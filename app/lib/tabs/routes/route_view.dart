import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shimmer/shimmer.dart';
import 'package:swift_travel/db/history.dart';
import 'package:swift_travel/l10n.dart';
import 'package:swift_travel/logic/location/location.dart';
import 'package:swift_travel/prediction/models/models.dart';
import 'package:swift_travel/prediction/predict.dart';
import 'package:swift_travel/tabs/routes/route_tab.dart';
import 'package:swift_travel/tabs/routes/route_tile.dart';
import 'package:swift_travel/utils/errors.dart';
import 'package:swift_travel/utils/models/coordinates.dart';
import 'package:swift_travel/utils/strings/strings.dart';
import 'package:swift_travel/widgets/route_widget.dart';
import 'package:theming/dynamic_theme.dart';
import 'package:theming/responsive.dart';

final _locationNotFound = RegExp(r'Stop ([\d\.,-\s]*) not found\.');

class RoutesView extends StatelessWidget {
  const RoutesView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Consumer(builder: (context, w, _) {
        final fetcher = w(routeStatesProvider);

        return fetcher.state.when(
          (routes) => CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(child: SizedBox(height: 8)),
              SliverSafeArea(
                sliver: routes.connections.isNotEmpty
                    ? SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, i) => RouteTile(
                            key: Key('routetile-$i'),
                            route: routes,
                            i: i,
                          ),
                          childCount: routes.connections.length,
                        ),
                      )
                    : SliverFillRemaining(
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Center(
                            child: routes.messages.isEmpty ||
                                    _locationNotFound.hasMatch(routes.messages.first)
                                ? Text(
                                    "You don't seem to be in a supported area.",
                                    style: Theme.of(context).textTheme.headline6,
                                    textAlign: TextAlign.center,
                                  )
                                : Text(
                                    routes.messages.join('\n'),
                                    style: Theme.of(context).textTheme.headline6,
                                    textAlign: TextAlign.center,
                                  ),
                          ),
                        ),
                      ),
              ),
            ],
          ),
          networkException: () => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Expanded(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Center(
                      child: Text(
                    '😢',
                    style: TextStyle(fontSize: 96),
                  )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  'Network Error',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
            ],
          ),
          locationPermissionNotGranted: () => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(16),
                      child: Center(
                          child: Text(
                        '🗺',
                        style: TextStyle(fontSize: 80),
                      )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        'This app requires location permissions !',
                        style: Theme.of(context).textTheme.headline6,
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                  child: Center(
                child: isDarwin(context)
                    ? const CupertinoButton.filled(
                        onPressed: Geolocator.openAppSettings,
                        child: Text('Open settings'),
                      )
                    : ElevatedButton(
                        onPressed: Geolocator.openAppSettings,
                        style: ElevatedButton.styleFrom(
                          shadowColor: ShadowTheme.of(context).buttonShadow?.color,
                          elevation: 8,
                          shape: const StadiumBorder(),
                        ),
                        child: const Text('Open settings'),
                      ),
              )),
            ],
          ),
          exception: (e) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Center(
                      child: Text(
                    '😢',
                    style: TextStyle(fontSize: 80),
                  )),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    e.toString(),
                    style: Theme.of(context).textTheme.headline6,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
          loading: () => const Center(child: CircularProgressIndicator.adaptive()),
          empty: () => const Align(
            alignment: Alignment.topCenter,
            child: _PredictionTile(),
          ),
          missingPluginException: () => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Center(
                      child: Text(
                    '😢',
                    style: TextStyle(fontSize: 80),
                  )),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    'Location is not supported on this device',
                    style: Theme.of(context).textTheme.headline6,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        );
      });
}

final _predictionProvider = FutureProvider<RoutePrediction>((ref) async {
  final dateTime = ref.watch(dateProvider).state;
  LatLon? pos;
  try {
    final loc = await getLocation().timeout(const Duration(seconds: 4));
    pos = LatLon.fromGeoLocation(loc);
  } on Exception {
    ignoreError();
  }

  final routes = RouteHistoryRepository.i.history;
  return predictRoute(
    routes,
    pos != null ? LocationArgument(pos, dateTime: null) : EmptyArgument(dateTime: dateTime),
  );
});

class _PredictionTile extends StatelessWidget {
  const _PredictionTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Consumer(
        builder: (context, watch, child) => watch(_predictionProvider).when(
          data: (pred) {
            if (pred.prediction != null) {
              return RouteWidget(
                from: Text(pred.prediction!.fromAsString.stripAt()),
                to: Text(pred.prediction!.toAsString.stripAt()),
                onTap: () {
                  from.setString(context, pred.prediction!.fromAsString);
                  to.setString(context, pred.prediction!.toAsString);
                },
                title: Text(AppLoc.of(context).suggestion),
                onLongPress: () {
                  showDialog<void>(
                      context: context,
                      builder: (context) => AlertDialog(
                            title: const Text('Arguments'),
                            content: Text(
                                const JsonEncoder.withIndent(' ').convert(pred.arguments.toJson())),
                          ));
                },
              );
            } else {
              return child!;
            }
          },
          loading: () => Shimmer.fromColors(
            baseColor: Colors.grey,
            highlightColor: Colors.white,
            child: const RouteWidget(
              from: Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  height: 16,
                  child: DecoratedBox(
                    decoration: BoxDecoration(color: Colors.black),
                    child: Text('                           '),
                  ),
                ),
              ),
              to: Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  height: 16,
                  child: DecoratedBox(
                    decoration: BoxDecoration(color: Colors.black),
                    child: Text('           '),
                  ),
                ),
              ),
              title: Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  height: 16,
                  child: DecoratedBox(
                    decoration: BoxDecoration(color: Colors.black),
                    child: Text('               '),
                  ),
                ),
              ),
            ),
          ),
          error: (e, s) {
            print(e);
            debugPrintStack(stackTrace: s);
            return child!;
          },
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '🔎',
              style: TextStyle(fontSize: 48),
            ),
            const SizedBox(height: 24),
            Text(
              AppLoc.of(context).find_a_route,
              style: Theme.of(context).textTheme.headline6,
              textAlign: TextAlign.center,
            )
          ],
        ),
      );
}
