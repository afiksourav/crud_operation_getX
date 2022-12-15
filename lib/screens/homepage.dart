import 'package:data_facthing_getx/controller/postController.dart';
import 'package:data_facthing_getx/screens/update.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
//import 'package:http/http.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});

  final postcon = Get.put(PostController());

  final TextEditingController _titleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Api Calling'),
        ),
        body: Obx(() => postcon.isLoaded.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: postcon.postList.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        title: Text(postcon.postList[index].title.toString()),
                      ),
                      TextField(
                        controller: _titleController,
                        decoration: InputDecoration(
                            labelText: "task title",
                            hintText: "enter your title"),
                      ),
                      Row(
                        children: [
                          TextButton(
                              onPressed: () {

                                postcon.Deteledata(postcon.postList[index].id!);
                              },
                              child: Icon(
                                Icons.delete,
                                color: Colors.red,
                              )),
                          TextButton(
                              onPressed: () {
                                Get.to(UpdateScreen(
                                    title: postcon.postList[index].title
                                        .toString(),
                                    id: postcon.postList[index].id!));
                              },
                              child: Icon(
                                Icons.edit,
                                color: Colors.red,
                              ))
                        ],
                      ),
                      ElevatedButton(
                          onPressed: () {
                            var title = _titleController.text;
                            postcon.getPostdata(title);
                          },
                          child: Text('save'))
                    ],
                  );
                })));
  }
}
