import 'package:domo/src/presentation/pages/pages.dart';

getRoutes() => {
      'authPhone': (_) => AuthPhonePage(),
      'verificationCodePage': (_) => VerificationCodePage(),
      'selectUserType': (_) => SelectUserType(),
      'profilePage': (_) => ProfilePage(),
      'listServicePage': (_) => ListServicePage(),
    };
