class Validators {
  static bool validateMainField(String input) {
    // const mainFieldRegex = r'^[a-zA-Z]{2}[0-9]{4}$';

    const mainFieldRegex = r'^[A-Z]{2}[0-9]{4}$';

    if (RegExp(mainFieldRegex).hasMatch(input)) {
      return true;
    } else {
      return false;
    }
  }

  static bool validatePhoneNumber(String phoneNumber) {
    const phoneNumberRegex = r'^[0-9]{10}$';

    if (RegExp(phoneNumberRegex).hasMatch(phoneNumber)) {
      return true;
    } else {
      return false;
    }
  }

  static bool validateOtp(String otp) {
    const otpRegex = r'^[0-9]{6}$';

    if (RegExp(otpRegex).hasMatch(otp)) {
      return true;
    } else {
      return false;
    }
  }
}
