import 'package:chat_app_lozada/shared/constant.dart';
import 'package:chat_app_lozada/shared/loading.dart';
import 'package:chat_app_lozada/views/authenticate/forget_password.dart';
import 'package:chat_app_lozada/views/home/home.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  String email = '';
  String password = '';
  String error = '';

  bool _hidePassword = true;
  Icon _passwordIcon = Icon(Icons.remove_red_eye);

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.blue[700],
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.fromLTRB(10.0, 40.0, 10.0, 0.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      // chat app logo
                      Center(
                        child: CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/chat_app_logo.png'),
                          backgroundColor: Colors.blue[700],
                          radius: 100.0,
                        ),
                      ),
                      // email text field
                      TextFormField(
                        decoration:
                            textInputDecoration.copyWith(hintText: 'Email'),
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        validator: (val) {
                          if (val.isEmpty) {
                            return 'Enter an email';
                          } else if (!RegExp(
                                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                              .hasMatch(val)) {
                            return 'Enter a valid email';
                          } else {
                            return null;
                          }
                        },
                        onChanged: (val) {
                          setState(() {
                            email = val;
                          });
                        },
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      // password text field
                      TextFormField(
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: textInputDecoration.copyWith(
                              hintText: 'Password',
                              suffixIcon: IconButton(
                                icon: _passwordIcon,
                                onPressed: () {
                                  setState(() {
                                    _hidePassword = !_hidePassword;
                                    if (_hidePassword == false) {
                                      setState(() {
                                        _passwordIcon =
                                            Icon(Icons.remove_red_eye_outlined);
                                      });
                                    } else {
                                      setState(() {
                                        _passwordIcon =
                                            Icon(Icons.remove_red_eye);
                                      });
                                    }
                                  });
                                },
                              )),
                          obscureText: _hidePassword,
                          validator: (val) => val.length < 6
                              ? 'Enter a password 6+ characters long'
                              : null,
                          onChanged: (val) {
                            setState(() {
                              password = val;
                            });
                          }),
                      // forgot password button
                      Container(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          style: ButtonStyle(
                            foregroundColor: MaterialStateProperty.all<Color>(
                                Colors.grey[800]),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ForgetPassword()));
                          },
                          child: Text(
                            'Forgot Password',
                            style:
                                TextStyle(color: Colors.white60, fontSize: 16),
                          ),
                        ),
                      ),
                      // sign in button
                      ElevatedButton(
                        style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.blue[900]),
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              EdgeInsets.symmetric(vertical: 15.0)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0))),
                          elevation: MaterialStateProperty.all(0.0),
                        ),
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Home()));
                          }
                        },
                      ),
                      SizedBox(height: 2),
                      Center(
                        child: Text(
                          error,
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 2),
                      // sign up button
                      ElevatedButton(
                        style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.black),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.grey[300]),
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              EdgeInsets.symmetric(vertical: 15.0)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0))),
                          elevation: MaterialStateProperty.all(0.0),
                        ),
                        child: Text(
                          'Create an account',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () {
                          widget.toggleView();
                        },
                      ),
                      orDivider(),
                      // google and facebook login
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Expanded(
                              child: ElevatedButton.icon(
                                icon: Image(
                                    width: 15.0,
                                    image:
                                        AssetImage('assets/google_logo.png')),
                                style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.black),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.white),
                                  padding:
                                      MaterialStateProperty.all<EdgeInsets>(
                                          EdgeInsets.symmetric(
                                              vertical: 5.0, horizontal: 5.0)),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0))),
                                  elevation: MaterialStateProperty.all(0.0),
                                ),
                                label: Text(
                                  'Sign in with Google',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                  ),
                                ),
                                onPressed: () {},
                              ),
                            ),
                            SizedBox(width: 5),
                            Expanded(
                              child: ElevatedButton.icon(
                                icon: Image(
                                    width: 15.0,
                                    image:
                                        AssetImage('assets/facebook_logo.png')),
                                style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.white),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Color(0xff45619d)),
                                  padding:
                                      MaterialStateProperty.all<EdgeInsets>(
                                          EdgeInsets.symmetric(
                                              vertical: 5.0, horizontal: 5.0)),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0))),
                                  elevation: MaterialStateProperty.all(0.0),
                                ),
                                label: Text(
                                  'Sign in with Facebook',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                  ),
                                ),
                                onPressed: () {},
                              ),
                            ),
                          ])
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
