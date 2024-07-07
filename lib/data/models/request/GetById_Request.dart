/// id : "667df44f964923a8a39d734b"

class GetByIdRequest {
  GetByIdRequest({
      this.id,});

  GetByIdRequest.fromJson(dynamic json) {
    id = json['id'];
  }
  String? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    return map;
  }

}