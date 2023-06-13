import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/ui/auth/varify_code.dart';
import 'package:flutter_firebase/utils/utils.dart';
import 'package:flutter_firebase/widgets/round_button.dart';

class LoginWithPhoneNumber extends StatefulWidget {
  const LoginWithPhoneNumber({super.key});

  @override
  State<LoginWithPhoneNumber> createState() => _LoginWithPhoneNumberState();
}

class _LoginWithPhoneNumberState extends State<LoginWithPhoneNumber> {
  bool loading = false;
  final _auth = FirebaseAuth.instance;

  void setLoadingStatus(bool currentStatus) {
    setState(() {
      loading = currentStatus;
    });
  }

  void varification() async {
    try {
      setLoadingStatus(true);
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumberController.text,
        verificationCompleted: (_) {
          setLoadingStatus(false);
        },
        verificationFailed: (e) {
          setLoadingStatus(false);
          Utils().toastMessage(e.message.toString());
        },
        codeSent: (String varificationid, int? token) {
          setLoadingStatus(false);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  VarifyCodeScreen(varificationid: varificationid),
            ),
          );
        },
        codeAutoRetrievalTimeout: (e) {
          setLoadingStatus(false);
          Utils().toastMessage(e.toString());
        },
      );
    } on FirebaseAuthException catch (e) {
      setLoadingStatus(false);
      Utils().toastMessage(e.message.toString());
    }
  }

  final phoneNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text("Login"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(children: [
          const SizedBox(height: 50),
          TextFormField(
            controller: phoneNumberController,
            keyboardType: TextInputType.phone,
            decoration: const InputDecoration(
              label: Text("Mobile Number"),
              hintText: "+1 234 985 6558",
            ),
          ),
          const SizedBox(height: 30),
          RoundButton(
              title: "Login",
              onTap: () {
                varification();
              }),
        ]),
      ),
    );
  }
}
