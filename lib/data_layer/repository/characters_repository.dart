import 'package:breaking_bad_app/data_layer/api/characters_api.dart';
import 'package:breaking_bad_app/data_layer/models/characters_model.dart';

class AllCharactersRepository {
  final CharactersApi charactersApi;

  AllCharactersRepository(this.charactersApi);

  Future<List<CharacterModel>?> getAllCharacters() async {
    try {

      final allCharacters = await charactersApi.getCharacter();


      print("repo allCharacters: $allCharacters");

       print(" repo allCharacters' Map : ${allCharacters.map((e) => CharacterModel.fromJson(e)).toList()}");


      return allCharacters.map((character) => CharacterModel.fromJson(character)).toList() ;

    } catch (e) {

      print("repo error is : $e");

      return [] ;
    }

  }
}
