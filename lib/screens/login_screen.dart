import 'package:flutter/material.dart';
import 'package:zoom_clone/resources/auth_methods.dart';
import 'package:zoom_clone/widgets/coustom_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthMethod _authMethod = AuthMethod();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Start or join meeting",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: height * 0.1,
          ),
          Image.asset("assets/images/onboarding.jpg"),
          SizedBox(
            height: height * 0.1,
          ),
          CoustomButton(
              buttonText: "Login with google",
              onPressed: () async {
                bool result = await _authMethod.signInWithGoogle(context);
                if (result == true) {
                  Navigator.pushNamed(context, '/home');
                }
              },
              )
        ],
      ),
    );
  }
}
