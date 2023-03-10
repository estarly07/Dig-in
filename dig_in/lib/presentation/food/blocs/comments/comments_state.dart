part of 'comments_bloc.dart';

@immutable
abstract class CommentsState {

  CommentsState();
}

class CommentsInitial extends CommentsState {}
class LoadingCommentsState extends CommentsState {}
class LoadedCommenstState extends CommentsState {
  final List<CommentModel> comments;
  LoadedCommenstState(this.comments);
}