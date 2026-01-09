class AppRegex {
  // Validate email
  static bool isEmailValid(String email) {
    return RegExp(r'^.+@[a-zA-Z]+\.[a-zA-Z]+(\.[a-zA-Z]+)?$').hasMatch(email);
  }

  /// Validate email and return error message
  static String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return 'Email is required';
    }
    if (!isEmailValid(email)) {
      return 'Invalid email address';
    }
    return null;
  }

  // Validate password rules
  static bool isPasswordValid(String password) {
    final hasMinLength = password.length >= 8;
    final hasNumber = RegExp(r'\d').hasMatch(password);
    final hasLetter = RegExp(r'[a-zA-Z]').hasMatch(password);

    return hasMinLength && hasNumber && hasLetter;
  }

  /// Validate password and return error message
  static String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return 'Password is required';
    }

    if (password.length < 8) {
      return 'Password must be at least 8 characters';
    }

    if (!RegExp(r'[a-zA-Z]').hasMatch(password)) {
      return 'Password must contain at least one letter';
    }

    if (!RegExp(r'\d').hasMatch(password)) {
      return 'Password must contain at least one number';
    }

    return null;
  }

  /// Validate confirm password
  static String? validateConfirmPassword(
    String? confirmPassword,
    String? password,
  ) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return 'Confirm password is required';
    }
    if (confirmPassword != password) {
      return 'Passwords do not match';
    }
    return null;
  }
}
