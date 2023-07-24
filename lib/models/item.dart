class Item {
  Item({required this.title, required this.dateTime});

  Item.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        dateTime = DateTime.parse(json['dateTime']);

  String title;
  DateTime dateTime;

  toJson() {
    return {
      'title': title,
      'dateTime': dateTime.toIso8601String(),
    };
  }
}
