import 'package:get/get.dart';

import '../screens/places_list_screen.dart';
import '../screens/add_place_screen.dart';
part './app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.INITIAL,
      page: () => PlacesListScreen(),
    ),
    GetPage(
      name: Routes.ADDPLACE,
      page: () => AddPlaceScreen(),
    ),
  ];
}
