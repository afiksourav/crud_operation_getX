class AlbumModel{
  int ? userId;
  int ? id;
  String ?title;
  String ? content;

  AlbumModel({this.userId, this.id, this.title,this.content});

  late List<AlbumModel> _products;
  List<AlbumModel> get products => _products; 

  factory AlbumModel.fromJson(Map<String, dynamic>json)=> AlbumModel(
    userId : json['userId'],
    id : json['id'],
    title : json['title'],
    content : json['body'],
  );


}