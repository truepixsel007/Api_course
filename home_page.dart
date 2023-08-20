import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluter_demo/model.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget{
  const HomePage({Key? key}) :super (key: key);

  @override
  State<HomePage> createState() =>  _HomePageState();
}

class _HomePageState extends State<HomePage>{
  List<SamplePost> samplePosts = [];

  @override
  Widget build(BuildContext context){
  return FutureBuilder(
    future: getData(),
    builder: (context ,snapshot) {
      if(snapshot.hasData){
        return ListView.builder(
          itemCount: samplePosts.length,
          itemBuilder: (context, index){
            return Container(
              height: 200,
              color: Colors.greenAccent,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              margin:const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('User id: ${samplePosts[index].userId}', style: TextStyle(fontSize: 18),),
                  Text('Id: ${samplePosts[index].id}', style: TextStyle(fontSize: 18),),
                  Text('Title: ${samplePosts[index].title}', style: TextStyle(fontSize: 18),),
                  Text('Body: ${samplePosts[index].body}',maxLines: 1, style: TextStyle(fontSize: 18),),
                ],
              ),
            );
          },
        );
      }
      else{
        return Center(
          child: CircularProgressIndicator(),
        );
      }
    }
  );
  }
  
  
  Future<List<SamplePost>> getData() async{
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
     var data = jsonDecode((response.body.toString()));

     if(response.statusCode == 200){
       for(Map<String,dynamic> index in data){
         samplePosts.add(SamplePost.fromJson(index));
       }
       return samplePosts;
     }else{
       return samplePosts;
     }
  }
}