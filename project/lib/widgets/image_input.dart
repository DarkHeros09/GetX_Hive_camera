import 'dart:io';

import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../themes/app_theme.dart';
import '../controllers/images.dart';

class ImageInput extends StatelessWidget {
  // final Function onSelectedImage;

  // ImageInput({this.onSelectedImage});

  final ImagesFile imgController = Get.put(ImagesFile());

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 150,
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
          ),
          child: GetBuilder(
            init: imgController,
            builder: (_) => imgController.storedImages != null
                ? Image.file(
                    imgController.storedImages,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  )
                : Text(
                    'No Image Taken',
                    textAlign: TextAlign.center,
                  ),
          ),
          alignment: Alignment.center,
        ),
        SizedBox(
          height: 10,
        ),
        Expanded(
          child: FlatButton.icon(
            icon: Icon(Icons.camera),
            label: Text('Take Picture'),
            onPressed: () {
              imgController.takePicture;
            },
            textColor: appThemeData.primaryColor,
          ),
        ),
      ],
    );
  }
}
