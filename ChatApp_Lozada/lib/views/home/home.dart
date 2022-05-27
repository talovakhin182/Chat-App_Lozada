import 'package:chat_app_lozada/shared/loading.dart';
import 'package:chat_app_lozada/views/home/chat_room.dart';
import 'package:chat_app_lozada/views/home/profile.dart';
import 'package:chat_app_lozada/views/home/search.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  bool loading = false;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: Text('Chat App'),
              backgroundColor: Colors.blue[850],
              elevation: 0.0,
              leading: IconButton(
                icon: Image.asset('assets/chat_app_logo.png'),
                onPressed: () {},
              ),
            ),
            body: (_selectedIndex == 0) ? ChatRoom() : Profile(),
            floatingActionButton: (_selectedIndex == 1)
                ? Container()
                : FloatingActionButton(
                    child: Icon(Icons.search_rounded),
                    backgroundColor: Colors.blue[700],
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Search()));
                    },
                    elevation: 0.0,
                  ),
            bottomNavigationBar: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    icon: Icon(Icons.chat_bubble_outline_rounded),
                    label: 'Chat'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person_outline_rounded), label: 'Profile')
              ],
              currentIndex: _selectedIndex,
              selectedItemColor: Colors.grey[900],
              onTap: _onItemTapped,
              elevation: 0.0,
            ),
          );
  }
}
