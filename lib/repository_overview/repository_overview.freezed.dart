// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'repository_overview.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RepositoryOverview _$RepositoryOverviewFromJson(Map<String, dynamic> json) {
  return _RepositoryOverview.fromJson(json);
}

/// @nodoc
mixin _$RepositoryOverview {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  bool get private => throw _privateConstructorUsedError;
  int get stargazers_count => throw _privateConstructorUsedError;
  int get forks_count => throw _privateConstructorUsedError;
  RepositoryOwner get owner => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RepositoryOverviewCopyWith<RepositoryOverview> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RepositoryOverviewCopyWith<$Res> {
  factory $RepositoryOverviewCopyWith(
          RepositoryOverview value, $Res Function(RepositoryOverview) then) =
      _$RepositoryOverviewCopyWithImpl<$Res, RepositoryOverview>;
  @useResult
  $Res call(
      {int id,
      String name,
      bool private,
      int stargazers_count,
      int forks_count,
      RepositoryOwner owner});

  $RepositoryOwnerCopyWith<$Res> get owner;
}

/// @nodoc
class _$RepositoryOverviewCopyWithImpl<$Res, $Val extends RepositoryOverview>
    implements $RepositoryOverviewCopyWith<$Res> {
  _$RepositoryOverviewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? private = null,
    Object? stargazers_count = null,
    Object? forks_count = null,
    Object? owner = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      private: null == private
          ? _value.private
          : private // ignore: cast_nullable_to_non_nullable
              as bool,
      stargazers_count: null == stargazers_count
          ? _value.stargazers_count
          : stargazers_count // ignore: cast_nullable_to_non_nullable
              as int,
      forks_count: null == forks_count
          ? _value.forks_count
          : forks_count // ignore: cast_nullable_to_non_nullable
              as int,
      owner: null == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as RepositoryOwner,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RepositoryOwnerCopyWith<$Res> get owner {
    return $RepositoryOwnerCopyWith<$Res>(_value.owner, (value) {
      return _then(_value.copyWith(owner: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_RepositoryOverviewCopyWith<$Res>
    implements $RepositoryOverviewCopyWith<$Res> {
  factory _$$_RepositoryOverviewCopyWith(_$_RepositoryOverview value,
          $Res Function(_$_RepositoryOverview) then) =
      __$$_RepositoryOverviewCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      bool private,
      int stargazers_count,
      int forks_count,
      RepositoryOwner owner});

  @override
  $RepositoryOwnerCopyWith<$Res> get owner;
}

/// @nodoc
class __$$_RepositoryOverviewCopyWithImpl<$Res>
    extends _$RepositoryOverviewCopyWithImpl<$Res, _$_RepositoryOverview>
    implements _$$_RepositoryOverviewCopyWith<$Res> {
  __$$_RepositoryOverviewCopyWithImpl(
      _$_RepositoryOverview _value, $Res Function(_$_RepositoryOverview) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? private = null,
    Object? stargazers_count = null,
    Object? forks_count = null,
    Object? owner = null,
  }) {
    return _then(_$_RepositoryOverview(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      private: null == private
          ? _value.private
          : private // ignore: cast_nullable_to_non_nullable
              as bool,
      stargazers_count: null == stargazers_count
          ? _value.stargazers_count
          : stargazers_count // ignore: cast_nullable_to_non_nullable
              as int,
      forks_count: null == forks_count
          ? _value.forks_count
          : forks_count // ignore: cast_nullable_to_non_nullable
              as int,
      owner: null == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as RepositoryOwner,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RepositoryOverview implements _RepositoryOverview {
  const _$_RepositoryOverview(
      {required this.id,
      required this.name,
      required this.private,
      required this.stargazers_count,
      required this.forks_count,
      required this.owner});

  factory _$_RepositoryOverview.fromJson(Map<String, dynamic> json) =>
      _$$_RepositoryOverviewFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final bool private;
  @override
  final int stargazers_count;
  @override
  final int forks_count;
  @override
  final RepositoryOwner owner;

  @override
  String toString() {
    return 'RepositoryOverview(id: $id, name: $name, private: $private, stargazers_count: $stargazers_count, forks_count: $forks_count, owner: $owner)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RepositoryOverview &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.private, private) || other.private == private) &&
            (identical(other.stargazers_count, stargazers_count) ||
                other.stargazers_count == stargazers_count) &&
            (identical(other.forks_count, forks_count) ||
                other.forks_count == forks_count) &&
            (identical(other.owner, owner) || other.owner == owner));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, private, stargazers_count, forks_count, owner);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RepositoryOverviewCopyWith<_$_RepositoryOverview> get copyWith =>
      __$$_RepositoryOverviewCopyWithImpl<_$_RepositoryOverview>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RepositoryOverviewToJson(
      this,
    );
  }
}

abstract class _RepositoryOverview implements RepositoryOverview {
  const factory _RepositoryOverview(
      {required final int id,
      required final String name,
      required final bool private,
      required final int stargazers_count,
      required final int forks_count,
      required final RepositoryOwner owner}) = _$_RepositoryOverview;

  factory _RepositoryOverview.fromJson(Map<String, dynamic> json) =
      _$_RepositoryOverview.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  bool get private;
  @override
  int get stargazers_count;
  @override
  int get forks_count;
  @override
  RepositoryOwner get owner;
  @override
  @JsonKey(ignore: true)
  _$$_RepositoryOverviewCopyWith<_$_RepositoryOverview> get copyWith =>
      throw _privateConstructorUsedError;
}
