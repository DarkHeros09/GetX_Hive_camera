import 'dart:io';

import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../models/place.dart';

class GreatPlaces extends GetxController {
  List<Place> _items = [];
  Box _imgBox;

  List<Place> get items {
    return [..._items];
  }

  void addPlace(String pickedTitle, File pickeiImage) async {
    final newPlace = Place(
        id: DateTime.now().toString(),
        image: pickeiImage,
        title: pickedTitle,
        location: null);
    _items.add(newPlace);
    update();
    await Hive.openBox("mainBox");
    _imgBox = Hive.box('mainBox');
    final key = newPlace.id;
    await _imgBox.put(
      key,
      {
        'id': newPlace.id,
        'title': newPlace.title,
        'image': newPlace.image,
      },
    );
    print(_imgBox);
  }

  fetchAndSetPlaces() async {
    await Hive.openBox("mainBox");
    _imgBox = Hive.box('mainBox');
    List keys = _imgBox.keys.toList();
    List dataList;

    for (var i = 0; i < keys.length; i++) {
      {
        dataList.add(_imgBox.keys.toList()[i]);
      }
      return dataList;
    }
    _items = dataList
        .map(
          (items) => Place(
            id: items['id'],
            title: items['title'],
            location: null,
            image: File(
              items['image'],
            ),
          ),
        )
        .toList();
    print(_items);
    update();
  }
}
