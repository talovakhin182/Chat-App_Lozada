import 'package:chat_app_lozada/shared/constant.dart';
import 'package:chat_app_lozada/views/home/conversation.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class SearchItem {
  String username;
  String email;

  SearchItem({this.username, this.email});
}

class _SearchState extends State<Search> {
  final _formKey = GlobalKey<FormState>();
  final String userusername = "amiellozada";
  final String useremail = "amiellozada@gmail.com";
  String email = '';
  String username = '';
  var text = TextEditingController();

  dynamic searchSnapshot;
  List<SearchItem> searchitemslist;

  initiateSearch() {
    List<SearchItem> searchitems = [
      SearchItem(username: "amiellozada182", email: "amiellozada@gmail.com"),
      SearchItem(
          username: "paramonvillaceran", email: "paramonvillaceran@gmail.com"),
      SearchItem(
          username: "paramonvillaceran2", email: "paramonvillaceran@gmail.com"),
      SearchItem(username: "rhyanlarosa", email: "rhyanlarosa@gmail.com"),
    ];

    setState(() {
      searchitemslist =
          searchitems.where((element) => element.email == email).toList();
    });
  }

  Widget searchList() {
    return (searchitemslist != null)
        ? ListView.builder(
            shrinkWrap: true,
            itemCount: searchitemslist.length,
            itemBuilder: (context, index) {
              return SearchTile(
                username: searchitemslist[0].email,
                email: searchitemslist[0].username,
              );
            },
          )
        : Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Search'),
        centerTitle: true,
        backgroundColor: Colors.blue[850],
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Container(
                  child: Form(
                    key: _formKey,
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: text,
                            decoration: textInputDecoration.copyWith(
                              hintText: 'Search user email',
                              suffixIcon: IconButton(
                                icon: Icon(Icons.clear_rounded),
                                onPressed: () {
                                  text.text = '';
                                },
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 1.5)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey[300], width: 2.0)),
                            ),
                            keyboardType: TextInputType.text,
                            onChanged: (val) {
                              email = val;
                            },
                            validator: (val) {
                              if (val == useremail) {
                                return 'You cant have a conversation with yourself';
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              initiateSearch();
                            }
                          },
                          child: Text('Search'),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.blue[500]),
                            padding: MaterialStateProperty.all<EdgeInsets>(
                                EdgeInsets.symmetric(vertical: 20.0)),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(3.0))),
                            elevation: MaterialStateProperty.all(0.0),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 15),
                searchList()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SearchTile extends StatelessWidget {
  final String username;
  final String email;
  SearchTile({this.username, this.email});

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

    createChatroomAndStartConversation() {
      String chatroomid = getChatroomId(email, useremail);

      List<String> users = [email, useremail.toString()];
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => Conversation(
                    users: users,
                    chatroomid: chatroomid,
                  )));
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              username,
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(email),
          ],
        ),
        Spacer(),
        Container(
          child: ElevatedButton(
            child: Text('Message'),
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.blue[500]),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30))),
              elevation: MaterialStateProperty.all(0.0),
            ),
            onPressed: () {
              createChatroomAndStartConversation();
            },
          ),
        )
      ]),
    );
  }
}
