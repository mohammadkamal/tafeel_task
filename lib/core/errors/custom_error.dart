class CustomError {
  const CustomError({required this.message, this.stackTrace});

  final String message;
  final StackTrace? stackTrace;
}
