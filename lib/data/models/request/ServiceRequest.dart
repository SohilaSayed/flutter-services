/// providerId : "667bf6f2353283bdfda57323"

class ServiceRequest {
  ServiceRequest({
      this.providerId,});

  ServiceRequest.fromJson(dynamic json) {
    providerId = json['providerId'];
  }
  String? providerId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['providerId'] = providerId;
    return map;
  }

}