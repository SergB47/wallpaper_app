import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wallpaperapp/data/secret.dart';
import 'package:wallpaperapp/model/wallpaper_model.dart';
import 'package:wallpaperapp/widgets/widget.dart';

class Category extends StatefulWidget {

  final String categorieName;
  Category({this.categorieName});
  @override
  _CategoryState createState() => _CategoryState();
}


class _CategoryState extends State<Category> {

  List<WallpaperModel> wallpapers = new List();

  getSearchWallpapers(String query) async{
    var response = await http.get("https://api.pexels.com/v1/search?query=$query&per_page=16",
    headers: {
      'Authorization' : api
    });
    //print(response.body.toString());
    Map<String, dynamic> jsonData = jsonDecode(response.body);
    jsonData["photos"].forEach((element){
      //print(element);
      WallpaperModel wallpaperModel = new WallpaperModel();
      wallpaperModel = WallpaperModel.fromMap(element);
      wallpapers.add(wallpaperModel);
    });
    setState(() {
      
    });
  }


  @override
  void initState() {
    getSearchWallpapers(widget.categorieName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
        title: Center(child: brandName()),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
                SizedBox(height: 16,),
                wallpaperList(wallpapers: wallpapers, context: context)
            ],
          ),
        ),
      ),
    );
  }
}