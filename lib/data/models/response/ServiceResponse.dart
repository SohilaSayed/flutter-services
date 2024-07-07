import 'package:flutter_home_screen/domain/entities/ServiceEntity.dart';

/// message : "Done"
/// services : [{"_id":"667bfa3d4706d8f6e2789c2e","name":"apartment","code":"ef55","description":"abcd","fees":300,"state":"active","type":"agent","providerId":"667bf6f2353283bdfda57323","createdAt":"2024-06-26T11:23:41.459Z","updatedAt":"2024-06-26T11:23:41.459Z","__v":0},{"_id":"667d6c4c32d804708924a4ba","name":"metro","image":{"public_id":"services/metro/xddoakd09hsbvaqb6vwp","secure_url":"https://res.cloudinary.com/ds5updpqm/image/upload/v1719495755/services/metro/xddoakd09hsbvaqb6vwp.jpg"},"code":"bb5","description":"hbbb","fees":42,"state":"active","type":"agent","providerId":"667bf6f2353283bdfda57323","createdAt":"2024-06-27T13:42:36.837Z","updatedAt":"2024-06-27T13:42:36.837Z","__v":0}]

class ServicesResponse extends ServiceEntity {
  ServicesResponse({
      super.message,
      super.services,});

  ServicesResponse.fromJson(dynamic json) {
    message = json['message'];
    if (json['services'] != null) {
      services = [];
      json['services'].forEach((v) {
        services?.add(ServicesDTO.fromJson(v));
      });
    }
  }

  // Map<String, dynamic> toJson() {
  //   final map = <String, dynamic>{};
  //   map['message'] = message;
  //   if (services != null) {
  //     map['services'] = services?.map((v) => v.toJson()).toList();
  //   }
  //   return map;
  // }

}

/// _id : "667bfa3d4706d8f6e2789c2e"
/// name : "apartment"
/// code : "ef55"
/// description : "abcd"
/// fees : 300
/// state : "active"
/// type : "agent"
/// providerId : "667bf6f2353283bdfda57323"
/// createdAt : "2024-06-26T11:23:41.459Z"
/// updatedAt : "2024-06-26T11:23:41.459Z"
/// __v : 0

class ServicesDTO extends Services {
  ServicesDTO({
    super.id,
    super.name,
    super.code,
    super.description,
    super.fees,
    super.state,
    super.type,
    super.providerId,
    super.createdAt,
    super.updatedAt,
    super.v,});

  ServicesDTO.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    code = json['code'];
    description = json['description'];
    fees = json['fees'];
    state = json['state'];
    type = json['type'];
    providerId = json['providerId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['code'] = code;
    map['description'] = description;
    map['fees'] = fees;
    map['state'] = state;
    map['type'] = type;
    map['providerId'] = providerId;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    return map;
  }

}