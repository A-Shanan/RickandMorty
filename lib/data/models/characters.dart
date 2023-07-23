class Character {
  late int id;
  late String name;
  late String statusIfDeadOrAlive;
  late String species;
  late String type;
  late String gender;
  late String originName;
  late String originUrl;
  late String locationName;
  late String locationUrl;
  late String image;
  late List<dynamic> episode;

  Character.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    statusIfDeadOrAlive = json['status'];
    species = json['species'];
    type = json['type'];
    gender = json['gender'];
    originName = json['origin']['name'];
    originUrl = json['origin']['url'];
    locationName = json['location']['name'];
    locationUrl = json['location']['url'];
    image = json['image'];
    episode = json['episode'];
  }
}
