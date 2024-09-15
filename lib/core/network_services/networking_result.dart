// Import your error model
import 'package:may_fair/core/models/error_handler_model.dart';


// Base class for API result
abstract class ApiResult<T> {
  const ApiResult();
  
  // Factory method to create a success or failure
  factory ApiResult.success(T data) => Success(data);
  factory ApiResult.failure(ApiErrorModel apiErrorModel) => Failure(apiErrorModel);

  // This method can be overridden to handle both success and failure cases.
  void when({
    required void Function(T data) success,
    required void Function(ApiErrorModel error) failure,
  });
}

// Success subclass
class Success<T> extends ApiResult<T> {
  final T data;

  Success(this.data) : super();

  @override
  void when({
    required void Function(T data) success,
    required void Function(ApiErrorModel error) failure,
  }) {
    success(data); // Call the success function with the data
  }
}

// Failure subclass
class Failure<T> extends ApiResult<T> {
  final ApiErrorModel apiErrorModel;

  Failure(this.apiErrorModel) : super();

  @override
  void when({
    required void Function(T data) success,
    required void Function(ApiErrorModel error) failure,
  }) {
    failure(apiErrorModel); // Call the failure function with the error
  }
}
