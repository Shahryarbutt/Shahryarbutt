import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:translator/translator.dart';

class LanguageControll extends GetxController {
  GoogleTranslator translator = GoogleTranslator();
  RxString outpu = ''.obs;
  RxString outpu2 = ''.obs;
  trans1(String text, String hinttext) {
    if (hinttext == 'Arabic') {
      translator.translate(text, to: 'ar').then((output) {
        outpu2.value = output.toString();
      });
    } else if (hinttext == 'Bengali') {
      translator.translate(text, to: 'bn').then((output) {
        outpu2.value = output.toString();
      });
    } else if (hinttext == 'Bulgarian') {
      translator.translate(text, to: 'bg').then((output) {
        outpu2.value = output.toString();
      });
    } else if (hinttext == 'Catalan') {
      translator.translate(text, to: 'ca').then((output) {
        outpu2.value = output.toString();
      });
    } else if (hinttext == 'Chinese') {
      translator.translate(text, to: 'zh-cn').then((output) {
        outpu2.value = output.toString();
      });
    } else if (hinttext == 'Croatian') {
      translator.translate(text, to: 'hr').then((output) {
        outpu2.value = output.toString();
      });
    } else if (hinttext == 'Czech') {
      translator.translate(text, to: 'cs').then((output) {
        outpu2.value = output.toString();
      });
    } else if (hinttext == 'Danish') {
      translator.translate(text, to: 'da').then((output) {
        outpu2.value = output.toString();
      });
    } else if (hinttext == 'Dutch') {
      translator.translate(text, to: 'nl').then((output) {
        outpu2.value = output.toString();
      });
    } else if (hinttext == 'English') {
      translator.translate(text, to: 'en').then((output) {
        outpu2.value = output.toString();
      });
    } else if (hinttext == 'Filipino') {
      translator.translate(text, to: 'fil').then((output) {
        outpu2.value = output.toString();
      });
    } else if (hinttext == 'Finnish') {
      translator.translate(text, to: 'fi').then((output) {
        outpu2.value = output.toString();
      });
    } else if (hinttext == 'French') {
      translator.translate(text, to: 'fr').then((output) {
        outpu2.value = output.toString();
      });
    } else if (hinttext == 'German') {
      translator.translate(text, to: 'de').then((output) {
        outpu2.value = output.toString();
      });
    } else if (hinttext == 'Greek') {
      translator.translate(text, to: 'el').then((output) {
        outpu2.value = output.toString();
      });
    } else if (hinttext == 'Hebrew') {
      translator.translate(text, to: 'he').then((output) {
        outpu2.value = output.toString();
      });
    } else if (hinttext == 'Hindi') {
      translator.translate(text, to: 'hi').then((output) {
        outpu2.value = output.toString();
      });
    } else if (hinttext == 'Hungarian') {
      translator.translate(text, to: 'hu').then((output) {
        outpu2.value = output.toString();
      });
    } else if (hinttext == 'Indonesian') {
      translator.translate(text, to: 'in').then((output) {
        outpu2.value = output.toString();
      });
    } else if (hinttext == 'Italian') {
      translator.translate(text, to: 'it').then((output) {
        outpu2.value = output.toString();
      });
    } else if (hinttext == 'Japanese') {
      translator.translate(text, to: 'ja').then((output) {
        outpu2.value = output.toString();
      });
    } else if (hinttext == 'Korean') {
      translator.translate(text, to: 'ko').then((output) {
        outpu2.value = output.toString();
      });
    } else if (hinttext == 'Latvian') {
      translator.translate(text, to: 'lv').then((output) {
        outpu2.value = output.toString();
      });
    } else if (hinttext == 'Lithuanian') {
      translator.translate(text, to: 'lt').then((output) {
        outpu2.value = output.toString();
      });
    } else if (hinttext == 'Malay') {
      translator.translate(text, to: 'ms').then((output) {
        outpu2.value = output.toString();
      });
    } else if (hinttext == 'Norwegian') {
      translator.translate(text, to: 'no').then((output) {
        outpu2.value = output.toString();
      });
    } else if (hinttext == 'Persian') {
      translator.translate(text, to: 'fa').then((output) {
        outpu2.value = output.toString();
      });
    } else if (hinttext == 'Polish') {
      translator.translate(text, to: 'pl').then((output) {
        outpu2.value = output.toString();
      });
    } else if (hinttext == 'Portuguese') {
      translator.translate(text, to: 'pt').then((output) {
        outpu2.value = output.toString();
      });
    } else if (hinttext == 'Romanian') {
      translator.translate(text, to: 'ro').then((output) {
        outpu2.value = output.toString();
      });
    } else if (hinttext == 'Russian') {
      translator.translate(text, to: 'ru').then((output) {
        outpu2.value = output.toString();
      });
    } else if (hinttext == 'Serbian') {
      translator.translate(text, to: 'sr').then((output) {
        outpu2.value = output.toString();
      });
    } else if (hinttext == 'Slovak') {
      translator.translate(text, to: 'sk').then((output) {
        outpu2.value = output.toString();
      });
    } else if (hinttext == 'Slovenian') {
      translator.translate(text, to: 'sl').then((output) {
        outpu2.value = output.toString();
      });
    } else if (hinttext == 'Spanish') {
      translator.translate(text, to: 'es').then((output) {
        outpu2.value = output.toString();
      });
    } else if (hinttext == 'Swedish') {
      translator.translate(text, to: 'sv').then((output) {
        outpu2.value = output.toString();
      });
    } else if (hinttext == 'Thai') {
      translator.translate(text, to: 'th').then((output) {
        outpu2.value = output.toString();
      });
    } else if (hinttext == 'Turkish') {
      translator.translate(text, to: 'tr').then((output) {
        outpu2.value = output.toString();
      });
    } else if (hinttext == 'Urdu') {
      translator.translate(text, to: 'ur').then((output) {
        outpu2.value = output.toString();
      });
    } else if (hinttext == 'Vietnamese') {
      translator.translate(text, to: 'vi').then((output) {
        outpu2.value = output.toString();
      });
    }
  }

  void trans(String? selectedItem, TextEditingController lang) {
    if (selectedItem == 'Arabic') {
      translator.translate(lang.text, to: 'ar').then((output) {
        outpu.value = output.toString();
      });
    } else if (selectedItem == 'Bengali') {
      translator.translate(lang.text, to: 'bn').then((output) {
        outpu.value = output.toString();
      });
    } else if (selectedItem == 'Bulgarian') {
      translator.translate(lang.text, to: 'bg').then((output) {
        outpu.value = output.toString();
      });
    } else if (selectedItem == 'Catalan') {
      translator.translate(lang.text, to: 'ca').then((output) {
        outpu.value = output.toString();
      });
    } else if (selectedItem == 'Chinese') {
      translator.translate(lang.text, to: 'zh-cn').then((output) {
        outpu.value = output.toString();
      });
    } else if (selectedItem == 'Croatian') {
      translator.translate(lang.text, to: 'hr').then((output) {
        outpu.value = output.toString();
      });
    } else if (selectedItem == 'Czech') {
      translator.translate(lang.text, to: 'cs').then((output) {
        outpu.value = output.toString();
      });
    } else if (selectedItem == 'Danish') {
      translator.translate(lang.text, to: 'da').then((output) {
        outpu.value = output.toString();
      });
    } else if (selectedItem == 'Dutch') {
      translator.translate(lang.text, to: 'nl').then((output) {
        outpu.value = output.toString();
      });
    } else if (selectedItem == 'English') {
      translator.translate(lang.text, to: 'en').then((output) {
        outpu.value = output.toString();
      });
    } else if (selectedItem == 'Filipino') {
      translator.translate(lang.text, to: 'fil').then((output) {
        outpu.value = output.toString();
      });
    } else if (selectedItem == 'Finnish') {
      translator.translate(lang.text, to: 'fi').then((output) {
        outpu.value = output.toString();
      });
    } else if (selectedItem == 'French') {
      translator.translate(lang.text, to: 'fr').then((output) {
        outpu.value = output.toString();
      });
    } else if (selectedItem == 'German') {
      translator.translate(lang.text, to: 'de').then((output) {
        outpu.value = output.toString();
      });
    } else if (selectedItem == 'Greek') {
      translator.translate(lang.text, to: 'el').then((output) {
        outpu.value = output.toString();
      });
    } else if (selectedItem == 'Hebrew') {
      translator.translate(lang.text, to: 'he').then((output) {
        outpu.value = output.toString();
      });
    } else if (selectedItem == 'Hindi') {
      translator.translate(lang.text, to: 'hi').then((output) {
        outpu.value = output.toString();
      });
    } else if (selectedItem == 'Hungarian') {
      translator.translate(lang.text, to: 'hu').then((output) {
        outpu.value = output.toString();
      });
    } else if (selectedItem == 'Indonesian') {
      translator.translate(lang.text, to: 'in').then((output) {
        outpu.value = output.toString();
      });
    } else if (selectedItem == 'Italian') {
      translator.translate(lang.text, to: 'it').then((output) {
        outpu.value = output.toString();
      });
    } else if (selectedItem == 'Japanese') {
      translator.translate(lang.text, to: 'ja').then((output) {
        outpu.value = output.toString();
      });
    } else if (selectedItem == 'Korean') {
      translator.translate(lang.text, to: 'ko').then((output) {
        outpu.value = output.toString();
      });
    } else if (selectedItem == 'Latvian') {
      translator.translate(lang.text, to: 'lv').then((output) {
        outpu.value = output.toString();
      });
    } else if (selectedItem == 'Lithuanian') {
      translator.translate(lang.text, to: 'lt').then((output) {
        outpu.value = output.toString();
      });
    } else if (selectedItem == 'Malay') {
      translator.translate(lang.text, to: 'ms').then((output) {
        outpu.value = output.toString();
      });
    } else if (selectedItem == 'Norwegian') {
      translator.translate(lang.text, to: 'no').then((output) {
        outpu.value = output.toString();
      });
    } else if (selectedItem == 'Persian') {
      translator.translate(lang.text, to: 'fa').then((output) {
        outpu.value = output.toString();
      });
    } else if (selectedItem == 'Polish') {
      translator.translate(lang.text, to: 'pl').then((output) {
        outpu.value = output.toString();
      });
    } else if (selectedItem == 'Portuguese') {
      translator.translate(lang.text, to: 'pt').then((output) {
        outpu.value = output.toString();
      });
    } else if (selectedItem == 'Romanian') {
      translator.translate(lang.text, to: 'ro').then((output) {
        outpu.value = output.toString();
      });
    } else if (selectedItem == 'Russian') {
      translator.translate(lang.text, to: 'ru').then((output) {
        outpu.value = output.toString();
      });
    } else if (selectedItem == 'Serbian') {
      translator.translate(lang.text, to: 'sr').then((output) {
        outpu.value = output.toString();
      });
    } else if (selectedItem == 'Slovak') {
      translator.translate(lang.text, to: 'sk').then((output) {
        outpu.value = output.toString();
      });
    } else if (selectedItem == 'Slovenian') {
      translator.translate(lang.text, to: 'sl').then((output) {
        outpu.value = output.toString();
      });
    } else if (selectedItem == 'Spanish') {
      translator.translate(lang.text, to: 'es').then((output) {
        outpu.value = output.toString();
      });
    } else if (selectedItem == 'Swedish') {
      translator.translate(lang.text, to: 'sv').then((output) {
        outpu.value = output.toString();
      });
    } else if (selectedItem == 'Thai') {
      translator.translate(lang.text, to: 'th').then((output) {
        outpu.value = output.toString();
      });
    } else if (selectedItem == 'Turkish') {
      translator.translate(lang.text, to: 'tr').then((output) {
        outpu.value = output.toString();
      });
    } else if (selectedItem == 'Urdu') {
      translator.translate(lang.text, to: 'ur').then((output) {
        outpu.value = output.toString();
      });
    } else if (selectedItem == 'Vietnamese') {
      translator.translate(lang.text, to: 'vi').then((output) {
        outpu.value = output.toString();
      });
    }
  }
}
