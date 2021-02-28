import 'package:swift_travel/apis/navigation/search.ch/models/vehicle_iconclass.dart';
import 'package:swift_travel/utils/models/coordinates.dart';

mixin StationBoard {
  Stop get stop;
  List<StationboardConnection> get connections;
  String get stopName;
  List<Object> get messages;
  bool get hasError;
}

mixin BaseStop {
  String get name;
  String? get id;
}

abstract class Stop = Object with BaseStop, WithTimeMixin, LocatedMixin;

mixin WithTimeMixin {
  DateTime? get departure;
  DateTime? get arrival;
}

mixin StationboardConnection {
  DateTime get time;
  Vehicle get type;
  String get color;
  Stop get terminal;
  String? get line;
  String? get operator;
  String get number;
  String? get g;
  String? get l;

  List<DelayedStop> get subsequentStops;

  int get depDelay;
  int get arrDelay;
}

abstract class DelayedStop = Object with Stop, WithDelayMixin;

mixin WithDelayMixin {
  int get depDelay;
  int get arrDelay;
}

mixin LocatedMixin {
  double? get lat;
  double? get lon;

  LatLon? get position;
}
