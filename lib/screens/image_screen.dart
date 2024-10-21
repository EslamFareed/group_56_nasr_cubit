import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageScreen extends StatefulWidget {
  const ImageScreen({super.key});

  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  XFile? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            image == null
                ? Container()
                : CircleAvatar(
                    radius: 100,
                    backgroundImage: FileImage(File(image!.path)),
                  ),
            ElevatedButton(
              onPressed: () async {
                image =
                    await ImagePicker().pickImage(source: ImageSource.gallery);
                // image =
                //     await ImagePicker().pickVideo(source: ImageSource.camera);
                // ImagePicker().pickMedia();
                //  image = await ImagePicker().pickMultiImage();
                setState(() {});
              },
              child: const Text("Pick Image"),
            )
          ],
        ),
      ),
    );
  }
}
