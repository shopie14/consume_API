

import 'package: flutter/material.dart';
import 'package:api_berita_app/controllers/post_controllers.dart';
import 'package:flutter/material.dart';
import 'package:itg_consume_api/controllers/post_controller.dart';
import '../models/post.dart';

class HomePage extends Statefulwidget {
  const HomePage({ super.key});
  
  @override
  State<HomePage> createState() => _HomePageState();
  }
  class HomePageState extends State<HomePage> { 
    final PostController postController = PostController()
    @override
    Widget build(BuildContext context) {
      final Size size = MediaQuery.of(context).size;
      return Scaffold(
        appBar: AppBar(
          title: const Text("Home Page"),
          ), // AppBar
          body: SafeArea(
            child: FutureBuilder<List<Post>>(
               builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            if (snapshot.data!.isNotEmpty) {
              inspect(snapshot.data!);
              return ListView.separated(itemBuilder:(context, index)          
                )
             }, separatorBuilder: (context, index) {
              return SizedBox(height: size.height *0.01,
              );
             }, itemCount: snapshot.data!.length,
             );
          } else {
              return Text("Tidak ada data")
            }
            } else {
              return Text ("error");
            }
            },
            ), // FutureBuilder
            ), // SafeArea
            ); // Scaffold
    }
  }