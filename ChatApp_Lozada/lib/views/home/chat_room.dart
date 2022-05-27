import 'package:chat_app_lozada/views/home/conversation.dart';
import 'package:flutter/material.dart';

class ChatRoom extends StatefulWidget {
  @override
  _ChatRoomState createState() => _ChatRoomState();
}

class Chatroom {
  String chatroomid;
  List<String> users;

  Chatroom({this.chatroomid, this.users});
}

class _ChatRoomState extends State<ChatRoom> {
  getChatroomId(String a, String b) {
    if (a.compareTo(b) > 0) {
      return "$b\_$a";
    } else {
      return "$a\_$b";
    }
  }

  @override
  Widget build(BuildContext context) {
    final String useremail = "amiellozada@gmail.com";
    final String email1 = "paramonvillaceran@gmail.com";
    final String email2 = "rhyanlarosa@gmail.com";

    String chatroomid1 = getChatroomId(useremail, email1);
    String chatroomid2 = getChatroomId(useremail, email2);
    List<String> users1 = [
      useremail,
      email1,
    ];

    List<String> users2 = [
      useremail,
      email2,
    ];

    List<Chatroom> chatrooms = [
      Chatroom(
        chatroomid: chatroomid1,
        users: users1,
      ),
      Chatroom(
        chatroomid: chatroomid2,
        users: users2,
      )
    ];

    createChatroomAndStartConversation(email) {
      String chatroomid = getChatroomId(email, useremail);

      List<String> users = [email, useremail];
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Conversation(
                    users: users,
                    chatroomid: chatroomid,
                  )));
    }

    return Container(
      child: StreamBuilder(builder: (context, snapshot) {
        return Container(
            child: ListView.builder(
          itemCount: chatrooms.length,
          itemBuilder: (context, index) {
            return Container(
              child: Card(
                  margin: EdgeInsets.fromLTRB(1, 1, 1, 0),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 20.0,
                      backgroundImage: AssetImage('assets/profile_image.png'),
                    ),
                    title: Text(chatrooms[index].chatroomid),
                    trailing: IconButton(
                        icon: Icon(Icons.send),
                        onPressed: () {
                          createChatroomAndStartConversation(useremail);
                        }),
                  )),
            );
          },
        ));
      }),
    );
  }
}
