/// message : "Done"
/// data : [{"_id":"667bf6f2353283bdfda57323","spEnglishName":"Hospital","spArabicName":"مستشفي","active":true,"categoryId":"667bf609353283bdfda57321","__v":0}]

class ServiceProviderEntity {
  ServiceProviderEntity({
      this.message, 
      this.data,});


  String? message;
  List<Provider>? data;



}

/// _id : "667bf6f2353283bdfda57323"
/// spEnglishName : "Hospital"
/// spArabicName : "مستشفي"
/// active : true
/// categoryId : "667bf609353283bdfda57321"
/// __v : 0

class Provider {
  Provider({
      this.id, 
      this.spEnglishName, 
      this.spArabicName, 
      this.active, 
      this.categoryId, 
      this.v,});


  String? id;
  String? spEnglishName;
  String? spArabicName;
  bool? active;
  String? categoryId;
  int? v;



}