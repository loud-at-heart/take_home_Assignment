// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'i_timer_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ITimerModel _$ITimerModelFromJson(Map<String, dynamic> json) {
  return _ITimerModel.fromJson(json);
}

/// @nodoc
mixin _$ITimerModel {
  int? get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get subtitle => throw _privateConstructorUsedError;
  int? get second => throw _privateConstructorUsedError;
  bool get finished => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ITimerModelCopyWith<ITimerModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ITimerModelCopyWith<$Res> {
  factory $ITimerModelCopyWith(
          ITimerModel value, $Res Function(ITimerModel) then) =
      _$ITimerModelCopyWithImpl<$Res, ITimerModel>;
  @useResult
  $Res call(
      {int? id, String? title, String? subtitle, int? second, bool finished});
}

/// @nodoc
class _$ITimerModelCopyWithImpl<$Res, $Val extends ITimerModel>
    implements $ITimerModelCopyWith<$Res> {
  _$ITimerModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? subtitle = freezed,
    Object? second = freezed,
    Object? finished = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      subtitle: freezed == subtitle
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String?,
      second: freezed == second
          ? _value.second
          : second // ignore: cast_nullable_to_non_nullable
              as int?,
      finished: null == finished
          ? _value.finished
          : finished // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ITimerModelCopyWith<$Res>
    implements $ITimerModelCopyWith<$Res> {
  factory _$$_ITimerModelCopyWith(
          _$_ITimerModel value, $Res Function(_$_ITimerModel) then) =
      __$$_ITimerModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id, String? title, String? subtitle, int? second, bool finished});
}

/// @nodoc
class __$$_ITimerModelCopyWithImpl<$Res>
    extends _$ITimerModelCopyWithImpl<$Res, _$_ITimerModel>
    implements _$$_ITimerModelCopyWith<$Res> {
  __$$_ITimerModelCopyWithImpl(
      _$_ITimerModel _value, $Res Function(_$_ITimerModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? subtitle = freezed,
    Object? second = freezed,
    Object? finished = null,
  }) {
    return _then(_$_ITimerModel(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      subtitle: freezed == subtitle
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String?,
      second: freezed == second
          ? _value.second
          : second // ignore: cast_nullable_to_non_nullable
              as int?,
      finished: null == finished
          ? _value.finished
          : finished // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ITimerModel implements _ITimerModel {
  const _$_ITimerModel(
      {this.id, this.title, this.subtitle, this.second, this.finished = false});

  factory _$_ITimerModel.fromJson(Map<String, dynamic> json) =>
      _$$_ITimerModelFromJson(json);

  @override
  final int? id;
  @override
  final String? title;
  @override
  final String? subtitle;
  @override
  final int? second;
  @override
  @JsonKey()
  final bool finished;

  @override
  String toString() {
    return 'ITimerModel(id: $id, title: $title, subtitle: $subtitle, second: $second, finished: $finished)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ITimerModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.subtitle, subtitle) ||
                other.subtitle == subtitle) &&
            (identical(other.second, second) || other.second == second) &&
            (identical(other.finished, finished) ||
                other.finished == finished));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, subtitle, second, finished);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ITimerModelCopyWith<_$_ITimerModel> get copyWith =>
      __$$_ITimerModelCopyWithImpl<_$_ITimerModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ITimerModelToJson(
      this,
    );
  }
}

abstract class _ITimerModel implements ITimerModel {
  const factory _ITimerModel(
      {final int? id,
      final String? title,
      final String? subtitle,
      final int? second,
      final bool finished}) = _$_ITimerModel;

  factory _ITimerModel.fromJson(Map<String, dynamic> json) =
      _$_ITimerModel.fromJson;

  @override
  int? get id;
  @override
  String? get title;
  @override
  String? get subtitle;
  @override
  int? get second;
  @override
  bool get finished;
  @override
  @JsonKey(ignore: true)
  _$$_ITimerModelCopyWith<_$_ITimerModel> get copyWith =>
      throw _privateConstructorUsedError;
}
