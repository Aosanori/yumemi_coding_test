// ignore_for_file: non_constant_identifier_names, public_member_api_docs

import 'package:freezed_annotation/freezed_annotation.dart';

import '../repository_owner/repository_owner.dart';

part 'repository_overview.freezed.dart';
part 'repository_overview.g.dart';

@freezed
class RepositoryOverview with _$RepositoryOverview {

  // プロパティを指定
  const factory RepositoryOverview({
    required int id,
    required String name,
    required bool private,
    required int stargazers_count,
    required int forks_count,
    required RepositoryOwner owner,
    //@Default(false) bool isPremium,
  }) = _RepositoryOverview;

  factory RepositoryOverview.fromJson(Map<String, dynamic> json) => _$RepositoryOverviewFromJson(json);
}