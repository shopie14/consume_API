import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:api_berita_app/controllers/post_controllers.dart';

class AddPostPage extends StatefulWidget {
  const AddPostPage({super.key});

  @override
  State<AddPostPage> createState() => _AddPostPageState();
}

class _AddPostPageState extends State<AddPostPage> {
  final PostController postcontroller = PostController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final TextEditingController titleController;
  late final TextEditingController bodyController;
  @override
  void initState() {
    titleController = TextEditingController();
    bodyController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tambah Berita"),
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 8.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(height: size.height * 0.01),
                    TextFormField(
                      controller: titleController,
                      decoration: const InputDecoration(
                        isDense: true,
                        border: OutlineInputBorder(),
                        hintText: "title",
                      ),
                      validator: (value) {
                        if (value == "") {
                          return "judul harus diisi";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: size.height * 0.01),
                    TextFormField(
                      controller: bodyController,
                      maxLines: null,
                      decoration: const InputDecoration(
                        isDense: true,
                        border: OutlineInputBorder(),
                        hintText: "body",
                      ),
                      validator: (value) {
                        if (value == "") {
                          return "Body  harus diisi";
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Expanded(
            child: SizedBox(),
          ),
          Container(
            width: size.width,
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
            child: TextButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
              ),
              child: const Text("Tambah"),
            ),
          )
        ],
      ),
    );
  }
}
