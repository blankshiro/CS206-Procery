// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'screens/dashboard/DashboardExplore.dart';
import 'screens/grocerylist/GLCurrentPage.dart';
import 'screens/mealplanner/MealPlannerInitial.dart';
import 'screens/recipe/RecipeExplore.dart';

class Routes {
  static const String recipeExplore = '/recipe-explore';
  static const String dashboardExplore = '/';
  static const String gLExplore = '/g-lcurrent-page';
  static const String mealPlannerExplore = '/meal-planner-initial';
  static const all = <String>{
    recipeExplore,
    dashboardExplore,
    gLExplore,
    mealPlannerExplore,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.recipeExplore, page: RecipeExplore),
    RouteDef(Routes.dashboardExplore, page: DashboardExplore),
    RouteDef(Routes.gLExplore, page: GLCurrentPage),
    RouteDef(Routes.mealPlannerExplore, page: MealPlannerInitial),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    RecipeExplore: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => RecipeExplore(),
        settings: data,
      );
    },
    DashboardExplore: (data) {
      final args = data.getArgs<DashboardExploreArguments>(
        orElse: () => DashboardExploreArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => DashboardExplore(
          key: args.key,
          pageTitle: args.pageTitle,
        ),
        settings: data,
      );
    },
    GLCurrentPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => GLCurrentPage(),
        settings: data,
      );
    },
    MealPlannerInitial: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => MealPlannerInitial(),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// DashboardExplore arguments holder class
class DashboardExploreArguments {
  final Key key;
  final String pageTitle;
  DashboardExploreArguments({this.key, this.pageTitle});
}
