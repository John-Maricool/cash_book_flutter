import 'package:cash_book/utils/constants/constants.dart';
import 'package:cash_book/utils/constants/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/global_widgets/global_widgets.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  _SwipeableWidgetExampleState createState() => _SwipeableWidgetExampleState();
}

class _SwipeableWidgetExampleState extends State<IntroScreen> {
  final PageController _pageController = PageController();

  int _currentPage = 0;
  num _pageOffset = 0;
  String initialText = "Next";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding:
                const EdgeInsets.only(right: 20, top: 40, bottom: 60, left: 20),
            color: backgroundColor,
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: () {
                      //  Get.offNamed(USER_TYPE);
                    },
                    child: Image.asset('assets/images/app_bg_green.png',
                        width: 120, height: 40),
                  ),
                ),
                const Padding(padding: EdgeInsets.only(top: 10)),
                Expanded(
                  child: PageView(
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                        if (_currentPage == 2) {
                          initialText = "Get Started";
                        } else {
                          initialText = "Next";
                        }
                      });
                    },
                    controller: _pageController
                      ..addListener(() {
                        setState(() {
                          _pageOffset = (_pageController.page ??
                                  _pageController.initialPage) -
                              _currentPage;
                        });
                      }),
                    children: <Widget>[
                      firstOption(context),
                      secondOption(context),
                      thirdOption(context),
                    ],
                  ),
                ),
                Container(
                    height: 40,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(3, (index) {
                          return AnimatedContainer(
                            duration: Duration(milliseconds: 200),
                            width: 8,
                            height: 8,
                            margin: EdgeInsets.symmetric(horizontal: 5),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _currentPage == index
                                  ? primaryColor
                                  : _pageOffset > index && _pageOffset < index
                                      ? primaryColor
                                      : Colors.grey.withOpacity(0.7),
                            ),
                          );
                        }))),
                defaultButtons(
                    pressed: () {
                      if (_currentPage == 2) {
                        Get.offAllNamed(INPUT_NUMBER_PAGE);
                      } else {
                        if (_currentPage == 1) {
                          setState(() {
                            initialText = "Get Started";
                          });
                        }
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.ease,
                        );
                      }
                    },
                    text: initialText)
              ],
            )));
  }

  Widget firstOption(BuildContext context) {
    return Column(children: [
      Image.asset(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.5,
        'assets/on_boarding/on_boarding1.png',
      ),
      const Padding(padding: EdgeInsets.only(top: 20)),
      const Text(
        "Record and Track Expenses",
        style: TextStyle(color: primaryColor, fontSize: 20),
        textAlign: TextAlign.center,
      ),
      const Padding(padding: EdgeInsets.only(top: 15)),
      const Text(
        "Record and Track all your expenses in real time",
        style: TextStyle(color: blackColor, fontSize: 15),
        textAlign: TextAlign.center,
      ),
    ]);
  }

  Widget secondOption(BuildContext context) {
    return Column(children: [
      Image.asset(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.5,
        'assets/on_boarding/on_boarding2.png',
      ),
      const Text(
        "Create and Manage Cashbook",
        style: TextStyle(
            color: primaryColor,
            overflow: TextOverflow.fade,
            fontSize: 20,
            fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
      const Padding(padding: EdgeInsets.only(top: 20)),
      const Text(
        "Create and Manage personal and business accounts, to track expenses and income separately",
        style: TextStyle(color: Colors.black, fontSize: 15),
        textAlign: TextAlign.center,
      )
    ]);
  }

  Widget thirdOption(BuildContext context) {
    return Column(children: [
      Image.asset(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.5,
        'assets/on_boarding/on_boarding3.png',
      ),
      const Text(
        "Offline and Online Sync",
        style: TextStyle(
            color: primaryColor, fontSize: 20, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
      const Padding(padding: EdgeInsets.only(top: 20)),
      const Text(
        "Access and use the cash book app offline, with data syncing automatically once an internet connection is available.",
        style: TextStyle(color: blackColor, fontSize: 15),
        textAlign: TextAlign.center,
      )
    ]);
  }
}
