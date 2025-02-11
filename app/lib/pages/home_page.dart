import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:octo_image/octo_image.dart';
import 'package:swift_travel/l10n/app_localizations.dart';
import 'package:swift_travel/logic/navigation.dart';
import 'package:swift_travel/main.dart';
import 'package:swift_travel/settings/settings.dart';
import 'package:swift_travel/tabs/favorites/favorites_tab.dart';
import 'package:swift_travel/tabs/routes/route_tab.dart';
import 'package:swift_travel/tabs/stations/stations_tab.dart';
import 'package:swift_travel/utils/colors.dart';
import 'package:swift_travel/utils/definitions.dart';
import 'package:swift_travel/widgets/if_wrapper.dart';
import 'package:swift_travel/widgets/page.dart';
import 'package:swift_travel/widgets/route.dart';
import 'package:vibration/vibration.dart';

final tabProvider = ChangeNotifierProvider<CupertinoTabController>((ref) {
  final cupertinoPageController = CupertinoTabController();

  return cupertinoPageController;
});

class TabView extends ConsumerStatefulWidget {
  const TabView({super.key});

  @override
  _TabViewState createState() => _TabViewState();

  static const iosTabs = [
    StationsTab(),
    RouteTab(),
    FavoritesTab(),
    SettingsPage()
  ];
  static const androidTabs = [StationsTab(), RouteTab(), FavoritesTab()];
  static const sideBarWidth = 350.0;
}

final sideTabBarProvider = StateProvider<WidgetBuilder?>((_) => null);

bool shouldShowSidebar(BuildContext context) {
  final mq = MediaQuery.of(context);
  final s = mq.size.longestSide / mq.devicePixelRatio;
  return s > TabView.sideBarWidth && mq.orientation == Orientation.landscape;
}

class _TabViewState extends ConsumerState<TabView>
    with SingleTickerProviderStateMixin {
  int oldI = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    ref.read(navigationAPIProvider).locale = Localizations.localeOf(context);
  }

  late final cupertinoItems = [
    BottomNavigationBarItem(
      icon: const Icon(CupertinoIcons.search),
      label: AppLocalizations.of(context).timetable,
    ),
    BottomNavigationBarItem(
      icon: const Icon(CupertinoIcons.train_style_one),
      label: AppLocalizations.of(context).tabs_route,
    ),
    BottomNavigationBarItem(
      icon: const Icon(CupertinoIcons.square_favorites_alt),
      activeIcon: const Icon(CupertinoIcons.square_favorites_alt_fill),
      label: AppLocalizations.of(context).tabs_favourites,
    ),
    BottomNavigationBarItem(
      icon: const Icon(CupertinoIcons.settings),
      activeIcon: const Icon(CupertinoIcons.settings_solid),
      label: AppLocalizations.of(context).settings,
    )
  ];

  late final titles = [
    AppLocalizations.of(context).timetable,
    AppLocalizations.of(context).tabs_route,
    AppLocalizations.of(context).tabs_favourites,
  ];
  late final materialItems = [
    BottomNavigationBarItem(
      icon: const Icon(CupertinoIcons.search),
      label: titles.first,
    ),
    BottomNavigationBarItem(
      icon: const Icon(CupertinoIcons.list_dash),
      label: titles[1],
    ),
    BottomNavigationBarItem(
      icon: const Icon(CupertinoIcons.star),
      activeIcon: const Icon(CupertinoIcons.star_fill),
      label: titles[2],
    ),
  ];

  @override
  Widget build(BuildContext context) => IfWrapper(
        condition: shouldShowSidebar(context),
        builder: (context, child) => Row(children: [
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: TabView.sideBarWidth),
            child: child,
          ),
          const SafeArea(child: VerticalDivider(width: 0)),
          Expanded(
              child: ClipRect(
            child: Material(
              child: Navigator(
                key: sideBarNavigatorKey,
                pages: const [SingleWidgetPage<void>(SideBar())],
                onPopPage: (_, dynamic __) => false,
              ),
            ),
          )),
        ]),
        child: PlatformBuilder(
          cupertinoBuilder: (context, _) => buildCupertinoTabScaffold(),
          materialBuilder: (context, _) => buildScaffold(),
        ),
      );

  @allowReturningWidgets
  Widget buildCupertinoTabScaffold() => Consumer(builder: (context, w, _) {
        final tabController = w.watch(tabProvider.notifier);
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: CupertinoTabScaffold(
            controller: tabController,
            resizeToAvoidBottomInset: false,
            tabBar: CupertinoTabBar(
              onTap: (i) {
                Vibration.instance.selectSoft();
                if (i == oldI) {
                  navigatorTabKeys[i]
                      .currentState
                      ?.popUntil((route) => route.isFirst);
                  ref.read(sideTabBarProvider.notifier).state = null;
                }
                oldI = i;
              },
              backgroundColor: CupertinoTheme.of(context)
                  .barBackgroundColor
                  .withOpacity(0.5),
              items: cupertinoItems,
            ),
            tabBuilder: (context, i) => Navigator(
              key: navigatorTabKeys[i],
              pages: [
                SingleWidgetPage<void>(TabView.iosTabs[i],
                    title: cupertinoItems[i].label)
              ],
              onPopPage: (_, dynamic __) => true,
              onUnknownRoute: onUnknownRoute,
              onGenerateRoute: onGenerateRoute,
            ),
          ),
        );
      });

  List<Color> gradient(Color c) => [
        c.augmentSquared(),
        c,
      ];

  @allowReturningWidgets
  Widget buildScaffold() => Consumer(builder: (context, ref, _) {
        final controller = ref.watch(tabProvider);
        final page = controller.index % TabView.androidTabs.length;

        return Scaffold(
          key: const Key('home-scaffold'),
          resizeToAvoidBottomInset: false,
          bottomNavigationBar: SwiftNavigationBar(
            controller: controller,
            page: page,
            items: materialItems,
          ),
          body: Navigator(
            key: navigatorTabKeys[page],
            pages: [
              SingleWidgetPage<void>(
                TabView.androidTabs[page],
                name: titles[page],
              )
            ],
            onPopPage: (_, dynamic __) => true,
            onUnknownRoute: onUnknownRoute,
            onGenerateRoute: onGenerateRoute,
          ),
        );
      });
}

class SwiftNavigationBar extends ConsumerWidget {
  const SwiftNavigationBar({
    required this.controller,
    required this.page,
    required this.items,
    this.activeColor,
    super.key,
  });

  final CupertinoTabController controller;
  final int page;
  final List<BottomNavigationBarItem> items;
  final Color? activeColor;

  static const height = 64.0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return NavigationBar(
      destinations: [
        for (var i = 0; i < items.length; i++)
          NavigationDestination(
            icon: items[i].icon,
            selectedIcon: items[i].activeIcon,
            label: items[i].label!,
          )
      ],
      selectedIndex: page,
      animationDuration: const Duration(milliseconds: 300),
      labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
      onDestinationSelected: (i) {
        Vibration.instance.selectSoft();
        if (controller.index != i) {
          controller.index = i;
        } else {
          navigatorTabKeys[i].currentState?.popUntil((route) => route.isFirst);
          ref.read(sideTabBarProvider.notifier).state = null;
        }
      },
    );
  }
}

class SideBar extends ConsumerWidget {
  const SideBar({
    super.key,
  });

  static void push(
    BuildContext context,
    WidgetBuilder builder, {
    RouteSettings? settings,
    bool maintainState = true,
    bool fullscreenDialog = false,
    String? title,
    bool rootNavigator = false,
  }) {
    if (shouldShowSidebar(context)) {
      // ignore: deprecated_member_use_from_same_package
      final container = ProviderScope.containerOf(context, listen: false);
      container.read(sideTabBarProvider.notifier).state = builder;
      sideBarNavigatorKey.currentState!.popUntil((r) => r.isFirst);
    } else {
      unawaited(navigatorKey.currentState!.push<void>(PlatformPageRoute(
        builder: builder,
        fullscreenDialog: fullscreenDialog,
        maintainState: maintainState,
        title: title,
        settings: settings,
      )));
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(sideTabBarProvider)?.call(context) ??
        const DefaultSidebarWidget();
  }
}

class DefaultSidebarWidget extends StatelessWidget {
  const DefaultSidebarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: OctoImage(
            image: const AssetImage('assets/pictures/train.jfif'),
            placeholderBuilder: OctoPlaceholder.blurHash(
              'qwJRdKRORjayoej[fja{_4Rjf5fQayj@fRj[%MkDaejtWCazj@j[%1tRfkWBj[f7azayWDj]ogayoejsayayoff5ogofWBWBayoe',
            ),
            errorBuilder: OctoError.icon(color: Colors.red),
            fit: BoxFit.cover,
          ),
        ),
        Positioned.fill(
            child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  color: Theme.of(context)
                      .scaffoldBackgroundColor
                      .withOpacity(0.5),
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  child: const Text(
                      'Start searching a station or an itinerary to start using the app'),
                ),
              ),
            ),
          ),
        )),
      ],
    );
  }
}

final navigatorTabKeys = <GlobalKey<NavigatorState>>[
  GlobalKey(debugLabel: 'stations tab key'),
  GlobalKey(debugLabel: 'route tab key'),
  GlobalKey(debugLabel: 'favs tab key'),
  GlobalKey(debugLabel: 'settings key'),
];

final sideBarNavigatorKey = GlobalKey<NavigatorState>();

class MaterialAppBar extends AppBar {
  MaterialAppBar({
    this.showSettingsButton = true,
    super.key,
    List<Widget> actions = const [],
    super.title,
    super.leading,
  }) : super(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            ...actions,
            if (showSettingsButton)
              Builder(builder: (context) {
                return IconButton(
                    key: const Key('settings-button'),
                    tooltip: AppLocalizations.of(context).settings,
                    icon: const Icon(Icons.settings),
                    onPressed: () {
                      Vibration.instance.select();
                      SideBar.push(
                        context,
                        (context) => const SettingsPage(),
                        fullscreenDialog: true,
                        rootNavigator: true,
                      );
                    });
              }),
          ],
        );

  final bool showSettingsButton;
}

class SwiftCupertinoBar extends StatefulWidget
    implements ObstructingPreferredSizeWidget {
  const SwiftCupertinoBar({
    super.key,
    this.leading,
    this.automaticallyImplyLeading = true,
    this.automaticallyImplyMiddle = true,
    this.previousPageTitle,
    this.middle,
    this.trailing,
    this.brightness,
    this.padding,
    this.transitionBetweenRoutes = true,
    this.opacity = 0.5,
  });

  final Widget? leading;
  final bool automaticallyImplyLeading;
  final bool automaticallyImplyMiddle;
  final String? previousPageTitle;
  final Widget? middle;
  final Widget? trailing;
  final Brightness? brightness;
  final EdgeInsetsDirectional? padding;
  final bool transitionBetweenRoutes;
  final double opacity;

  @override
  _SwiftCupertinoBarState createState() => _SwiftCupertinoBarState();

  @override
  Size get preferredSize =>
      const Size.fromHeight(kMinInteractiveDimensionCupertino);

  @override
  bool shouldFullyObstruct(BuildContext context) => opacity == 1.0;
}

class _SwiftCupertinoBarState extends State<SwiftCupertinoBar> {
  String? get _previousPageTitle =>
      PlatformRouteTitleMixin.getPreviousTitleOf(context);
  String? get _pageTitle => PlatformRouteTitleMixin.getPageTitleOf(context);

  @override
  Widget build(BuildContext context) {
    final prevPageTitle = widget.automaticallyImplyLeading
        ? widget.previousPageTitle ?? _previousPageTitle
        : widget.previousPageTitle;
    // log.log('Previous page title is $prevPageTitle');

    @allowReturningWidgets
    Widget? pageTitleWidget() {
      final title = _pageTitle;
      if (title == null) {
        return null;
      }
      return Text(title);
    }

    return CupertinoNavigationBar(
      leading: widget.leading,
      automaticallyImplyLeading: widget.automaticallyImplyLeading,
      automaticallyImplyMiddle: widget.automaticallyImplyMiddle,
      previousPageTitle: prevPageTitle,
      middle: widget.automaticallyImplyMiddle
          ? widget.middle ?? pageTitleWidget()
          : widget.middle,
      trailing: widget.trailing,
      backgroundColor: CupertinoTheme.of(context)
          .barBackgroundColor
          .withOpacity(widget.opacity),
      brightness: widget.brightness,
      padding: widget.padding,
      transitionBetweenRoutes: widget.transitionBetweenRoutes,
    );
  }
}
