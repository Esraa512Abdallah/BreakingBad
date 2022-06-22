import 'package:breaking_bad_app/bussiness_logic_layer/characters_cubit.dart';
import 'package:breaking_bad_app/data_layer/api/characters_api.dart';
import 'package:breaking_bad_app/data_layer/repository/characters_repository.dart';
import 'package:breaking_bad_app/presentation_layer/screens/characters_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../presentation_layer/screens/characters_home_screen.dart';

class AppRouter {

  late AllCharactersRepository allCharactersRepository;

  late CharactersCubit charactersCubit;

  AppRouter() {
    allCharactersRepository = AllCharactersRepository(CharactersApi());
    charactersCubit = CharactersCubit(allCharactersRepository);
  }

  Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => charactersCubit,
            child: CharactersHomeScreen(),
          ),
        );
      case '/characters_details_screen':
        return MaterialPageRoute(builder: (_) => CharactersDetailsScreen());
    }
    return null ;
  }
}
