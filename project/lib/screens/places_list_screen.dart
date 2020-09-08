import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routes/app_pages.dart';
import '../controllers/great_places.dart';
import '../controllers/textfiled_controller.dart';
import '../controllers/images.dart';

class PlacesListScreen extends StatelessWidget {
  final GetTextController txtcontroller = Get.put(GetTextController());
  final ImagesFile imgController = Get.put(ImagesFile());
  final GreatPlaces grtPlaceController = Get.put(GreatPlaces());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Your Places'),
          actions: [
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Get.toNamed(Routes.ADDPLACE);
              },
            ),
          ],
        ),
        body: Center(
            child: FutureBuilder(
          future: grtPlaceController.fetchAndSetPlaces(),
          builder: (ctx, snapshot) => snapshot.connectionState ==
                  ConnectionState.waiting
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : GetBuilder(
                  init: grtPlaceController,
                  builder: (_) => grtPlaceController.items.length <= 0
                      ? Text('Got no places yet, start adding some!')
                      : ListView.builder(
                          itemCount: grtPlaceController.items.length,
                          itemBuilder: (ctx, i) => ListTile(
                            leading: CircleAvatar(
                              backgroundImage:
                                  FileImage(grtPlaceController.items[i].image),
                            ),
                            title: Text(grtPlaceController.items[i].title),
                            onTap: () {
                              // to add later
                            },
                          ),
                        ),
                ),
        )));
  }
}
