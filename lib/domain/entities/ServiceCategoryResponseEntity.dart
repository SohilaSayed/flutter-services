
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
    this.image,
    this.v,});

  String? id;
  String? categoryEnglishName;
  String? categoryArabicName;
  bool? active;
  int? v;
  CustomImage? image;



}
class CustomImage {
  CustomImage({
    this.publicId,
    this.secureUrl,});

  CustomImage.fromJson(dynamic json) {
    publicId = json['public_id'];
    secureUrl = json['secure_url'];
  }
  String? publicId;
  String? secureUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['public_id'] = publicId;
    map['secure_url'] = secureUrl;
    return map;
  }

}
