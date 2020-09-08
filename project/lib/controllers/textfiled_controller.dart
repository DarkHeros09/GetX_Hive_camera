import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetTextController extends GetxController {
  final _titleController = TextEditingController().obs;

  get titleController => _titleController.value;
}
