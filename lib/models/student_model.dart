class StudentModel {
  final String name;
  final String enrolmentNumber;
  final String phoneNumber;

  StudentModel({
    required this.name,
    required this.enrolmentNumber,
    required this.phoneNumber,
  });

  factory StudentModel.fromJson(Map<String, dynamic> map) {
    return StudentModel(
      name: map['name'],
      enrolmentNumber: map['enrollment number'],
      phoneNumber: map['mobile number'].toString(),
    );
  }
}
