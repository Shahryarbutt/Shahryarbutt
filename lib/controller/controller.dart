import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ScrollControllerManager extends GetxController {
  final ScrollController _scrollController = ScrollController();

  ScrollController get scrollController => _scrollController;
}
