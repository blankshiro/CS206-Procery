// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'screens/BaseScreen.dart';
import 'screens/recipe/RecipeExplore.dart';

class Routes {
  static const String baseScreen = '/';
  static const String recipeExplore = '/recipe-explore';
  static const all = <String>{
    baseScreen,
    recipeExplore,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.baseScreen, page: BaseScreen),
    RouteDef(Routes.recipeExplore, page: RecipeExplore),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    BaseScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => BaseScreen(),
        settings: data,
      );
    },
    RecipeExplore: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => RecipeExplore(),
        settings: data,
      );
    },
  };
}
