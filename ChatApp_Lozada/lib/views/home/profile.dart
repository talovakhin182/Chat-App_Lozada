import 'package:chat_app_lozada/models/user.dart';
import 'package:chat_app_lozada/views/authenticate/authenticate.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UserData>(
      builder: (context, snapshot) {
        if (true) {
          final String username = "amiellozada";
          final String useremail = "amiellozada@gmail.com";

          return Container(
              padding: const EdgeInsets.all(40),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(7),
                      decoration: BoxDecoration(
                        color: Colors.blue[900],
                        shape: BoxShape.circle,
                      ),
                      child: CircleAvatar(
                        radius: 80,
                        backgroundColor: Colors.grey[200],
                        backgroundImage: AssetImage('assets/profile_image.png'),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '${username}',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('${useremail}'),
                    SizedBox(height: 30),
                    ElevatedButton(
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.black),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.red[300]),
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 70)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0))),
                        elevation: MaterialStateProperty.all(0.0),
                      ),
                      child: Text(
                        'Sign Out',
                        style: TextStyle(
                          fontSize: 14.0,
                        ),
                      ),
                      onPressed: () async {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Authenticate()));
                      },
                    ),
                  ],
                ),
              ));
        }
      },
    );
  }
}
