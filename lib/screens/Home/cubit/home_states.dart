

import 'package:flutter_home_screen/domain/entities/ServiceProviderEntity.dart';

import '../../../domain/entities/ServiceCategoryResponseEntity.dart';

abstract class HomeStates{}

class HomeInitialState extends HomeStates{}

class HomeLoadingState extends HomeStates{
  String? loadingMsg;
  HomeLoadingState({required this.loadingMsg});
}

class HomeErrorState extends HomeStates{
  String? errorMsg;
  HomeErrorState({required this.errorMsg});
}


class CategorySuccessState extends HomeStates{
  //response - list of Homes
  ServiceCategoryEntity ServiceCategory;
  CategorySuccessState({required this.ServiceCategory});
}

class ProviderSuccessState extends HomeStates{
  //response - list of Homes
  ServiceProviderEntity ServiceProvider;
  ProviderSuccessState({required this.ServiceProvider});
}

