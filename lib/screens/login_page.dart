import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var formKey = GlobalKey<FormState>();
  var tfUsername = TextEditingController();
  var tfPassword = TextEditingController();
  bool _isValid = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/images/login_bg.png',
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 8,
              right: 16,
              child: Text(
                'Login',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.40),
                        borderRadius: BorderRadius.circular(16)
                      ),
                      child: Form(
                        key: formKey,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 20.0),
                              child: TextFormField(
                                controller: tfUsername,
                                decoration: InputDecoration(
                                  labelText: 'Username',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  suffixIcon: _isValid
                                      ? SizedBox(height: 0)
                                      : Icon(Icons.error),
                                ),
                                validator: (tfInput) {
                                  if (tfInput!.isEmpty) {
                                    setState(() {
                                      _isValid = false;
                                    });
                                    return "Please enter username!";
                                  } else {
                                    setState(() {
                                      _isValid = true;
                                    });
                                    return null;
                                  }
                                },
                              ),
                            ),
                            TextFormField(
                              // initialValue: 'Password',
                              controller: tfPassword,
                              obscureText: true,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                // errorText: 'Error',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                suffixIcon: _isValid
                                    ? SizedBox(height: 0)
                                    : Icon(Icons.error),
                              ),
                              validator: (tfInput) {
                                if (tfInput!.isEmpty) {
                                  setState(() {
                                    _isValid = false;
                                  });
                                  return "Please enter password!";
                                } else if (tfInput.length < 6) {
                                  setState(() {
                                    _isValid = false;
                                  });
                                  return "Password must be at least 6 characters.";
                                } else {
                                  setState(() {
                                    _isValid = true;
                                  });
                                  return null;
                                }
                              },
                              onChanged: (tfInput) {
                                if (tfInput.length >= 6) {
                                  setState(() {
                                    _isValid = true;
                                  });
                                }
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 100),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: CircleBorder(),
                                  padding: const EdgeInsets.all(20),
                                  backgroundColor: _isValid ? Colors.green : null,
                                ),
                                child: Icon(Icons.arrow_forward_ios),
                                onPressed: () {
                                  bool loginResult = formKey.currentState!
                                      .validate();
                                  if (loginResult) {
                                    String _username = tfUsername.text.trim();
                                    String _password = tfPassword.text.trim();
                                    print(
                                      "username: $_username, password: $_password",
                                    );
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
