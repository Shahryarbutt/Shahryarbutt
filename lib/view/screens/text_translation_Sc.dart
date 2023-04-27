// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, must_be_immutable, deprecated_member_use, file_names, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_workers/utils/debouncer.dart';
import 'package:the_translation_app/model/favouriteModel.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/services.dart';

import 'package:translator/translator.dart';
import '../../controller/fav_db.dart';
import '../../controller/language_controller.dart';
import '../../model/Colors.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:share/share.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

import 'package:url_launcher/url_launcher.dart';
import '../widgets/favoritesc.dart';

class TextTranslation extends StatefulWidget {
  const TextTranslation({
    super.key,
  });

  @override
  State<TextTranslation> createState() => _TextTranslationState();
}

class _TextTranslationState extends State<TextTranslation> {
  final LanguageControll _languageControll = Get.put(LanguageControll());

  String outpu = '';
  Favoritedb? favdb;

  String snd = '1';
  final FlutterTts flutterTts = FlutterTts();
  stt.SpeechToText _speech = stt.SpeechToText();
  bool _isListening = false;
  var saved = '';
  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
    favdb = Favoritedb();
  }

  bool clkick = false;
  @override
  void dispose() {
    flutterTts.stop();
    super.dispose();
  }

  bool btnpress = false;
  bool convert = false;
  bool clear = false;
  bool voice = false;
  List lst = ['icons/flags/png/bd.png', 'icons/flags/png/pk.png'];
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

  String selected = 'English';
  String selected2 = 'Chinese';

  var lang = TextEditingController();

  GoogleTranslator translator = GoogleTranslator();
  final Debouncer _debouncer =
      Debouncer(delay: const Duration(milliseconds: 1000));
  final _text = 'Write text here'.tr;
  String n = '';
  void _listen(String code) async {
    if (!_isListening) {
      bool available = await _speech.initialize();
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(onResult: (val) {
          _debouncer.call(() async {
            lang.text = val.recognizedWords;
            Translation translation =
                await translator.translate(lang.text, to: code);
            lang.text = translation.toString();
            setState(() {});
          });
        }).onError((error, stackTrace) =>
            {Get.snackbar('Network error', 'Check your network')});
      }
    } else {
      setState(() => _isListening = false);
      _speech.stop();
    }
  }

  var index = 0;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          SystemNavigator.pop();
          return true;
        },
        child: Scaffold(
            drawer: Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  DrawerHeader(
                    decoration: BoxDecoration(
                      color: CColors().appbar,
                    ),
                    child: Center(
                        child: Text(
                      'Translation App'.tr,
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0),
                    child: ListTile(
                      leading: Icon(Icons.favorite_outline),
                      title: Text('My Favorites'.tr),
                      onTap: () {
                        Get.to(Favorite(data: 'data'));
                        // Handle drawer button tap
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0),
                    child: ListTile(
                      leading: Icon(Icons.info),
                      title: Text('About Us'.tr),
                      onTap: () {
                        var url = 'https://enfixo.com/about-us/';
                        launch(url);
                        // Handle drawer button tap
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0),
                    child: ListTile(
                      leading: Icon(Icons.contact_mail_outlined),
                      title: Text('Contact Us'.tr),
                      onTap: () {
                        var url = 'https://enfixo.com/about-us/';
                        launch(url);
                        // Handle drawer button tap
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0),
                    child: ListTile(
                      leading: Icon(Icons.security),
                      title: Text('Privacy Policy'.tr),
                      onTap: () {
                        // Handle drawer button tap
                        var url =
                            'https://www.freeprivacypolicy.com/live/79cc5004-00cc-4c71-870c-59b973f8830d';
                        launch(url);
                      },
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 18.0),
                  //   child: ListTile(
                  //     leading: Icon(Icons.share),
                  //     title: Text('Share App'),
                  //     onTap: () {
                  //       // Handle drawer button tap
                  //     },
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0),
                    child: ListTile(
                      leading: Icon(Icons.language),
                      title: Text('Languages'.tr),
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (v) {
                              return AlertDialog(
                                title: Text('Select language'.tr),
                                content: SizedBox(
                                  height: 540,
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        lsttile(
                                            const Locale('ur_PK'),
                                            Image.asset(
                                              'icons/flags/png/pk.png',
                                              package: 'country_icons',
                                              height: 40,
                                              width: 40,
                                            ),
                                            'Urdu'),
                                        const Divider(
                                          thickness: 1.5,
                                        ),
                                        lsttile(
                                            const Locale('en_AT'),
                                            Image.asset(
                                              'icons/flags/png/at.png',
                                              package: 'country_icons',
                                              height: 40,
                                              width: 40,
                                            ),
                                            'English'),
                                        const Divider(
                                          thickness: 1.5,
                                        ),
                                        lsttile(
                                            const Locale('hi_IN'),
                                            Image.asset(
                                              'icons/flags/png/in.png',
                                              package: 'country_icons',
                                              height: 40,
                                              width: 40,
                                            ),
                                            'Hindi'),
                                        const Divider(
                                          thickness: 1.5,
                                        ),
                                        lsttile(
                                            const Locale('ar_AE'),
                                            Image.asset(
                                              'icons/flags/png/ae.png',
                                              package: 'country_icons',
                                              height: 40,
                                              width: 40,
                                            ),
                                            'Arabic'),
                                        const Divider(
                                          thickness: 1.5,
                                        ),
                                        lsttile(
                                            const Locale('es_AR'),
                                            Image.asset(
                                              'icons/flags/png/ar.png',
                                              package: 'country_icons',
                                              height: 40,
                                              width: 40,
                                            ),
                                            'Spanish'),
                                        const Divider(
                                          thickness: 1.5,
                                        ),
                                        lsttile(
                                            const Locale('fr_BE'),
                                            Image.asset(
                                              'icons/flags/png/be.png',
                                              package: 'country_icons',
                                              height: 40,
                                              width: 40,
                                            ),
                                            'French'),
                                        const Divider(
                                          thickness: 1.5,
                                        ),
                                        lsttile(
                                            const Locale('de_AT'),
                                            Image.asset(
                                              'icons/flags/png/at.png',
                                              package: 'country_icons',
                                              height: 40,
                                              width: 40,
                                            ),
                                            'German'),
                                        const Divider(
                                          thickness: 1.5,
                                        ),
                                        lsttile(
                                            const Locale('zh_Hans'),
                                            Image.asset(
                                              'icons/flags/png/cn.png',
                                              package: 'country_icons',
                                              height: 40,
                                              width: 40,
                                            ),
                                            'Chinese'),
                                        const Divider(
                                          thickness: 1.5,
                                        ),
                                        lsttile(
                                            const Locale('pt_AO'),
                                            Image.asset(
                                              'icons/flags/png/ao.png',
                                              package: 'country_icons',
                                              height: 40,
                                              width: 40,
                                            ),
                                            'Portuguese'),
                                        const Divider(
                                          thickness: 1.5,
                                        ),
                                        lsttile(
                                            const Locale('bn_BD'),
                                            Image.asset(
                                              'icons/flags/png/bd.png',
                                              package: 'country_icons',
                                              height: 40,
                                              width: 40,
                                            ),
                                            'Bengali'),
                                        const Divider(
                                          thickness: 1.5,
                                        ),
                                        lsttile(
                                            const Locale('ru_RU'),
                                            Image.asset(
                                              'icons/flags/png/ru.png',
                                              package: 'country_icons',
                                              height: 40,
                                              width: 40,
                                            ),
                                            'Russian'),
                                        const Divider(
                                          thickness: 1.5,
                                        ),
                                        lsttile(
                                            const Locale('ja_JP'),
                                            Image.asset(
                                              'icons/flags/png/jp.png',
                                              package: 'country_icons',
                                              height: 40,
                                              width: 40,
                                            ),
                                            'Japanese'),
                                        const Divider(
                                          thickness: 1.5,
                                        ),
                                        lsttile(
                                            const Locale('ko_KR'),
                                            Image.asset(
                                              'icons/flags/png/kr.png',
                                              package: 'country_icons',
                                              height: 40,
                                              width: 40,
                                            ),
                                            'Korean'),
                                        const Divider(
                                          thickness: 1.5,
                                        ),
                                        lsttile(
                                            const Locale('tr_TR'),
                                            Image.asset(
                                              'icons/flags/png/tr.png',
                                              package: 'country_icons',
                                              height: 40,
                                              width: 40,
                                            ),
                                            'Turkish'),
                                        const Divider(
                                          thickness: 1.5,
                                        ),
                                        lsttile(
                                            const Locale('in_ID'),
                                            Image.asset(
                                              'icons/flags/png/id.png',
                                              package: 'country_icons',
                                              height: 40,
                                              width: 40,
                                            ),
                                            'Indonesian'),
                                      ],
                                    ),
                                  ),
                                ),
                                actions: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text('cancel'.tr,
                                            style: TextStyle(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              fontFamily: 'Popins',
                                            ))),
                                  )
                                ],
                              );
                            });
                        // Handle drawer button tap
                      },
                    ),
                  ),
                  // Other drawer items
                ],
              ),
            ),
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                'Text Translator'.tr,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w800),
              ),
              elevation: 0,
              backgroundColor: CColors().appbar,
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 100,
                    width: double.infinity,
                    decoration: BoxDecoration(color: CColors().appbar),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Container(
                                height: 40,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(color: Colors.white)),
                                // width: 126,
                                child: Row(
                                  children: [
                                    Center(
                                      child: SizedBox(
                                          width: 80,
                                          child: convert == false
                                              ? Text(
                                                  selected,
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                )
                                              : Text(
                                                  selected2,
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                )),
                                    ),
                                    PopupMenuButton(
                                      constraints: BoxConstraints.expand(
                                          width: 180, height: 400),
                                      itemBuilder: (BuildContext context) {
                                        return firstlist
                                            .map((item) => PopupMenuItem(
                                                  value: item,
                                                  child: Column(
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Text(
                                                            '.  ',
                                                            style: TextStyle(
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w900),
                                                          ),
                                                          Column(
                                                            children: [
                                                              SizedBox(
                                                                height: 10,
                                                              ),
                                                              Text(item),
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                      Divider()
                                                    ],
                                                  ),
                                                ))
                                            .toList();
                                      },
                                      onSelected: (value) {
                                        setState(() {
                                          if (convert == false) {
                                            selected = value.toString();
                                          } else if (convert == true) {
                                            selected2 = value.toString();
                                          }
                                        });
                                      },
                                      child: SizedBox(
                                        // color:
                                        //     CColors().scaffoldbgcolor,
                                        width: 30,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
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
                            convert == false
                                ? TextButton(
                                    onPressed: () {
                                      setState(() {
                                        voice = true;
                                        convert = true;
                                        // convert = false;
                                      });
                                    },
                                    child: Icon(
                                      Icons.swap_horiz,
                                      color: Colors.white,
                                    ))
                                : TextButton(
                                    onPressed: () {
                                      setState(() {
                                        voice = false;
                                        // convert = true;
                                        convert = false;
                                      });
                                    },
                                    child: Icon(
                                      Icons.swap_horiz,
                                      color: Colors.white,
                                    )),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(color: Colors.white)),
                              height: 40,
                              child: Row(
                                children: [
                                  Center(
                                    child: SizedBox(
                                        width: 80,
                                        child: convert == false
                                            ? Text(
                                                selected2,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                                textAlign: TextAlign.center,
                                              )
                                            : Text(
                                                selected,
                                                style: TextStyle(
                                                    color: Colors.white),
                                                textAlign: TextAlign.center,
                                              )),
                                  ),
                                  PopupMenuButton(
                                    constraints: BoxConstraints.expand(
                                        width: 200, height: 400),
                                    itemBuilder: (BuildContext context) {
                                      return firstlist
                                          .map((item) => PopupMenuItem(
                                                value: item,
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        // Image(
                                                        //     image: AssetImage(
                                                        //         lst
                                                        //             .map((e) =>
                                                        //                 Container(
                                                        //                   height:
                                                        //                       20,
                                                        //                   width:
                                                        //                       20,
                                                        //                   child:
                                                        //                       e,
                                                        //                 ))
                                                        //             .toList()
                                                        //             .toString())),
                                                        // SizedBox(height: 20,width: 20,child: lst.map((e) =>   Image.asset(
                                                        //     // 'icons/flags/png/bd.png',
                                                        //     lst[index].toString(),
                                                        //     package:
                                                        //         'country_icons',
                                                        //     height: 20,
                                                        //     width: 20,
                                                        //   ),).toList()
                                                        //   ,)
                                                        // Text(lst
                                                        //     .map((e) => Text(e))
                                                        //     .toList()
                                                        //     .toString()), //
                                                        Text(
                                                          '.  ',
                                                          style: TextStyle(
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w900),
                                                        ),
                                                        Column(
                                                          children: [
                                                            SizedBox(
                                                              height: 10,
                                                            ),
                                                            Text(item),
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                    Divider()
                                                  ],
                                                ),
                                              ))
                                          .toList();
                                    },
                                    onSelected: (value) {
                                      setState(() {
                                        if (convert == false) {
                                          selected2 = value.toString();
                                        } else if (convert == true) {
                                          selected = value.toString();
                                        }
                                      });
                                    },
                                    child: SizedBox(
                                      // color: CColors().scaffoldbgcolor,
                                      width: 30,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Icon(
                                            Icons.arrow_drop_down,
                                            color: Colors.white,
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // Image.asset(
                  //   // 'icons/flags/png/bd.png',
                  //   lst[index].toString(),
                  //   package: 'country_icons',
                  //   height: 20,
                  //   width: 20,
                  // ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 2,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          side: const BorderSide(
                              color: Color.fromARGB(255, 214, 212, 212))),
                      child: SizedBox(
                        height: 230,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                      onTap: () {
                                        setState(() {});

                                        flutterTts.speak(lang.text);
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.grey),
                                            // color: CColors().cardbgcolors,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        height: 40,
                                        width: 120,
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8),
                                              child: Icon(Icons.volume_up,
                                                  size: 18, color: Colors.grey),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 4.0, bottom: 4, left: 6),
                                              child: voice == false
                                                  ? Text(
                                                      selected,
                                                      style: TextStyle(
                                                          color: Colors.grey),
                                                    )
                                                  : Text(
                                                      selected2,
                                                      style: TextStyle(
                                                          color: Colors.grey),
                                                    ),
                                            )
                                          ],
                                        ),
                                      )),
                                  clear
                                      ? TextButton(
                                          onPressed: () {
                                            setState(() {});
                                            lang.text = '';

                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                                    backgroundColor:
                                                        CColors().cardbgcolors,
                                                    behavior: SnackBarBehavior
                                                        .floating,
                                                    margin:
                                                        EdgeInsetsDirectional
                                                            .only(
                                                                bottom: 80,
                                                                start: 80,
                                                                end: 80),
                                                    content: Text(
                                                      'Text Cleared'.tr,
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          color:
                                                              CColors().appbar),
                                                    )));
                                          },
                                          child: Text('Clear'.tr))
                                      : Text('')
                                ],
                              ),
                            ),
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, top: 25),
                                child: SizedBox(
                                  height: 90,
                                  child: TextField(
                                    onChanged: (value) {
                                      setState(() {
                                        clear = true;
                                      });
                                    },
                                    maxLines: 4,
                                    cursorColor: Colors.grey,
                                    decoration: InputDecoration(
                                      hintText: _text,
                                      border: InputBorder.none,
                                    ),
                                    controller: lang,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 8.0, left: 8, bottom: 8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  InkWell(
                                    onTap: () async {
                                      final clipboardData =
                                          await Clipboard.getData('text/plain');
                                      if (clipboardData != null &&
                                          clipboardData.text != null) {
                                        setState(() {
                                          clear = true;
                                        });
                                        lang.text = clipboardData.text!;
                                      }
                                    },
                                    child: Center(
                                        child: Icon(
                                      Icons.paste,
                                      color: CColors().appbar,
                                    )),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {});

                                      clear = true;

                                      _listen('en');
                                    },
                                    child: Center(
                                        child: Icon(
                                      Icons.mic,
                                      color: CColors().appbar,
                                      size: 30,
                                    )),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  clear == true
                                      ? InkWell(
                                          onTap: () {
                                            saved =
                                                _languageControll.outpu.value;
                                            setState(() {});
                                            if (convert == false) {
                                              _languageControll.trans(
                                                selected2,
                                                lang,
                                              );
                                            } else {
                                              _languageControll.trans(
                                                selected,
                                                lang,
                                              );
                                            }
                                            btnpress = true;
                                          },
                                          child: Container(
                                              width: 90,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: CColors().appbar,
                                              ),
                                              height: 40,
                                              // width: 100,
                                              child: Center(
                                                  child: Text(
                                                'Translate'.tr,
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ))),
                                        )
                                      : Container(
                                          width: 90,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Colors.grey,
                                          ),
                                          height: 40,
                                          // width: 100,
                                          child: Center(
                                              child: Text(
                                            'Translate'.tr,
                                            style:
                                                TextStyle(color: Colors.white),
                                          ))),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  btnpress == false
                      ? Text('')
                      : Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                                side: const BorderSide(
                                    color: Color.fromARGB(255, 214, 212, 212))),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                          onTap: () {
                                            setState(() {});
                                            outpu =
                                                _languageControll.outpu.value;
                                            flutterTts.speak(outpu);
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.grey),
                                                // color: CColors().cardbgcolors,
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            height: 40,
                                            width: 120,
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 8),
                                                  child: Icon(Icons.volume_up,
                                                      size: 18,
                                                      color: Colors.grey),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 4.0,
                                                          bottom: 4,
                                                          left: 7),
                                                  child: voice == false
                                                      ? Text(
                                                          selected2,
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.grey),
                                                        )
                                                      : Text(
                                                          selected,
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.grey),
                                                        ),
                                                )
                                              ],
                                            ),
                                          )),
                                      InkWell(
                                          onTap: () {
                                            setState(() {});
                                            ontap();
                                            outpu =
                                                _languageControll.outpu.value;
                                            if (tap == true) {
                                              favdb!
                                                  .insert(FavoriteM(
                                                      text: outpu,
                                                      text1: lang.text,
                                                      first: selected,
                                                      second: selected2))
                                                  .then((value) {});
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                    backgroundColor:
                                                        CColors().cardbgcolors,
                                                    behavior: SnackBarBehavior
                                                        .floating,
                                                    margin:
                                                        EdgeInsetsDirectional
                                                            .only(
                                                                bottom: 80,
                                                                start: 80,
                                                                end: 80),
                                                    content: Text(
                                                      'Added to favorite'.tr,
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          color:
                                                              CColors().appbar),
                                                    )),
                                              );
                                            }
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            height: 30,
                                            width: 50,
                                            child: tap == false
                                                ? Icon(
                                                    FontAwesomeIcons.heart,
                                                    size: 20,
                                                    color: CColors().appbar,
                                                  )
                                                : Icon(Icons.favorite_sharp),
                                          )),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Expanded(child: Obx(() {
                                      return Text(
                                          _languageControll.outpu.value);
                                    })),
                                  ],
                                ),
                                SizedBox(
                                  height: 50,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    InkWell(
                                        onTap: () {
                                          setState(() {});
                                          outpu = _languageControll.outpu.value;
                                          Clipboard.setData(
                                              ClipboardData(text: outpu));
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                                backgroundColor:
                                                    CColors().cardbgcolors,
                                                behavior:
                                                    SnackBarBehavior.floating,
                                                margin:
                                                    EdgeInsetsDirectional.only(
                                                        bottom: 80,
                                                        start: 80,
                                                        end: 80),
                                                content: Text(
                                                  'Text Copied'.tr,
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: CColors().appbar),
                                                )),
                                          );
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              // color: CColors().cardbgcolors,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
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
                                        outpu = _languageControll.outpu.value;
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
                                          setState(() {});
                                          _languageControll.outpu.value = '';

                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                                  backgroundColor:
                                                      CColors().cardbgcolors,
                                                  behavior:
                                                      SnackBarBehavior.floating,
                                                  margin: EdgeInsetsDirectional
                                                      .only(
                                                          bottom: 80,
                                                          start: 80,
                                                          end: 80),
                                                  content: Text(
                                                    'Text deleted'.tr,
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color:
                                                            CColors().appbar),
                                                  )));
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              // color: CColors().cardbgcolors,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
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
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                        ),
                ],
              ),
            )
            // : index == 1
            //     ? SafeArea(
            //         child: Scaffold(
            //           body: Text('data'),
            //         ),
            //       )
            //     : index == 2
            //         ? SpeechToTextsc()
            //         : index == 3
            //             ? ConversationSc()
            //             : Favorite()),
            ));
  }

  ocrfn() {}

  bool tap = false;
  ontap() {
    setState(() {});
    tap = !tap;
  }

  Widget lsttile(Locale lc, Image flagimg, String name) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      onTap: () {
        setState(() {});
        var locale = lc;
        Get.updateLocale(locale);
      },
      dense: true,
      visualDensity: const VisualDensity(vertical: -1),
      leading: flagimg,
      title: Text(
        name.tr,
        style: TextStyle(
          fontFamily: 'Popins',
          fontSize: 16,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
