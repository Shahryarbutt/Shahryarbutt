// ignore_for_file: library_private_types_in_public_api

import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_workers/utils/debouncer.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:the_translation_app/controller/chat_mesg_db.dart';
import 'package:the_translation_app/controller/conversationdb.dart';
import 'package:the_translation_app/model/Colors.dart';
import 'package:the_translation_app/model/conversationM.dart';
import 'package:the_translation_app/view/widgets/Conversation.dart';
import 'package:translator/translator.dart';

import 'package:speech_to_text/speech_to_text.dart' as stt;

class ChatScreen2 extends StatefulWidget {
  const ChatScreen2({super.key});

  @override
  _ChatScreen2State createState() => _ChatScreen2State();
}

class _ChatScreen2State extends State<ChatScreen2> {
  final List<ChatMessage> _messages = [];
  final bool _isListening = true;
  final stt.SpeechToText _speech = stt.SpeechToText();
  GoogleTranslator translator = GoogleTranslator();
  var controller = TextEditingController();
  final Debouncer _debouncer =
      Debouncer(delay: const Duration(milliseconds: 2000));
  String snd = '1';
  final FlutterTts flutterTts = FlutterTts();
  String _text = '';
  String _text2 = '';
  bool ispress = false;
  @override
  void dispose() {
    flutterTts.stop();
    super.dispose();
  }

  final ScrollController _scrollController = ScrollController();
  // final ScrollControllerManager _controller =
  //     Get.put(ScrollControllerManager());
  void _listen2(String code, bool isRight) async {
    if (_isListening) {
      bool available = await _speech.initialize();
      if (available) {
        fn2(code, isRight);
      }
    }
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  ConversationDb? favdb;

  @override
  void initState() {
    super.initState();

    favdb = ConversationDb();
    chatdbtwo = Chatdb();
    load();
  }

  Chatdb? chatdbtwo;
  late Future<List<ChatMessage2>> hrtlist;
  load() async {
    hrtlist = chatdbtwo!.getbmilist();
  }

  Locale? locale;
  var trsns = '';
  var trsns2 = '';
  Future fn2(String code, bool isRight) async {
    if (selectedItem == 'Arabic') {
      locale = const Locale('ar');
    } else if (selectedItem == 'Bengali') {
      locale = const Locale('bn');
    } else if (selectedItem == 'Catalan') {
      locale = const Locale('ca');
    } else if (selectedItem == 'Chinese') {
      locale = const Locale('zh-cn');
    } else if (selectedItem == 'Croatian') {
      locale = const Locale('hr');
    } else if (selectedItem == 'Czech') {
      locale = const Locale('cs');
    } else if (selectedItem == 'Danish') {
      locale = const Locale('da');
    } else if (selectedItem == 'Dutch') {
      locale = const Locale('nl');
    } else if (selectedItem == 'English') {
      locale = const Locale('en');
    } else if (selectedItem == 'Filipino') {
      locale = const Locale('fil');
    } else if (selectedItem == 'Finnish') {
      locale = const Locale('fi');
    } else if (selectedItem == 'French') {
      locale = const Locale('fr');
    } else if (selectedItem == 'German') {
      locale = const Locale('de');
    } else if (selectedItem == 'Greek') {
      locale = const Locale('el');
    } else if (selectedItem == 'Hebrew') {
      locale = const Locale('he');
    } else if (selectedItem == 'Hindi') {
      locale = const Locale('hi');
    } else if (selectedItem == 'Hungarian') {
      locale = const Locale('hu');
    } else if (selectedItem == 'Indonesian') {
      locale = const Locale('in');
    } else if (selectedItem == 'Italian') {
      locale = const Locale('it');
    } else if (selectedItem == 'Japanese') {
      locale = const Locale('ja');
    } else if (selectedItem == 'Korean') {
      locale = const Locale('ko');
    } else if (selectedItem == 'Latvian') {
      locale = const Locale('lv');
    } else if (selectedItem == 'Lithuanian') {
      locale = const Locale('lt');
    } else if (selectedItem == 'Malay') {
      locale = const Locale('ms');
    } else if (selectedItem == 'Norwegian') {
      locale = const Locale('no');
    } else if (selectedItem == 'Persian') {
      locale = const Locale('fa');
    } else if (selectedItem == 'Polish') {
      locale = const Locale('pl');
    } else if (selectedItem == 'Portuguese') {
      locale = const Locale('pt');
    } else if (selectedItem == 'Romanian') {
      locale = const Locale('ro');
    } else if (selectedItem == 'Russian') {
      locale = const Locale('ru');
    } else if (selectedItem == 'Serbian') {
      locale = const Locale('sr');
    } else if (selectedItem == 'Slovak') {
      locale = const Locale('sk');
    } else if (selectedItem == 'Slovenian') {
      locale = const Locale('sl');
    } else if (selectedItem == 'Spanish') {
      locale = const Locale('es');
    } else if (selectedItem == 'Swedish') {
      locale = const Locale('sv');
    } else if (selectedItem == 'Thai') {
      locale = const Locale('th');
    } else if (selectedItem == 'Turkish') {
      locale = const Locale('tr');
    } else if (selectedItem == 'Urdu') {
      locale = const Locale('ur');
    } else if (selectedItem == 'Vietnamese') {
      locale = const Locale('vi');
    }
    await _speech.listen(
        onResult: (val) {
          _debouncer.call(() async {
            _text2 = val.recognizedWords;
            Translation translation =
                await translator.translate(_text2, to: code);
            final mesg = ChatMessage(
                text: _text2, isRight: isRight, time: translation.toString());
            _messages.add(mesg);
            trsns2 = translation.toString();
            // chatdbtwo!
            //     .insert(
            //         ChatMessage2(text: _text2, time: translation.toString()))
            //     .then((value) {
            //   print('yes');
            // }).onError((error, stackTrace) {
            //   print('no');
            // });
            setState(() {});
          });
        },
        localeId: locale.toString());
  }

  Future fn(String code, bool isRight) async {
    if (selected == 'Arabic') {
      locale = const Locale('ar');
    } else if (selected == 'Bengali') {
      locale = const Locale('bn');
    } else if (selected == 'Catalan') {
      locale = const Locale('ca');
    } else if (selected == 'Chinese') {
      locale = const Locale('zh-cn');
    } else if (selected == 'Croatian') {
      locale = const Locale('hr');
    } else if (selected == 'Czech') {
      locale = const Locale('cs');
    } else if (selected == 'Danish') {
      locale = const Locale('da');
    } else if (selected == 'Dutch') {
      locale = const Locale('nl');
    } else if (selected == 'English') {
      locale = const Locale('en');
    } else if (selected == 'Filipino') {
      locale = const Locale('fil');
    } else if (selected == 'Finnish') {
      locale = const Locale('fi');
    } else if (selected == 'French') {
      locale = const Locale('fr');
    } else if (selected == 'German') {
      locale = const Locale('de');
    } else if (selected == 'Greek') {
      locale = const Locale('el');
    } else if (selected == 'Hebrew') {
      locale = const Locale('he');
    } else if (selected == 'Hindi') {
      locale = const Locale('hi');
    } else if (selected == 'Hungarian') {
      locale = const Locale('hu');
    } else if (selected == 'Indonesian') {
      locale = const Locale('in');
    } else if (selected == 'Italian') {
      locale = const Locale('it');
    } else if (selected == 'Japanese') {
      locale = const Locale('ja');
    } else if (selected == 'Korean') {
      locale = const Locale('ko');
    } else if (selected == 'Latvian') {
      locale = const Locale('lv');
    } else if (selected == 'Lithuanian') {
      locale = const Locale('lt');
    } else if (selected == 'Malay') {
      locale = const Locale('ms');
    } else if (selected == 'Norwegian') {
      locale = const Locale('no');
    } else if (selected == 'Persian') {
      locale = const Locale('fa');
    } else if (selected == 'Polish') {
      locale = const Locale('pl');
    } else if (selected == 'Portuguese') {
      locale = const Locale('pt');
    } else if (selected == 'Romanian') {
      locale = const Locale('ro');
    } else if (selected == 'Russian') {
      locale = const Locale('ru');
    } else if (selected == 'Serbian') {
      locale = const Locale('sr');
    } else if (selected == 'Slovak') {
      locale = const Locale('sk');
    } else if (selected == 'Slovenian') {
      locale = const Locale('sl');
    } else if (selected == 'Spanish') {
      locale = const Locale('es');
    } else if (selected == 'Swedish') {
      locale = const Locale('sv');
    } else if (selected == 'Thai') {
      locale = const Locale('th');
    } else if (selected == 'Turkish') {
      locale = const Locale('tr');
    } else if (selected == 'Urdu') {
      locale = const Locale('ur');
    } else if (selected == 'Vietnamese') {
      locale = const Locale('vi');
    }
    await _speech.listen(
        onResult: (val) {
          _debouncer.call(() async {
            _text = val.recognizedWords;
            Translation translation =
                await translator.translate(_text, to: code);
            final mesg = ChatMessage(
                text: _text, isRight: isRight, time: translation.toString());
            // chatdbtwo!
            //     .insert(ChatMessage2(text: _text, time: translation.toString()))
            //     .then((value) {
            //   print('yes');
            // }).onError((error, stackTrace) {
            //   print('no');
            // });
            _messages.add(mesg);
            trsns = translation.toString();

            // print(mesg.text);

            setState(() {});
          });
        },
        localeId: locale.toString());
  }

  void _listen(String code, bool isRight) async {
    if (_isListening) {
      bool available = await _speech.initialize();
      if (available) {
        fn(
          code,
          isRight,
        );
      }
    }
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

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
  String selectedItem = 'Arabic';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 60),
        child: FloatingActionButton(
          onPressed: () {
            if (ispress == false) {
              chatdbtwo!.delete();
            } else if (ispress == true) {
              favdb!
                  .insert(ConversationM(
                      text: _text2,
                      text1: trsns2,
                      first: selected,
                      second: selectedItem))
                  .then((value) {});
            }
          },
          child: const Icon(Icons.save),
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: CColors().appbar,
        title: Text('Con'.tr),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemCount: _messages.length,
              itemBuilder: (BuildContext context, int index) {
                final message = _messages[index];
                return ChatBubble(
                  clipper: ChatBubbleClipper9(
                      type: message.isRight
                          ? BubbleType.sendBubble
                          : BubbleType.receiverBubble),
                  alignment:
                      message.isRight ? Alignment.topRight : Alignment.topLeft,
                  margin: const EdgeInsets.only(
                      top: 8.0, bottom: 8.0, left: 16.0, right: 16.0),
                  backGroundColor:
                      message.isRight ? Colors.green[100] : Colors.grey[200],
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(message.text),
                      const SizedBox(height: 8.0),
                      Text(
                        message.time.toString(),
                      ),
                      // const Icon(Icons.favorite)
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 0, right: 0),
            child: Card(
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {});
                      ispress = false;

                      _listen(
                          selectedItem == 'Chinese'
                              ? 'zh-cn'
                              : selectedItem == 'Arabic'
                                  ? 'ar'
                                  : selectedItem == 'Bengali'
                                      ? 'bn'
                                      : selectedItem == 'Bulgarian'
                                          ? 'bg'
                                          : selectedItem == 'Catalan'
                                              ? 'ca'
                                              : selectedItem == 'Croatian'
                                                  ? 'hr'
                                                  : selectedItem == 'Czech'
                                                      ? 'cs'
                                                      : selectedItem == 'Danish'
                                                          ? 'da'
                                                          : selectedItem ==
                                                                  'Dutch'
                                                              ? 'nl'
                                                              : selectedItem ==
                                                                      'English'
                                                                  ? 'en'
                                                                  : selectedItem ==
                                                                          'Filipino'
                                                                      ? 'fil'
                                                                      : selectedItem ==
                                                                              'Finnish'
                                                                          ? 'fi'
                                                                          : selectedItem == 'French'
                                                                              ? 'fr'
                                                                              : selectedItem == 'German'
                                                                                  ? 'de'
                                                                                  : selectedItem == 'Greek'
                                                                                      ? 'el'
                                                                                      : selectedItem == 'Hebrew'
                                                                                          ? 'he'
                                                                                          : selectedItem == 'Hindi'
                                                                                              ? 'hi'
                                                                                              : selectedItem == 'Hungarian'
                                                                                                  ? 'hu'
                                                                                                  : selectedItem == 'Indonesian'
                                                                                                      ? 'in'
                                                                                                      : selectedItem == 'Italian'
                                                                                                          ? 'it'
                                                                                                          : selectedItem == 'Japanese'
                                                                                                              ? 'ja'
                                                                                                              : selectedItem == 'Korean'
                                                                                                                  ? 'ko'
                                                                                                                  : selectedItem == 'Latvian'
                                                                                                                      ? 'lv'
                                                                                                                      : selectedItem == 'Lithuanian'
                                                                                                                          ? 'lt'
                                                                                                                          : selectedItem == 'Malay'
                                                                                                                              ? 'ms'
                                                                                                                              : selectedItem == 'Norwegian'
                                                                                                                                  ? 'no'
                                                                                                                                  : selectedItem == 'Persian'
                                                                                                                                      ? 'fa'
                                                                                                                                      : selectedItem == 'Polish'
                                                                                                                                          ? 'pl'
                                                                                                                                          : selectedItem == 'Portuguese'
                                                                                                                                              ? 'pt'
                                                                                                                                              : selectedItem == 'Romanian'
                                                                                                                                                  ? 'ro'
                                                                                                                                                  : selectedItem == 'Russian'
                                                                                                                                                      ? 'ru'
                                                                                                                                                      : selectedItem == 'Serbian'
                                                                                                                                                          ? 'sr'
                                                                                                                                                          : selectedItem == 'Slovak'
                                                                                                                                                              ? 'sk'
                                                                                                                                                              : selectedItem == 'Slovenian'
                                                                                                                                                                  ? 'sl'
                                                                                                                                                                  : selectedItem == 'Spanish'
                                                                                                                                                                      ? 'es'
                                                                                                                                                                      : selectedItem == 'Swedish'
                                                                                                                                                                          ? 'sv'
                                                                                                                                                                          : selectedItem == 'Thai'
                                                                                                                                                                              ? 'th'
                                                                                                                                                                              : selectedItem == 'Turkish'
                                                                                                                                                                                  ? 'tr'
                                                                                                                                                                                  : selectedItem == 'Urdu'
                                                                                                                                                                                      ? 'ur'
                                                                                                                                                                                      : 'vi',
                          false);
                    },
                    child: AvatarGlow(
                      animate: false,
                      glowColor: Theme.of(context).primaryColor,
                      endRadius: 30.0,
                      duration: const Duration(milliseconds: 2000),
                      repeatPauseDuration: const Duration(milliseconds: 100),
                      repeat: true,
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            color: CColors().appbar,
                            borderRadius: BorderRadius.circular(25)),
                        child: const Icon(
                          Icons.mic,
                          size: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      enabled: false,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintStyle: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                        hintText: selected,
                      ),
                    ),
                  ),
                  PopupMenuButton(
                    constraints:
                        const BoxConstraints.expand(width: 200, height: 400),
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
                                              fontWeight: FontWeight.w900),
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
                      setState(() {});
                      selected = value;
                    },
                    child: const SizedBox(
                      width: 40,
                      child: Icon(Icons.arrow_drop_down),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: TextFormField(
                      enabled: false,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: selectedItem,
                        hintStyle: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  PopupMenuButton(
                    constraints:
                        const BoxConstraints.expand(width: 200, height: 400),
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
                                              fontWeight: FontWeight.w900),
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
                      setState(() {});
                      selectedItem = value;
                    },
                    child: const SizedBox(
                      width: 40,
                      child: Icon(Icons.arrow_drop_down),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {});
                      ispress = true;
                      _listen2(
                          selected == 'Chinese'
                              ? 'zh-cn'
                              : selected == 'Arabic'
                                  ? 'ar'
                                  : selected == 'Bengali'
                                      ? 'bn'
                                      : selected == 'Bulgarian'
                                          ? 'bg'
                                          : selected == 'Catalan'
                                              ? 'ca'
                                              : selected == 'Croatian'
                                                  ? 'hr'
                                                  : selected == 'Czech'
                                                      ? 'cs'
                                                      : selected == 'Danish'
                                                          ? 'da'
                                                          : selected == 'Dutch'
                                                              ? 'nl'
                                                              : selected ==
                                                                      'English'
                                                                  ? 'en'
                                                                  : selected ==
                                                                          'Filipino'
                                                                      ? 'fil'
                                                                      : selected ==
                                                                              'Finnish'
                                                                          ? 'fi'
                                                                          : selected == 'French'
                                                                              ? 'fr'
                                                                              : selected == 'German'
                                                                                  ? 'de'
                                                                                  : selected == 'Greek'
                                                                                      ? 'el'
                                                                                      : selected == 'Hebrew'
                                                                                          ? 'he'
                                                                                          : selected == 'Hindi'
                                                                                              ? 'hi'
                                                                                              : selected == 'Hungarian'
                                                                                                  ? 'hu'
                                                                                                  : selected == 'Indonesian'
                                                                                                      ? 'in'
                                                                                                      : selected == 'Italian'
                                                                                                          ? 'it'
                                                                                                          : selected == 'Japanese'
                                                                                                              ? 'ja'
                                                                                                              : selected == 'Korean'
                                                                                                                  ? 'ko'
                                                                                                                  : selected == 'Latvian'
                                                                                                                      ? 'lv'
                                                                                                                      : selected == 'Lithuanian'
                                                                                                                          ? 'lt'
                                                                                                                          : selected == 'Malay'
                                                                                                                              ? 'ms'
                                                                                                                              : selected == 'Norwegian'
                                                                                                                                  ? 'no'
                                                                                                                                  : selected == 'Persian'
                                                                                                                                      ? 'fa'
                                                                                                                                      : selected == 'Polish'
                                                                                                                                          ? 'pl'
                                                                                                                                          : selected == 'Portuguese'
                                                                                                                                              ? 'pt'
                                                                                                                                              : selected == 'Romanian'
                                                                                                                                                  ? 'ro'
                                                                                                                                                  : selected == 'Russian'
                                                                                                                                                      ? 'ru'
                                                                                                                                                      : selected == 'Serbian'
                                                                                                                                                          ? 'sr'
                                                                                                                                                          : selected == 'Slovak'
                                                                                                                                                              ? 'sk'
                                                                                                                                                              : selected == 'Slovenian'
                                                                                                                                                                  ? 'sl'
                                                                                                                                                                  : selected == 'Spanish'
                                                                                                                                                                      ? 'es'
                                                                                                                                                                      : selected == 'Swedish'
                                                                                                                                                                          ? 'sv'
                                                                                                                                                                          : selected == 'Thai'
                                                                                                                                                                              ? 'th'
                                                                                                                                                                              : selected == 'Turkish'
                                                                                                                                                                                  ? 'tr'
                                                                                                                                                                                  : selected == 'Urdu'
                                                                                                                                                                                      ? 'ur'
                                                                                                                                                                                      : 'vi',
                          true);
                    },
                    child: AvatarGlow(
                      animate: false,
                      glowColor: Theme.of(context).primaryColor,
                      endRadius: 30.0,
                      duration: const Duration(milliseconds: 2000),
                      repeatPauseDuration: const Duration(milliseconds: 100),
                      repeat: true,
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            color: CColors().appbar,
                            borderRadius: BorderRadius.circular(25)),
                        child: const Icon(
                          Icons.mic,
                          size: 20,
                          color: Colors.white,
                        ),
                      ),
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
}

class ChatMessage {
  final String text;
  final bool isRight;
  final String time;

  ChatMessage({
    required this.text,
    required this.isRight,
    required this.time,
  });
}
