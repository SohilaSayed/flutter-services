import 'package:flutter_home_screen/domain/entities/AgentServiceResponseEntity.dart';

/// message : "Done"
/// data : [{"_id":"667bfa784706d8f6e2789c30","agentEnglishName":"usef","agentArabicName":"يوسف","serviceId":"667bfa3d4706d8f6e2789c2e","serviceAgentfees":50,"state":"active","isVisible":true,"hasCalendar":true,"__v":0},{"_id":"667df44f964923a8a39d734b","agentEnglishName":"ahmed","agentArabicName":"يوسف","serviceId":"667bfa3d4706d8f6e2789c2e","serviceAgentfees":50,"state":"active","isVisible":true,"hasCalendar":true,"__v":0}]

class ServiceResponse extends ServiceResponseEntity {
  ServiceResponse({
    super.message,
    super.data,});

  ServiceResponse.fromJson(dynamic json) {
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(ServiceDTO.fromJson(v));
      });
    }
  }
  // Map<String, dynamic> toJson() {
  //   final map = <String, dynamic>{};
  //   map['message'] = message;
  //   if (data != null) {
  //     map['data'] = data?.map((v) => v.toJson()).toList();
  //   }
  //   return map;
  // }

}

class ServiceDTO extends Service {
  ServiceDTO({
    super.id,
    super.agentEnglishName,
    super.agentArabicName,
    super.serviceId,
    super.serviceAgentfees,
    super.state,
    super.isVisible,
    super.hasCalendar,
    super.v,});

  ServiceDTO.fromJson(dynamic json) {
    id = json['_id'];
    agentEnglishName = json['agentEnglishName'];
    agentArabicName = json['agentArabicName'];
    serviceId = json['serviceId'];
    serviceAgentfees = json['serviceAgentfees'];
    state = json['state'];
    isVisible = json['isVisible'];
    hasCalendar = json['hasCalendar'];
    v = json['__v'];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['agentEnglishName'] = agentEnglishName;
    map['agentArabicName'] = agentArabicName;
    map['serviceId'] = serviceId;
    map['serviceAgentfees'] = serviceAgentfees;
    map['state'] = state;
    map['isVisible'] = isVisible;
    map['hasCalendar'] = hasCalendar;
    map['__v'] = v;
    return map;
  }

}