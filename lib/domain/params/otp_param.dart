

class OtpParams {
  OtpParams({
    required this.email,
    required  this.token,
  });

  String email;
  String token;



  Map<String, dynamic> toJson() => {
    "email": email,
    "token": token,
  };
}
