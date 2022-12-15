import 'package:data_facthing_getx/models/post_model.dart';
import 'package:get/get.dart';

import '../service/apiService.dart';

class PostController extends GetxController{

  var isLoaded = true.obs;
  var postList = <AlbumModel>[].obs;

  @override
  void onInit() {
    getAllPOst();
    super.onInit();
  }

  void getAllPOst() async{
   var data = await ApiService().fatchPost();
   if(data.length>0){
    postList.clear();
   isLoaded(false);
    postList.addAll(data); 
   }
  }

   void getPostdata(String title) async{
   var data = await ApiService().PostAlbum(title);

  }

    void getUpdatedata(String title,int id) async{
   var data = await ApiService().UpdateAlbum(title, id);

  }

    void Deteledata(int id) async{
   var data = await ApiService().DeleteAlbum(id);

  }

}