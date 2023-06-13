import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/ui/auth/login_screen.dart';
import 'package:flutter_firebase/utils/utils.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Posts"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () async {
                try {
                  await _auth.signOut().then((value) => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        )
                      });
                  /*
                      .onError((error, stackTrace) {
                    Utils().toastMessage(error.toString());
                  });*/
                } on FirebaseAuthException catch (e) {
                  Utils().toastMessage(e.message.toString());
                }
                //
              },
              icon: const Icon(Icons.logout_outlined))
        ],
      ),
    );
  }
}
