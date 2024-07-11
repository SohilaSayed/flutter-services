
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_home_screen/domain/entities/ServiceEntity.dart';
import 'package:flutter_home_screen/domain/entities/agentCalenderEntity.dart';
import 'package:flutter_home_screen/screens/AgentService/cubit/service_states.dart';

import '../../../domain/entities/AgentServiceResponseEntity.dart';
import '../../../domain/useCase/AgentCalender_useCase.dart';
import '../../../domain/useCase/agentServiceById_useCase.dart';
import '../../../domain/useCase/getAgentServices_useCase.dart';
import '../../../domain/useCase/service_useCase.dart';

class ServiceScreenViewModel extends Cubit<ServiceStates> {

  GetAllAgentServiceUseCase agentServiceUseCase;
  SpecificAgentServiceUseCase specificAgentServiceUseCase;
  ServiceUseCase serviceUseCase;
  GetAgentCalenderUseCase agentCalenderUseCase;

  ServiceScreenViewModel({
    required this.agentServiceUseCase,
    required this.specificAgentServiceUseCase,
    required this.serviceUseCase,
    required this.agentCalenderUseCase,
  }) :super(ServiceInitialState());

  List<Service>? agentServiceList;
  List<Service>? serviceProviderPassed;
  List<Services>? servicePassed;
  List<agentCalender>? agentCalenderList;
  Service? selectedService;


  void getAllAgentService(String? id) async {
    emit(ServiceLoadingState(loadingMsg: 'Loading ...'));

    var either = await agentServiceUseCase.invoke(id);
    return either.fold((l) {
      emit(ServiceErrorState(errorMsg: l.errorMsg));
    }, (response) {
      agentServiceList = response.data;
      emit(ServiceSuccessState(serviceEntity: response));
    });
  }


  void getSpecificService(String? id) async {
    emit(ServiceLoadingState(loadingMsg: 'Loading ...'));

    var either = await specificAgentServiceUseCase.invoke(id!);
    return either.fold((l) {
      emit(ServiceErrorState(errorMsg: l.errorMsg));
    }, (response) {
      serviceProviderPassed = response.data;
      emit(ServiceSuccessState(serviceEntity: response));
    });
  }

  void getAllServices(String id) async {
    emit(ServiceLoadingState(loadingMsg: 'Loading ...'));

    var either = await serviceUseCase.invoke(id);
    return either.fold((l) {
      emit(ServiceErrorState(errorMsg: l.errorMsg));
    }, (response) {
      servicePassed = response.services;
      emit(ServicesSuccessState(servicesEntity: response));
    });
  }

  void getAgentCalender(String id) async {
    emit(ServiceLoadingState(loadingMsg: 'Loading ...'));

    var either = await agentCalenderUseCase.invoke(id);
    return either.fold((l) {
      emit(ServiceErrorState(errorMsg: l.errorMsg));
    }, (response) {
      agentCalenderList = response.data;
      print(agentCalenderList?.first.slots);
      emit(CalenderSuccessState(agentCalenderEntity: response));
    });
  }
}