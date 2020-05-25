import 'package:flutter/material.dart';
import 'package:wallpaperapp/data/data.dart';
import 'package:wallpaperapp/model/categories_model.dart';
import 'package:wallpaperapp/widgets/widget.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<CategorieModel> categories = new List();

  @override
  void initState() {
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
            )
          ],
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
    return Container(
      margin: EdgeInsets.only(right: 4),
      child: Stack(children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(imgUrl, height: 50, width: 100, fit: BoxFit.cover,)),
        Container(
          color: Colors.black26,
          alignment: Alignment.center,
          height: 50, width: 100,
          child: Text(title, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 16),))
      ],)
    );
  }
}