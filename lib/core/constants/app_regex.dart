class AppRegex {
  // Validate email
  static bool isEmailValid(String email) {
    return RegExp(r'^.+@[a-zA-Z]+\.[a-zA-Z]+(\.[a-zA-Z]+)?$').hasMatch(email);
  }

  // Validate phone number
  static bool isPhoneNumberValid(String phoneNumber) {
    return RegExp(r'^(010|011|012|015)[0-9]{8}$').hasMatch(phoneNumber);
  }

  // Validate password with all requirements
  static bool isPasswordValid(String password) {
    return RegExp(
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[@$!%*?&]).{8,}$',
    ).hasMatch(password);
  }

  // Validation methods with error messages

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

  /// Validate password and return error message
  static String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return 'Password is required';
    }
    if (!isPasswordValid(password)) {
      return 'Password must contain:\n'
          '• At least 8 characters\n'
          '• At least one uppercase letter\n'
          '• At least one lowercase letter\n'
          '• At least one number\n'
          '• At least one special character (@!%*?&)';
    }
    return null;
  }

  /// Validate phone number and return error message
  static String? validatePhoneNumber(String? phoneNumber) {
    if (phoneNumber == null || phoneNumber.isEmpty) {
      return 'Phone number is required';
    }
    if (!isPhoneNumberValid(phoneNumber)) {
      return 'Invalid phone number. It must start with 010, 011, 012, or 015 and be 11 digits long';
    }
    return null;
  }

  /// Validate first name
  static String? validateFirstName(String? firstName) {
    if (firstName == null || firstName.isEmpty) {
      return 'First name is required';
    }
    return null;
  }

  /// Validate last name
  static String? validateLastName(String? lastName) {
    if (lastName == null || lastName.isEmpty) {
      return 'Last name is required';
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

  /// Validate date of birth
  static String? validateDateOfBirth(String? dateOfBirth) {
    if (dateOfBirth == null || dateOfBirth.isEmpty) {
      return 'Date of birth is required';
    }
    return null;
  }

  /// Validate user type
  static String? validateUserType(String? userType) {
    if (userType == null || userType.isEmpty) {
      return 'User type is required';
    }
    return null;
  }

  /// Validate gender
  static String? validateGender(String? gender) {
    if (gender == null || gender.isEmpty) {
      return 'Gender is required';
    }
    return null;
  }
}
