import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }
  Future passwordReset() async {
    try{
      await FirebaseAuth.instance.sendPasswordResetEmail(email: _emailController.text.trim());
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Password Reset Email Sent'),
            content: Text('Please check your email for a password reset link.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                }, 
                child: Text('OK'))
            ],
          );
        }
      );    
    }on FirebaseAuthException catch(e){
      print(e.message);
      showDialog(context: context, builder: (context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(e.message!),
          actions: [
            TextButton(onPressed: () {
              Navigator.pop(context);
            }, child: Text('OK'))
          ],
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Text('Enter Your Email and We Will Send You a Link to Reset Your Password',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter your email',
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            MaterialButton(onPressed: passwordReset,
            child: Text('Reset Password'),
            color: Colors.deepPurpleAccent,)
          ],
        ),
      ),
    );
  }
}
