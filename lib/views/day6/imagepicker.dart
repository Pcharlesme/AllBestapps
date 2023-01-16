import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:testappbc/utils/sizes.dart';
import 'package:path/path.dart';
import '../../const/assets_path.dart';

class ImagePickerApp extends StatefulWidget {
  const ImagePickerApp({super.key});

  @override
  State<ImagePickerApp> createState() => _ImagePickerAppState();
}

class _ImagePickerAppState extends State<ImagePickerApp> {
  File? _image;

  Future getImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      final imagePermanent = await saveFilePermanently(image.path);
      setState(() {
        this._image = imagePermanent;
      });
    } on PlatformException catch (e) {
      print("failed to pick image: $e");
    }
  }

  Future<File> saveFilePermanently(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(imagePath);
    final image = File('${directory.path}/$name');

    return File(imagePath).copy(image.path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text("Pick an Image"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 30,
          ),
          _image != null
              ? Image.file(
                  _image!,
                  width: 250,
                  height: 250,
                  fit: BoxFit.cover,
                )
              : Image.asset(
                  splashlogo,
                  height: 200,
                ),
          SizedBox(
            height: 30,
          ),
          CustomButton(
            icons: Icons.image_outlined,
            press: () {
              getImage(ImageSource.gallery);
            },
            title: 'Pick from Gallery',
          ),
          CustomButton(
            icons: Icons.camera,
            press: () {
              getImage(ImageSource.camera);
            },
            title: 'Pick From Camera',
          )
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String title;
  final IconData icons;
  final VoidCallback press;

  const CustomButton({
    super.key,
    required this.title,
    required this.icons,
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          width: widthSize(220),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icons),
              SizedBox(
                width: 16,
              ),
              Text(title),
            ],
          ),
        ),
      ),
    );
  }
}
