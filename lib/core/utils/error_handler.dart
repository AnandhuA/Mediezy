class ErrorHandler {
  static String extractErrorMessage(dynamic data) {
    if (data == null) {
      return "Something went wrong";
    }

    if (data["message"] is Map) {
      final errors = data["message"] as Map;

      final messages = <String>[];

      errors.forEach((key, value) {
        if (value is List) {
          messages.addAll(
            value.map((e) => e.toString()),
          );
        }
      });

      return messages.join("\n");
    }

    return data["message"]?.toString() ??
        "Something went wrong";
  }
}