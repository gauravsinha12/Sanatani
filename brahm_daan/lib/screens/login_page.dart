import 'package:brahm_daan/screens/forgot_pw_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback showRegisterPage;
  const LoginPage({Key? key, required this.showRegisterPage}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //text controllers

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim());
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(111, 118, 130, 241),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.temple_hindu_rounded,
                  size: 150,
                  color: Color.fromARGB(255, 255, 96, 48),
                ),
                SizedBox(
                  height: 70,
                ),
                Text('Suswagatam Mitron',
                    style: GoogleFonts.bebasNeue(
                        fontSize: 50, color: Colors.black)),
                SizedBox(height: 10),
                Text('Welcome to the login page',
                    style: TextStyle(
                      fontSize: 20,
                    )),
                SizedBox(height: 60),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.white),
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
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        obscureText: true,
                        controller: _passwordController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Password',
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(
                                builder: (context) {
                            return ForgotPasswordPage();
                          },
                          ),
                          );
                        },
                        child: Text('Forgot Password?',
                            style: TextStyle(
                              color: Colors.deepPurpleAccent,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                //sign in button
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: GestureDetector(
                      onTap: signIn,
                      child: Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.deepPurpleAccent,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Center(
                            child: Text(
                              'Sign In',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )),
                    )),
                SizedBox(height: 25),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Not A Member ? ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        )),
                    GestureDetector(
                      onTap: widget.showRegisterPage,
                      child: Text(' Register Here',
                          style: TextStyle(
                            color: Colors.deepPurpleAccent,
                            fontWeight: FontWeight.bold,
                          )),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
