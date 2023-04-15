import 'package:chatting_app/widget/form_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});
  void submitFormFn(
      String username, String email, String password, bool isLogin) async {
    try {
      if (isLogin) {
        //LOGIN
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);
      } else {
        //REGISTER
        final result = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);

        FirebaseFirestore.instance
            .collection('users')
            .doc(result.user!.uid)
            .set({'username': username, 'email': email, 'password': password});
      }
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: FormAuth(submitForm: submitFormFn),
    );
  }
}
