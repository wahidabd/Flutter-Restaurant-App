class Menu {
  String name;

  Menu({required this.name});

  factory Menu.fromJson(Map<String, dynamic> json) => Menu(name: json['name']);
}
