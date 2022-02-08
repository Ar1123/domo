import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../config/style/style.dart';
import '../../../widgets/widgets.dart';

class ListServicePage extends StatefulWidget {
  const ListServicePage({Key? key}) : super(key: key);

  @override
  _ListServicePageState createState() => _ListServicePageState();
}

class _ListServicePageState extends State<ListServicePage> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: backGroundColor,
        body: Column(
          children: [
            Container(
              height: size.height * .2,
              margin: EdgeInsets.only(top: size.height * .05),
              child: CarouselSlider(
                  items: [
                    _container(size: size, color: Colors.pink),
                    _container(size: size, color: Colors.red),
                    _container(size: size, color: Colors.orange),
                    _container(size: size, color: Colors.blue),
                    _container(size: size, color: Colors.black),
                  ],
                  options: CarouselOptions(
                      height: 400,
                      aspectRatio: 16 / 9,
                      viewportFraction: 0.4,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: Duration(
                        seconds: 15,
                      ),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      scrollDirection: Axis.horizontal,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _current = index;
                        });
                      })),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [1, 1, 1, 1, 1].asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => _controller.animateToPage(entry.key),
                  child: Container(
                    width: 12.0,
                    height: 12.0,
                    margin:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: (Theme.of(context).brightness == Brightness.dark
                                ? Colors.white
                                : colorText)
                            .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                  ),
                );
              }).toList(),
            ),
            Expanded(
              child: Container(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: size.height * .03,
                      ),
                      SizedBox(
                        height: size.height * .1,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 4,
                          itemBuilder: (context, index) => Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: size.width * .02),
                              child: Chip(
                                backgroundColor: colorText,
                                label: Text(
                                  'chip',
                                  style: textStyle(
                                    color: whiteColor,
                                    size: size.height * .02,
                                  ),
                                ),
                              )),
                        ),
                      ),
                      Carwidget(
                        ciudad: 'Montería',
                        fecha: '12/Feb/2022',
                        hora: '8:45 AM',
                      ),
                      SizedBox(
                        height: size.height * .02,
                      ),
                      Carwidget(
                        ciudad: 'Montería',
                        fecha: '12/Feb/2022',
                        hora: '8:45 AM',
                      ),
                      SizedBox(
                        height: size.height * .02,
                      ),
                      Carwidget(
                        ciudad: 'Montería',
                        fecha: '12/Feb/2022',
                        hora: '8:45 AM',
                      ),
                      SizedBox(
                        height: size.height * .02,
                      ),
                      Carwidget(
                        ciudad: 'Montería',
                        fecha: '12/Feb/2022',
                        hora: '8:45 AM',
                      ),
                      SizedBox(
                        height: size.height * .02,
                      ),
                      Carwidget(
                        ciudad: 'Montería',
                        fecha: '12/Feb/2022',
                        hora: '8:45 AM',
                      ),
                      SizedBox(
                        height: size.height * .02,
                      ),
                      Carwidget(
                        ciudad: 'Montería',
                        fecha: '12/Feb/2022',
                        hora: '8:45 AM',
                      ),
                      SizedBox(
                        height: size.height * .02,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _container({required Size size, required Color color}) => Container(
        height: size.height * .15,
        width: size.width,
        color: color,
      );
}
