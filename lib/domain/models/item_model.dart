// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import 'license_model.dart';
import 'owner_model.dart';

part 'item_model.freezed.dart';
part 'item_model.g.dart';

/// APIレスポンスのItemプロパティをクライアント側で扱いやすくするための型
@freezed
class Item with _$Item {
  factory Item({
    required int id,
    @JsonKey(name: 'node_id') required String nodeId,
    required String name,
    @JsonKey(name: 'full_name') required String fullName,
    required Owner owner,
    required bool private,
    @JsonKey(name: 'html_url') required String htmlUrl,
    String? description,
    required bool fork,
    required String url,
    @JsonKey(name: 'forks_url') required String forksUrl,
    @JsonKey(name: 'keys_url') required String keysUrl,
    @JsonKey(name: 'collaborators_url') required String collaboratorsUrl,
    @JsonKey(name: 'teams_url') required String teamsUrl,
    @JsonKey(name: 'hooks_url') required String hooksUrl,
    @JsonKey(name: 'issue_events_url') required String issueEventsUrl,
    @JsonKey(name: 'events_url') required String eventsUrl,
    @JsonKey(name: 'assignees_url') required String assigneesUrl,
    @JsonKey(name: 'branches_url') required String branchesUrl,
    @JsonKey(name: 'tags_url') required String tagsUrl,
    @JsonKey(name: 'blobs_url') required String blobsUrl,
    @JsonKey(name: 'git_tags_url') required String gitTagsUrl,
    @JsonKey(name: 'git_refs_url') required String gitRefsUrl,
    @JsonKey(name: 'trees_url') required String treesUrl,
    @JsonKey(name: 'statuses_url') required String statusesUrl,
    @JsonKey(name: 'languages_url') required String languagesUrl,
    @JsonKey(name: 'stargazers_url') required String stargazersUrl,
    @JsonKey(name: 'contributors_url') required String contributorsUrl,
    @JsonKey(name: 'subscribers_url') required String subscribersUrl,
    @JsonKey(name: 'subscription_url') required String subscriptionUrl,
    @JsonKey(name: 'commits_url') required String commitsUrl,
    @JsonKey(name: 'git_commits_url') required String gitCommitsUrl,
    @JsonKey(name: 'comments_url') required String commentsUrl,
    @JsonKey(name: 'issue_comment_url') required String issueCommentUrl,
    @JsonKey(name: 'contents_url') required String contentsUrl,
    @JsonKey(name: 'compare_url') required String compareUrl,
    @JsonKey(name: 'merges_url') required String mergesUrl,
    @JsonKey(name: 'archive_url') required String archiveUrl,
    @JsonKey(name: 'downloads_url') required String downloadsUrl,
    @JsonKey(name: 'issues_url') required String issuesUrl,
    @JsonKey(name: 'pulls_url') required String pullsUrl,
    @JsonKey(name: 'milestones_url') required String milestonesUrl,
    @JsonKey(name: 'notifications_url') required String notificationsUrl,
    @JsonKey(name: 'labels_url') required String labelsUrl,
    @JsonKey(name: 'releases_url') required String releasesUrl,
    @JsonKey(name: 'deployments_url') required String deploymentsUrl,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    @JsonKey(name: 'pushed_at') required DateTime pushedAt,
    @JsonKey(name: 'git_url') required String gitUrl,
    @JsonKey(name: 'ssh_url') required String sshUrl,
    @JsonKey(name: 'clone_url') required String cloneUrl,
    @JsonKey(name: 'svn_url') required String svnUrl,
    String? homepage,
    required int size,
    @JsonKey(name: 'stargazers_count') required int stargazersCount,
    @JsonKey(name: 'watchers_count') required int watchersCount,
    String? language,
    @JsonKey(name: 'has_issues') required bool hasIssues,
    @JsonKey(name: 'has_projects') required bool hasProjects,
    @JsonKey(name: 'has_downloads') required bool hasDownloads,
    @JsonKey(name: 'has_wiki') required bool hasWiki,
    @JsonKey(name: 'has_pages') required bool hasPages,
    @JsonKey(name: 'has_discussions') required bool hasDiscussions,
    @JsonKey(name: 'forks_count') required int forksCount,
    String? mirrorUrl,
    required bool archived,
    required bool disabled,
    @JsonKey(name: 'open_issues_count') required int openIssuesCount,
    License? license,
    @JsonKey(name: 'allow_forking') required bool allowForking,
    @JsonKey(name: 'is_template') required bool isTemplate,
    @JsonKey(name: 'web_commit_signoff_required')
    required bool webCommitSignoffRequired,
    List<String>? topics,
    required String visibility,
    @JsonKey(name: 'forks') required int forks,
    @JsonKey(name: 'open_issues') required int openIssues,
    @JsonKey(name: 'watchers') required int watchers,
    @JsonKey(name: 'default_branch') required String defaultBranch,
  }) = _Item;

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
}
