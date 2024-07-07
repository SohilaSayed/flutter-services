/// message : "Done"
/// services : [{"_id":"667bfa3d4706d8f6e2789c2e","name":"apartment","code":"ef55","description":"abcd","fees":300,"state":"active","type":"agent","providerId":"667bf6f2353283bdfda57323","createdAt":"2024-06-26T11:23:41.459Z","updatedAt":"2024-06-26T11:23:41.459Z","__v":0},{"_id":"667d6c4c32d804708924a4ba","name":"metro","image":{"public_id":"services/metro/xddoakd09hsbvaqb6vwp","secure_url":"https://res.cloudinary.com/ds5updpqm/image/upload/v1719495755/services/metro/xddoakd09hsbvaqb6vwp.jpg"},"code":"bb5","description":"hbbb","fees":42,"state":"active","type":"agent","providerId":"667bf6f2353283bdfda57323","createdAt":"2024-06-27T13:42:36.837Z","updatedAt":"2024-06-27T13:42:36.837Z","__v":0}]

class ServiceEntity {
  ServiceEntity({
    this.message,
    this.services,});


  String? message;
  List<Services>? services;


}

class Services {
  Services({
      this.id, 
      this.name, 
      this.code, 
      this.description, 
      this.fees, 
      this.state, 
      this.type, 
      this.providerId, 
      this.createdAt, 
      this.updatedAt, 
      this.v,});

  String? id;
  String? name;
  String? code;
  String? description;
  int? fees;
  String? state;
  String? type;
  String? providerId;
  String? createdAt;
  String? updatedAt;
  int? v;



}