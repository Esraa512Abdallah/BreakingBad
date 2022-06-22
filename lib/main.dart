import 'package:breaking_bad_app/shared/app_router.dart';
import 'package:flutter/material.dart';

import 'data_layer/api/characters_api.dart';

void main() {
  runApp( BreakingBadApp(appRouter: AppRouter(),));
}

class BreakingBadApp extends StatelessWidget {
  const BreakingBadApp({Key? key, required this.appRouter}) : super(key: key);

  final AppRouter appRouter ;


   // void initState() {
   //
   //
   //   print("Run Success");
   //
   //   CharactersApi();
   // }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(


      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute,

      
    );
  }
}

