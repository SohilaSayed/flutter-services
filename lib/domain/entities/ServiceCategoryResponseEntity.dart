
class ServiceCategoryEntity {
  ServiceCategoryEntity({
      this.message, 
      this.data,});


  String? message;
  List<Category>? data;


}


class Category {
  Category({
      this.id, 
      this.categoryEnglishName, 
      this.categoryArabicName, 
      this.active, 
      this.v,});

  String? id;
  String? categoryEnglishName;
  String? categoryArabicName;
  bool? active;
  int? v;


}