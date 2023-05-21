class User {
  final String name;
  final int age;
  final String sport;

  const User({required this.name, required this.age, required this.sport});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(name: json['name'], age: json['age'], sport: json['sport']);
  }
}

var apiJson = {'name': 'Tom', 'age': 29, 'Sport': 'Football'};
