class AuthService {
  Future<bool> login({
    required String username,
    required String password,
  }) async {
    await Future.delayed(const Duration(seconds: 2));

    // API call here

    return true;
  }
}