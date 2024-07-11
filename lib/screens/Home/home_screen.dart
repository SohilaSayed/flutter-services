import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_home_screen/domain/useCase/serviceProvider_useCase.dart';
import 'package:flutter_home_screen/screens/Home/cubit/home_states.dart';
import 'package:flutter_home_screen/screens/ScheduleServices.dart';
import 'package:flutter_home_screen/screens/AgentService/agentServices.dart';
import 'package:flutter_home_screen/screens/AgentService/generalServices.dart';
import '../../domain/useCase/getServicesCategories_useCase.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/section_header.dart';
import '../../widgets/icon_card.dart';
import '../../widgets/order_card.dart';
import '../routes.dart';
import 'ViewAllService.dart';
import 'cubit/home_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeScreenViewModel homeViewModel;

  @override
  void initState() {
    super.initState();
    homeViewModel = HomeScreenViewModel(
      categoryUseCase: injectCategoryServiceUseCase(),
      providerUseCase: injectServiceProviderUseCase(),
    );
    homeViewModel.getAllServiceCategory();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => homeViewModel,
      child: BlocBuilder<HomeScreenViewModel, HomeStates>(
        builder: (context, state) {
          if (state is HomeLoadingState) {
            return Scaffold(
              appBar: AppBar(
                title: Text('Loading...'),
              ),
              body: Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                ),
              ),
            );
          } else if (state is CategorySuccessState) {
            return Scaffold(
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(140),
                child: CustomAppBar(),
              ),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 75),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                      child: Column(
                        children: [
                          const SectionHeader(title: "Bills"),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconCard(icon: Icons.circle, label: "First Bill"),
                              IconCard(icon: Icons.circle, label: "Second Bill"),
                              IconCard(icon: Icons.circle, label: "Third Bill"),
                            ],
                          ),
                          const SizedBox(height: 16.0),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed(ViewAllServiceScreenRouter);
                            },
                            child: const SectionHeader(
                              title: "Services Booking List",
                              actionText: "View all",
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: state.ServiceCategory.data!.take(4).map((category) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pushNamed(serviceProviderRoute, arguments: category);
                                },
                                child: IconCard2(
                                  imageUrl: category.image?.secureUrl,
                                  label: category.categoryEnglishName!,
                                  color: Colors.green,
                                ),
                              );
                            }).toList(),
                          ),
                          const SizedBox(height: 16.0),
                          const SectionHeader(title: "Order Now", actionText: "View all"),
                          const OrderCard(label: "Coffee and Drinks"),
                          const OrderCard(label: "Breakfast"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              bottomNavigationBar: BottomNavigationBar(
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: '',
                  ),
                ],
                currentIndex: 0,
              ),
            );
          } else {
            return Scaffold(
              appBar: AppBar(
                title: Text('Error'),
              ),
              body: Center(
                child: Text('Failed to load categories.'),
              ),
            );
          }
        },
      ),
    );
  }
}
