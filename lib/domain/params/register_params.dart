

class RegisterParam {
  RegisterParam({
     required this.fullName,
     required this.username,
     required this.email,
     required this.country,
     required this.password,
     this.deviceName = "web",
  });

  String fullName;
  String username;
  String email;
  String country;
  String password;
  String deviceName;



  Map<String, dynamic> toJson() => {
    "full_name": fullName,
    "username": username,
    "email": email,
    "country": country,
    "password": password,
    "device_name": deviceName,
  };
}
