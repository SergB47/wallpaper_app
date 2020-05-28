import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wallpaperapp/data/data.dart';
import 'package:wallpaperapp/model/categories_model.dart';
import 'package:wallpaperapp/model/wallpaper_model.dart';
import 'package:wallpaperapp/views/category.dart';
import 'package:wallpaperapp/views/search.dart';
import 'package:wallpaperapp/widgets/widget.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<CategorieModel> categories = new List();
  List<WallpaperModel> wallpapers = new List();
  TextEditingController searchController = new TextEditingController();

  getTradingWallpapers() async{
    var response = await http.get("https://api.pexels.com/v1/curated?per_page=15&page=1",
    headers: {
      'Authorization' : apiKey
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
    getTradingWallpapers();
    categories = getCategories();
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
                        controller: searchController,
                      decoration: InputDecoration(
                      hintText: 'search',
                      border: InputBorder.none
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context)=>Search(
                          searchQuery: searchController.text,
                        )
                      ));
                    },
                    child: Container(
                      child: Icon(Icons.search)),
                  )
                ],),
              ),
              SizedBox(height: 16,),
              Container(
                height: 80,
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal:24),
                  itemCount: categories.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index){
                    return CategoriesTitle(
                      title: categories[index].categorieName,
                      imgUrl: categories[index].imgUrl,
                    );
                  }
                ),
              ),
              SizedBox(height: 16,),
              wallpaperList(wallpapers: wallpapers, context: context)
            ],
          ),
        ),
      ),
    );
  }
}

class CategoriesTitle extends StatelessWidget {

  final String imgUrl, title;
  CategoriesTitle({this.title, this.imgUrl});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
          builder: (context)=> Category(categorieName: title.toLowerCase(),)
        ));
      },
      child: Container(
      margin: EdgeInsets.only(right: 4),
      child: Stack(children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(imgUrl, height: 50, width: 100, fit: BoxFit.cover,)),
        Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.black26,
          ),
        alignment: Alignment.center,
        height: 50,
        width: 100,
        child: Text(title, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 16),))
        ],)
      ),
    );
  }
}