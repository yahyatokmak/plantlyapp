import 'api_exception.dart';

sealed class ApiResult<T> {
  const ApiResult();

  bool get isSuccess => this is ApiSuccess<T>;
  bool get isFailure => this is ApiFailure<T>;

  T? get data => isSuccess ? (this as ApiSuccess<T>).data : null;
  ApiException? get exception => isFailure ? (this as ApiFailure<T>).exception : null;

  R when<R>({
    required R Function(T data) success,
    required R Function(ApiException exception) failure,
  }) {
    if (this is ApiSuccess<T>) {
      return success((this as ApiSuccess<T>).data);
    } else {
      return failure((this as ApiFailure<T>).exception);
    }
  }

  R? whenOrNull<R>({
    R Function(T data)? success,
    R Function(ApiException exception)? failure,
  }) {
    if (this is ApiSuccess<T> && success != null) {
      return success((this as ApiSuccess<T>).data);
    } else if (this is ApiFailure<T> && failure != null) {
      return failure((this as ApiFailure<T>).exception);
    }
    return null;
  }
}

class ApiSuccess<T> extends ApiResult<T> {
  @override
  final T data;

  const ApiSuccess(this.data);
}

class ApiFailure<T> extends ApiResult<T> {
  @override
  final ApiException exception;

  const ApiFailure(this.exception);
}
