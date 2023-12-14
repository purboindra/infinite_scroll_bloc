part of 'post_bloc.dart';

enum PostStatus { initial, success, failure }

final class PostState extends Equatable {
  const PostState({
    this.status = PostStatus.initial,
    this.posts = const <PostModel>[],
    this.hasReachedMax = false,
  });

  final PostStatus status;
  final List<PostModel> posts;
  final bool hasReachedMax;

  PostState copyWith({
    PostStatus? status,
    List<PostModel>? posts,
    bool? hasReachedMax,
  }) {
    return PostState(
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      posts: posts ?? this.posts,
      status: status ?? this.status,
    );
  }

  @override
  String toString() =>
      '''PostState { status: $status, hasReachedMax: $hasReachedMax, posts: ${posts.length} }''';

  @override
  List<Object> get props => [status, hasReachedMax, posts];
}
