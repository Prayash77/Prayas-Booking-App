import 'package:flutter/material.dart';
import 'package:freelance_booking_app/Screens/ServiceDetailsMedical.dart';
import 'package:freelance_booking_app/Screens/CalanderScreen.dart';
import 'package:freelance_booking_app/Widgets/ServiceDetailsCenterCard.dart';
import 'package:freelance_booking_app/Widgets/ServiceListMainCard.dart';




class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Container(
        child: new SingleChildScrollView(
          child:Column(
            children: <Widget>[
                  SizedBox(height: 100.0,),
                  Container(
                    child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Services Provided',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        )
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  Container(
                    margin: new EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            CircleAvatar(
                                radius: 32,
                                backgroundImage: AssetImage('assets/doctor 3.png')
                            ),
                            SizedBox(height: 10.0,),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(4.0)),
                                border: Border.all(color: Color(0xFF5D5FEF)),
                                color: Colors.white,
                              ),
                              height: 25.0,
                              width: 65.0,
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Doctors',
                                  style: TextStyle(
                                      color: Color(0xFF5D5FEF),
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            CircleAvatar(
                                radius: 32,
                                backgroundImage: AssetImage('assets/Group 30.png')
                            ),
                            SizedBox(height: 10.0,),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(4.0)),
                                border: Border.all(color: Color(0xFF5D5FEF)),
                                color: Colors.white,
                              ),
                              height: 25.0,
                              width: 65.0,
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Parlour',
                                  style: TextStyle(
                                      color: Color(0xFF5D5FEF),
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            CircleAvatar(
                                radius: 32,
                                backgroundImage: AssetImage('assets/Group 32.png')
                            ),
                            SizedBox(height: 10.0,),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(4.0)),
                                border: Border.all(color: Color(0xFF5D5FEF)),
                                color: Colors.white,
                              ),
                              height: 25.0,
                              width: 65.0,
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Salon',
                                  style: TextStyle(
                                      color: Color(0xFF5D5FEF),
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.0,),
                  SizedBox(height: 30),
                  Container(
                    margin: new EdgeInsets.symmetric(horizontal: 20.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                      'Services Near By',
                      style: TextStyle(
                          color: Color(0xFF5D5FEF),
                          fontWeight: FontWeight.bold,
                          fontSize: 22.0
                      ),
                    ),
                    ),
                  ),
                  SizedBox(height: 20),
                  ServiceListMainCard(),
                  SizedBox(height: 15),
                  ServiceListMainCard(),
                  SizedBox(height: 15),
                  ServiceListMainCard()
            ],
          ),
        ),
      )
    );
  }
}







class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

  int _currentIndex=0;
  final List<Widget> _children=[
    Home(),
    ServiceDetailsMedical(),
    CalanderScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.white,
        backgroundColor: Colors.blueAccent,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            title: Text('Services'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            title: Text('Bookings'),
          ),
        ],
        onTap: (index){
          setState(() {
            _currentIndex=index;
          });
        },
      ),
    );
  }
}
