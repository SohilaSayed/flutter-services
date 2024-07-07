/// serviceId : "667bfa3d4706d8f6e2789c2e"

class ServiceAgentRequest {
  ServiceAgentRequest({
      this.serviceId,});

  ServiceAgentRequest.fromJson(dynamic json) {
    serviceId = json['serviceId'];
  }
  String? serviceId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['serviceId'] = serviceId;
    return map;
  }

}