import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_using_firebase/otp_screen.dart';

class PhoneAuth extends StatefulWidget {
  const PhoneAuth({super.key});

  @override
  State<PhoneAuth> createState() => _PhoneAuthState();
}

TextEditingController phoneController = TextEditingController();

class _PhoneAuthState extends State<PhoneAuth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                hintText: "Enter Phone Number", suffixIcon: Icon(Icons.phone)),
            controller: phoneController,
          ),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(
              onPressed: () async {
                await FirebaseAuth.instance.verifyPhoneNumber(
                    verificationCompleted: (PhoneAuthCredential credential) {},
                    verificationFailed: (FirebaseAuthException ex) {},
                    codeSent: (String verificationid, int? resendtoken) {
                      Get.to(() => OtpScreen(
                            verificationid: verificationid,
                          ));
                    },
                    codeAutoRetrievalTimeout: (String verificationId) {},
                    phoneNumber: phoneController.text.toString());
              },
              child: Text('Verify Phone number'))
        ],
      ),
    );
  }
}
