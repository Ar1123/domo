import 'package:domo/src/presentation/pages/pages.dart';

getRoutes() => {
      'authPhone': (_) => AuthPhonePage(),
      // 'selectUserType': (_) => SelectUserType(),
      'profilePage': (_) => ProfilePage(),
      'homePage': (_) => HomePage(),
      'createService': (_) => CreateServicePage(),
      'detailService': (_) => DetailService(),
      'offertDetail': (_) => OffertDetail(),
    };
