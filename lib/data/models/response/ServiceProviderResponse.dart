import '../../../domain/entities/ServiceProviderEntity.dart';

/// message : "Done"
/// data : [{"_id":"667bf6f2353283bdfda57323","spEnglishName":"Hospital","spArabicName":"مستشفي","active":true,"categoryId":"667bf609353283bdfda57321","__v":0}]

class ServiceProviderResponse extends ServiceProviderEntity {
  ServiceProviderResponse({
    super.message,
    super.data,});

  ServiceProviderResponse.fromJson(dynamic json) {
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(ProviderDTO.fromJson(v));
      });
    }
  }
}

/// _id : "667bf6f2353283bdfda57323"
/// spEnglishName : "Hospital"
/// spArabicName : "مستشفي"
/// active : true
/// categoryId : "667bf609353283bdfda57321"
/// __v : 0

class ProviderDTO extends Provider {
  ProviderDTO({
    super.id,
    super.spEnglishName,
    super.spArabicName,
  super.active,
  super.categoryId,
  super.v,});

  ProviderDTO.fromJson(dynamic json) {
    id = json['_id'];
    spEnglishName = json['spEnglishName'];
    spArabicName = json['spArabicName'];
    active = json['active'];
    categoryId = json['categoryId'];
    v = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['spEnglishName'] = spEnglishName;
    map['spArabicName'] = spArabicName;
    map['active'] = active;
    map['categoryId'] = categoryId;
    map['__v'] = v;
    return map;
  }

}