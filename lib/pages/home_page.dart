import 'package:flutter/material.dart';
import '../controllers/post_controllers.dart';
import '../models/post.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PostController postController = PostController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: SafeArea(
        child: FutureBuilder<List<Post>>(
          future: postController.fetchAll(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData) {
              if (snapshot.data!.isNotEmpty) {
                return ListView.separated(
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(snapshot.data![index].title),
                      subtitle: Text(snapshot.data![index].body),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: size.height * 0.01,
                    );
                  },
                  itemCount: snapshot.data!.length,
                );
              } else {
                return Text("Tidak Ada Data");
              }
            } else {
              return Text("Error");
            }
          },
        ),
      ),
    );
  }
}
