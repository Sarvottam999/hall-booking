 
import 'package:flutter/material.dart';
import 'package:oyo/features/detailScreen/screen/checkScreen.dart';
import 'package:oyo/features/detailScreen/screen/detailScreen.dart';
import 'package:oyo/features/favourit/screen/favouritScreen.dart';
import 'package:oyo/models/venueModel.dart';
import 'package:oyo/features/home/screen/home_screen.dart';
import 'package:oyo/features/search/screen/searchScreen.dart';


MaterialPageRoute <dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    // case AuthScreen.routeName:
    //   return MaterialPageRoute(
    //     builder: (_) => const AuthScreen()
    //     );

    case HomeScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const HomeScreen()
        );

    case DetailScreen.namedRoute:
    
      return MaterialPageRoute(
         
        builder: (_) =>   DetailScreen( hall: settings.arguments as Hall,)
        );

    case SltDateScreen.namedRoute:
      return MaterialPageRoute(
        builder: (_) =>   SltDateScreen( hallid: settings.arguments as String ,)
        );

        case SearchScreen.namedRoute:
      return MaterialPageRoute(
        builder: (_) =>   SearchScreen( )
        );

        case FavoriteHallsScreen.namedRoute:
      return MaterialPageRoute(
        builder: (_) =>   FavoriteHallsScreen( userId: settings.arguments as String ,)
        );
        
    default:

      return MaterialPageRoute(builder: (_) =>   Scaffold(
        body: Center(
          child: Text('No route defined for ${settings.name}'),
        ),
      ));

  }
}