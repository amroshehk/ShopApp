class ShopLoginModel {
 bool? status;
 String? message;
 UserData? data;

 ShopLoginModel.fromJson(Map<String, dynamic> dataResponse) {
   status = dataResponse['status'];
   message = dataResponse['message'];
   data = dataResponse['data'] != null ? UserData.fromJson(dataResponse['data']) : null;
 }
}

class UserData {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? image;
  int? points;
  int? credit;
  String? token;
  UserData.fromJson(Map<String, dynamic> dataResponse) {
    id = dataResponse['id'];
    name = dataResponse['name'];
    email = dataResponse['email'];
    phone = dataResponse['phone'];
    image = dataResponse['image'];
    points = dataResponse['points'];
    credit = dataResponse['credit'];
    token = dataResponse['token'];
  }
}