import 'package:get/get.dart';

class UserController extends RxController {
  RxString? email = ''.obs;
  RxString? name = ''.obs;
  RxString? phone = ''.obs;

  login(String localEmail) {
    email = localEmail.obs;
  }

  register({
    required String localEmail,
    required String localName,
    required String localPhone,
  }) {
    email = localEmail.obs;
    name = localName.obs;
    phone = localPhone.obs;
  }
}
