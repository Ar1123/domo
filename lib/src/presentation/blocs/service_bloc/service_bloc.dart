import 'dart:developer';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:domo/src/domain/usecase/service_use_case.dart';
import 'package:equatable/equatable.dart';

import '../../../core/constant/asset_images.dart';
import '../../../domain/entities/city_entities.dart';
import '../../../domain/usecase/use_case_domain.dart';

part 'service_event.dart';
part 'service_state.dart';

class ServiceBloc extends Bloc<ServiceEvent, ServiceState> {
  final LocalCityUseCase localCityUseCase;
  final GetImageFromLocalUseCase getImageFromLocalUseCase;
  final SharedPrefencesUseCase sharedPrefencesUseCase;
  final ServiceUseCase serviceUseCase;

  ServiceBloc({
    required this.localCityUseCase,
    required this.getImageFromLocalUseCase,
    required this.sharedPrefencesUseCase,
    required this.serviceUseCase,
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

  void _onGetImageFromLocal(
      OnEventGetImageFromLocal event, Emitter emitter) async {
        // await sharedPrefencesUseCase.clearPreferences("img");
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
    final createService =
        await serviceUseCase.createService(data: data, file: file);
    createService.fold((l) => {}, (r) {
      status = r;
    });
    await sharedPrefencesUseCase.clearPreferences("img");

    return status;
  }
}
