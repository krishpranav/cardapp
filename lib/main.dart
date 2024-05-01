import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:palette_generator/palette_generator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentindex = 0;
  bool cardEmpty = false;

  List images = [
    'assets/women_1.png',
    'assets/women_2.png',
    'assets/women_3.png',
  ];

  PaletteGenerator? paletteGenerator;

  Color defaultcolor = Colors.white;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF0E0D0D),
        appBar: AppBar(
          backgroundColor: Color(0xFF0E0D0D),
          leading: Image.asset('assets/location.png'),
          title: Row(
            children: [
              Text(
                '목이길어슬픈기린님의 새로운 스팟',
                style: TextStyle(
                    fontSize: 13,
                    color: Colors.white,
                    fontWeight: FontWeight.w700),
              )
            ],
          ),
          actions: [
            Row(
              children: [
                Container(
                  width: 85,
                  height: 30,
                  decoration: BoxDecoration(
                      color: Color(0xFF000000),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Color(0xFF212121))),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 3,
                      ),
                      Image.asset('assets/star.png'),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '323,233',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
                Container(
                  child: Image.asset('assets/bell.png'),
                )
              ],
            )
          ],
        ),
        body: Column(
          children: [
            Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                height: 650,
                child: cardEmpty == false
                    ? CardSwiper(
                        cardsCount: 3,

                        cardBuilder: (context, index, x, y) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              images[index],
                              fit: BoxFit.cover,
                            ),
                          );
                        },

                        // allowedSwipeDirection: AllowedSwipeDirection.only(right: true),

                        // numberOfCardsDisplayed: 4,

                        isLoop: false,

                        onSwipe: (prevoius, current, direction) {
                          currentindex = current!;
                          if (currentindex == 2) {
                            setState(() {
                              cardEmpty = true;
                            });
                          }
                          // if (direction == CardSwiperDirection.right) {
                          //   Fluttertoast.showToast(
                          //       msg: '🔥', backgroundColor: Colors.white, fontSize: 28);
                          // } else if (direction == CardSwiperDirection.left) {
                          //   Fluttertoast.showToast(
                          //       msg: '😖', backgroundColor: Colors.white, fontSize: 28);
                          // }
                          return true;
                        },
                      )
                    : Center(
                        child: Flex(
                          direction: Axis.vertical,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              '추천 드릴 친구들을 준비 중이에요',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 26),
                            ),
                            Text(
                              '매일 새로운 친구들을 소개시켜드려요',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 20),
                            ),
                          ],
                        ),
                      )),
            Expanded(
                child: Container(
              width: MediaQuery.of(context).size.width,
              height: 94,
              child: Image.asset(
                'assets/bottom_bar.png',
                fit: BoxFit.cover,
              ),
            ))
          ],
        ));
  }
}
