import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../config/style/style.dart';
import '../../../../core/constant/asset_images.dart';
import '../../../../core/constant/words.dart';
import '../../../../domain/entities/user_entities.dart';
import '../../../../injector.dart';
import '../../../blocs/blocs.dart';
import '../../../widgets/custom_widget/custom.dart';
import '../../../widgets/widgets.dart';
import 'tabs_profile/persona_data.dart';
import 'tabs_profile/professiona_data.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final userBloc = locator<UserBloc>();

  //Client
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _lastNameController = TextEditingController();

  final TextEditingController _ideNameController = TextEditingController();

  final TextEditingController _phoneController = TextEditingController();
  String _typeIde = "";

  bool loading = false;

  List<String> _ide = [
    'Cédula de ciudadanía',
    'Cédula extranjeria',
  ];
  int? _currentIndex;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: apbar(title: (ktitleProfile), size: size),
        backgroundColor: backGroundColor,
        body: FutureBuilder<UserEntities>(
            future: userBloc.getUser(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data!.typUser == 1) {
                  return _bodyServidor(size: size);
                } else {
                  return _bodyClient(
                    size: size,
                  );
                }
              } else {
                return SizedBox(
                  height: size.height,
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
    );
  }

  Widget _image({required Size size}) => Center(
        child: ClipOval(
          child: Container(
            height: size.height * .14,
            child: CachedNetworkImage(
              imageUrl: '',
              placeholder: (_, __) => Container(
                height: size.height * .02,
                width: size.width * .04,
                color: whiteColor,
                child: Center(child: CircularProgressIndicator()),
              ),
              errorWidget: (_, __, ___) => Image.asset(
                kImageUser,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      );

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
              ProfessionalData(),
            ],
          ),
        ),
      );

  Widget _bodyClient({required Size size}) => Container(
        margin: EdgeInsets.symmetric(
          horizontal: (loading) ? 0 : size.width * .04,
        ),
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: size.height * .04,
                  ),
                  _image(size: size),
                  SizedBox(
                    height: size.height * .01,
                  ),
                  Container(
                    child: Text(
                      'Foto de perfil',
                      style: textStyle(
                        color: colorText,
                        size: size.height * .022,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * .04,
                  ),
                  InputWidget(
                    labeltext: 'Nombre',
                    onchanged: (e) {},
                    textEditingController: _nameController,
                  ),
                  SizedBox(
                    height: size.height * .02,
                  ),
                  InputWidget(
                    labeltext: 'Apellido',
                    onchanged: (e) {},
                    textEditingController: _lastNameController,
                  ),
                  SizedBox(
                    height: size.height * .02,
                  ),
                  CustomContainer(
                    child: ListTile(
                      onTap: () {
                        _showModal(size: size);
                      },
                      title: Text(
                        (_typeIde.isNotEmpty)
                            ? _typeIde
                            : 'Tipo de identificación',
                        style: textStyle(
                          color: colorText,
                          size: size.height * .022,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      trailing: Icon(
                        Icons.add_circle_outline_outlined,
                        color: colorText,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * .02,
                  ),
                  InputWidget(
                    labeltext: 'Identificación',
                    onchanged: (e) {},
                    textEditingController: _ideNameController,
                  ),
                  SizedBox(
                    height: size.height * .02,
                  ),
                  InputWidget(
                    labeltext: 'Número telefónico',
                    onchanged: (e) {},
                    enabled: false,
                    textEditingController: _phoneController,
                  ),
                  SizedBox(
                    height: size.height * .02,
                  ),
                  ButtonWidget(
                    backGroundColor: colorText,
                    borderColor: colorText,
                    textColor: whiteColor,
                    text: 'Guardar',
                    action: () async {
                      loading = true;
                      setState(() {});
                      final update = await userBloc.udateUser(data: {
                        "name": _nameController.text.trim(),
                        "lastName": _lastNameController.text.trim(),
                        "ide": _ideNameController.text.trim(),
                        "typeIde": _typeIde,
                      });

                      if (update) {
                        custonTopSnackbar(
                          context: context,
                          message: "Datos guardados con éxito",
                          type: Types.error,
                        );
                      } else {
                        custonTopSnackbar(
                          context: context,
                          message: "Error al guardar datos",
                          type: Types.error,
                        );
                      }
                      loading = false;
                      setState(() {});
                    },
                  ),
                  SizedBox(
                    height: size.height * .02,
                  ),
                ],
              ),
              (loading)
                  ? Container(
                      height: size.height,
                      color: blackColor.withOpacity(.5),
                      child: Center(child: CircularProgressIndicator()),
                    )
                  : SizedBox()
            ],
          ),
        ),
      );

  void _showModal({required Size size}) => customShowModalBottonSheet(
        context: context,
        child: SizedBox(
          height: size.height * .15,
          child: ListView.builder(
            itemCount: _ide.length,
            itemBuilder: (_, index) => ListTile(
              onTap: () {
                _currentIndex = index;
                _typeIde = _ide[index];
                setState(() {});
                Navigator.pop(context);
              },
              title: Text(_ide[index]),
              leading: (_currentIndex != null && _currentIndex == index)
                  ? Icon(
                      Icons.radio_button_checked_outlined,
                      color: colorText,
                    )
                  : Icon(
                      Icons.radio_button_off_rounded,
                      color: colorText,
                    ),
            ),
          ),
        ),
        header: SizedBox(),
      );
}
