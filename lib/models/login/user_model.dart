class UserModel {
  String? key;

  UserModel({this.key});

  UserModel.fromJson(Map<String, dynamic> json) {
    key = json["key"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["key"] = key;
    return data;
  }
}
