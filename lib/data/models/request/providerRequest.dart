/// categoryId : "667bf609353283bdfda57321"

class ProviderRequest {
  ProviderRequest({
      this.categoryId,});

  ProviderRequest.fromJson(dynamic json) {
    categoryId = json['categoryId'];
  }
  String? categoryId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['categoryId'] = categoryId;
    return map;
  }

}