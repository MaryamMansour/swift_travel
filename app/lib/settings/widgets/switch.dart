import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:swift_travel/settings/properties/property.dart';
import 'package:swift_travel/settings/settings.dart';
import 'package:swift_travel/settings/widgets/tiles.dart';
import 'package:theming/responsive.dart';

class SwiftSettingsSwitchTile extends StatefulWidget with WithLeading {
  const SwiftSettingsSwitchTile({
    Key? key,
    required this.title,
    this.leading,
    required this.initialValue,
    this.subtitle,
    this.onChanged,
    this.tileBorders = TileBorders.none,
    this.isSubtitleOutside = false,
  })  : listenable = null,
        super(key: key);

  final Widget title;
  @override
  final Widget? leading;
  final Widget? subtitle;
  final bool initialValue;
  final ValueChanged<bool>? onChanged;
  final ValueListenable<bool>? listenable;
  final TileBorders tileBorders;
  final bool isSubtitleOutside;

  SwiftSettingsSwitchTile.property({
    Key? key,
    required this.title,
    this.leading,
    this.subtitle,
    required Property<bool> property,
    this.tileBorders = TileBorders.none,
    this.isSubtitleOutside = false,
  })  : initialValue = property.value,
        onChanged = ((v) => property.setValue(v)),
        listenable = property,
        super(key: key);

  @override
  State<SwiftSettingsSwitchTile> createState() =>
      _SwiftSettingsSwitchTileState();
}

class _SwiftSettingsSwitchTileState extends State<SwiftSettingsSwitchTile> {
  late bool value = widget.initialValue;

  @override
  void initState() {
    super.initState();
    widget.listenable?.addListener(onListenableChanged);
  }

  @override
  void dispose() {
    super.dispose();
    widget.listenable?.removeListener(onListenableChanged);
  }

  void onListenableChanged() {
    final listenableValue = widget.listenable!.value;

    if (listenableValue != value) {
      setState(() {
        value = listenableValue;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarwin = theme.platform.isDarwin;
    const radius = Radius.circular(8);
    final child = Material(
      color: Colors.transparent,
      child: ListTile(
        horizontalTitleGap: 0,
        title: widget.title,
        subtitle: widget.isSubtitleOutside
            ? null
            : widget.subtitle?.wrap((object) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: object,
                )),
        leading: widget.leading,
        tileColor: isDarwin
            ? SettingsColor.tile.resolveFrom(context)
            : Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: widget.tileBorders.toBorderRadius(radius),
        ),
        onTap: isDarwin ? null : () => setState(() => value = !value),
        trailing: Switch.adaptive(
            value: value,
            onChanged: (v) {
              setState(() => value = v);
              widget.onChanged?.call(v);
            }),
      ),
    );
    if (widget.isSubtitleOutside) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          child,
          if (widget.subtitle != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              child: DefaultTextStyle(
                style: theme.textTheme.caption!,
                child: widget.subtitle!,
              ),
            )
        ],
      );
    } else {
      return child;
    }
  }
}

extension ObjectX<T extends Object> on T {
  S wrap<S>(S Function(T object) wrapper) => wrapper(this);
}
