// ignore_for_file: deprecated_member_use

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:the_translation_app/view/screens/text_translation_Sc.dart';
import 'package:the_translation_app/view/widgets/OCR_screen.dart';
import 'package:the_translation_app/view/widgets/Speech_To_text.dart';
import 'package:the_translation_app/view/widgets/conv2.dart';
import 'package:the_translation_app/view/widgets/favoritesc.dart';

import 'model/Colors.dart';

class NavigationSc extends StatefulWidget {
  const NavigationSc({super.key});

  @override
  State<NavigationSc> createState() => _NavigationScState();
}

class _NavigationScState extends State<NavigationSc> {
  final List _page = [
    const TextTranslation(),
    const OCRScreen(),
    // const TextTranslation(),
    const SpeechToTextsc(),
    const ChatScreen2(),
    Favorite(
      data: '',
    )
  ];
  var index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
          height: 50,
          onTap: (value) {
            setState(() {
              index = value;
            });
          },
          backgroundColor: Colors.white,
          color: CColors().appbar,
          animationDuration: const Duration(milliseconds: 300),
          animationCurve: Curves.linear,
          items: const [
            Icon(
              Icons.translate,
              color: Colors.white,
            ),
            Icon(
              Icons.camera_alt_outlined,
              color: Colors.white,
            ),
            Icon(
              Icons.mic,
              color: Colors.white,
            ),
            Icon(
              Icons.chat,
              color: Colors.white,
            ),
            Icon(
              Icons.favorite,
              color: Colors.white,
            )
          ]),
      body: _page[index],
    );
  }
}
