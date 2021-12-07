class Giveaway {
  Giveaway({
    required this.id,
    required this.title,
    required this.worth,
    required this.thumbnail,
    required this.image,
    required this.description,
    required this.instructions,
    required this.openGiveawayUrl,
    required this.publishedDate,
    required this.type,
    required this.platforms,
    required this.endDate,
    required this.users,
    required this.status,
    required this.gamerpowerUrl,
    required this.openGiveaway,
  });

  late final int id;
  late final String title;
  late final String worth;
  late final String thumbnail;
  late final String image;
  late final String description;
  late final String instructions;
  late final String openGiveawayUrl;
  late final String publishedDate;
  late final String type;
  late final String platforms;
  late final String endDate;
  late final int users;
  late final String status;
  late final String gamerpowerUrl;
  late final String openGiveaway;

  Giveaway.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    worth = json['worth'];
    thumbnail = json['thumbnail'];
    image = json['image'];
    description = json['description'];
    instructions = json['instructions'];
    openGiveawayUrl = json['open_giveaway_url'];
    publishedDate = json['published_date'];
    type = json['type'];
    platforms = json['platforms'];
    endDate = json['end_date'];
    users = json['users'];
    status = json['status'];
    gamerpowerUrl = json['gamerpower_url'];
    openGiveaway = json['open_giveaway'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title;
    _data['worth'] = worth;
    _data['thumbnail'] = thumbnail;
    _data['image'] = image;
    _data['description'] = description;
    _data['instructions'] = instructions;
    _data['open_giveaway_url'] = openGiveawayUrl;
    _data['published_date'] = publishedDate;
    _data['type'] = type;
    _data['platforms'] = platforms;
    _data['end_date'] = endDate;
    _data['users'] = users;
    _data['status'] = status;
    _data['gamerpower_url'] = gamerpowerUrl;
    _data['open_giveaway'] = openGiveaway;
    return _data;
  }
}
