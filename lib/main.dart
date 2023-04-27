import 'package:chatting_app/pages/pages.dart';
import 'package:chatting_app/screen/auth_screen.dart';
import 'package:chatting_app/screen/chat_screen.dart';
import 'package:chatting_app/screen/chats_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> verifyPhoneNumber(String? phoneNumber) async {
  // kode autentikasi Firebase di sini
  await FirebaseAuth.instance.verifyPhoneNumber(
    phoneNumber: '+62895704163165',
    verificationCompleted: (PhoneAuthCredential credential) {},
    verificationFailed: (FirebaseAuthException e) {},
    codeSent: (String verificationId, int? resendToken) {},
    codeAutoRetrievalTimeout: (String verificationId) {},
  );
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: StreamBuilder<User?>(
//           stream: FirebaseAuth.instance.authStateChanges(),
//           builder: (context, snapshot) {
//             if (snapshot.data != null) {
//               return const ChatScreen();
//             }
//             // return const LoginPage();
//             return const AuthScreen();
//           }),
//     );
//   }
// }

// TRY AUTHENTIKASI FIRBASE
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/chats': (context) => const ChatsScreen(),
      },
      initialRoute: '/chats',
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late String? _phoneNumber;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                decoration: const InputDecoration(
                  labelText: 'Nomor Telepon',
                ),
                keyboardType: TextInputType.phone,
                onChanged: (value) {
                  _phoneNumber = value;
                },
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                verifyPhoneNumber(_phoneNumber);
              },
              child: const Text('Kirim Kode Verifikasi'),
            ),
          ],
        ),
      ),
    );
  }
}
