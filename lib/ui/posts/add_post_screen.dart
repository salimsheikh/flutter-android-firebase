import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/utils/utils.dart';
import 'package:flutter_firebase/widgets/round_button.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  bool loading = false;
  final databaseRef = FirebaseDatabase.instance.ref("Post");
  final postController = TextEditingController();

  void setLoadingStatus(bool currentStatus) {
    setState(() {
      loading = currentStatus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Post"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(height: 30),
            TextFormField(
              maxLines: 4,
              controller: postController,
              decoration: const InputDecoration(
                hintText: "Whats your mind?",
                label: Text("Post Content"),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 30),
            RoundButton(
                title: "Add",
                loading: loading,
                onTap: () {
                  try {
                    setLoadingStatus(true);
                    final id = DateTime.now().microsecondsSinceEpoch.toString();
                    databaseRef.child(id).set({
                      'id': id,
                      'title': postController.text.toString(),
                    }).then((value) => {
                          setLoadingStatus(false),
                          Utils()
                              .toastSuccessMessage("Post added successfully.")
                        });
                  } on FirebaseException catch (e) {
                    Utils().toastMessage(e.message.toString());
                  }
                })
          ],
        ),
      ),
    );
  }
}
