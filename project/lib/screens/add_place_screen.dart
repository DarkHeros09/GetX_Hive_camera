import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/great_places.dart';
import '../controllers/textfiled_controller.dart';
import '../themes/app_theme.dart';
import '../widgets/image_input.dart';
import '../controllers/images.dart';

class AddPlaceScreen extends StatelessWidget {
  final GetTextController txtcontroller = Get.put(GetTextController());
  final ImagesFile imgController = Get.put(ImagesFile());
  final GreatPlaces grtPlaceController = Get.put(GreatPlaces());

  void _savedPlace() {
    if (txtcontroller.titleController.text.isEmpty ||
        imgController.storedImages == null) {
      return;
    }
    grtPlaceController.addPlace(
        txtcontroller.titleController.text, imgController.storedImages);
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add a new place'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(labelText: 'Title'),
                        controller: txtcontroller.titleController,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ImageInput(
                          // onSelectedImage: imgController.storedImages,
                          ),
                    ],
                  ),
                ),
              ),
            ),
            RaisedButton.icon(
              icon: Icon(Icons.add),
              label: Text('Add Place'),
              onPressed: _savedPlace,
              elevation: 0,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              color: appThemeData.accentColor,
            )
          ],
        ),
      ),
    );
  }
}
