class signUpPostModel {
   String name;
   String email;
   String password;
   String phone;
   String car_no;
   String nic_no;
   String license_no;

  signUpPostModel({this.name,this.email, this.password,this.phone,this.car_no,this.nic_no,this.license_no});

  factory signUpPostModel.fromJson(Map json) {
    return signUpPostModel(
      name: json['name'],
      email: json['email'],
      password: json['password'],
      phone: json['phone'],
      car_no: json['car_no'],
      nic_no: json['nic_no'],
      license_no: json['license_no'],
    );
  }

   Map<String, dynamic> toJson() => {
     "name": name,
     "email": email,
     "password": password,
     "phone": phone,
     "car_no": car_no,
     "nic_no": nic_no,
     "license_no": license_no,
   };

  Map toMap() {
    var map = new Map();
    map["userId"] = name;
    map["email"] = email;
    map["password"] = password;
    map["phone"] = phone;
    map["car_no"] = car_no;
    map["nic_no"] = nic_no;
    map["license_no"] = license_no;
    return map;
  }
}