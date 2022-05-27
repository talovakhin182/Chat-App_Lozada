import 'package:chat_app_lozada/shared/constant.dart';
import 'package:flutter/material.dart';

class Conversation extends StatefulWidget {
  final List<String> users;
  final String chatroomid;
  const Conversation({this.users, this.chatroomid});

  @override
  _ConversationState createState() => _ConversationState();
}

class Message {
  String chatroomid;
  String message;
  String sender;
  DateTime time;

  Message({this.chatroomid, this.message, this.sender, this.time});
}

class _ConversationState extends State<Conversation> {
  String message = '';
  TextEditingController text = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final String username = "amiellozada";
  final String useremail = "amiellozada@gmail.com";

  List<Message> messages = [
    Message(
        chatroomid: "asdsadasd",
        message: "hey",
        sender: "amiellozada@gmail.com",
        time: new DateTime.now()),
    Message(
        chatroomid: "asdsadasd",
        message: "hello pls respond",
        sender: "amiellozada@gmail.com",
        time: new DateTime.now())
  ];

  @override
  Widget build(BuildContext context) {
    void addMessage(Message newMessage) {
      setState(() {
        messages.add(newMessage);
      });
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Container(
          child: (widget.users[0] == useremail)
              ? Text(widget.users[1])
              : Text(widget.users[0]),
        ),
        backgroundColor: Colors.blue[850],
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        child: Stack(children: [
          Container(
            padding: EdgeInsets.only(bottom: 60),
            child: StreamBuilder(builder: (context, snapshot) {
              if (messages.length < 1) {
                return Container(
                  child: Center(
                    child: Text(
                        'You can now start a conversation with this person'),
                  ),
                );
              } else {
                return Container(
                  child: ListView.builder(
                    reverse: false,
                    controller: _scrollController,
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.only(
                            left:
                                (messages[index].sender == useremail) ? 24 : 0,
                            right:
                                (messages[index].sender == useremail) ? 0 : 24),
                        margin:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                        width: MediaQuery.of(context).size.width,
                        alignment: (messages[index].sender == useremail)
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            border: (messages[index].sender == useremail)
                                ? Border.all(
                                    color: Colors.blue[200],
                                    width: 2,
                                  )
                                : Border.all(
                                    color: Colors.grey[200],
                                    width: 2,
                                  ),
                            color: (messages[index].sender == useremail)
                                ? Colors.white
                                : Colors.blue[200],
                            borderRadius: (messages[index].sender == useremail)
                                ? BorderRadius.only(
                                    topLeft: Radius.circular(23),
                                    topRight: Radius.circular(23),
                                    bottomLeft: Radius.circular(23),
                                  )
                                : BorderRadius.only(
                                    topLeft: Radius.circular(23),
                                    topRight: Radius.circular(23),
                                    bottomRight: Radius.circular(23),
                                  ),
                          ),
                          child: Text(messages[index].message),
                        ),
                      );
                    },
                  ),
                );
              }
            }),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: Container(
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: text,
                      decoration: textInputDecoration.copyWith(
                          hintText: 'Type a message...',
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.grey[300], width: 2.0)),
                          suffixIcon: IconButton(
                            icon: Icon(Icons.send),
                            onPressed: () async {
                              if (message != '') {
                                final newMessage = Message(
                                    chatroomid: widget.chatroomid,
                                    message: message,
                                    sender: useremail,
                                    time: new DateTime.now());

                                addMessage(newMessage);

                                text.clear();
                                FocusScopeNode currentFocus =
                                    FocusScope.of(context);
                                currentFocus.unfocus();
                                setState(() {});
                              }
                            },
                          )),
                      keyboardType: TextInputType.text,
                      onChanged: (val) {
                        setState(() {
                          message = val;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
