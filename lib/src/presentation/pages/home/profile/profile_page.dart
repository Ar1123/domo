import 'package:domo/src/config/style/style.dart';
import 'package:domo/src/core/constant/words.dart';
import 'package:domo/src/presentation/pages/home/profile/tabs_profile/persona_data.dart';
import 'package:domo/src/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: apbar(title: (ktitleProfile), size: size),
        backgroundColor: backGroundColor,
        body: SingleChildScrollView(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: size.height * .2,
                  width: size.width,
                  alignment: Alignment.center,
                  child: Container(
                    height: size.height * .35,
                    width: size.width * .35,
                    decoration: BoxDecoration(
                      color: whiteColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Container(
                  width: size.width,
                  height: size.height * .8,
                  child: _bodyServidor(size: size),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _bodyServidor({required Size size}) => DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: backGroundColor,
          appBar: PreferredSize(
            preferredSize: Size(double.infinity, 60),
            child: TabBar(
              labelStyle: textStyle(
                color: colorText,
                size: size.height * .02,
              ),
              indicatorColor: colorText,
              labelColor: colorText,
              tabs: [
                Text(ktabOne),
                Text(ktabTwo),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              PersonalData(),
              Text('2'),
            ],
          ),
        ),
      );
}
