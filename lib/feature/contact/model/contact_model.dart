class ContactModel {
  ContactModel({
    required this.data,
  });

  List<DataContact> data;

  factory ContactModel.fromJson(Map<String, dynamic> json) => ContactModel(
        data: List<DataContact>.from(
            json["data"].map((x) => DataContact.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class DataContact {
  DataContact({
    required this.name,
    required this.phoneNumber,
  });

  String name;
  String phoneNumber;

  factory DataContact.fromJson(Map<String, dynamic> json) => DataContact(
        name: json["name"],
        phoneNumber: json["phoneNumber"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "phoneNumber": phoneNumber,
      };
}
