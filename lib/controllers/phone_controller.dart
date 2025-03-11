import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:otp_using_firebase/views/screens/otp_screen.dart';

class PhoneAuthController extends GetxController {
  var isLoading = false.obs; // Observable for loading state
  var completePhoneNumber = ''.obs; // Observable for phone number

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> verifyPhoneNumber() async {
    if (completePhoneNumber.value.isEmpty) {
      Get.snackbar(
        'Invalid Phone Number',
        'Please enter a valid phone number',
        backgroundColor: Get.theme.colorScheme.error,
        colorText: Get.theme.colorScheme.onError,
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    isLoading.value = true;

    try {
      await _auth.verifyPhoneNumber(
        verificationCompleted: (PhoneAuthCredential credential) {
          isLoading.value = false;
        },
        verificationFailed: (FirebaseAuthException ex) {
          isLoading.value = false;
          Get.snackbar(
            'Error',
            ex.message ?? 'Something went wrong',
            backgroundColor: Get.theme.colorScheme.error,
            colorText: Get.theme.colorScheme.onError,
            snackPosition: SnackPosition.BOTTOM,
          );
        },
        codeSent: (String verificationId, int? resendToken) {
          isLoading.value = false;
          Get.to(() => OtpScreen(
                verificationid: verificationId,
                phoneNumber: completePhoneNumber.value,
              ));
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
        phoneNumber: completePhoneNumber.value,
      );
    } catch (e) {
      isLoading.value = false;
      Get.snackbar(
        'Error',
        e.toString(),
        backgroundColor: Get.theme.colorScheme.error,
        colorText: Get.theme.colorScheme.onError,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
