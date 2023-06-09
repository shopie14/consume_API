import 'package:api_berita_app/controllers/post_controllers.dart';
import 'package:flutter/material.dart';
import '../models/comment.dart';
import '../models/post.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key, required this.post});
  final Post post;

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  @override
  Widget build(BuildContext context) {
    final PostController postController = PostController();
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail post"),
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.post.title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.01),
            SizedBox(
              width: size.width,
              child: Text(
                widget.post.body,
                textAlign: TextAlign.justify,
              ),
            ),
            SizedBox(height: size.height * 0.01),
            const Text(
              "Komentar",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.01),
            const Text("komentar"),
            Expanded(
                child: FutureBuilder<List<Comment>>(
              future: postController.fetchComments(widget.post.id),
              builder: ((context, snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data!.isNotEmpty) {
                    List<Comment> comments = snapshot.data!;
                    return ListView.separated(
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            title: Text(comments[index].name),
                            subtitle: Text(comments[index].body),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: size.height * 0.0005,
                        );
                      },
                      itemCount: comments.length,
                    );
                  } else {
                    return const Text("Belum ada komentar");
                  }
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return AspectRatio(
                      aspectRatio: 1 / 1,
                      child: SizedBox(
                        width: size.width * 0.4,
                      ));
                } else {
                  return const Center(child: Text("Error"));
                }
              }),
            ))
          ],
        ),
      )),
    );
  }
}
