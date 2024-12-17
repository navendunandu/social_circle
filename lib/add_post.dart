import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_circle/main.dart';

class AddPost extends StatefulWidget {
  const AddPost({super.key});

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  File? _image;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  Future<String?> _uploadImage(File image, String userId) async {
    try {
      final fileName = 'post_$userId';

      await supabase.storage.from('post').upload(fileName, image);

      // Get public URL of the uploaded image
      final imageUrl = supabase.storage.from('post').getPublicUrl(fileName);
      return imageUrl;
    } catch (e) {
      print('Image upload failed: $e');
      return null;
    }
  }

  Future<void> uploadPost() async {
    try {} catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Post'),
        actions: [
          IconButton(
            icon: Icon(Icons.cancel),
            onPressed: () {
              // Handle camera click
            },
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {
              // Handle post submission
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          Center(
            child: GestureDetector(
                onTap: _pickImage,
                child: Container(
                  height: 120,
                  width: 300,
                  color: Colors.grey,
                  child: _image != null
                      ? Image.file(_image!)
                      : Center(
                          child: Icon(Icons.add_a_photo_outlined),
                        ),
                )),
          ),
        ],
      ),
    );
  }
}
