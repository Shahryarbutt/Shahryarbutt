// ignore_for_file: file_names, deprecated_member_use, must_be_immutable, unnecessary_null_comparison
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:the_translation_app/model/Colors.dart';
import 'package:translator/translator.dart';

import '../../controller/language_controller.dart';

class OCRScreen extends StatefulWidget {
  const OCRScreen({
    super.key,
  });

  @override
  State<OCRScreen> createState() => _OCRScreenState();
}

GoogleTranslator translator = GoogleTranslator();
bool img = true;

class _OCRScreenState extends State<OCRScreen> {
  var text = '';
  final picker = ImagePicker();
  String _extractedText = 'nothing text';

  GoogleTranslator translator = GoogleTranslator();
  String outpu = 'translation';
  String hinttext = 'English';
  String onchange = '1';
  String snd = '1';
  final FlutterTts flutterTts = FlutterTts();

  @override
  void dispose() {
    flutterTts.stop();
    super.dispose();
  }

  final LanguageControll _languageControll = Get.put(LanguageControll());

  List<String> firstlist = [
    'Arabic',
    'Bengali',
    'Bulgarian',
    'Catalan',
    'Chinese',
    'Croatian',
    'Czech',
    'Danish',
    'Dutch',
    'English',
    'Filipino',
    'Finnish',
    'French',
    'German',
    'Greek',
    'Hebrew',
    'Hindi',
    'Hungarian',
    'Indonesian',
    'Italian',
    'Japanese',
    'Korean',
    'Latvian',
    'Lithuanian',
    'Malay',
    'Norwegian',
    'Persian',
    'Polish',
    'Portuguese',
    'Romanian',
    'Russian',
    'Serbian',
    'Slovak',
    'Slovenian',
    'Spanish',
    'Swedish',
    'Thai',
    'Turkish',
    'Urdu',
    'Vietnamese'
  ];
  bool empty = false;
  bool btnpress = false;

  Future _getImageAndRecognizeText2() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    if (pickedFile != null) {
      final inputImage = InputImage.fromFile(File(pickedFile.path));
      final textDetector = GoogleMlKit.vision.textRecognizer();
      final RecognizedText recognisedText =
          await textDetector.processImage(inputImage);
      String? extractedText = recognisedText.text;

      setState(() {
        empty = true;
        _extractedText = extractedText;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: CColors().appbar,
        title: Text('OCR Text Scanner'.tr),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: empty == true
          ? Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8, left: 8, top: 16),
                  child: Card(
                    elevation: 2,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                        side: const BorderSide(
                            color: Color.fromARGB(255, 214, 212, 212))),
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        height: 170,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: ListView(children: [
                            Text(
                              _extractedText,
                              style: const TextStyle(fontSize: 16),
                            )
                          ]),
                        )),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      // const Text('Choose language'),
                      SizedBox(
                        width: 140,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10, left: 10),
                          child: Container(
                            decoration: BoxDecoration(
                                color: CColors().appbar,
                                borderRadius: BorderRadius.circular(10)),
                            height: 50,
                            width: double.infinity,
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    enabled: false,
                                    decoration: InputDecoration(
                                        contentPadding:
                                            const EdgeInsets.only(left: 15),
                                        border: InputBorder.none,
                                        hintStyle: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                        hintText: hinttext),
                                  ),
                                ),
                                PopupMenuButton(
                                  constraints: const BoxConstraints.expand(
                                      width: 230, height: 400),
                                  itemBuilder: (BuildContext context) {
                                    return firstlist
                                        .map((item) => PopupMenuItem(
                                              value: item,
                                              child: Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      const Text(
                                                        '.  ',
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w900),
                                                      ),
                                                      Column(
                                                        children: [
                                                          const SizedBox(
                                                            height: 10,
                                                          ),
                                                          Text(item),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                  const Divider()
                                                ],
                                              ),
                                            ))
                                        .toList();
                                  },
                                  onSelected: (value) {
                                    hinttext = value;

                                    setState(() {});
                                  },
                                  child: Container(
                                    color: CColors().appbar,
                                    width: 40,
                                    child: Row(
                                      children: const [
                                        Icon(
                                          Icons.arrow_drop_down,
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 50,
                        width: 70,
                        decoration: BoxDecoration(
                            color: CColors().appbar,
                            borderRadius: BorderRadius.circular(10)),
                        child: IconButton(
                            onPressed: () {
                              setState(() {});
                              text = _extractedText;
                              if (hinttext == 'Arabic') {
                                translator
                                    .translate(text, to: 'ar')
                                    .then((value) {
                                  text = value.toString();
                                });
                              }
                              btnpress = true;
                              _languageControll.trans1(
                                  _extractedText, hinttext);
                            },
                            icon: const Icon(
                              Icons.translate,
                              color: Colors.white,
                            )),
                      )
                    ],
                  ),
                ),
                btnpress == true
                    ? Padding(
                        padding:
                            const EdgeInsets.only(right: 8.0, left: 8, top: 16),
                        child: Card(
                          elevation: 2,
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                              side: const BorderSide(
                                  color: Color.fromARGB(255, 214, 212, 212))),
                          child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              height: 200,
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: ListView(children: [
                                        Obx(() {
                                          return Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Text(
                                              _languageControll.outpu2.value,
                                              style:
                                                  const TextStyle(fontSize: 26),
                                            ),
                                          );
                                        }),
                                      ]),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        InkWell(
                                            onTap: () {
                                              setState(() {
                                                outpu = _languageControll
                                                    .outpu2.value;
                                                flutterTts.speak(outpu);
                                              });
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                              height: 30,
                                              width: 50,
                                              child: Icon(
                                                FontAwesomeIcons.volumeHigh,
                                                size: 20,
                                                color: CColors().appbar,
                                              ),
                                            )),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        InkWell(
                                            onTap: () {
                                              setState(() {});
                                              outpu = _languageControll
                                                  .outpu2.value;
                                              Clipboard.setData(
                                                  ClipboardData(text: outpu));
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                    backgroundColor: CColors()
                                                        .cardbgcolors,
                                                    behavior: SnackBarBehavior
                                                        .floating,
                                                    margin:
                                                        const EdgeInsetsDirectional
                                                                .only(
                                                            bottom: 80,
                                                            start: 80,
                                                            end: 80),
                                                    content: Text(
                                                      'Text Copied'.tr,
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          color:
                                                              CColors().appbar),
                                                    )),
                                              );
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  // color: CColors().cardbgcolors,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                              height: 30,
                                              width: 50,
                                              child: Icon(
                                                FontAwesomeIcons.copy,
                                                size: 20,
                                                color: CColors().appbar,
                                              ),
                                            )),
                                        const SizedBox(width: 5),
                                        InkWell(
                                          onTap: () {
                                            setState(() {});
                                            outpu =
                                                _languageControll.outpu2.value;
                                            Share.share(outpu);
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                                // color: CColors().cardbgcolors,
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            height: 30,
                                            width: 50,
                                            child: Icon(
                                              FontAwesomeIcons.share,
                                              size: 20,
                                              color: CColors().appbar,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        InkWell(
                                            onTap: () {
                                              setState(() {
                                                // btnpress = false;
                                              });
                                              _languageControll.outpu2.value =
                                                  '';
                                              // outpu = '';

                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(SnackBar(
                                                      backgroundColor: CColors()
                                                          .cardbgcolors,
                                                      behavior: SnackBarBehavior
                                                          .floating,
                                                      margin:
                                                          const EdgeInsetsDirectional
                                                                  .only(
                                                              bottom: 80,
                                                              start: 80,
                                                              end: 80),
                                                      content: Text(
                                                        'Text deleted'.tr,
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            color: CColors()
                                                                .appbar),
                                                      )));
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                              height: 30,
                                              width: 50,
                                              child: Icon(
                                                Icons.delete,
                                                size: 20,
                                                color: CColors().appbar,
                                              ),
                                            )),
                                        const SizedBox(
                                          width: 20,
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              )),
                        ),
                      )
                    : const Text(''),
              ],
            )
          : Center(
              child: Text(
              'No Text Available Press the button  \n\nto select image'.tr,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.grey),
            )),
      floatingActionButton: FloatingActionButton(
        backgroundColor: CColors().btncolor,
        onPressed: _getImageAndRecognizeText2,
        tooltip: 'Pick Image',
        child: const Icon(Icons.camera_enhance),
      ),
    ));
  }
}
