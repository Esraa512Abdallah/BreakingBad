class CharacterModel {
  final int? charId;
  final String? name;
  final String? birthday;
  final List<String>? occupation;
  final String? img;
  final String? status;
  final String? nickname;
  final List<int>? appearance;
  final String? portrayed;
  final String? category;
  final List<dynamic>? betterCallSaulAppearance;

  CharacterModel(
      {required this.charId,
      required this.name,
      required this.birthday,
      required this.occupation,
      required this.img,
      required this.status,
      required this.nickname,
      required this.appearance,
      required this.portrayed,
      required this.category,
      required this.betterCallSaulAppearance});

  factory CharacterModel.fromJson(Map<String, dynamic> jsonData) {
    return CharacterModel(
      charId: jsonData['char_id'],
      name: jsonData['name'],
      birthday: jsonData['birthday'],
      occupation: jsonData['occupation'],
      img: jsonData['img'],
      status: jsonData['status'],
      nickname: jsonData['nickname'],
      appearance: jsonData['appearance'],
      portrayed: jsonData['portrayed'],
      category: jsonData['category'],
      betterCallSaulAppearance: jsonData['betterCallSaulAppearance'],
    );

  }


}
