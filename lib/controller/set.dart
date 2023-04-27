import 'package:get/get.dart';
import 'package:the_translation_app/view/widgets/OCR_screen.dart';
import 'package:translator/translator.dart';

class MyController extends GetxController {
  var variable1 = ''.obs;
  var orignialText2 = ''.obs;

  Future<void> updateVariables(String orignialText, String newValue2) async {
    Translation translation =
        await translator.translate(orignialText, to: newValue2);
    orignialText2.value = translation.toString();
    update();
  }
}
