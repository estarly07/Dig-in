class BaseResultUseCase {
  BaseResultUseCase._();

  factory BaseResultUseCase.success(dynamic data) = SuccessResponse;
  factory BaseResultUseCase.nullOrEmptyData() = NullOrEmptyData;
  factory BaseResultUseCase.errorApi(Exception exception)= ErrorResponseApi;
}

class SuccessResponse extends BaseResultUseCase {
  final dynamic data;
  SuccessResponse(this.data) : super._();
}

class NullOrEmptyData extends BaseResultUseCase {
  NullOrEmptyData() : super._();
}
class NoConnectionInternet extends BaseResultUseCase {
  NoConnectionInternet() : super._();
}

class ErrorResponseApi extends BaseResultUseCase {
  final Exception error;
  ErrorResponseApi(this.error) : super._();
}
