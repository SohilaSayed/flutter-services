import '../../../domain/entities/agentCalenderEntity.dart';

/// message : "Done"
/// data : [{"_id":"667bfbf84706d8f6e2789c32","fromDate":"2020-01-01T00:00:00.000Z","toDate":"2023-04-01T00:00:00.000Z","fromHour":3,"toHour":5,"slots":4,"serviceAgentId":"667bfa784706d8f6e2789c30","__v":0}]

class AgentCalenderResponse extends AgentCalenderEntity {
  AgentCalenderResponse({
      super.message, 
      super.data,});

  AgentCalenderResponse.fromJson(dynamic json) {
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(agentCalenderDTO.fromJson(v));
      });
    }
  }


}

/// _id : "667bfbf84706d8f6e2789c32"
/// fromDate : "2020-01-01T00:00:00.000Z"
/// toDate : "2023-04-01T00:00:00.000Z"
/// fromHour : 3
/// toHour : 5
/// slots : 4
/// serviceAgentId : "667bfa784706d8f6e2789c30"
/// __v : 0

class agentCalenderDTO extends agentCalender {
  agentCalenderDTO({
      super.id, 
      super.fromDate, 
      super.toDate, 
      super.fromHour, 
      super.toHour, 
      super.slots, 
      super.serviceAgentId, 
      super.v,});

  agentCalenderDTO.fromJson(dynamic json) {
    id = json['_id'];
    fromDate = json['fromDate'];
    toDate = json['toDate'];
    fromHour = json['fromHour'];
    toHour = json['toHour'];
    slots = json['slots'];
    serviceAgentId = json['serviceAgentId'];
    v = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['fromDate'] = fromDate;
    map['toDate'] = toDate;
    map['fromHour'] = fromHour;
    map['toHour'] = toHour;
    map['slots'] = slots;
    map['serviceAgentId'] = serviceAgentId;
    map['__v'] = v;
    return map;
  }

}