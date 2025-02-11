// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'geo_admin.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SearchCompletion _$SearchCompletionFromJson(Map<String, dynamic> json) {
  return _SearchCompletion.fromJson(json);
}

/// @nodoc
mixin _$SearchCompletion {
  String? get label => throw _privateConstructorUsedError;
  String? get html => throw _privateConstructorUsedError;
  String? get iconclass => throw _privateConstructorUsedError;
  String? get corrected => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SearchCompletionCopyWith<SearchCompletion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchCompletionCopyWith<$Res> {
  factory $SearchCompletionCopyWith(
          SearchCompletion value, $Res Function(SearchCompletion) then) =
      _$SearchCompletionCopyWithImpl<$Res, SearchCompletion>;
  @useResult
  $Res call(
      {String? label, String? html, String? iconclass, String? corrected});
}

/// @nodoc
class _$SearchCompletionCopyWithImpl<$Res, $Val extends SearchCompletion>
    implements $SearchCompletionCopyWith<$Res> {
  _$SearchCompletionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = freezed,
    Object? html = freezed,
    Object? iconclass = freezed,
    Object? corrected = freezed,
  }) {
    return _then(_value.copyWith(
      label: freezed == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
      html: freezed == html
          ? _value.html
          : html // ignore: cast_nullable_to_non_nullable
              as String?,
      iconclass: freezed == iconclass
          ? _value.iconclass
          : iconclass // ignore: cast_nullable_to_non_nullable
              as String?,
      corrected: freezed == corrected
          ? _value.corrected
          : corrected // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SearchCompletionCopyWith<$Res>
    implements $SearchCompletionCopyWith<$Res> {
  factory _$$_SearchCompletionCopyWith(
          _$_SearchCompletion value, $Res Function(_$_SearchCompletion) then) =
      __$$_SearchCompletionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? label, String? html, String? iconclass, String? corrected});
}

/// @nodoc
class __$$_SearchCompletionCopyWithImpl<$Res>
    extends _$SearchCompletionCopyWithImpl<$Res, _$_SearchCompletion>
    implements _$$_SearchCompletionCopyWith<$Res> {
  __$$_SearchCompletionCopyWithImpl(
      _$_SearchCompletion _value, $Res Function(_$_SearchCompletion) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = freezed,
    Object? html = freezed,
    Object? iconclass = freezed,
    Object? corrected = freezed,
  }) {
    return _then(_$_SearchCompletion(
      label: freezed == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
      html: freezed == html
          ? _value.html
          : html // ignore: cast_nullable_to_non_nullable
              as String?,
      iconclass: freezed == iconclass
          ? _value.iconclass
          : iconclass // ignore: cast_nullable_to_non_nullable
              as String?,
      corrected: freezed == corrected
          ? _value.corrected
          : corrected // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(checked: true)
class _$_SearchCompletion implements _SearchCompletion {
  const _$_SearchCompletion(
      {required this.label, this.html, this.iconclass, this.corrected});

  factory _$_SearchCompletion.fromJson(Map<String, dynamic> json) =>
      _$$_SearchCompletionFromJson(json);

  @override
  final String? label;
  @override
  final String? html;
  @override
  final String? iconclass;
  @override
  final String? corrected;

  @override
  String toString() {
    return 'SearchCompletion(label: $label, html: $html, iconclass: $iconclass, corrected: $corrected)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SearchCompletion &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.html, html) || other.html == html) &&
            (identical(other.iconclass, iconclass) ||
                other.iconclass == iconclass) &&
            (identical(other.corrected, corrected) ||
                other.corrected == corrected));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, label, html, iconclass, corrected);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SearchCompletionCopyWith<_$_SearchCompletion> get copyWith =>
      __$$_SearchCompletionCopyWithImpl<_$_SearchCompletion>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SearchCompletionToJson(
      this,
    );
  }
}

abstract class _SearchCompletion implements SearchCompletion {
  const factory _SearchCompletion(
      {required final String? label,
      final String? html,
      final String? iconclass,
      final String? corrected}) = _$_SearchCompletion;

  factory _SearchCompletion.fromJson(Map<String, dynamic> json) =
      _$_SearchCompletion.fromJson;

  @override
  String? get label;
  @override
  String? get html;
  @override
  String? get iconclass;
  @override
  String? get corrected;
  @override
  @JsonKey(ignore: true)
  _$$_SearchCompletionCopyWith<_$_SearchCompletion> get copyWith =>
      throw _privateConstructorUsedError;
}

GeoAdminResult _$GeoAdminResultFromJson(Map<String, dynamic> json) {
  return _GeoAdminResult.fromJson(json);
}

/// @nodoc
mixin _$GeoAdminResult {
  @JsonKey(name: 'id')
  int get intId => throw _privateConstructorUsedError;
  int get weight => throw _privateConstructorUsedError;
  GeoAdminAttributes get attrs => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GeoAdminResultCopyWith<GeoAdminResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeoAdminResultCopyWith<$Res> {
  factory $GeoAdminResultCopyWith(
          GeoAdminResult value, $Res Function(GeoAdminResult) then) =
      _$GeoAdminResultCopyWithImpl<$Res, GeoAdminResult>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int intId, int weight, GeoAdminAttributes attrs});

  $GeoAdminAttributesCopyWith<$Res> get attrs;
}

/// @nodoc
class _$GeoAdminResultCopyWithImpl<$Res, $Val extends GeoAdminResult>
    implements $GeoAdminResultCopyWith<$Res> {
  _$GeoAdminResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? intId = null,
    Object? weight = null,
    Object? attrs = null,
  }) {
    return _then(_value.copyWith(
      intId: null == intId
          ? _value.intId
          : intId // ignore: cast_nullable_to_non_nullable
              as int,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as int,
      attrs: null == attrs
          ? _value.attrs
          : attrs // ignore: cast_nullable_to_non_nullable
              as GeoAdminAttributes,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $GeoAdminAttributesCopyWith<$Res> get attrs {
    return $GeoAdminAttributesCopyWith<$Res>(_value.attrs, (value) {
      return _then(_value.copyWith(attrs: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_GeoAdminResultCopyWith<$Res>
    implements $GeoAdminResultCopyWith<$Res> {
  factory _$$_GeoAdminResultCopyWith(
          _$_GeoAdminResult value, $Res Function(_$_GeoAdminResult) then) =
      __$$_GeoAdminResultCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int intId, int weight, GeoAdminAttributes attrs});

  @override
  $GeoAdminAttributesCopyWith<$Res> get attrs;
}

/// @nodoc
class __$$_GeoAdminResultCopyWithImpl<$Res>
    extends _$GeoAdminResultCopyWithImpl<$Res, _$_GeoAdminResult>
    implements _$$_GeoAdminResultCopyWith<$Res> {
  __$$_GeoAdminResultCopyWithImpl(
      _$_GeoAdminResult _value, $Res Function(_$_GeoAdminResult) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? intId = null,
    Object? weight = null,
    Object? attrs = null,
  }) {
    return _then(_$_GeoAdminResult(
      intId: null == intId
          ? _value.intId
          : intId // ignore: cast_nullable_to_non_nullable
              as int,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as int,
      attrs: null == attrs
          ? _value.attrs
          : attrs // ignore: cast_nullable_to_non_nullable
              as GeoAdminAttributes,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GeoAdminResult extends _GeoAdminResult {
  const _$_GeoAdminResult(
      {@JsonKey(name: 'id') required this.intId,
      this.weight = 0,
      required this.attrs})
      : super._();

  factory _$_GeoAdminResult.fromJson(Map<String, dynamic> json) =>
      _$$_GeoAdminResultFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int intId;
  @override
  @JsonKey()
  final int weight;
  @override
  final GeoAdminAttributes attrs;

  @override
  String toString() {
    return 'GeoAdminResult(intId: $intId, weight: $weight, attrs: $attrs)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GeoAdminResult &&
            (identical(other.intId, intId) || other.intId == intId) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.attrs, attrs) || other.attrs == attrs));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, intId, weight, attrs);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GeoAdminResultCopyWith<_$_GeoAdminResult> get copyWith =>
      __$$_GeoAdminResultCopyWithImpl<_$_GeoAdminResult>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GeoAdminResultToJson(
      this,
    );
  }
}

abstract class _GeoAdminResult extends GeoAdminResult {
  const factory _GeoAdminResult(
      {@JsonKey(name: 'id') required final int intId,
      final int weight,
      required final GeoAdminAttributes attrs}) = _$_GeoAdminResult;
  const _GeoAdminResult._() : super._();

  factory _GeoAdminResult.fromJson(Map<String, dynamic> json) =
      _$_GeoAdminResult.fromJson;

  @override
  @JsonKey(name: 'id')
  int get intId;
  @override
  int get weight;
  @override
  GeoAdminAttributes get attrs;
  @override
  @JsonKey(ignore: true)
  _$$_GeoAdminResultCopyWith<_$_GeoAdminResult> get copyWith =>
      throw _privateConstructorUsedError;
}

GeoAdminAttributes _$GeoAdminAttributesFromJson(Map<String, dynamic> json) {
  return _GeoAdminAttributes.fromJson(json);
}

/// @nodoc
mixin _$GeoAdminAttributes {
  String get origin => throw _privateConstructorUsedError;
  @JsonKey(name: 'featureId')
  String? get featureId => throw _privateConstructorUsedError;
  String get detail => throw _privateConstructorUsedError;
  int get rank => throw _privateConstructorUsedError;
  @JsonKey(name: 'num')
  int? get number => throw _privateConstructorUsedError;
  double get y => throw _privateConstructorUsedError;
  double get x => throw _privateConstructorUsedError;
  int get zoomlevel => throw _privateConstructorUsedError;
  @JsonKey(name: 'label')
  String get htmlLabel => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GeoAdminAttributesCopyWith<GeoAdminAttributes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeoAdminAttributesCopyWith<$Res> {
  factory $GeoAdminAttributesCopyWith(
          GeoAdminAttributes value, $Res Function(GeoAdminAttributes) then) =
      _$GeoAdminAttributesCopyWithImpl<$Res, GeoAdminAttributes>;
  @useResult
  $Res call(
      {String origin,
      @JsonKey(name: 'featureId') String? featureId,
      String detail,
      int rank,
      @JsonKey(name: 'num') int? number,
      double y,
      double x,
      int zoomlevel,
      @JsonKey(name: 'label') String htmlLabel});
}

/// @nodoc
class _$GeoAdminAttributesCopyWithImpl<$Res, $Val extends GeoAdminAttributes>
    implements $GeoAdminAttributesCopyWith<$Res> {
  _$GeoAdminAttributesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? origin = null,
    Object? featureId = freezed,
    Object? detail = null,
    Object? rank = null,
    Object? number = freezed,
    Object? y = null,
    Object? x = null,
    Object? zoomlevel = null,
    Object? htmlLabel = null,
  }) {
    return _then(_value.copyWith(
      origin: null == origin
          ? _value.origin
          : origin // ignore: cast_nullable_to_non_nullable
              as String,
      featureId: freezed == featureId
          ? _value.featureId
          : featureId // ignore: cast_nullable_to_non_nullable
              as String?,
      detail: null == detail
          ? _value.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as String,
      rank: null == rank
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as int,
      number: freezed == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int?,
      y: null == y
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as double,
      x: null == x
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as double,
      zoomlevel: null == zoomlevel
          ? _value.zoomlevel
          : zoomlevel // ignore: cast_nullable_to_non_nullable
              as int,
      htmlLabel: null == htmlLabel
          ? _value.htmlLabel
          : htmlLabel // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GeoAdminAttributesCopyWith<$Res>
    implements $GeoAdminAttributesCopyWith<$Res> {
  factory _$$_GeoAdminAttributesCopyWith(_$_GeoAdminAttributes value,
          $Res Function(_$_GeoAdminAttributes) then) =
      __$$_GeoAdminAttributesCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String origin,
      @JsonKey(name: 'featureId') String? featureId,
      String detail,
      int rank,
      @JsonKey(name: 'num') int? number,
      double y,
      double x,
      int zoomlevel,
      @JsonKey(name: 'label') String htmlLabel});
}

/// @nodoc
class __$$_GeoAdminAttributesCopyWithImpl<$Res>
    extends _$GeoAdminAttributesCopyWithImpl<$Res, _$_GeoAdminAttributes>
    implements _$$_GeoAdminAttributesCopyWith<$Res> {
  __$$_GeoAdminAttributesCopyWithImpl(
      _$_GeoAdminAttributes _value, $Res Function(_$_GeoAdminAttributes) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? origin = null,
    Object? featureId = freezed,
    Object? detail = null,
    Object? rank = null,
    Object? number = freezed,
    Object? y = null,
    Object? x = null,
    Object? zoomlevel = null,
    Object? htmlLabel = null,
  }) {
    return _then(_$_GeoAdminAttributes(
      origin: null == origin
          ? _value.origin
          : origin // ignore: cast_nullable_to_non_nullable
              as String,
      featureId: freezed == featureId
          ? _value.featureId
          : featureId // ignore: cast_nullable_to_non_nullable
              as String?,
      detail: null == detail
          ? _value.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as String,
      rank: null == rank
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as int,
      number: freezed == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int?,
      y: null == y
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as double,
      x: null == x
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as double,
      zoomlevel: null == zoomlevel
          ? _value.zoomlevel
          : zoomlevel // ignore: cast_nullable_to_non_nullable
              as int,
      htmlLabel: null == htmlLabel
          ? _value.htmlLabel
          : htmlLabel // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GeoAdminAttributes extends _GeoAdminAttributes {
  const _$_GeoAdminAttributes(
      {required this.origin,
      @JsonKey(name: 'featureId') required this.featureId,
      required this.detail,
      required this.rank,
      @JsonKey(name: 'num') this.number,
      required this.y,
      required this.x,
      required this.zoomlevel,
      @JsonKey(name: 'label') required this.htmlLabel})
      : super._();

  factory _$_GeoAdminAttributes.fromJson(Map<String, dynamic> json) =>
      _$$_GeoAdminAttributesFromJson(json);

  @override
  final String origin;
  @override
  @JsonKey(name: 'featureId')
  final String? featureId;
  @override
  final String detail;
  @override
  final int rank;
  @override
  @JsonKey(name: 'num')
  final int? number;
  @override
  final double y;
  @override
  final double x;
  @override
  final int zoomlevel;
  @override
  @JsonKey(name: 'label')
  final String htmlLabel;

  @override
  String toString() {
    return 'GeoAdminAttributes(origin: $origin, featureId: $featureId, detail: $detail, rank: $rank, number: $number, y: $y, x: $x, zoomlevel: $zoomlevel, htmlLabel: $htmlLabel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GeoAdminAttributes &&
            (identical(other.origin, origin) || other.origin == origin) &&
            (identical(other.featureId, featureId) ||
                other.featureId == featureId) &&
            (identical(other.detail, detail) || other.detail == detail) &&
            (identical(other.rank, rank) || other.rank == rank) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.y, y) || other.y == y) &&
            (identical(other.x, x) || other.x == x) &&
            (identical(other.zoomlevel, zoomlevel) ||
                other.zoomlevel == zoomlevel) &&
            (identical(other.htmlLabel, htmlLabel) ||
                other.htmlLabel == htmlLabel));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, origin, featureId, detail, rank,
      number, y, x, zoomlevel, htmlLabel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GeoAdminAttributesCopyWith<_$_GeoAdminAttributes> get copyWith =>
      __$$_GeoAdminAttributesCopyWithImpl<_$_GeoAdminAttributes>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GeoAdminAttributesToJson(
      this,
    );
  }
}

abstract class _GeoAdminAttributes extends GeoAdminAttributes {
  const factory _GeoAdminAttributes(
          {required final String origin,
          @JsonKey(name: 'featureId') required final String? featureId,
          required final String detail,
          required final int rank,
          @JsonKey(name: 'num') final int? number,
          required final double y,
          required final double x,
          required final int zoomlevel,
          @JsonKey(name: 'label') required final String htmlLabel}) =
      _$_GeoAdminAttributes;
  const _GeoAdminAttributes._() : super._();

  factory _GeoAdminAttributes.fromJson(Map<String, dynamic> json) =
      _$_GeoAdminAttributes.fromJson;

  @override
  String get origin;
  @override
  @JsonKey(name: 'featureId')
  String? get featureId;
  @override
  String get detail;
  @override
  int get rank;
  @override
  @JsonKey(name: 'num')
  int? get number;
  @override
  double get y;
  @override
  double get x;
  @override
  int get zoomlevel;
  @override
  @JsonKey(name: 'label')
  String get htmlLabel;
  @override
  @JsonKey(ignore: true)
  _$$_GeoAdminAttributesCopyWith<_$_GeoAdminAttributes> get copyWith =>
      throw _privateConstructorUsedError;
}
