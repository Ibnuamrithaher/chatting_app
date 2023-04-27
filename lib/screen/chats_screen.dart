import 'package:chatting_app/screen/chat_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Chatting'),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.message)),
              Tab(icon: Icon(Icons.play_circle_sharp)),
              Tab(icon: Icon(Icons.call)),
            ],
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                // your code here
              },
            ),
          ],
        ),
        body: TabBarView(
          children: [
            ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
                return Container(
                    padding: const EdgeInsets.only(
                        left: 0, top: 0, right: 0, bottom: 0),
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ChatDetail(),
                            ));
                      },
                      title: const Text("IBNU AMRI THAHER"),
                      subtitle: const Text("089523231"),
                      trailing: const Icon(
                        Icons.circle_rounded,
                        color: Colors.green,
                        size: 30,
                      ),
                    ));
              },
            ),
            const Icon(Icons.directions_transit),
            const Icon(Icons.directions_bike),
          ],
        ),
      ),
    );
  }
}
