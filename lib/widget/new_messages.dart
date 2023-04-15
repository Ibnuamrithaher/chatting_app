import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NewMessages extends StatefulWidget {
  const NewMessages({super.key});

  @override
  State<NewMessages> createState() => _NewMessagesState();
}

class _NewMessagesState extends State<NewMessages> {
  String message = '';
  final messageController = TextEditingController();
  void sendMessage() async {
    if (message == '') {
      return;
    }

    final user = await FirebaseAuth.instance.currentUser;

    FirebaseFirestore.instance.collection('chat').add(
        {'text': message, 'createdAt': Timestamp.now(), 'userId': user!.uid});
    messageController.clear();
    message = '';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Expanded(
              child: TextField(
            controller: messageController,
            onChanged: (value) {
              setState(() {
                message = value;
              });
            },
          )),
          IconButton(
              onPressed: sendMessage,
              icon: const Icon(
                Icons.send,
                color: Colors.blue,
              ))
        ],
      ),
    );
  }
}
