import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter_firebase/ui/auth/login_screen.dart';
import 'package:flutter_firebase/widgets/round_button.dart';

import '../../utils/utils.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool loading = false;
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text("Sign up"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
                decoration: const InputDecoration(
                  hintText: "Email",
                  prefixIcon: Icon(Icons.alternate_email),
                ),
                // initialValue: 'admin@gmail.com',
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter email.';
                  }

                  if (!EmailValidator.validate(value)) {
                    return 'Enter valid email.';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: "Password",
                  prefixIcon: Icon(Icons.lock_open),
                ),
                //initialValue: '1234567989',
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter password.';
                  }

                  if (value.length < 6) {
                    return 'Enter 6 character passwrod.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 50),
              RoundButton(
                title: "Sign up",
                loading: loading,
                onTap: () async {
                  if (_formKey.currentState!.validate()) {
                    setState(() {
                      loading = true;
                    });

                    try {
                      await _auth
                          .createUserWithEmailAndPassword(
                              email: emailController.text.toString(),
                              password: passwordController.text.toString())
                          .then((value) => {
                                setState(() {
                                  loading = false;
                                  Utils().toastSuccessMessage(
                                      "Account created succssfully.");
                                })
                              });

                      emailController.text = "";
                      passwordController.text = "";
                      /*
                          .onError((error, stackTrace) => {
                                setState(() {
                                  loading = false;
                                  Utils().toastMessage(error.toString());
                                })
                              });
                              */
                    } on FirebaseAuthException catch (e) {
                      setState(() {
                        loading = false;
                      });
                      Utils().toastMessage(e.message.toString());
                    }
                  }
                },
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have account."),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
                    child: const Text("Login"),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
