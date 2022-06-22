import 'package:bloc/bloc.dart';
import 'package:breaking_bad_app/data_layer/models/characters_model.dart';
import 'package:breaking_bad_app/data_layer/repository/characters_repository.dart';
import 'package:meta/meta.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {

  final AllCharactersRepository allCharactersRepository ;

  CharactersCubit(this.allCharactersRepository) : super(CharactersInitial());


   List<CharacterModel>? myCharacters ;

  /////////////
  List<CharacterModel>? getMyAllCharacters(){

    allCharactersRepository.getAllCharacters().then((characters) {

      emit(CharactersLoaded(characters!));


      myCharacters = characters ;

   //   print("////////////////////////////$myCharacters");

    });

   // print("////////////////////////////$myCharacters");

   // print(myCharacters);

    return  myCharacters ;
  }

  //////////
}
