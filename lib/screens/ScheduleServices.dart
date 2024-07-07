import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_home_screen/screens/scheduleServiceDetails.dart';

class ScheduleServicesScreen extends StatelessWidget {
  const ScheduleServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
          'Scheduled Services',
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
                    icon: Icon(Icons.filter_list_outlined, color: Colors.white ,),
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
              child: ListView(
                children: List.generate(3, (index) => ServiceItem()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ServiceItem extends StatelessWidget {
  const ServiceItem({super.key});

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
                color: Color(0XFFFABE3C),
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
                    'National ID booking',
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),
                  ),
                  SizedBox(height: 8.0,),

                  GestureDetector(
                    onTap: (){

                    },
                    child:
                        GestureDetector(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ServiceDetailsScreen()),
                            );
                          },
                          child: Container(
                            height: 30,
                            padding: EdgeInsets.fromLTRB(82,10, 0, 0),
                            child:  Text(
                              textAlign: TextAlign.center,
                              'Check Details',
                              style: TextStyle(color: Color(0xFF12A770),fontWeight: FontWeight.w500),
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
