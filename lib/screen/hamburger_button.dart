import 'package:flutter/material.dart';

class HamburgerButton extends StatelessWidget {
  const HamburgerButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage: AssetImage('asset/img/logo.png'),
            ),
            accountName: Text('Pet lover'),
            accountEmail: Text('petloverforever@naver.com'),
            onDetailsPressed: () {
              print('Hello, My Hope World!');
            },
            decoration: BoxDecoration(
              color: Colors.red[200],
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40.0),
                bottomRight: Radius.circular(40.0),
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.home,
              color: Colors.grey[850],
            ),
            title: Text('개인정보'),
            onTap: () {
              print('Home button is clicked!');
            },
            trailing: Icon(Icons.add),
          ),
          ListTile(
            leading: Icon(
              Icons.question_answer,
              color: Colors.grey[850],
            ),
            title: Text('내 게시글'),
            onTap: () {
              print('settings button is clicked!');
            },
            trailing: Icon(Icons.add),
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: Colors.grey[850],
            ),
            title: Text('세팅'),
            onTap: () {
              print('Q&A button is clicked!');
            },
            trailing: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
