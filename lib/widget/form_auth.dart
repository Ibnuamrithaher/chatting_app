import 'package:flutter/material.dart';

class FormAuth extends StatefulWidget {
  const FormAuth({Key? key, required this.submitForm}) : super(key: key);
  final Function(String username, String email, String password, bool isLogin)
      submitForm;
  @override
  State<FormAuth> createState() => _FormAuthState();
}

class _FormAuthState extends State<FormAuth> {
  bool isLogin = true;
  final formKey = GlobalKey<FormState>();
  String username = '';
  String email = '';
  String password = '';

  void trySubmit() {
    bool isValid = formKey.currentState!.validate();
    if (isValid) {
      formKey.currentState!.save();
      widget.submitForm(username, email, password, isLogin);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Card(
          margin: const EdgeInsets.symmetric(vertical: 200, horizontal: 20),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (!isLogin)
                      TextFormField(
                        key: const ValueKey('username'),
                        onSaved: (newValue) {
                          username = newValue!;
                        },
                        validator: (value) {
                          if (value!.isEmpty || value.length < 4) {
                            return "Username Minimal 4 Karakter";
                          }
                          return null;
                        },
                        decoration:
                            const InputDecoration(label: Text('Username')),
                      ),
                    TextFormField(
                      key: const ValueKey('email'),
                      onSaved: (newValue) {
                        email = newValue!;
                      },
                      validator: (value) {
                        if (value!.isEmpty || !value.contains('@')) {
                          return "Email Tidak Valid";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(label: Text('Email')),
                    ),
                    TextFormField(
                      key: const ValueKey('password'),
                      onSaved: (newValue) {
                        password = newValue!;
                      },
                      validator: (value) {
                        if (value!.isEmpty || value.length < 6) {
                          return "Password Minimal 6 Karakter";
                        }
                        return null;
                      },
                      obscureText: true,
                      decoration:
                          const InputDecoration(label: Text('Password')),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        onPressed: trySubmit,
                        child: isLogin
                            ? const Text('Login')
                            : const Text('Register')),
                    TextButton(
                        onPressed: () {
                          setState(() {
                            isLogin = !isLogin;
                          });
                        },
                        child: isLogin
                            ? const Text('Create Account')
                            : const Text("I Have Already Account"))
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
