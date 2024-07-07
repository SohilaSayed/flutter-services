
import 'package:flutter_home_screen/domain/entities/agentCalenderEntity.dart';

import '../../../domain/entities/AgentServiceResponseEntity.dart';
import '../../../domain/entities/ServiceEntity.dart';

abstract class ServiceStates{}

class ServiceInitialState extends ServiceStates{}

class ServiceLoadingState extends ServiceStates{
  String? loadingMsg;
  ServiceLoadingState({required this.loadingMsg});
}

class ServiceErrorState extends ServiceStates{
  String? errorMsg;
  ServiceErrorState({required this.errorMsg});
}



class ServiceSuccessState extends ServiceStates{
  //response - list of services
  ServiceResponseEntity serviceEntity;
  ServiceSuccessState({required this.serviceEntity});
}

class ServicesSuccessState extends ServiceStates{
  //response - list of services
  ServiceEntity servicesEntity;
  ServicesSuccessState({required this.servicesEntity});
}
class CalenderSuccessState extends ServiceStates{
  //response - list of services
  AgentCalenderEntity agentCalenderEntity;
  CalenderSuccessState({required this.agentCalenderEntity});
}


// class ServiceDetailsSuccessState extends HomeTabStates{
//   //response - list of services
//   ServiceByIdEntity serviceEntity;
//   ServiceDetailsSuccessState({required this.serviceEntity});
// }
