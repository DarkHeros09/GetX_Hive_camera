// import 'package:get/get.dart';
// import 'package:flutter/material.dart';

// abstract class SingleTextController implements DisposableInterface {
//   TextEditingController _textController;
//   Worker _worker;
//   RxString _rx;

//   TextEditingController _buildController() => TextEditingController();

//   TextEditingController get textController {
//     _textController ??= _buildController();
//     return _textController;
//   }

//   onClose() {
//     _worker?.dispose();
//     _textController?.removeListener(_onTextChanged);
//     _textController?.dispose();
//   }

//   void bindRx(RxString val) {
//     _rx = val;
//     textController.addListener(_onTextChanged);
//     _worker = ever(
//         _rx,
//         (newText) => _textController.value =
//             _textController.value.copyWith(text: newText));
//   }

//   void _onTextChanged() => _rx.value = _textController.text;
// }

// class TextController extends GetxController with SingleTextController {
//   TextController(RxString value) {
//     bindRx(value);
//     textController.text = '$value';
//   }
// }
