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
      language: json['language'] as String,
      stargazers_count: json['stargazers_count'] as int,
      forks_count: json['forks_count'] as int,
      open_issues: json['open_issues'] as int,
      watchers: json['watchers'] as int,
      owner: RepositoryOwner.fromJson(json['owner'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_RepositoryOverviewToJson(
        _$_RepositoryOverview instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'private': instance.private,
      'language': instance.language,
      'stargazers_count': instance.stargazers_count,
      'forks_count': instance.forks_count,
      'open_issues': instance.open_issues,
      'watchers': instance.watchers,
      'owner': instance.owner,
    };
