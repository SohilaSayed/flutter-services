import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_home_screen/domain/entities/ServiceCategoryResponseEntity.dart';
import 'package:flutter_home_screen/domain/entities/ServiceProviderEntity.dart';

import '../../domain/useCase/getServicesCategories_useCase.dart';
import '../../domain/useCase/serviceProvider_useCase.dart';
import '../routes.dart';
import 'cubit/home_states.dart';
import 'cubit/home_view_model.dart';

class ServiceProvidersScreen extends StatefulWidget {
  const ServiceProvidersScreen({super.key});

  @override
  State<ServiceProvidersScreen> createState() => _ServiceProvidersScreen();
}

class _ServiceProvidersScreen extends State<ServiceProvidersScreen> {


  HomeScreenViewModel homeViewModel = HomeScreenViewModel(
      categoryUseCase: injectCategoryServiceUseCase(), providerUseCase: injectServiceProviderUseCase());

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as Category;


    return BlocProvider(
        create: (context) => homeViewModel..getAllServiceProvider(args.id!),
        child: BlocBuilder<HomeScreenViewModel, HomeStates>(
        builder: (context, state) {
      if (state is HomeLoadingState) {
        return Container(
          color: Colors.white, // Background color
          child: Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
              // Indicator color
              backgroundColor: Colors
                  .white, // Background color of the progress indicator
            ),
          ),
        );
      }
      else if (state is ProviderSuccessState) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            title: Text(
              'Service Providers',
              style: TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        decoration: BoxDecoration(
                          color: Colors.white70,
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.search, color: Colors.green),
                            SizedBox(height: 16.0),
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: '  Search..',
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 16.0),
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xFF12A770),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.filter_list_outlined, color: Colors.white,),
                        onPressed: () {
                          // Filter action
                        },
                        tooltip: 'Filter',
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.0),
                Expanded(
                  child: ListView.builder(
                    itemCount: homeViewModel.serviceProviderList?.length,
                    itemBuilder: (context, index) {
                      return ProviderItem(provider: homeViewModel.serviceProviderList![index]);
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      }
      else{
        return Container(
          color: Colors.white, // Background color
          child: Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
              // Indicator color
              backgroundColor: Colors
                  .white, // Background color of the progress indicator
            ),
          ),
        );
    }

        }
    )
    );
  }
}

class ProviderItem extends StatelessWidget {
  final Provider provider;

  const ProviderItem({super.key,required this.provider});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                color: Color(0xFF3DAB25),
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Icon(Icons.ac_unit_rounded, color: Colors.white,size: 50,), // Placeholder for the icon
            ),
            SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment:MainAxisAlignment.start,
                children: [
                  Text(
                    provider.spEnglishName!,
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),
                  ),
                  SizedBox(height: 8.0,),

                  Container(
                    height: 30,
                    padding: EdgeInsets.fromLTRB(60, 0, 0, 0),
                    child:
                    ElevatedButton(
                      onPressed: () {
                        // Handle button press
                        // Add your logic here
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF12A770)),
                      ),
                      child: Container(
                        alignment: Alignment.center,
                        width: 70,
                        height: 30,
                        // padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                        child: Container(
                          padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: (){
                                  Navigator.of(context).pushNamed(serviceRoute, arguments:provider);
                                },
                                child: Text(
                                  textAlign: TextAlign.center,
                                  'Details',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),

                              Icon(Icons.arrow_forward_rounded,color: Colors.white,size: 15,)
                            ],
                          ),
                        ),
                      ),
                    )

                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
