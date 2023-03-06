abstract class AuthValidators {
  static checkIsEmpty(String value) {
    return value.trim().isEmpty;
  }

  static checkIsLetter(String value) {
    return RegExp('[a-zA-Z]').hasMatch(value);
  }

  static checkIsNumber(String value) {
    return RegExp('[0-9]').hasMatch(value);
  }

  static validateEmail(String value) {
    if (checkIsEmpty(value)) {
      return 'invaild email';
    }
    if (value.contains('@gmail.com')) {
      return null;
    } else {
      return 'invaild email';
    }
  }

  static validateName(String value) {
    if (checkIsEmpty(value)) {
      return 'invaild name';
    }
    if (checkIsLetter(value)) {
      return null;
    } else {
      return 'invaild name';
    }
  }

  static validatePassword(String value) {
    if (checkIsEmpty(value)) {
      return 'weak Password';
    }
    if (value.length > 6) {
      return null;
    } else {
      return 'Weak Password';
    }
  }

  static validatePhone(String value) {
    if (checkIsEmpty(value)) {
      return 'invaild number';
    }
    if (checkIsNumber(value)) {
      return null;
    } else {
      return 'invaild number';
    }
  }

  static validateNationalID(String value) {
    if (checkIsEmpty(value)) {
      return 'invaild ID';
    }
    if (checkIsNumber(value) &
        (value.length == 10) &
        (value.startsWith('1') || value.startsWith('2'))) {
      return null;
    } else {
      return 'invaild ID';
    }
  }
}
