import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ChatDetail extends StatelessWidget {
  const ChatDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ibnu Amri Thaher'),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text('Pesan Satu'),
        const Text('pesan 2'),
        const Text('pesan 3'),
        const Text('pesan 4'),
        Expanded(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                const Expanded(
                    child: TextField(
                  decoration: InputDecoration(
                    hintText: 'your message in here',
                  ),
                )),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.send,
                      color: Colors.blue,
                    ))
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
