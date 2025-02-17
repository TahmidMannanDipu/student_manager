class Student {
  final int id;
  final String firstName;
  final String lastName;
  final int age;
  final String major;

  Student({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.age,
    required this.major,
  });

  // Factory constructor to create a Student from JSON
  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      age: json['age'],
      major: json['major'],
    );
  }

  // Method to convert Student to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'age': age,
      'major': major,
    };
  }

  void toMap() {}
}
