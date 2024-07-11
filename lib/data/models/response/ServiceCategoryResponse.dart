import '../../../domain/entities/ServiceCategoryResponseEntity.dart';

/// message : "Done"
/// data : [{"_id":"667bf609353283bdfda57321","categoryEnglishName":"medical","categoryArabicName":"طبي","active":true,"__v":0},{"_id":"667d654d8254742cbe72a32e","categoryEnglishName":"medical","categoryArabicName":"طبي","image":{"public_id":"Category/medical/fpnlwaavwtc3rxqjcuak","secure_url":"https://res.cloudinary.com/dkaflobgm/image/upload/v1719493964/Category/medical/fpnlwaavwtc3rxqjcuak.jpg"},"active":true,"__v":0},{"_id":"667d65b6ca2d1a4e808a5144","categoryEnglishName":"medical","categoryArabicName":"طبي","image":{"public_id":"Category/medical/gxdodjzgqwbdodj8j4zc","secure_url":"https://res.cloudinary.com/dkaflobgm/image/upload/v1719494069/Category/medical/gxdodjzgqwbdodj8j4zc.jpg"},"active":true,"__v":0},{"_id":"667d6a184aec394991fa0f01","categoryEnglishName":"medical","categoryArabicName":"طبي","image":{"public_id":"Category/medical/oletk14mtpit7utdovf0","secure_url":"https://res.cloudinary.com/ds5updpqm/image/upload/v1719495191/Category/medical/oletk14mtpit7utdovf0.jpg"},"active":true,"__v":0}]

class ServiceCategoryResponse extends ServiceCategoryEntity {
  ServiceCategoryResponse({
    super.message,
    super.data,});

  ServiceCategoryResponse.fromJson(dynamic json) {
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(CategoryDTO.fromJson(v));
      });
    }
  }
}

/// _id : "667bf609353283bdfda57321"
/// categoryEnglishName : "medical"
/// categoryArabicName : "طبي"
/// active : true
/// __v : 0

class CategoryDTO extends Category{
  CategoryDTO({
    super.id,
    super.categoryEnglishName,
    super.categoryArabicName,
    super.active,
    super.image,
    super.v,});

  CategoryDTO.fromJson(dynamic json) {
    id = json['_id'];
    categoryEnglishName = json['categoryEnglishName'];
    categoryArabicName = json['categoryArabicName'];
    active = json['active'];
    image = json['image'] != null ? CustomImage.fromJson(json['image']) : null;

    v = json['__v'];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['categoryEnglishName'] = categoryEnglishName;
    map['categoryArabicName'] = categoryArabicName;
    map['active'] = active;
    if (image != null) {
      map['image'] = image?.toJson();
    }
    map['__v'] = v;
    return map;
  }

}