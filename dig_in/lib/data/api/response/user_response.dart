class UserResponse {
  final String email;
  final String password;
  final String name;
  final String lastname;
  final String uid;
  final String image;

  UserResponse(this.email, this.password, this.name, this.lastname, this.uid,
      this.image);
  factory UserResponse.fromJson(Map<String, dynamic> json) => UserResponse(
    json["email"], 
    json["password"], 
    json["name"], 
    json["lastname"], 
    json["uid"], 
    json["image"]
  );
  Map<String, dynamic> toJson() 
  => {
        "email"    : email,
        "password" : password,
        "name"     : name,
        "lastname" : lastname,
        "uid"      : uid,
        "image"    : image,
      };
}
