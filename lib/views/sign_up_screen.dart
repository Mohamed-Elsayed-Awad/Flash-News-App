import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String? email;
  bool isLoading = false;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffE8ECF3),
      ),
      backgroundColor: Color(0xffE8ECF3),
      body: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Form(
            child: ListView(
              children: [
                SizedBox(
                  height: 100,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Flash ',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 32),
                    ),
                    Text(
                      'News',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 32),
                    ),
                  ],
                ),
                SizedBox(
                  height: 70,
                ),
                Container(
                  height: 400,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Create an Account?',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                              color: Colors.black),
                        ),
                        // SizedBox(
                        //   height: 30,
                        // ),
                        // Align(
                        //   alignment: Alignment.centerLeft,
                        //   child: Text(
                        //     'Name',
                        //     style: TextStyle(
                        //         fontWeight: FontWeight.w400, fontSize: 15),
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: 8,
                        // ),
                        // TextFormField(
                        //   cursorColor: Colors.blue,
                        //   decoration: InputDecoration(
                        //     filled: true,
                        //     focusColor: Colors.blue,
                        //     contentPadding: EdgeInsets.symmetric(horizontal: 16),
                        //     hintStyle: TextStyle(
                        //         fontSize: 12, fontWeight: FontWeight.w300),
                        //     fillColor: Color(0xffE8ECF3),
                        //     enabledBorder: OutlineInputBorder(
                        //         borderRadius: BorderRadius.circular(30),
                        //         borderSide: BorderSide(color: Color(0xffE8ECF3))),
                        //     disabledBorder: OutlineInputBorder(
                        //         borderRadius: BorderRadius.circular(30),
                        //         borderSide: BorderSide(color: Color(0xffE8ECF3))),
                        //     focusedBorder: OutlineInputBorder(
                        //         borderRadius: BorderRadius.circular(30),
                        //         borderSide: BorderSide(color: Color(0xffE8ECF3))),
                        //     hintText: 'Enter Your name',
                        //     border: OutlineInputBorder(
                        //       borderRadius: BorderRadius.circular(30),
                        //       borderSide: BorderSide(
                        //         color: const Color.fromARGB(142, 211, 226, 251),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        SizedBox(
                          height: 16,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Email',
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 15),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        TextFormField(
                          onChanged: (value) {
                            email = value;
                          },
                          cursorColor: Colors.blue,
                          decoration: InputDecoration(
                            filled: true,
                            focusColor: Colors.blue,
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 16),
                            hintStyle: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w300),
                            fillColor: Color(0xffE8ECF3),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide:
                                    BorderSide(color: Color(0xffE8ECF3))),
                            disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide:
                                    BorderSide(color: Color(0xffE8ECF3))),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide:
                                    BorderSide(color: Color(0xffE8ECF3))),
                            hintText: 'Email',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                                color: const Color.fromARGB(142, 211, 226, 251),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Password',
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 15),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        TextFormField(
                          onChanged: (value) {
                            password = value;
                          },
                          obscureText: true,
                          cursorColor: Colors.blue,
                          decoration: InputDecoration(
                            filled: true,
                            focusColor: Colors.blue,
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 16),
                            hintStyle: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w300),
                            fillColor: Color(0xffE8ECF3),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide:
                                    BorderSide(color: Color(0xffE8ECF3))),
                            disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide:
                                    BorderSide(color: Color(0xffE8ECF3))),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide:
                                    BorderSide(color: Color(0xffE8ECF3))),
                            hintText: 'Password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                                color: const Color.fromARGB(142, 211, 226, 251),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.blue,
                            ),
                            onPressed: () async {
                              setState(() {
                                isLoading = true;
                              });
                              try {
                                UserCredential userCredential =
                                    await FirebaseAuth.instance
                                        .createUserWithEmailAndPassword(
                                            email: email!, password: password!);
                                setState(() {
                                  isLoading = false;
                                });
                                Navigator.pop(context);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    elevation: 2,
                                    // margin: EdgeInsets.all(16),
                                    padding: EdgeInsets.all(16),
                                    backgroundColor: Colors.green,
                                    content: Text('Success'),
                                  ),
                                );
                              } on FirebaseAuthException catch (e) {
                                if (e.code == 'weak-password') {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                          'The password provided is too weak.'),
                                    ),
                                  );
                                } else if (e.code == 'email-already-in-use') {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('${e.code}'),
                                    ),
                                  );
                                  print('there was an error, please try again');
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('${e.code}'),
                                    ),
                                  );
                                }
                              } catch (e) {
                                print(e);
                              }
                            },
                            child: Text(
                              'Register',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'You already have an account ? ',
                              style: TextStyle(
                                  color: const Color.fromARGB(120, 0, 0, 0)),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Text('Login'),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
