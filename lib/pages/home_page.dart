import 'package:flutter/material.dart';
import '../controllers/post_controllers.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

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
              return Padding(
                padding:EdgeInsets.symmetric(horizontal: size.width * 0.01),
                child: ListView.separated(itemBuilder:(context, index){
                  return Dismissible(
                    key: Key(snapshot.data![index].id.toString()),
                    onDismissed: (direction) {
                      postController.delete(snapshot.data![index].id).then((result){
                        if (result){
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("post delete"),
                          behavior: SnackBarBehavior.floating,
                          ),
                          );
                          setState(() {
                            
                          });
                        }else{
                           ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("failed to delete post"),
                           behavior: SnackBarBehavior.floating,
                           ),
                           );
                           setState(() {
                             
                           });
                        }

                      });
                    },
                    child: Card(
                      child: ListTile(
                        title: Text(snapshot.data![index].title,maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        ),
                        subtitle: Text(snapshot.data![index].body, maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  );
              
                },    
                  
                           }, separatorBuilder: (context, index) {
                return SizedBox(height: size.height * 0.0005,
                );
                           }, itemCount: snapshot.data!.length,
                           ),
              );
          } else {
              return Text("Tidak ada data")
            }
            } else {
              return Text ("error");
            }
