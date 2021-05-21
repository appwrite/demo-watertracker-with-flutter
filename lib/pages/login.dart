import 'package:appwrite/appwrite.dart';
import 'package:flappwrite_water_tracker/data/service/api_service.dart';
import 'package:flappwrite_water_tracker/main.dart';
import 'package:flutter/material.dart';
import './signup.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController _email;
  late TextEditingController _password;

  @override
  void initState() {
    super.initState();
    _email = TextEditingController();
    _password = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: <Widget>[
            Text(
              "Login",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline3,
            ),
            const SizedBox(height: 30.0),
            TextField(
              controller: _email,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  hintText: "email"),
            ),
            const SizedBox(height: 10.0),
            TextField(
              controller: _password,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                hintText: "password",
              ),
              obscureText: true,
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () async {
                //login user
                try {
                  await ApiService.instance
                      .login(email: _email.text, password: _password.text);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => MainScreen()),
                  );
                } on AppwriteException catch (e) {
                  //“One of the main causes of the fall of the Roman Empire was that lacking zero, they had no way to indicate successful termination of their C programs.”
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(e.message ?? "Error unknown"),
                    ),
                  );
                }
              },
              child: Text("Login"),
            ),
            const SizedBox(height: 10.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.grey.shade300,
                onPrimary: Colors.black,
              ),
              onPressed: () async {
                //login user
                try {
                  await ApiService.instance.anonymousLogin();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => MainScreen()),
                  );
                } on AppwriteException catch (e) {
                  //“One of the main causes of the fall of the Roman Empire was that lacking zero, they had no way to indicate successful termination of their C programs.”
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(e.message ?? "Error unknown"),
                    ),
                  );
                }
              },
              child: Text("Login Anonymously"),
            ),
            const SizedBox(height: 10.0),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => SignupPage(),
                  ),
                );
              },
              child: Text("Not registered? Sign up."),
            ),
          ],
        ),
      ),
    );
  }
}
