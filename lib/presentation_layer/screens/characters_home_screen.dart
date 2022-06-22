import 'package:breaking_bad_app/bussiness_logic_layer/characters_cubit.dart';
import 'package:breaking_bad_app/data_layer/models/characters_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data_layer/api/characters_api.dart';
import '../../data_layer/repository/characters_repository.dart';
import '../../shared/constance/color_constance.dart';
import '../custom_widgets/character_item_widget.dart';

class CharactersHomeScreen extends StatefulWidget {
  const CharactersHomeScreen({Key? key}) : super(key: key);

  @override
  State<CharactersHomeScreen> createState() => _CharactersHomeScreenState();
}

class _CharactersHomeScreenState extends State<CharactersHomeScreen> {
  List<CharacterModel>? allCharacters;

  @override
  void initState() {
    super.initState();
    print("run success...");
   // CharactersApi().getOneCharacter();
    AllCharactersRepository(CharactersApi()).getAllCharacters();



   // allCharacters =BlocProvider.of<CharactersCubit>(context).getMyAllCharacters();

  //  print("allCharacters is : $allCharacters");



  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: RoseQuartzColor,
        title: Text(
          "Characters",
          style: TextStyle(
            fontSize: 18,
            color: greyColor,
          ),
        ),
        centerTitle: true,
      ),
      body:Container(),
      //buildBlocWidget(),
    );
  }

  Widget buildBlocWidget() {
    return BlocBuilder<CharactersCubit, CharactersState>(
        builder: (context, state) {
      if (state is CharactersLoaded) {
        allCharacters = (state).characters;

        return buildLoadedWidget();
      } else {
        print("errrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrror");
        //print(allCharacters);
        return Center(
          child: CircularProgressIndicator(),
        );
      }
    });
  }

  Widget buildLoadedWidget() {
    return SingleChildScrollView(
      child: Container(
        color: greyColor,
        child: Column(
          children: [
             buildCharactersList(),
          ],
        ),
      ),
    );
  }

  Widget buildCharactersList() {
    return  GridView.builder(
      padding: EdgeInsets.all(0),
      shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 3,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1,
        ),
        itemCount: allCharacters?.length,
        itemBuilder: (context , index){
          return CharacterItems(

          );
        });
  }
}
