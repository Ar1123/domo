import 'package:domo/src/config/style/style.dart';
import 'package:domo/src/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class PersonalData extends StatefulWidget {
  PersonalData({Key? key}) : super(key: key);

  @override
  _PersonalDataState createState() => _PersonalDataState();
}

class _PersonalDataState extends State<PersonalData> {
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _lastNameController = TextEditingController();

  final TextEditingController _biographyController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _lastNameController.dispose();
    _biographyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backGroundColor,
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(
              top: size.height * .06,
              left: size.width * .06,
              right: size.width * .06,
            ),
            child: InputWidget(
              labeltext: 'Nombres',
              onchanged: (e) {},
              textEditingController: _nameController,
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: size.height * .01,
              left: size.width * .06,
              right: size.width * .06,
            ),
            child: InputWidget(
              labeltext: 'Apellidos',
              onchanged: (e) {},
              textEditingController: _lastNameController,
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(
              top: size.height * .01,
              left: size.width * .06,
              right: size.width * .06,
            ),
            child: Text(
              'Biografia',
              style: textStyle(
                  color: colorText,
                  size: size.height * .02,
                  fontWeight: FontWeight.normal),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: size.height * .01,
              left: size.width * .06,
              right: size.width * .06,
            ),
            child: InputWidget(
              labeltext: 'Describete brevemente...',
              onchanged: (e) {},
              lines: 5,
              textEditingController: _biographyController,
            ),
          ),
            Container(
            margin: EdgeInsets.only(
              top: size.height * .01,
              left: size.width * .06,
              right: size.width * .06,
            ),
            child: InputWidget(
              enabled: false,
              labeltext: 'Número teléfonico',
              
              onchanged: (e) {},
              textEditingController: _lastNameController,
            ),
          ),
          SizedBox(
            height: size.height * .04,
          ),
          ButtonWidget(
            action: () {},
            backGroundColor: colorText,
            borderColor: colorText,
            text: 'Guardar',
            textColor: whiteColor,
          )
        ],
      ),
    );
  }
}
