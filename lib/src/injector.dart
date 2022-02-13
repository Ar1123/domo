import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'presentation/blocs/blocs.dart';

final locator = GetIt.instance;

Future<void> initLocator()async{


/*
.......##.......##.########..##........#######...######...######.
......##.......##..##.....##.##.......##.....##.##....##.##....##
.....##.......##...##.....##.##.......##.....##.##.......##......
....##.......##....########..##.......##.....##.##........######.
...##.......##.....##.....##.##.......##.....##.##.............##
..##.......##......##.....##.##.......##.....##.##....##.##....##
.##.......##.......########..########..#######...######...######.
*/

  locator.registerFactory(() => AuthBloc(
    firebaseAuth: locator(),
  ));
  locator.registerFactory(() => UserBloc());



  
  

  /*
  .......##.......##.########.##.....##.########.########.########..##....##..#######.
  ......##.......##..##........##...##.....##....##.......##.....##.###...##.##.....##
  .....##.......##...##.........##.##......##....##.......##.....##.####..##.##.....##
  ....##.......##....######......###.......##....######...########..##.##.##.##.....##
  ...##.......##.....##.........##.##......##....##.......##...##...##..####.##.....##
  ..##.......##......##........##...##.....##....##.......##....##..##...###.##.....##
  .##.......##.......########.##.....##....##....########.##.....##.##....##..#######.
  */
  final sharedPreferences = await SharedPreferences.getInstance();
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  locator.registerLazySingleton(() => sharedPreferences);
  locator.registerLazySingleton(() => auth);
  locator.registerLazySingleton(() => _messaging);

}