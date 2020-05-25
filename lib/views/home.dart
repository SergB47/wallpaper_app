import 'package:flutter/material.dart';
import 'package:wallpaperapp/widgets/widget.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(  
        title: Center(child: brandName()),
        elevation: 0.0,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Color(0xfff5f8fd), 
                borderRadius: BorderRadius.circular(30)
              ),
              padding: EdgeInsets.symmetric(horizontal: 24),
              margin: EdgeInsets.symmetric(horizontal: 24),
              child: Row(children: <Widget>[
                Expanded(
                    child: TextField(
                    decoration: InputDecoration(
                    hintText: 'search',
                    border: InputBorder.none
                    ),
                  ),
                ),
                Icon(Icons.search)
              ],),
            )
          ],
        ),
      ),
    );
  }
}