import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:infinite_list_bloc/post/data/repository/post_repository.dart';
import 'package:infinite_list_bloc/post/models/post_model.dart';
import 'package:stream_transform/stream_transform.dart';

part 'post_event.dart';
part 'post_state.dart';

const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepository postRepository;

  PostBloc(this.postRepository) : super(const PostState()) {
    on<PostFetched>(_onFetched,
        transformer: throttleDroppable(throttleDuration));
  }

  Future<void> _onFetched(PostFetched event, Emitter<PostState> emit) async {
    try {
      print('ON FETCH BLOG');
      if (state.status == PostStatus.initial) {
        final post = await postRepository.fetchPost();
        return emit(state.copyWith(
          hasReachedMax: false,
          posts: post,
          status: PostStatus.success,
        ));
      }
      final post = await postRepository.fetchPost(state.posts.length);
      emit(post.isEmpty
          ? state.copyWith(hasReachedMax: true)
          : state.copyWith(
              status: PostStatus.success,
              posts: List.of(state.posts)..addAll(post),
              hasReachedMax: false,
            ));
    } catch (e) {
      print('ON FETCH BLOG ERROR $e');
      emit(state.copyWith(status: PostStatus.failure));
    }
  }
}
