import 'package:hive/hive.dart';

class HiveHelper {
  static const onboardingBox = "ONBOARDING_BOX";
  static const token = "TOKEN";
  static const KEY_BOX_APP_LANGUAGE = "KEY_BOX_APP_LANGUAGE";

  /// Onboarding Box

  static void isFirstTime() async {
    await Hive.box(onboardingBox).put(onboardingBox, true);
  }

  static bool checkOnboardingBox() {
    if (Hive.box(onboardingBox).isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  static setToken(String tokenParam) {
    Hive.box(token).put(token, tokenParam);
  }

  static String? getToken() {
    if (Hive.box(token).isNotEmpty) {
      return Hive.box(token).get(token);
    }
  }

  static void setLanguage(String langCode) async {
    Hive.box(KEY_BOX_APP_LANGUAGE).put(KEY_BOX_APP_LANGUAGE, langCode);
  }

  static String? getLanguage() {
    return Hive.box(KEY_BOX_APP_LANGUAGE).get(KEY_BOX_APP_LANGUAGE);
  }
}
