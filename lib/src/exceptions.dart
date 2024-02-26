class SignUpFailedException implements Exception{
  @override
  String toString() {
    return 'Sign up failed';
  }
}

class WrongCredentialsException implements Exception{
  @override
  String toString() {
    return 'Incorrect email or password';
  }
}

class CouldNotLoadUserDataException implements Exception{
  @override
  String toString() {
    return 'Could not load user data';
  }
}

class HostUnreachableException implements Exception {
  @override
  String toString() {
    return 'No connection to the server';
  }
}