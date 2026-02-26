/// Base exception class for application-specific errors.
///
/// This exception is intended to be caught by the UI layer to display
/// user-friendly error messages.
class AppException implements Exception {
  AppException(this.message);
  final String message;

  @override
  String toString() => message;
}
