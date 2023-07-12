// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repository_overview.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RepositoryOverview _$$_RepositoryOverviewFromJson(
        Map<String, dynamic> json) =>
    _$_RepositoryOverview(
      id: json['id'] as int,
      name: json['name'] as String,
      private: json['private'] as bool,
      stargazers_count: json['stargazers_count'] as int,
      forks_count: json['forks_count'] as int,
      owner: RepositoryOwner.fromJson(json['owner'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_RepositoryOverviewToJson(
        _$_RepositoryOverview instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'private': instance.private,
      'stargazers_count': instance.stargazers_count,
      'forks_count': instance.forks_count,
      'owner': instance.owner,
    };
