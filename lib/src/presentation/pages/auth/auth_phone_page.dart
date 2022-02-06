import 'package:domo/src/config/style/style.dart';
import 'package:domo/src/core/constant/asset_images.dart';
import 'package:domo/src/core/constant/words.dart';
import 'package:domo/src/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AuthPhonePage extends StatefulWidget {
  const AuthPhonePage({Key? key}) : super(key: key);

  @override
  _AuthPhonePageState createState() => _AuthPhonePageState();
}

class _AuthPhonePageState extends State<AuthPhonePage> {
  final TextEditingController _numberController = TextEditingController();
  @override
  void dispose() {
    _numberController.dispose();
    super.dispose();
  }

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
            SizedBox(
              height: size.height * .07,
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
            ),
            Container(
              margin: EdgeInsets.only(
                top: size.height * .04,
                left: size.width * .06,
                right: size.width * .06,
              ),
              child: InputWidget(
                labeltext: ktextInputLogin,
                onchanged: (e) {},
                textInputFormatter: [],
                textEditingController: _numberController,
                textInputType: TextInputType.number,
              ),
            ),
            SizedBox(
              height: size.height * .07,
            ),
            ButtonWidget(
              backGroundColor: colorText,
              borderColor: colorText,
              textColor: whiteColor,
              text: kbtnLogin,
              action: () {},
            ),
            SizedBox(
              height: size.height * .07,
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: size.width * .1,
              ),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: kLinesTermsOne,
                      style: textStyle(
                        color: colorText,
                        size: size.height * .02,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    TextSpan(
                      text: kLinesTermsTwo,
                      style: textStyle(
                        color: colorText,
                        size: size.height * .02,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: kLinesTermsThree,
                      style: textStyle(
                        color: colorText,
                        size: size.height * .02,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    TextSpan(
                      text: kLinesTermsFour,
                      style: textStyle(
                        color: colorText,
                        size: size.height * .02,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: kLinesTermsFive,
                      style: textStyle(
                        color: colorText,
                        size: size.height * .02,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
