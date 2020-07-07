class Users {
  String id;
  String firstName;
  String lastName;
  String middleName;
  String email;
  String studentRef;
  String image;
  String status;

  Users(
      {this.id,
      this.firstName,
      this.lastName,
      this.middleName,
      this.email,
      this.studentRef,
      this.image,
      this.status});

  Map toMap(Users user) {
    var data = Map<String, dynamic>();
    data['id'] = user.id;
    data['first_name'] = user.firstName;
    data['last_name'] = user.lastName;
    data['middle_name'] = user.middleName;
    data['email'] = user.email;
    data['student_ref'] = user.studentRef;
    data['image'] = user.image;
    data['status'] = user.status;
    return data;
  }

  Users.fromMap(Map<String, dynamic> mapData) {
    this.id = mapData['id'];
    this.firstName = mapData['first_name'];
    this.lastName = mapData['last_name'];
    this.middleName = mapData['middle_name'];
    this.email = mapData['email'];
    this.studentRef = mapData['student_ref'];
    this.status = mapData['status'];
  }
}
