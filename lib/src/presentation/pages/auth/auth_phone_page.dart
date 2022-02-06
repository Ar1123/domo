import 'package:domo/src/config/style/style.dart';
import 'package:domo/src/core/constant/asset_images.dart';
import 'package:domo/src/core/constant/words.dart';
import 'package:flutter/material.dart';

class AuthPhonePage extends StatelessWidget {
  const AuthPhonePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      backgroundColor: backGroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height * .05,
            ),
            SizedBox(
              width: size.width,
              height: size.height * .2,
              child: Image(
                image: AssetImage(kImageLogo),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                ktextLogin,
                textAlign: TextAlign.center,
                style: textStyle(
                  color: colorText,
                  size: size.height * .03,
                  fontWeight: FontWeight.normal,
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
