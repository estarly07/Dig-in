class UserResponse {
  final String email;
  final String name;
  final String lastname;
  final String uid;
  final String image;

  UserResponse(this.email,  this.name, this.lastname, this.uid,
      this.image);
  factory UserResponse.fromJson(Map<String, dynamic> json) => UserResponse(
    json["email"], 
    json["name"], 
    json["lastname"], 
    json["uid"], 
    json["image"]
  );
  Map<String, dynamic> toJson() 
  => {
        "email"    : email,
        "name"     : name,
        "lastname" : lastname,
        "uid"      : uid,
        "image"    : image,
      };
}
