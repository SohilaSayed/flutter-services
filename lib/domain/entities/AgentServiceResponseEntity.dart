/// message : "Done"
/// data : [{"_id":"667bfa784706d8f6e2789c30","agentEnglishName":"usef","agentArabicName":"يوسف","serviceId":"667bfa3d4706d8f6e2789c2e","serviceAgentfees":50,"state":"active","isVisible":true,"hasCalendar":true,"__v":0},{"_id":"667df44f964923a8a39d734b","agentEnglishName":"ahmed","agentArabicName":"يوسف","serviceId":"667bfa3d4706d8f6e2789c2e","serviceAgentfees":50,"state":"active","isVisible":true,"hasCalendar":true,"__v":0}]

class ServiceResponseEntity {
  ServiceResponseEntity({
      this.message, 
      this.data,});


  String? message;
  List<Service>? data;



}

class Service {
  Service({
      this.id, 
      this.agentEnglishName, 
      this.agentArabicName, 
      this.serviceId, 
      this.serviceAgentfees, 
      this.state, 
      this.isVisible, 
      this.hasCalendar, 
      this.v,});


  String? id;
  String? agentEnglishName;
  String? agentArabicName;
  String? serviceId;
  int? serviceAgentfees;
  String? state;
  bool? isVisible;
  bool? hasCalendar;
  int? v;


}