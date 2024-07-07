import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_home_screen/domain/entities/AgentServiceResponseEntity.dart';
import 'package:flutter_home_screen/domain/useCase/getAgentServices_useCase.dart';
import 'package:flutter_home_screen/screens/AgentService/cubit/service_states.dart';

import '../../domain/entities/ServiceEntity.dart';
import '../../domain/useCase/AgentCalender_useCase.dart';
import '../../domain/useCase/agentServiceById_useCase.dart';
import '../../domain/useCase/service_useCase.dart';
import '../routes.dart';
import 'agentServiceDetails.dart';
import 'cubit/service_view_model.dart';

class AgentServicesScreen extends StatefulWidget {
  const AgentServicesScreen({super.key});

  @override
  State<AgentServicesScreen> createState() => _AgentServicesScreenState();
}

class _AgentServicesScreenState extends State<AgentServicesScreen> {
  ServiceScreenViewModel serviceViewModel = ServiceScreenViewModel(
      agentServiceUseCase: injectAgentServiceUseCase(),
      specificAgentServiceUseCase: injectSpecificAgentServiceUseCase(),
      serviceUseCase: injectServiceUseCase(), agentCalenderUseCase: injectAgentCalenderUseCase()
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    var args = ModalRoute.of(context)!.settings.arguments as Services;

    return BlocProvider(
      create: (context) => serviceViewModel..getAllAgentService(args.id!),
      child: BlocBuilder<ServiceScreenViewModel, ServiceStates>(
        builder: (context, state) {
          if (state is ServiceLoadingState) {
            return Container(
              color: Colors.white, // Background color
              child: Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.green), // Indicator color
                  backgroundColor: Colors.white, // Background color of the progress indicator
                ),
              ),
            );
          }
          else if (state is ServiceSuccessState) {
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
                  'Agent Services',
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
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
                        itemCount: serviceViewModel.agentServiceList?.length,
                        itemBuilder: (context, index) {
                          return ServiceItem(service: serviceViewModel.agentServiceList![index]);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          else{
            return Center(child: Text('Failed to load services'));
          }
        },
      ),
    );
  }
}

class ServiceItem extends StatelessWidget {
  final Service service;

  const ServiceItem({super.key, required this.service});

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
                color: Color(0xFFFA803C),
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Icon(
                Icons.ac_unit_rounded,
                color: Colors.white,
                size: 50,
              ), // Placeholder for the icon
            ),
            SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    service.agentEnglishName!,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  SizedBox(height: 8.0),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(serviceAgentDetailsRoute, arguments:service);
                    },
                    child: Container(
                      height: 30,
                      padding: EdgeInsets.fromLTRB(32, 10, 0, 0),
                      child: Text(
                        'Check Available Agents',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF12A770),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
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
