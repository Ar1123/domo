import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../config/style/style.dart';
import 'status_service/status_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  int _currentIndex = 0;
  @override
  void initState() {
    _initTabController();
    super.initState();
  }

  void _initTabController() {
    _tabController = TabController(length: 3, vsync: this);
    _tabController!.addListener(() {});
  }

  @override
  void dispose() {
    super.dispose();
    _tabController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: backGroundColor,
            body: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _tabController,
              children: [
                TabStatusService(),
                Text('2'),
                Text('3'),
              ],
            ),
            bottomNavigationBar: Container(
              color: backGroundColor,
              padding: EdgeInsets.only(
                bottom: 20,
                right: 20,
                left: 20,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(50.0),
                ),
                child: Container(
                  color: Colors.white,
                  child: TabBar(
                    onTap: (index) {
                      if (index == 0) {
                        _currentIndex = index;
                      } else if (index == 1) {
                        log("Añadir");
                        Navigator.pushNamed(context, 'createService');
                      } else if (index == 2) {
                        log("Menu");
                      }

                      _tabController!.animateTo(_currentIndex);
                    },
                    labelColor: Color(0xFFC41A3B),
                    unselectedLabelColor: Colors.red,
                    labelStyle: TextStyle(fontSize: 10.0),
                    indicator: UnderlineTabIndicator(
                      borderSide: BorderSide(color: Colors.black54, width: 0.0),
                    ),
                    //For Indicator Show and Customization
                    indicatorColor: Colors.black54,
                    tabs: <Widget>[
                      Tab(
                        icon: Icon(
                          Icons.home_outlined,
                          size: 24.0,
                          color: colorText,
                        ),
                      ),
                      Tab(
                        icon: Icon(
                          Icons.add_circle_outline_sharp,
                          size: 24.0,
                          color: colorText,
                        ),
                      ),
                      Tab(
                        icon: Icon(
                          Icons.menu,
                          size: 24.0,
                          color: colorText,
                        ),
                      ),
                    ],
                    controller: _tabController,
                  ),
                ),
              ),
            )));
    //   return SafeArea(
    //       child: Scaffold(
    //           body: TabBarView(
    //             controller: _tabController,
    //             children: [
    //               ListServicePage(),
    //               SearchService(),
    //               Center(
    //                   child: Container(
    //                 child: Text('3'),
    //               )),
    //               Center(
    //                   child: Container(
    //                 child: Text('4'),
    //               )),
    //             ],
    //           ),
    //           bottomNavigationBar: Container(
    //               color: backGroundColor,
    //               padding: EdgeInsets.only(
    //                 bottom: 20,
    //                 right: 20,
    //                 left: 20,
    //               ),
    //               child: ClipRRect(
    // borderRadius: BorderRadius.all(
    //   Radius.circular(50.0),
    // ),
    // child: Container(
    //   color: Colors.white,
    //   child: TabBar(
    //     labelColor: Color(0xFFC41A3B),
    //     unselectedLabelColor: Colors.red,
    //     labelStyle: TextStyle(fontSize: 10.0),
    //     indicator: UnderlineTabIndicator(
    //       borderSide:
    //           BorderSide(color: Colors.black54, width: 0.0),
    //     ),
    //     //For Indicator Show and Customization
    //     indicatorColor: Colors.black54,
    //     tabs: <Widget>[
    //       Tab(
    //         icon: Icon(
    //           Icons.home_outlined,
    //           size: 24.0,
    //           color: colorText,
    //         ),
    //       ),
    //       Tab(
    //         icon: Icon(
    //           Icons.search_outlined,
    //           size: 24.0,
    //           color: colorText,
    //         ),
    //       ),
    //       Tab(
    //         icon: Icon(
    //           Icons.monetization_on_outlined,
    //           size: 24.0,
    //           color: colorText,
    //         ),
    //       ),
    //       Tab(
    //         icon: Icon(
    //           Icons.menu,
    //           size: 24.0,
    //           color: colorText,
    //         ),
    //       ),
    //     ],
    //     controller: _tabController,
    //   ),
    //                 ),
    //               ),),),);
  }
}
