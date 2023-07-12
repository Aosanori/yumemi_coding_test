// ignore_for_file: non_constant_identifier_names, public_member_api_docs

import 'package:freezed_annotation/freezed_annotation.dart';

part 'repository_owner.freezed.dart';
part 'repository_owner.g.dart';

@freezed
class RepositoryOwner with _$RepositoryOwner {
  const factory RepositoryOwner({
    required String login,
    required String avatar_url,
    required int id,
    //@Default(false) bool isPremium,
  }) = _RepositoryOwner;

  factory RepositoryOwner.fromJson(Map<String, dynamic> json) =>
      _$RepositoryOwnerFromJson(json);
}
