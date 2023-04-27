// ignore_for_file: file_names, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_workers/utils/debouncer.dart';
import 'package:share/share.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:avatar_glow/avatar_glow.dart';
import 'package:translator/translator.dart';

import '../../controller/fav_db.dart';

import '../../model/Colors.dart';

class SpeechToTextsc extends StatefulWidget {
  const SpeechToTextsc({super.key});

  @override
  _SpeechToTextscState createState() => _SpeechToTextscState();
}

class _SpeechToTextscState extends State<SpeechToTextsc> {
  stt.SpeechToText _speech = stt.SpeechToText();
  bool _isListening = false;
  Favoritedb? favdb;
  String _text = 'Press the button and start speaking'.tr;
  var selectedItem = "Urdu";
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
  bool pr = false;
  bool isfilled = false;
  GoogleTranslator translator = GoogleTranslator();
  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
    favdb = Favoritedb();
  }

  final Debouncer _debouncer =
      Debouncer(delay: const Duration(milliseconds: 1000));
  final FlutterTts flutterTts = FlutterTts();

  @override
  void dispose() {
    flutterTts.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: CColors().appbar,
        title: Text('Speech to Text'.tr),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          AvatarGlow(
            animate: false,
            glowColor: Theme.of(context).primaryColor,
            endRadius: 130.0,
            duration: const Duration(milliseconds: 2000),
            repeatPauseDuration: const Duration(milliseconds: 100),
            repeat: true,
            child: FloatingActionButton(
              backgroundColor: CColors().appbar,
              onPressed: () {
                if (selectedItem == 'Arabic') {
                  _listen('ar');
                } else if (selectedItem == 'Bengali') {
                  _listen('bn');
                } else if (selectedItem == 'Bulgarian') {
                  _listen('bg');
                } else if (selectedItem == 'Catalan') {
                  _listen('ca');
                } else if (selectedItem == 'Chinese') {
                  _listen('zh-cn');
                } else if (selectedItem == 'Croatian') {
                  _listen('hr');
                } else if (selectedItem == 'Czech') {
                  _listen('cs');
                } else if (selectedItem == 'Danish') {
                  _listen('da');
                } else if (selectedItem == 'Dutch') {
                  _listen('nl');
                } else if (selectedItem == 'English') {
                  _listen('en');
                } else if (selectedItem == 'Filipino') {
                  _listen('fil');
                } else if (selectedItem == 'Finnish') {
                  _listen('fi');
                } else if (selectedItem == 'French') {
                  _listen('fr');
                } else if (selectedItem == 'German') {
                  _listen('de');
                } else if (selectedItem == 'Greek') {
                  _listen('el');
                } else if (selectedItem == 'Hebrew') {
                  _listen('iw');
                } else if (selectedItem == 'Hindi') {
                  _listen('hi');
                } else if (selectedItem == 'Hungarian') {
                  _listen('hu');
                } else if (selectedItem == 'Indonesian') {
                  _listen('in');
                } else if (selectedItem == 'Italian') {
                  _listen('it');
                } else if (selectedItem == 'Japanese') {
                  _listen('ja');
                } else if (selectedItem == 'Korean') {
                  _listen('ko');
                } else if (selectedItem == 'Latvian') {
                  _listen('lv');
                } else if (selectedItem == 'Lithuanian') {
                  _listen('lt');
                } else if (selectedItem == 'Malay') {
                  _listen('ms');
                } else if (selectedItem == 'Norwegian') {
                  _listen('no');
                } else if (selectedItem == 'Persian') {
                  _listen('fa');
                } else if (selectedItem == 'pl') {
                  _listen('ar');
                } else if (selectedItem == 'Portuguese') {
                  _listen('pt');
                } else if (selectedItem == 'Romanian') {
                  _listen('ro');
                } else if (selectedItem == 'Russian') {
                  _listen('ru');
                } else if (selectedItem == 'Serbian') {
                  _listen('sr');
                } else if (selectedItem == 'Slovak') {
                  _listen('sk');
                } else if (selectedItem == 'Slovenian') {
                  _listen('sl');
                } else if (selectedItem == 'Spanish') {
                  _listen('es');
                } else if (selectedItem == 'Swedish') {
                  _listen('sv');
                } else if (selectedItem == 'Thai') {
                  _listen('th');
                } else if (selectedItem == 'Turkish') {
                  _listen('tr');
                } else if (selectedItem == 'Urdu') {
                  _listen('ur');
                } else if (selectedItem == 'Vietnamese') {
                  _listen('vi');
                }
              },
              child: Icon(_isListening ? Icons.mic : Icons.mic_none),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const SizedBox(
                width: 20,
              ),
              // const Text('Choose language'),
              SizedBox(
                width: 200,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35),
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
                              contentPadding: const EdgeInsets.only(left: 15),
                              border: InputBorder.none,
                              hintStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                              hintText: selectedItem,
                            ),
                          ),
                        ),
                        PopupMenuButton(
                          constraints: const BoxConstraints.expand(
                              width: 240, height: 400),
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
                                                        FontWeight.w900),
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
                            selectedItem = value;

                            setState(() {});
                          },
                          child: Container(
                            color: CColors().appbar,
                            width: 40,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                  side: const BorderSide(
                      color: Color.fromARGB(255, 214, 212, 212))),
              child: Column(
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: SizedBox(
                      height: 180,
                      child: ListView(
                        children: [
                          Text(
                            _text.tr,
                            style: const TextStyle(
                                fontSize: 18, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                            onTap: () {
                              setState(() {});

                              flutterTts.speak(_text);
                            },
                            child: Icon(
                              FontAwesomeIcons.volumeHigh,
                              // size: 30,
                              color: CColors().appbar,
                            )),
                        const SizedBox(
                          width: 20,
                        ),
                        InkWell(
                            onTap: () {
                              setState(() {});

                              Clipboard.setData(ClipboardData(text: _text));
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    backgroundColor: CColors().cardbgcolors,
                                    behavior: SnackBarBehavior.floating,
                                    margin: const EdgeInsetsDirectional.only(
                                        bottom: 80, start: 80, end: 80),
                                    content: Text(
                                      'Text Copied'.tr,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: CColors().appbar),
                                    )),
                              );
                            },
                            child: Icon(
                              FontAwesomeIcons.copy,
                              // size: 20,
                              color: CColors().appbar,
                            )),
                        const SizedBox(width: 20),
                        InkWell(
                          onTap: () {
                            setState(() {});
                            Share.share(_text);
                          },
                          child: Icon(
                            FontAwesomeIcons.share,
                            color: CColors().appbar,
                          ),
                        ),
                        const SizedBox(width: 20),
                        InkWell(
                            onTap: () {
                              setState(() {});

                              _text = '';

                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      backgroundColor: CColors().cardbgcolors,
                                      behavior: SnackBarBehavior.floating,
                                      margin: const EdgeInsetsDirectional.only(
                                          bottom: 80, start: 80, end: 80),
                                      content: Text(
                                        'Text deleted'.tr,
                                        textAlign: TextAlign.center,
                                        style:
                                            TextStyle(color: CColors().appbar),
                                      )));
                            },
                            child: Icon(
                              Icons.delete,
                              // size: 20,
                              color: CColors().appbar,
                            )),
                        const SizedBox(
                          width: 20,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _listen(String code) async {
    if (!_isListening) {
      bool available = await _speech.initialize();
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(onResult: (val) {
          _debouncer.call(() async {
            _text = val.recognizedWords;
            Translation translation =
                await translator.translate(_text, to: code);
            _text = translation.toString();
            setState(() {});
          });
        });
      }
    } else {
      setState(() => _isListening = false);
      _speech.stop();
    }
  }
}
