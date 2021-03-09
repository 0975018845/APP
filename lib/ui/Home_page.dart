import 'package:flutter/material.dart';
import 'package:flutter_app2/ui/profileView.dart';
import 'package:flutter_app2/ui/todoList.dart';
import 'package:flutter_app2/views/home.dart';
import 'page_1.dart';



class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  int index = 0;
  Widget _MyPage_1 = page_1();
  Widget _MyPage_2 = Home();
  Widget _MyPage_3 = TodoList();
  Widget _MyPage_4 = ProfileView();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: GetBody(),
      bottomNavigationBar: BottomNavigationBar(
        selectedIconTheme: IconThemeData (
            color: Color(0xff40e0d0),
            opacity: 1.0,
            size: 35
        ),
        unselectedIconTheme: IconThemeData (
            color: Colors.black45,
            opacity: 0.5,
            size: 25
        ),
        backgroundColor: Colors.grey[100],
        currentIndex: this.index,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.coronavirus_rounded),
              title: new Text("NCOVID-19")
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.whatshot_rounded,
              color: Colors.deepOrange,),
              title: new Text("Page 1")
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.article_sharp),
              title: new Text("Page 1")
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box),
              title: new Text("Page 1")
          ),
        ],
        onTap: (int tap_index){
          this.TapHandle(tap_index);
        },
      ),
    );
  }

  void TapHandle(int tap_index) {
    this.setState(() {
      this.index = tap_index;
    });
  }

  Widget GetBody() {
    if(index == 0) {
      return this._MyPage_1;
    }else if(index == 1) {
      return this._MyPage_2;
    }else if(index == 2) {
      return this._MyPage_3;
    }else if(index == 3) {
      return this._MyPage_4;
    }
  }
}