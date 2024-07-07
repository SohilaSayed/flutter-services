import 'package:flutter/material.dart';
import 'package:flutter_home_screen/screens/AgentService/setaSchedule.dart';
import 'package:flutter_home_screen/widgets/icon_card.dart';


class ServiceDetailsScreen extends StatefulWidget {
  @override
  _ServiceDetailsScreen createState() => _ServiceDetailsScreen();
}

class _ServiceDetailsScreen extends State<ServiceDetailsScreen> {

  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:PreferredSize(
        preferredSize: Size.fromHeight(211.0), // Set your custom height here
        child: ClipRRect(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20.0), // Set your custom border radius here
          ),
          child: AppBar(
            backgroundColor: Color(0xFFFABE3C),
            title: Text('Service Details'
              ,style: TextStyle(fontSize: 24,color: Colors.white),),
            leading: IconButton(
              icon: Icon(Icons.arrow_back,color: Colors.white,),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            actions: [
              GestureDetector(
                onTap: (){},
                child: Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
                  child: Image.asset(
                    'assets/images/save.png',
                    // fit: BoxFit.cover,
                    width: 36,
                    height: 36,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16,0,16,0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 295,
                    height: 60,
                    padding: EdgeInsets.fromLTRB(15, 5, 5, 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                        color: Color(0xFF979797)
                      ),]
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding:EdgeInsets.fromLTRB(0, 0, 15, 0),
                          child:
                          Text('Check available dates'),

                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ServiceCalendarScreen()),
                            );                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF12A770),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7.0),
                            ),
                            elevation: 5,
                            padding: EdgeInsets.symmetric(horizontal: 7, vertical: 0),
                          ),
                          child: Text('Set a schedule',
                            style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 12),),
                        ),
                      ],
                    ),

                  ),


                ],
              ),
              Text(
                'New electricity cable booking',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconCard(icon:Icons.location_on, color: Color(0xFF00C853), label: '',),
                  SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Gala Convention Center'),
                      Text('36 Guild Street London, UK', style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                ],
              ),
              // SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconCard(icon : Icons.bolt, color: Color(0xFFFFA726), label: '',),
                  SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Electricity and power co.'),
                      Text('Organizer', style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                ],
              ),
              Text(
                'About Service',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
              ),
              SizedBox(height: 8),
              // Text(
              //   'Enjoy your favorite dishe and a lovely your friends and family and have a great time. '
              //       'Food from local food trucks will be available for purchase. Read More...',
              //   style: TextStyle(color: Colors.grey),
              // ),
              _isExpanded
                  ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Enjoy your favorite dishe and a lovely your friends and family and have a great time. '
                        'Food from local food trucks will be available for purchase. Read More...',
                    style: TextStyle(color: Colors.grey),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isExpanded = false;
                      });
                    },
                    child: Text(
                      'Show Less',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              )
                  : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Enjoy your favorite dishe and a lovely your friends and family and have a great time. '
                        'Food from local food trucks will be available for purchase. Read More...',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.grey),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isExpanded = true;
                      });
                    },
                    child: Text(
                      'Show More',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 17),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Book service action
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF12A770),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 57, vertical: 16),
                  ),
                  child: Text('BOOK SERVICE', style: TextStyle(fontSize: 16,color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
