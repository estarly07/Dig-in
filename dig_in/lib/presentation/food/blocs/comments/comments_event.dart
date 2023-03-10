part of 'comments_bloc.dart';

@immutable
abstract class CommentsEvent {}
class GetCommentsEvent extends CommentsEvent {
  final String idFood;
  GetCommentsEvent(this.idFood);

}