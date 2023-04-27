part of 'pages.dart';

class GoogleSignInPage extends StatelessWidget {
  const GoogleSignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade50,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //* TITLE
            Text(
              'SIGN IN WITH GOOGLE ACCOUNT',
              style:
                  GoogleFonts.lato(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            //* SIGN IN STATUS
            // CODE HERE: Change status based on current user
            StreamBuilder<User?>(
                stream: FirebaseAuth.instance.userChanges(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(
                        'Signed is as ${FirebaseAuth.instance.currentUser!.displayName} (${FirebaseAuth.instance.currentUser!.email})');
                  } else {
                    return const Text("You haven't signed in yet");
                  }
                }),
            const SizedBox(height: 15),

            //* SIGN IN BUTTON
            SizedBox(
              width: 150,
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.purple.shade900)),
                  onPressed: () async {
                    // CODE HERE: Sign in with Google Credential / Sign out from firebase & Google
                    if (FirebaseAuth.instance.currentUser == null) {
                      GoogleSignInAccount? account =
                          await GoogleSignIn().signIn();

                      if (account != null) {
                        GoogleSignInAuthentication auth =
                            await account.authentication;
                        OAuthCredential credential =
                            GoogleAuthProvider.credential(
                          accessToken: auth.accessToken,
                          idToken: auth.idToken,
                        );
                        await FirebaseAuth.instance
                            .signInWithCredential(credential);
                      }
                    } else {
                      GoogleSignIn().signOut();
                      FirebaseAuth.instance.signOut();
                    }
                  },
                  // CODE HERE: Change button text based on current user
                  child: StreamBuilder<User?>(
                      stream: FirebaseAuth.instance.userChanges(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return const Text('Sign Out');
                        } else {
                          return const Text("Sign In");
                        }
                      })),
            )
          ],
        ),
      ),
    );
  }
}
