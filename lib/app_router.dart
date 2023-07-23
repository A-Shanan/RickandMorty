import 'package:bloc_training/business_logic/cubit/characters_cubit.dart';
import 'package:bloc_training/data/repository/characters_repository.dart';
import 'package:bloc_training/data/web_services/characters_web_services.dart';
import 'package:bloc_training/presentation/screens/characters_details.dart';
import 'package:bloc_training/presentation/screens/characters_screen.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'constants/strings.dart';

class AppRouter {
  late CharactersRepository charactersRepository;
  late CharactersCubit charactersCubit;

  AppRouter() {
    charactersRepository = CharactersRepository(CharactersWebServices());
    charactersCubit = CharactersCubit(charactersRepository);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case charactersScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => charactersCubit,
            child: CharacterScreen(),
          ),
        );
      case characterDetailsScreen:
        return MaterialPageRoute(
            builder: (_) => const CharacterDetailsScreen());
    }
  }
}
