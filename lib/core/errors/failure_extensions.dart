import 'package:fpdart/fpdart.dart';
import 'package:lunchbox/core/errors/failure.dart';

import 'package:lunchbox/i18n/translations.g.dart';

/// Extension methods for Failure to provide user-friendly error messages
/// and convenient error handling patterns.
///
/// **Validates: Requirements 5.5**
extension FailureExtensions on Failure {
  /// Converts a Failure to a user-friendly message in Chinese.
  ///
  /// This method maps each failure type to an appropriate message
  /// that can be displayed to users.
  ///
  /// Example:
  /// ```dart
  /// final failure = Failure.network(message: 'Connection timeout');
  /// print(failure.toUserMessage()); // "网络错误：Connection timeout"
  /// ```
  String toUserMessage() {
    return when(
      network: (message, statusCode) {
        if (statusCode != null) {
          return t.common.networkErrorWithCode(
            statusCode: statusCode,
            message: message,
          );
        }
        return t.common.networkError(message: message);
      },
      server: (message, statusCode) =>
          t.common.serverError(statusCode: statusCode, message: message),
      cache: (message) => t.common.cacheError(message: message),
      notFound: (resource) => t.common.notFound(resource: resource),
      unauthorized: () => t.common.unauthorized,
      validation: (message, fieldErrors) {
        if (fieldErrors != null && fieldErrors.isNotEmpty) {
          final errors = fieldErrors.entries
              .map((e) => '${e.key}: ${e.value}')
              .join(', ');
          return t.common.validationErrorWithDetails(
            message: message,
            errors: errors,
          );
        }
        return t.common.validationError(message: message);
      },
    );
  }

  /// Returns true if this is a network-related failure.
  bool get isNetworkFailure => this is NetworkFailure;

  /// Returns true if this is a server-related failure.
  bool get isServerFailure => this is ServerFailure;

  /// Returns true if this is a cache-related failure.
  bool get isCacheFailure => this is CacheFailure;

  /// Returns true if this is a not-found failure.
  bool get isNotFoundFailure => this is NotFoundFailure;

  /// Returns true if this is an unauthorized failure.
  bool get isUnauthorizedFailure => this is UnauthorizedFailure;

  /// Returns true if this is a validation failure.
  bool get isValidationFailure => this is ValidationFailure;
}

/// Extension methods for `Either<Failure, R>` to simplify error handling.
///
/// **Validates: Requirements 5.3, 5.5**
extension EitherFailureExtensions<R> on Either<Failure, R> {
  /// Gets the right value or throws the failure with a user-friendly message.
  ///
  /// This is useful when you want to propagate errors but need them
  /// to be user-friendly.
  ///
  /// Example:
  /// ```dart
  /// final result = await repository.getData();
  /// final data = result.getOrThrow(); // Throws with user message if Left
  /// ```
  R getOrThrow() {
    return fold(
      (failure) => throw Exception(failure.toUserMessage()),
      (value) => value,
    );
  }

  /// Gets the right value or returns null if it's a Left.
  ///
  /// Example:
  /// ```dart
  /// final result = await repository.getData();
  /// final data = result.getOrNull(); // Returns null if Left
  /// ```
  R? getOrNull() {
    return fold((_) => null, (value) => value);
  }

  /// Gets the right value or returns the provided default value.
  ///
  /// Example:
  /// ```dart
  /// final result = await repository.getData();
  /// final data = result.getOrDefault(defaultData);
  /// ```
  R getOrDefault(R defaultValue) {
    return fold((_) => defaultValue, (value) => value);
  }

  /// Maps the failure to a different type while preserving the right value.
  ///
  /// Example:
  /// ```dart
  /// final result = await repository.getData();
  /// final mapped = result.mapFailure(
  ///   (f) => Failure.cache(message: f.toUserMessage())
  /// );
  /// ```
  Either<Failure, R> mapFailure(Failure Function(Failure) mapper) {
    return fold((failure) => left(mapper(failure)), right);
  }

  /// Returns the failure if this is a Left, otherwise returns null.
  ///
  /// Example:
  /// ```dart
  /// final result = await repository.getData();
  /// final failure = result.getFailureOrNull();
  /// if (failure != null) {
  ///   print('Error: ${failure.toUserMessage()}');
  /// }
  /// ```
  Failure? getFailureOrNull() {
    return fold((failure) => failure, (_) => null);
  }
}
