// ignore: file_names
// ignore_for_file: file_names, duplicate_ignore, must_be_immutable, camel_case_types

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:the_translation_app/model/Colors.dart';
import 'package:the_translation_app/navigatoin.dart';

class OnboardingSc1 extends StatefulWidget {
  const OnboardingSc1({super.key});

  @override
  State<OnboardingSc1> createState() => _OnboardingSc1State();
}

class _OnboardingSc1State extends State<OnboardingSc1> {
  var controller1 = TextEditingController();
  var controller2 = TextEditingController();
  late PageController _pageController;
  late PageController _pageController2;
  var indexp = 0;
  var inp = 0;
  Color clr1 = Colors.white;
  Color clr2 = Colors.white;
  Color clr3 = Colors.white;

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    _pageController = PageController(initialPage: 0);
    _pageController2 = PageController(initialPage: 0);
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _showAlertDialog();
    });
  }

  void _showAlertDialog() {
    showDialog(
        context: context,
        builder: (v) {
          return AlertDialog(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
            title: Text(
              'Select language'.tr,
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontFamily: 'UbuntuM',
                  fontWeight: FontWeight.w900),
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
                          color: Theme.of(context).primaryColor,
                          fontFamily: 'Popins',
                        ))),
              )
            ],
          );
        }).then((_) {
      // After the user dismisses the alert dialog,
      // navigate to the desired screen.
      // Navigator.push(
      //   context,
      //   // MaterialPageRoute(builder: (context) => MyOtherPage()),
      // );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _pageController2.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: SizedBox(
            height: 700,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(25),
                          bottomRight: Radius.circular(25))),
                  height: 400,
                  width: double.infinity,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                              onPressed: () {
                                _pageController2.nextPage(
                                    duration: const Duration(microseconds: 300),
                                    curve: Curves.ease);
                                _pageController.nextPage(
                                    duration: const Duration(microseconds: 300),
                                    curve: Curves.ease);
                                if (indexp == 2) {
                                  Get.to(const NavigationSc());
                                }
                              },
                              child: Text(
                                'Skip'.tr,
                                style: TextStyle(
                                    color: CColors().appbar,
                                    fontFamily: 'UbuntuM'),
                              ))
                        ],
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      SizedBox(
                        height: 250,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              child: PageView.builder(
                                onPageChanged: (value) {
                                  setState(() {
                                    indexp = value;
                                  });
                                },
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: dmo.length,
                                controller: _pageController,
                                itemBuilder: (context, index) =>
                                    OnboardContent1(image: dmo[index].img),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ...List.generate(dmo2.length,
                              (index) => Dotind(isActive: index == indexp)),
                          const SizedBox(
                            width: 30,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 200,
                    child: PageView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: dmo2.length,
                        controller: _pageController2,
                        itemBuilder: (context, index) => OnboardContent2(
                            text: dmo2[index].text, text2: dmo2[index].text2)),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 13),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed: () {
                            _pageController2.nextPage(
                                duration: const Duration(microseconds: 300),
                                curve: Curves.ease);
                            _pageController.nextPage(
                                duration: const Duration(microseconds: 300),
                                curve: Curves.ease);
                            if (indexp == 2) {
                              Get.to(const NavigationSc());
                            }
                          },
                          child: Container(
                            height: 40,
                            width: 70,
                            color: CColors().cardbgcolors,
                            child: Center(
                                child: Text(
                              'Next'.tr,
                              style: TextStyle(
                                  color: CColors().appbar,
                                  fontFamily: 'Popins'),
                            )),
                          ))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget lsttile(Locale lc, Image flagimg, String name) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      onTap: () {
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

class Dotind extends StatelessWidget {
  const Dotind({super.key, this.isActive = false});
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        height: 4,
        width: 14,
        decoration: BoxDecoration(
            color: isActive
                ? CColors().appbar
                : const Color.fromARGB(255, 233, 231, 231)),
      ),
    );
  }
}

class onb2 {
  final String text;
  final String text2;
  onb2({required this.text, required this.text2});
}

final List<onb2> dmo2 = [
  onb2(
      text: "Welcome to Translation Pro",
      text2:
          'Translate text into multiple with just a few taps. Whether you are traveling abroad or communicating with someone in another language, Translation Pro has got you covered'),
  onb2(
      text: 'Scan and Translate',
      text2:
          'Use our OCR scanner to extract text from images and documents, and translate them instantly. This powerful feature makes it easy to translate signs, menus, and other text'),
  onb2(
      text: 'Conversation Mode',
      text2:
          "Need to have a conversation with someone who speaks a different language? Translation Pro's conversation mode lets you speak and translate in real-time. Just select the languages and start talking!")
];

class onb {
  final String img;
  onb({required this.img});
}

final List<onb> dmo = [
  onb(img: 'assets/onb1.jpg'),
  onb(img: 'assets/onb2.jpg'),
  onb(img: 'assets/onb3.jpg')
];

class OnboardContent1 extends StatelessWidget {
  String image;
  OnboardContent1({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: 340,
            height: 300,
            child: Image(
              image: AssetImage(
                image,
              ),
              fit: BoxFit.contain,
            ),
          ),
        ),
      ],
    );
  }
}

class OnboardContent2 extends StatelessWidget {
  String text;
  String text2;
  OnboardContent2({super.key, required this.text, required this.text2});

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 20,
        ),
        Text(
          text.tr,
          style: TextStyle(
              color: CColors().appbar,
              fontFamily: 'PopinsB',
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 24,
        ),
        Text(
          text2.tr,
          style: TextStyle(
              color: CColors().appbar, fontFamily: 'Popins', fontSize: 14),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
