import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Screen extends StatelessWidget {
  Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GalleryImage(),
    );
  }
}

class GalleryImage extends StatefulWidget {
  GalleryImage({super.key});

  @override
  _GalleryImageState createState() => _GalleryImageState();
}

class _GalleryImageState extends State<GalleryImage> {
  final picker = ImagePicker();
  File? _storedImage;
  bool isPredicted = false;

  @override
  void initState() {
    super.initState();
  }

  Future<void> _getImageFromGallery() async {
    final imageFile = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (imageFile == null) {
      return;
    }

    setState(() {
      _storedImage = File(imageFile.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Stack(
          children: [
            Container(
              width: size.width,
              height: 400,
              alignment: Alignment.center,
              child: _storedImage == null
                  ? Column(
                      children: const [
                        Icon(
                          Icons.image,
                          size: 300,
                        ),
                        Text("Select image!"),
                      ],
                    )
                  : Image.file(
                      _storedImage!,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
            ),
            const Text("Test"),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            OutlinedButton.icon(
              onPressed: _getImageFromGallery,
              icon: const Icon(Icons.photo_library),
              label: const Text("Gallery"),
            )
          ],
        ),
      ],
    );
  }
}
