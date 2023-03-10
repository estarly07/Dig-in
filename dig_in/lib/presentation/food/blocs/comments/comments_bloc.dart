import 'package:bloc/bloc.dart';
import 'package:dig_in/base/base_result_use_case.dart';
import 'package:dig_in/domain/food/get_comments_foods_use_case.dart';
import 'package:dig_in/domain/models/comment_model.dart';
import 'package:meta/meta.dart';

part 'comments_event.dart';
part 'comments_state.dart';

class CommentsBloc extends Bloc<CommentsEvent, CommentsState> {
  final GetCommentsFoodUseCase _getCommentsFoodUseCase;
  CommentsBloc(this._getCommentsFoodUseCase) : super(CommentsInitial()) {
    on<GetCommentsEvent>((event, emit) async {
      emit(LoadingCommentsState());
      final response =await  _getCommentsFoodUseCase.getCommentsFoodUseCase(event.idFood);
      switch (response.runtimeType) {
        case SuccessResponse:
            emit(LoadedCommenstState((response as SuccessResponse).data));
          break;
        default:
      }
      
    });
  }
}
