class WallpaperModel{

  String photographer;
  String photographer_url;
  int phorographer_id;
  SrcModel src;

  WallpaperModel({this.src, this.photographer_url, this.phorographer_id, this.photographer});

  factory WallpaperModel.fromMap(Map<String, dynamic> jsonData){
    return WallpaperModel(
      src: SrcModel.fromMap(jsonData["src"]),
      photographer_url: jsonData["photographer_url"],
      phorographer_id: jsonData["phorographer_id"],
      photographer: jsonData["photographer"]
    );
  }
}

class SrcModel{
  String original;
  String small;
  String portrait;

  SrcModel({this.portrait, this.original, this.small});
  factory SrcModel.fromMap(Map<String, dynamic> jsonData){
    return SrcModel(
      portrait: jsonData["portrait"],
      original: jsonData["original"],
      small:  jsonData["small"]
    );
  }
}