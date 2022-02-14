import 'package:domo/src/presentation/pages/pages.dart';

getRoutes() => {
      'authPhone': (_) => AuthPhonePage(),
      // 'selectUserType': (_) => SelectUserType(),
      'profilePage': (_) => ProfilePage(),
      'listServicePage': (_) => ListServicePage(),
      'homePage': (_) => HomePage(),
      'createService': (_) => CreateServicePage(),
    };
