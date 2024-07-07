import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_home_screen/domain/entities/AgentServiceResponseEntity.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../domain/entities/agentCalenderEntity.dart';
import '../../domain/useCase/AgentCalender_useCase.dart';
import '../../domain/useCase/agentServiceById_useCase.dart';
import '../../domain/useCase/getAgentServices_useCase.dart';
import '../../domain/useCase/service_useCase.dart';
import 'cubit/service_states.dart';
import 'cubit/service_view_model.dart';

class ServiceCalendarScreen extends StatefulWidget {
  const ServiceCalendarScreen({super.key});

  @override
  _ServiceCalendarScreenState createState() => _ServiceCalendarScreenState();
}

class _ServiceCalendarScreenState extends State<ServiceCalendarScreen> {
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  late DateTime fromDate;
  late DateTime toDate;
  // Default selected time slot
  ServiceScreenViewModel serviceViewModel = ServiceScreenViewModel(
    agentServiceUseCase: injectAgentServiceUseCase(),
    specificAgentServiceUseCase: injectSpecificAgentServiceUseCase(),
    serviceUseCase: injectServiceUseCase(), agentCalenderUseCase: injectAgentCalenderUseCase(),
  );

  @override
  void initState() {
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute
        .of(context)!
        .settings
        .arguments as Service;


    return BlocProvider(
        create: (context) => serviceViewModel..getAgentCalender(args.id!),
        child: BlocBuilder<ServiceScreenViewModel, ServiceStates>(
            builder: (context, state) {
              if (state is ServiceLoadingState) {
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
              else if (state is CalenderSuccessState) {
                fromDate = DateTime.parse(state.agentCalenderEntity.data!.first.fromDate!);
                toDate = DateTime.parse(state.agentCalenderEntity.data!.first.toDate!);
                return Scaffold(
                  appBar: AppBar(
                    title: Text('Pick A Time'),
                    leading: IconButton(
                      icon: Icon(Icons.arrow_back, color: Color(0xFF3DAB25)),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  body: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(12.0),
                            child: Image.asset(
                              'assets/images/doctor.png',
                              width: 92,
                              height: 92,
                            ),
                          ),
                          title: Text(
                            args.agentEnglishName!,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            '${args.serviceAgentfees} EG',
                            style: TextStyle(color: Color(0xFF3DAB25),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        TableCalendar(
                          calendarStyle: CalendarStyle(
                            selectedTextStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            todayTextStyle: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                            todayDecoration: BoxDecoration(
                              color: Colors.white,
                              // Set the background color to white
                              shape: BoxShape.circle,
                              // Make it circular
                              border: Border.all(
                                color: Colors.black,
                                // Set the border color to black
                                width: 1.0, // Set the border width (optional)
                              ),
                            ),
                            selectedDecoration: BoxDecoration(
                              color: Color(0xFF12A770),
                              shape: BoxShape.circle,
                            ),
                          ),

                          firstDay: fromDate,
                          lastDay: toDate,
                          focusedDay: _focusedDay,
                          selectedDayPredicate: (day) {
                            return isSameDay(_selectedDay, day);
                          },
                          onDaySelected: (selectedDay, focusedDay) {
                            setState(() {
                              _selectedDay = selectedDay;
                              _focusedDay = focusedDay;
                            });
                          },
                          headerStyle: HeaderStyle(
                            titleCentered: true,
                            formatButtonVisible: false,
                            titleTextStyle: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                        Container(
                          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: Text(
                            'Available Slots',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        SizedBox(height: 8),
                        // Wrap(
                        //   spacing: 9.0,
                        //   runSpacing: 9.0,
                        //   children: [
                            Expanded(
                              child: SizedBox(
                                height: 300, // Set a fixed height or use MediaQuery.of(context).size.height * 0.6 for 60% of the screen height, for example
                                child: ListView.builder(
                                  itemCount: serviceViewModel.agentServiceList?.length ?? 0,
                                  itemBuilder: (context, index) {
                                    return BuildTimeSlot(
                                      agent: serviceViewModel.agentCalenderList![index],
                                      initialSelectedTimeSlot: '4',
                                    );
                                  },
                                ),
                              ),
                          //   ),
                          //
                          //
                          // ],
                        ),
                        Spacer(),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              // Confirm date action
                            },
                            child: Text('CONFIRM DATE'
                              , style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF04895C),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 52, vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    14.0), // Control border radius here
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
              else {
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

class BuildTimeSlot extends StatefulWidget {
  final agentCalender agent;
  final String initialSelectedTimeSlot;

  const BuildTimeSlot({
    Key? key,
    required this.agent,
    required this.initialSelectedTimeSlot,
  }) : super(key: key);

  @override
  _BuildTimeSlotState createState() => _BuildTimeSlotState();
}

class _BuildTimeSlotState extends State<BuildTimeSlot> {
  late List<int> availableTimeSlots;
  late String selectedTimeSlot;

  @override
  void initState() {
    super.initState();
    selectedTimeSlot = widget.initialSelectedTimeSlot;
    availableTimeSlots = calculateAvailableTimeSlots(
      widget.agent.fromHour!,
      widget.agent.toHour!,
      widget.agent.slots!,
    );
  }

  List<int> calculateAvailableTimeSlots(int fromHour, int toHour, int slots) {
    List<int> slotsList = [];
    int currentHour = fromHour;

    while (currentHour <= toHour - slots + 1) {
      slotsList.add(currentHour);
      currentHour++;
    }
    print(slotsList);
    return slotsList;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: availableTimeSlots.map((hour) {
        bool isSelected = hour == int.parse(selectedTimeSlot);

        return Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: OutlinedButton(
            onPressed: () {
              setState(() {
                selectedTimeSlot = hour.toString();
              });
            },
            child: Text(
              hour.toString(),
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontSize: 22,
              ),
            ),
            style: OutlinedButton.styleFrom(
              backgroundColor: isSelected ? Color(0xFF12A770) : Colors.white,
              side: BorderSide(
                color: isSelected ? Color(0xFF12A770) : Colors.grey,
              ),
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
