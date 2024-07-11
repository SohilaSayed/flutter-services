/// message : "Done"
/// data : [{"_id":"667bfbf84706d8f6e2789c32","fromDate":"2020-01-01T00:00:00.000Z","toDate":"2023-04-01T00:00:00.000Z","fromHour":3,"toHour":5,"slots":4,"serviceAgentId":"667bfa784706d8f6e2789c30","__v":0}]

class AgentCalenderEntity {
  AgentCalenderEntity({
    this.message,
    this.data,});


  String? message;
  List<agentCalender>? data;


}

/// _id : "667bfbf84706d8f6e2789c32"
/// fromDate : "2020-01-01T00:00:00.000Z"
/// toDate : "2023-04-01T00:00:00.000Z"
/// fromHour : 3
/// toHour : 5
/// slots : 4
/// serviceAgentId : "667bfa784706d8f6e2789c30"
/// __v : 0

class agentCalender {
  agentCalender({
    this.id,
    this.fromDate,
    this.toDate,
    this.fromHour,
    this.toHour,
    this.slots,
    this.serviceAgentId,
    this.v,});


  String? id;
  String? fromDate;
  String? toDate;
  int? fromHour;
  int? toHour;
  String? slots;
  String? serviceAgentId;
  int? v;




}