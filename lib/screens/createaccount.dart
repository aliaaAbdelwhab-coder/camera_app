import 'package:camera_app/my_code/auth_code.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final _formkey = GlobalKey<FormState>();

final usernameController = TextEditingController();
late TextEditingController emailController = TextEditingController();
late TextEditingController passwordController = TextEditingController();
final confirmpasswordController = TextEditingController();

bool passToggle = true;
bool confirmPassToggle = true;

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final Authcode _authCode = Authcode();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late String email;
  late String password;
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Form(
            key: _formkey,
            child: Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              child: Column(
                children: [
                  Image(
                    image: AssetImage('assets/birdie_logo.png'),
                    fit: BoxFit.cover,
                    height: 200,
                    width: 200,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: usernameController,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 15),
                      label: Text(
                        "User name",
                        style: TextStyle(color: Colors.blue[400]),
                      ),
                      hintText: "Enter User name",
                      hintStyle: TextStyle(color: Colors.black26),
                      prefixIcon: Icon(Icons.person, color: Colors.blue[400]),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please, Enter User name";
                      } else if (!RegExp(r'^[a-z A-z]+$').hasMatch(value!)) {
                        return "Enter Correct User name";
                      } else if (value!.length < 3) {
                        return "The User name Should be at least 3 letters";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 15),
                      label: Text(
                        "E-mail",
                        style: TextStyle(color: Colors.blue[400]),
                      ),
                      hintText: "Enter E-mail",
                      hintStyle: TextStyle(color: Colors.black26),
                      prefixIcon: Icon(Icons.person, color: Colors.blue[400]),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please, Enter E-mail";
                      } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{3}$')
                          .hasMatch(value!)) {
                        return "Enter Valid E-mail";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: passwordController,
                    obscureText: passToggle,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 15),
                      label: Text(
                        "Password",
                        style: TextStyle(color: Colors.blue[400]),
                      ),
                      hintText: "Enter Password",
                      hintStyle: TextStyle(color: Colors.black26),
                      prefixIcon: Icon(Icons.lock, color: Colors.blue[400]),
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            passToggle = !passToggle;
                          });
                        },
                        child: Icon(passToggle
                            ? Icons.visibility
                            : Icons.visibility_off),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please, Enter Password";
                      } else if (!RegExp(
                              r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                          .hasMatch(value!)) {
                        return "Password should contain [a z],[A Z],[0..9],[# @ & ..]";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: confirmpasswordController,
                    obscureText: confirmPassToggle,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 15),
                      label: Text(
                        "Confirm Password",
                        style: TextStyle(color: Colors.blue[400]),
                      ),
                      hintText: "Enter Password",
                      hintStyle: TextStyle(color: Colors.black26),
                      prefixIcon: Icon(Icons.lock, color: Colors.blue[400]),
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            confirmPassToggle = !confirmPassToggle;
                          });
                        },
                        child: Icon(passToggle
                            ? Icons.visibility
                            : Icons.visibility_off),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please, Rewrite Password";
                      } else if (passwordController.text !=
                          confirmpasswordController.text) {
                        return "Password Don't Match";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (_formkey.currentState!.validate()) {
                        print("sucess");
                        try {
                          // UserCredential userCredential =
                          //     await FirebaseAuth.instance
                          final newUser = await _auth.createUserWithEmailAndPassword(
                              email: emailController.text,
                              password: passwordController.text);
                          usernameController.clear();
                          emailController.clear();
                          passwordController.clear();
                          confirmpasswordController.clear();
                          Navigator.popAndPushNamed(context, '/home');
                        } on FirebaseAuthException catch (e) {
                          String errorMessage = 'An error occurred';
                          if (e.code == 'weak-password') {
                            //  print("The password provided is too weak.")  ;
                            errorMessage = 'The password provided is too weak.';
                          } else if (e.code == 'email-already-in-use') {
                            // print('The account already exists for that email.');
                            errorMessage =
                                'The account already exists for that email.';
                          }
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(errorMessage)),
                          );
                        } 
                        // catch (e) {
                        //   print(e);
                        // }

                        // }
                      }
                    },
                    child: Text(
                      "Create",
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.blue[400]),
                      padding: MaterialStateProperty.all(
                          EdgeInsets.symmetric(horizontal: 25, vertical: 10)),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "_________________________ or _________________________ ",
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(height: 35),
                  ElevatedButton(
                    onPressed: () {
                      _authCode.SignInWithGoogle();
                    },
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(EdgeInsets.only(
                        top: 15,
                        bottom: 15,
                      )),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          image: AssetImage('assets/google_icon.png'),
                          height: 28,
                        ),
                        SizedBox(width: 30),
                        Text(
                          'Sign up with Google',
                          style: TextStyle(color: Colors.black, fontSize: 16),
                          // _authCode.SignInWithGoogle();
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
