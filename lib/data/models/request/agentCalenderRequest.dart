/// serviceAgentId : "667bfa784706d8f6e2789c30"

class AgentCalenderRequest {
  AgentCalenderRequest({
      this.serviceAgentId,});

  AgentCalenderRequest.fromJson(dynamic json) {
    serviceAgentId = json['serviceAgentId'];
  }
  String? serviceAgentId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['serviceAgentId'] = serviceAgentId;
    return map;
  }

}