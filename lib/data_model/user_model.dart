class UserModel {
  String? name;
  int? age;
  String? gender;
  String? occupation;

  UserModel({
    this.name,
    this.age,
    this.gender,
    this.occupation,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    age = json['age'];
    gender = json['gender'];
    occupation = json['occupation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['age'] = age;
    data['gender'] = gender;
    data['occupation'] = occupation;
    return data;
  }
}
