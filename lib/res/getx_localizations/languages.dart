import 'package:get/get_navigation/src/root/internacionalization.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "en_US": {
          "email_hint": "Enter email",
          "internet_exception":
              "We are unable to show result \n Please check your data \n connections ",
          "general_exception":
              "We are unable to proccess your request.\n Please try again ",
          "welcome_back": "Welcome\nBack"
        },
        "ur_PK": {"email_hint": "اپنا ای میل درج کریں۔"},
      };
}
