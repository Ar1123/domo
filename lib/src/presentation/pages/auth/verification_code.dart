import 'package:domo/src/config/style/style.dart';
import 'package:domo/src/core/constant/words.dart';
import 'package:domo/src/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerificationCodePage extends StatelessWidget {
  const VerificationCodePage({Key? key, required this.number}) : super(key: key);
  final String number;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: backGroundColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                    left: size.width * .04,
                    top: size.height * .1,
                    right: size.width * .3),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: ktextInfo,
                        style: textStyle(
                          color: colorText,
                          size: size.height * .023,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      TextSpan(
                        text: number,
                        style: textStyle(
                          color: colorText,
                          size: size.height * .023,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  left: size.width * .1,
                  right: size.width * .1,
                  top: size.height * .15,
                ),
                child: PinCodeTextField(
                  appContext: context,
                  pinTheme: PinTheme(
                    activeColor: colorText,
                    inactiveColor: colorText,
                  ),
                  length: 6,
                  onChanged: (String value) {},
                  keyboardType: TextInputType.number,
                ),
              ),
              SizedBox(
                height: size.height * .02,
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '¿No recibiste el código? ',
                      style: textStyle(
                        color: colorText,
                        size: size.height * .02,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    TextSpan(
                      text: 'Reenviar ',
                      style: textStyle(
                        color: colorText,
                        size: size.height * .02,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * .1,
              ),
              ButtonWidget(
                backGroundColor: colorText,
                borderColor: colorText,
                textColor: whiteColor,
                text: 'Verificar',
                action: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
