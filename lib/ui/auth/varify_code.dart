import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/ui/posts/post_screen.dart';
import 'package:flutter_firebase/utils/utils.dart';
import 'package:flutter_firebase/widgets/round_button.dart';

class VarifyCodeScreen extends StatefulWidget {
  final String varificationid;
  const VarifyCodeScreen({super.key, required this.varificationid});

  @override
  State<VarifyCodeScreen> createState() => _VarifyCodeScreenState();
}

class _VarifyCodeScreenState extends State<VarifyCodeScreen> {
  bool loading = false;
  final _auth = FirebaseAuth.instance;

  void setLoadingStatus(bool currentStatus) {
    setState(() {
      loading = currentStatus;
    });
  }

  void codeVarification() async {
    final credential = PhoneAuthProvider.credential(
        verificationId: widget.varificationid,
        smsCode: varifySixDigitCdoe.text.toLowerCase());
    setLoadingStatus(true);

    try {
      _auth.signInWithCredential(credential);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const PostScreen(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      setLoadingStatus(false);
      Utils().toastMessage(e.message.toString());
    }
  }

  final varifySixDigitCdoe = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Varify"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(children: [
          const SizedBox(height: 50),
          TextFormField(
            controller: varifySixDigitCdoe,
            keyboardType: TextInputType.phone,
            decoration: const InputDecoration(hintText: "6 digit login"),
          ),
          const SizedBox(height: 30),
          RoundButton(
              title: "Varify",
              onTap: () {
                codeVarification();
              }),
        ]),
      ),
    );
  }
}
