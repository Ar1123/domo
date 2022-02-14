import 'package:domo/src/config/style/style.dart';
import 'package:flutter/material.dart';

import 'tabs/progress_service.dart';

class TabStatusService extends StatefulWidget {
  const TabStatusService({Key? key}) : super(key: key);

  @override
  State<TabStatusService> createState() => _TabStatusServiceState();
}

class _TabStatusServiceState extends State<TabStatusService>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          backgroundColor: backGroundColor,
          appBar: PreferredSize(
            preferredSize: Size(
              size.width * 1,
              size.height * .15,
            ),
            child: AppBar(
              
              backgroundColor: backGroundColor,
              bottom: TabBar(
                controller: _tabController,
                
                isScrollable: true,
                padding: const EdgeInsets.symmetric(
                  horizontal: 5,
                ),
                labelColor: colorText,
                labelPadding: EdgeInsets.all(size.width * .012),
                labelStyle: textStyle(
                  color: colorText,
                  size: size.height * .018,
                ),
                indicatorColor: colorText,
                unselectedLabelColor: blackColor,
                tabs: [
                  _item(
                    'Publicadas',
                    size,
                    const Icon(
                      Icons.public,
                    ),
                  ),
                  _item(
                    'Ofertas',
                    size,
                    const Icon(
                      Icons.monetization_on_outlined,
                    ),
                  ),
                  _item(
                    'En progreso',
                    size,
                    const Icon(
                      Icons.history,
                    ),
                  ),
                  _item(
                    'Finalizdas',
                    size,
                    const Icon(
                      Icons.check,
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: TabBarView(
            controller: _tabController,
            children: [
              ProgressService(),
              Text('2'),
              Text('3'),
              Text('4'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _item(
    String text,
    Size size,
    Widget icon,
  ) =>
      Column(
        children: [
          Container(
            width: size.width * .26,
            height: size.height * .07,
            child: icon,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: blueColorTwo,
              border: Border.all(
                color: colorText,
              ),
              shape: BoxShape.circle,
            ),
          ),
          Text(text)
        ],
      );
}
