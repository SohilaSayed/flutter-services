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
import 'cubit/home_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  HomeScreenViewModel homeViewModel = HomeScreenViewModel(
      categoryUseCase: injectCategoryServiceUseCase(), providerUseCase: injectServiceProviderUseCase());

  @override
  void initState() {
    super.initState();
    homeViewModel.getAllServiceCategory();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => homeViewModel,
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
          } else if (state is CategorySuccessState) {
            return Scaffold(
              appBar: const PreferredSize(
                preferredSize: Size.fromHeight(140),
                child: CustomAppBar(),
              ),
              body: Stack(
                children: [
                  SingleChildScrollView(
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
                                  IconCard(
                                      icon: Icons.circle, label: "First Bill"),
                                  IconCard(
                                      icon: Icons.circle, label: "Second Bill"),
                                  IconCard(
                                      icon: Icons.circle, label: "Third Bill"),
                                ],
                              ),
                              const SizedBox(height: 16.0),
                              GestureDetector(
                                onTap: () {},
                                child: const SectionHeader(
                                    title: "Services Booking List",
                                    actionText: "View all"),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: state.ServiceCategory.data!.map((category) {
                                  return GestureDetector(
                                    onTap: () {
                                      // Navigate to the appropriate screen based on the category
                                      Navigator.of(context).pushNamed(serviceProviderRoute, arguments:category);
                                    },
                                    child: IconCard(
                                      icon: Icons.miscellaneous_services,
                                      label: category.categoryEnglishName!,
                                      color: Colors.green,
                                    ),
                                  );
                                }).toList(),
                              ),
                              const SizedBox(height: 16.0),
                              const SectionHeader(
                                  title: "Order Now", actionText: "View all"),
                              const OrderCard(label: "Coffee and Drinks"),
                              const OrderCard(label: "Breakfast"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Positioned QR Code section overlapping the CustomAppBar
                  Positioned(
                    top: kToolbarHeight - 55,
                    // Adjust top position to overlap the AppBar
                    left: 20,
                    right: 20,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      // Adjust border radius as needed
                      child: Container(
                        height: 74, // Adjust the height as needed
                        color: Colors.white, // Background color of the overlay
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                  Icons.qr_code, size: 40, color: Colors.green),
                              const SizedBox(height: 8.0),
                              Text("My QR",
                                  style: TextStyle(
                                      fontFamily: 'DMSans',
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
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
          }
          return Container(); // Add a default return if state doesn't match any cases
        },
      ),
    );
  }
}
