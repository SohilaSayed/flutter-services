
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_home_screen/domain/entities/ServiceProviderEntity.dart';

import '../../../domain/entities/ServiceCategoryResponseEntity.dart';
import '../../../domain/useCase/getServicesCategories_useCase.dart';
import '../../../domain/useCase/serviceProvider_useCase.dart';
import 'home_states.dart';

class HomeScreenViewModel extends Cubit<HomeStates>{

  GetAllCategoriesServiceUseCase categoryUseCase;
  ServiceProviderUseCase providerUseCase;

  HomeScreenViewModel({
   required this.categoryUseCase,
   required this.providerUseCase
  }):super(HomeInitialState());


  List<Category>? categoryServiceList;
  List<Provider>? serviceProviderList;

  void getAllServiceCategory()
  async{
    emit(HomeLoadingState(loadingMsg: 'Loading ...'));

    var either = await categoryUseCase.invoke();
    return either.fold((l) {
      emit(HomeErrorState(errorMsg: l.errorMsg));
    }, (response) {
      categoryServiceList = response.data;
      emit(CategorySuccessState(ServiceCategory: response));
    });
  }

  void getAllServiceProvider(String id)
  async{
    emit(HomeLoadingState(loadingMsg: 'Loading ...'));

    var either = await providerUseCase.invoke(id);
    return either.fold((l) {
      emit(HomeErrorState(errorMsg: l.errorMsg));
    }, (response) {
      serviceProviderList = response.data;
      emit(ProviderSuccessState( ServiceProvider: response));
    });
  }

}