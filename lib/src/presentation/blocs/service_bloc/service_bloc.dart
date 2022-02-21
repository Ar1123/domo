import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../core/constant/asset_images.dart';
import '../../../domain/entities/category_service_entities.dart';
import '../../../domain/entities/city_entities.dart';
import '../../../domain/entities/offer_entities.dart';
import '../../../domain/entities/service_entities.dart';
import '../../../domain/usecase/use_case_domain.dart';
import '../blocs.dart';

part 'service_event.dart';
part 'service_state.dart';

class ServiceBloc extends Bloc<ServiceEvent, ServiceState> {
  final LocalCityUseCase localCityUseCase;
  final GetImageFromLocalUseCase getImageFromLocalUseCase;
  final SharedPrefencesUseCase sharedPrefencesUseCase;
  final ServiceUseCase serviceUseCase;
  final UserBloc userBloc;
  final CategoryServiceUseCase categoryServiceUseCase;
  final OfferUsecase offerUsecase;
  final NotificationUseCase notificationUseCase;
  final ServerUseCase serverUseCase;
  ServiceBloc({
    required this.localCityUseCase,
    required this.getImageFromLocalUseCase,
    required this.sharedPrefencesUseCase,
    required this.serviceUseCase,
    required this.offerUsecase,
    required this.userBloc,
    required this.categoryServiceUseCase,
    required this.serverUseCase,
    required this.notificationUseCase,
  }) : super(ServiceInitial()) {
    on<ServiceEvent>((event, emit) {});
    on<OnEventGetImageFromLocal>(_onGetImageFromLocal);
  }

  Future<List<CityEntities>> getCity({required String city}) async {
    List<CityEntities> list = [];
    final result = await localCityUseCase.getById(data: {
      "city": city,
    });
    result.fold((l) {}, (r) {
      list = r;
    });
    return list;
  }

  void clear()async{
    await sharedPrefencesUseCase.clearPreferences("img");

  }

  void _onGetImageFromLocal(
      OnEventGetImageFromLocal event, Emitter emitter) async {
    if (event.type == 1) {
      List<String> temp = [];
      final result = await getImageFromLocalUseCase.getimageFromLocal(type: 1);
      if (result.isNotEmpty) {
        List<String> imagesCache = [];
        final resultImages =
            await sharedPrefencesUseCase.getKeyListString(key: "img");
        resultImages.fold((l) {}, (r) {
          r.forEach((element) {
            imagesCache.add(element);
          });
        });

        if (imagesCache.length < 2) {
          imagesCache.forEach((element) {
            temp.add(element);
          });
          temp.add(result);
          await sharedPrefencesUseCase.setKeyListString(
              key: "img", value: temp);
          if (imagesCache.length < 1) {
            temp.add(kAddImageService);
          }
        }

        emitter(ShowImageFromLocal(
          path: temp,
        ));
        emitter(NextStateC());
      } else {
        emitter(ErrorStateC());
        emitter(NextStateC());
      }
    } else {
      List<String> temp = [];
      final result = await getImageFromLocalUseCase.getimageFromLocal(type: 2);
      if (result.isNotEmpty) {
        List<String> imagesCache = [];
        final resultImages =
            await sharedPrefencesUseCase.getKeyListString(key: "img");
        resultImages.fold((l) {}, (r) {
          r.forEach((element) {
            imagesCache.add(element);
          });
        });

        if (imagesCache.length < 2) {
          imagesCache.forEach((element) {
            temp.add(element);
          });
          temp.add(result);
          await sharedPrefencesUseCase.setKeyListString(
              key: "img", value: temp);
          if (imagesCache.length < 1) {
            temp.add(kAddImageService);
          }
          log("${temp.length}");
        }

        emitter(ShowImageFromLocal(
          path: temp,
        ));
        emitter(NextStateC());
      } else {
        emitter(ErrorStateC());
        emitter(NextStateC());
      }
    }
  }

  Future<bool> createService(
      {required Map<String, dynamic> data, required List<String> file}) async {
    bool status = false;
    final String idService = DateTime.now().millisecondsSinceEpoch.toString() +
        "" +
        DateTime.now().year.toString() +
        "" +
        DateTime.now().day.toString();

    final serviceData = {
      "uid": await userBloc.getIdUser(),
      "id": idService,
      "city": data['city'],
      "category": data['category'],
      "dep": data['dep'],
      "hour": data['hour'],
      "date": data['date'],
      "dir": data['dir'],
      "number": data['number'],
      "street": data['street'],
      "description": data['description'],
      "status": true,
      "finalizada": false,
    };
    final createService =
        await serviceUseCase.createService(data: serviceData, file: file);
    createService.fold((l) => {}, (r) {
      status = r;
    });
    await sharedPrefencesUseCase.clearPreferences("img");

    serverUseCase
        .getserver(category: data['category'], city: data['city'])
        .then((value) {
      value.fold((l) {}, (r) {
        log("${r.length}");
        r.forEach((element) async {
          final token = await userBloc.getToken(id: element);
          await notificationUseCase.sendNotification(
              message:
                  "Se ha creado una nueva solictud de servicio en una de tus areas, ven y observala",
              token: token,
              title: "Hola!!!");
        });
      });
    });

    return status;
  }
 
  Future<List<ServiceEntities>> getServicesByUser() async {
    List<ServiceEntities> list = [];
    final getService =
        await serviceUseCase.getServiceById(id: await userBloc.getIdUser());
    getService.fold((l) {}, (r) {
      list = r;
    });

    return list;
  }

  Future<List<CategoryServiceEntities>> getCategoryService() async {
    List<CategoryServiceEntities> list = [];

    final result = await categoryServiceUseCase.getCategoryservice();
    result.fold((l) {}, (r) {
      list = r;
    });
    return list;
  }

  /*
  .......##.......##..#######..########.########.########.########...######.
  ......##.......##..##.....##.##.......##.......##.......##.....##.##....##
  .....##.......##...##.....##.##.......##.......##.......##.....##.##......
  ....##.......##....##.....##.######...######...######...########...######.
  ...##.......##.....##.....##.##.......##.......##.......##...##.........##
  ..##.......##......##.....##.##.......##.......##.......##....##..##....##
  .##.......##........#######..##.......##.......########.##.....##..######.
  */

  Future<List<OfferEntities>> getOffer() async {
    List<OfferEntities> offer = [];
    final id = await userBloc.getIdUser();
    final result = await offerUsecase.getOffer(id: id);

    result.fold((l) {}, (r) {
      offer = r;
    });
    return offer;
  }

  Future<List<OfferEntities>> getOfferInProgress() async {
    List<OfferEntities> offer = [];
    final id = await userBloc.getIdUser();
    final result = await offerUsecase.getOfferInProgress(id: id);

    result.fold((l) {}, (r) {
      offer = r;
    });
    return offer;
  }

  Future<int> getOfferAmmount({required String idService}) async {
    int ammount = 0;
    final id = await userBloc.getIdUser();

    final result =
        await offerUsecase.offerAmmount(idService: idService, id: id);
    result.fold((l) {}, (r) {
      ammount = r;
    });
    return ammount;
  }

  Future<List<OfferEntities>> getOfferById({required String idService}) async {
    List<OfferEntities> list = [];
    final id = await userBloc.getIdUser();
    final result = await offerUsecase.offerById(idService: idService, id: id);
    result.fold((l) {}, (r) {
      list = r;
    });
    return list;
  }

  Future<bool> offerAceppt(
      {required String owner,
      required String idService,
      required List<OfferEntities> offer}) async {
    await offerUsecase.udpateOffer(data: {
      "acept": true,
      "status": false,
    }, id: idService);

    await serviceUseCase.updateData(data: {
      "status": false,
    }, id: offer[0].idService!);
    offer.forEach((element) {
      if ((idService != element.idOffer)) {
        offerUsecase.udpateOffer(data: {
          "acept": false,
          "status": false,
        }, id: element.idOffer!).then((value) {});
        log("${element.idOffer} - ${element.idService}", name: "2");
      }
    });

    return true;
  }
}
