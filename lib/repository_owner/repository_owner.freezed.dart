// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'repository_owner.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RepositoryOwner _$RepositoryOwnerFromJson(Map<String, dynamic> json) {
  return _RepositoryOwner.fromJson(json);
}

/// @nodoc
mixin _$RepositoryOwner {
  String get login => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RepositoryOwnerCopyWith<RepositoryOwner> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RepositoryOwnerCopyWith<$Res> {
  factory $RepositoryOwnerCopyWith(
          RepositoryOwner value, $Res Function(RepositoryOwner) then) =
      _$RepositoryOwnerCopyWithImpl<$Res, RepositoryOwner>;
  @useResult
  $Res call({String login, int id});
}

/// @nodoc
class _$RepositoryOwnerCopyWithImpl<$Res, $Val extends RepositoryOwner>
    implements $RepositoryOwnerCopyWith<$Res> {
  _$RepositoryOwnerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? login = null,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      login: null == login
          ? _value.login
          : login // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RepositoryOwnerCopyWith<$Res>
    implements $RepositoryOwnerCopyWith<$Res> {
  factory _$$_RepositoryOwnerCopyWith(
          _$_RepositoryOwner value, $Res Function(_$_RepositoryOwner) then) =
      __$$_RepositoryOwnerCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String login, int id});
}

/// @nodoc
class __$$_RepositoryOwnerCopyWithImpl<$Res>
    extends _$RepositoryOwnerCopyWithImpl<$Res, _$_RepositoryOwner>
    implements _$$_RepositoryOwnerCopyWith<$Res> {
  __$$_RepositoryOwnerCopyWithImpl(
      _$_RepositoryOwner _value, $Res Function(_$_RepositoryOwner) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? login = null,
    Object? id = null,
  }) {
    return _then(_$_RepositoryOwner(
      login: null == login
          ? _value.login
          : login // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RepositoryOwner implements _RepositoryOwner {
  const _$_RepositoryOwner({required this.login, required this.id});

  factory _$_RepositoryOwner.fromJson(Map<String, dynamic> json) =>
      _$$_RepositoryOwnerFromJson(json);

  @override
  final String login;
  @override
  final int id;

  @override
  String toString() {
    return 'RepositoryOwner(login: $login, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RepositoryOwner &&
            (identical(other.login, login) || other.login == login) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, login, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RepositoryOwnerCopyWith<_$_RepositoryOwner> get copyWith =>
      __$$_RepositoryOwnerCopyWithImpl<_$_RepositoryOwner>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RepositoryOwnerToJson(
      this,
    );
  }
}

abstract class _RepositoryOwner implements RepositoryOwner {
  const factory _RepositoryOwner(
      {required final String login,
      required final int id}) = _$_RepositoryOwner;

  factory _RepositoryOwner.fromJson(Map<String, dynamic> json) =
      _$_RepositoryOwner.fromJson;

  @override
  String get login;
  @override
  int get id;
  @override
  @JsonKey(ignore: true)
  _$$_RepositoryOwnerCopyWith<_$_RepositoryOwner> get copyWith =>
      throw _privateConstructorUsedError;
}
