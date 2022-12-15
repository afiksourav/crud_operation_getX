
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../controller/postController.dart';

class UpdateScreen extends StatefulWidget {
  final String title;
  final int id;

   UpdateScreen({ required this.title, required this.id, super.key});

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
     final postcon = Get.put(PostController());

    TextEditingController _titleEditController = TextEditingController();
   @override
  void initState() {
    _titleEditController= TextEditingController(text: widget.title);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(title: Text('update task title')),

    body: Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
           TextField(
              controller: _titleEditController,
              decoration: InputDecoration(
             labelText: "task title",
             hintText: "enter your title"
              ),
            ),
            ElevatedButton(onPressed: (){
          postcon.getUpdatedata(widget.title, widget.id);
            }, child: Text("Update"))
        ],
      ),
    ),

    );
    
  }
}