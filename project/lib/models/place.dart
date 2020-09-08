import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
part 'palce.g.dart';

class PlaceLocation {
  final double latitude;
  final double longitude;
  final String address;

  PlaceLocation(
      {@required this.latitude, @required this.longitude, this.address});
}

@HiveType(typeId: 1)
class Place {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final PlaceLocation location;
  @HiveField(3)
  final File image;

  Place(
      {@required this.id,
      @required this.title,
      @required this.location,
      @required this.image});
}
