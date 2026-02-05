import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

/// Base failure class for error handling using fpdart Either type.
///
/// This sealed class defines all possible failure types in the application.
/// Each failure type represents a specific error category that can occur
/// during data operations.
///
/// Usage:
/// ```dart
/// Future<Either<Failure, Data>> getData() async {
///   try {
///     final data = await dataSource.fetch();
///     return right(data);
///   } on NetworkException catch (e) {
///     return left(Failure.network(message: e.message));
///   }
/// }
/// ```
///
/// **Validates: Requirements 5.1, 5.6**
@freezed
sealed class Failure with _$Failure {
  /// Network-related failures (connection timeout, no internet, etc.)
  ///
  /// [message] - Human-readable error message
  /// [statusCode] - Optional HTTP status code if available
  const factory Failure.network({required String message, int? statusCode}) =
      NetworkFailure;

  /// Server-side failures (5xx errors, API errors)
  ///
  /// [message] - Human-readable error message from server
  /// [statusCode] - HTTP status code from server response
  const factory Failure.server({
    required String message,
    required int statusCode,
  }) = ServerFailure;

  /// Local cache/storage failures
  ///
  /// [message] - Human-readable error message describing cache issue
  const factory Failure.cache({required String message}) = CacheFailure;

  /// Resource not found failures (404 errors)
  ///
  /// [resource] - Name of the resource that was not found
  const factory Failure.notFound({required String resource}) = NotFoundFailure;

  /// Authentication/authorization failures (401, 403 errors)
  const factory Failure.unauthorized() = UnauthorizedFailure;

  /// Input validation failures
  ///
  /// [message] - General validation error message
  /// [fieldErrors] - Optional map of field-specific validation errors
  const factory Failure.validation({
    required String message,
    Map<String, String>? fieldErrors,
  }) = ValidationFailure;
}
