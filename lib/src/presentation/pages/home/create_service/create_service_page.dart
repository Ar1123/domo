import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../config/style/style.dart';
import '../../../widgets/custom_widget/custom.dart';
import '../../../widgets/widgets.dart';

class CreateServicePage extends StatefulWidget {
  const CreateServicePage({Key? key}) : super(key: key);

  @override
  _CreateServicePageState createState() => _CreateServicePageState();
}

class _CreateServicePageState extends State<CreateServicePage> {
  final TextEditingController _obsController = TextEditingController();

  List<String> _servicios = [
    'Servicio 1',
    'Servicio 2',
    'Servicio 3',
    'Servicio 4',
    'Servicio 5',
    'Servicio 6',
    'Servicio 7',
  ];
  int? _currentIndex;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: backGroundColor,
        appBar: apbar(
          title: "Crear servicio",
          size: size,
          action: () {
            Navigator.pop(context);
          },
        ),
        body: Container(
          margin: EdgeInsets.symmetric(
            horizontal: size.width * .04,
            vertical: size.height * .05,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomContainer(
                  child: ListTile(
                    onTap: () {
                      _selectedServiceCategory(size: size);
                    },
                    horizontalTitleGap: 0,
                    title: Text(
                      'Categoria del servicio',
                      style: textStyle(
                        color: colorText,
                        size: size.height * .023,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    trailing: Icon(
                      Icons.add_circle_outline_sharp,
                      color: colorText,
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * .02,
                ),
                CustomContainer(
                  child: ListTile(
                    horizontalTitleGap: 0,
                    leading: Icon(
                      Icons.search_outlined,
                      color: colorText,
                    ),
                    title: Text(
                      'Ciudad',
                      style: textStyle(
                        color: colorText,
                        size: size.height * .023,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * .02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: size.width * .4,
                      child: CustomContainer(
                        child: ListTile(
                          horizontalTitleGap: 0,
                          title: Text(
                            'Fecha',
                            style: textStyle(
                              color: colorText,
                              size: size.height * .023,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          leading: Icon(
                            Icons.calendar_today_outlined,
                            color: colorText,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: size.width * .4,
                      child: CustomContainer(
                        child: ListTile(
                          horizontalTitleGap: 0,
                          title: Text(
                            'Hora',
                            style: textStyle(
                              color: colorText,
                              size: size.height * .023,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          leading: FaIcon(
                            FontAwesomeIcons.clock,
                            color: colorText,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * .02,
                ),
                InputWidget(
                  labeltext: 'Describe brevemente tu servicio',
                  onchanged: (e) {},
                  lines: 6,
                  textEditingController: _obsController,
                ),
                SizedBox(
                  height: size.height * .02,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Añadir imagenes',
                    style: textStyle(
                      color: colorText,
                      size: size.height * .023,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                Container(
                  width: size.width,
                  height: size.height * .26,
                  child: StaggeredGridView.countBuilder(
                    crossAxisCount: 4,
                    itemCount: 2,
                    itemBuilder: (BuildContext context, int index) => Container(
                        color: Colors.green,
                        child: Center(
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Text('$index'),
                          ),
                        )),
                    staggeredTileBuilder: (int index) =>
                        StaggeredTile.count(2, index.isEven ? 2 : 2),
                    mainAxisSpacing: 4.0,
                    crossAxisSpacing: 4.0,
                  ),
                ),
                SizedBox(
                  height: size.height * .02,
                ),
                ButtonWidget(
                  backGroundColor: colorText,
                  borderColor: colorText,
                  textColor: whiteColor,
                  text: 'Crear',
                  action: () {},
                ),
                SizedBox(
                  height: size.height * .05,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _selectedServiceCategory({required Size size}) =>
      customShowModalBottonSheet(
        context: context,
        child: SizedBox(
          height: size.height * .35,
          child: ListView.builder(
            itemCount: _servicios.length,
            itemBuilder: (_, index) => ListTile(
              onTap: () {
                _currentIndex = index;
                setState(() {
                  Navigator.pop(context);
                });
              },
              leading: (_currentIndex != null && _currentIndex == index)
                  ? Icon(
                      Icons.radio_button_checked_outlined,
                      color: colorText,
                    )
                  : Icon(
                      Icons.radio_button_off_outlined,
                      color: colorText,
                    ),
              title: Text(_servicios[index]),
            ),
          ),
        ),
        header: SizedBox(
          height: size.height * .03,
        ),
      );
}
