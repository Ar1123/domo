import 'package:bloc/bloc.dart';
import 'package:domo/src/domain/entities/city_entities.dart';
import 'package:domo/src/domain/usecase/use_case_domain.dart';
import 'package:equatable/equatable.dart';

part 'service_event.dart';
part 'service_state.dart';

class ServiceBloc extends Bloc<ServiceEvent, ServiceState> {
  final LocalCityUseCase localCityUseCase;
  final GetImageFromLocalUseCase getImageFromLocalUseCase;

  ServiceBloc({
    required this.localCityUseCase,
    required this.getImageFromLocalUseCase,
  }) : super(ServiceInitial()) {
    on<ServiceEvent>((event, emit) {});
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
}
