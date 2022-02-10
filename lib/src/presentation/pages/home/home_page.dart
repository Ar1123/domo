import 'package:domo/src/config/style/style.dart';
import 'package:flutter/material.dart';

import '../pages.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
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
            body: TabBarView(
              controller: _tabController,
              children: [
                ListServicePage(),
                SearchService(),
                Center(
                    child: Container(
                  child: Text('3'),
                )),
                Center(
                    child: Container(
                  child: Text('4'),
                )),
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
                      labelColor: Color(0xFFC41A3B),
                      unselectedLabelColor: Colors.red,
                      labelStyle: TextStyle(fontSize: 10.0),
                      indicator: UnderlineTabIndicator(
                        borderSide:
                            BorderSide(color: Colors.black54, width: 0.0),
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
                            Icons.search_outlined,
                            size: 24.0,
                            color: colorText,
                          ),
                        ),
                        Tab(
                          icon: Icon(
                            Icons.monetization_on_outlined,
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
                ),),),);
  }
}
