class UserModel {
  final String name;
  final String age;
  final String favBook;
// Uint8List
  UserModel({
    required this.name,
    required this.age,
    required this.favBook,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'age': age,
        'favBook': favBook,
      };

  static UserModel fromJson(Map<String, dynamic> json) => UserModel(
        name: json['name'] ?? 'cant retrive data',
        age: json['age'] ?? 'cant retrive data',
        favBook: json['favBook'] ?? 'cant retrive data',
      );
}
