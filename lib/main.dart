import 'package:flutter/material.dart';
import 'package:flutter_home_screen/screens/AgentService/agentServiceDetails.dart';
import 'package:flutter_home_screen/screens/AgentService/generalServices.dart';
import 'package:flutter_home_screen/screens/AgentService/setaSchedule.dart';
import 'package:flutter_home_screen/screens/Home/ServiceProviders.dart';
import 'package:flutter_home_screen/screens/Home/ViewAllService.dart';
import 'package:flutter_home_screen/screens/routes.dart';
import 'screens/Home/home_screen.dart';

void main() {
  runApp(const SuperApp());
}

class SuperApp extends StatelessWidget {
  const SuperApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Servcies',
      routes: {

        serviceAgentDetailsRoute: (context) => AgentServiceDetailsScreen(),
        serviceProviderRoute: (context) => ServiceProvidersScreen(),
        serviceRoute: (context) => ServiceScreen(),
        agentCalenderRoute: (context) => ServiceCalendarScreen(),
        ViewAllServiceScreenRouter: (context) => ViewAllServiceScreen(),
        homeRouter: (context) => HomeScreen(),

      },
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'DMSans'
      ),
      home: const HomeScreen(),
    );
  }
}