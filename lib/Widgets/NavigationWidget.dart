import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:freelance_booking_app/Providers/navigationProvider.dart';
import 'package:freelance_booking_app/Screens/AllServices.dart';
import 'package:freelance_booking_app/Screens/Home.dart';
import 'package:freelance_booking_app/Widgets/myDrawer.dart';
import 'package:freelance_booking_app/Screens/MyBookings.dart';
import 'package:provider/provider.dart';

class BottomNavBar extends StatefulWidget {
  final User user;
  BottomNavBar({this.user});
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  bool isLoading = true;
  bool showUserForm = false;
  String name = "";

  _fetchUserData() async {
    try {
      await FirebaseFirestore.instance
          .collection("Users")
          .doc(widget.user.uid)
          .get()
          .then((doc) {
        if (doc.exists) {
          setState(() {
            isLoading = false;
          });
        } else {
          setState(() {
            showUserForm = true;
            isLoading = false;
          });
        }
      });
    } catch (e) {
      print(e.toString());
    }
    setState(() {});
  }

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    _fetchUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final navigator = Provider.of<NavigationProvider>(context);
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    final widgetNavigator = navigator.widgetIndex;
    void openthisEndDrawer() {
      _scaffoldKey.currentState.openEndDrawer();
    }
    // final List<Widget> _children = [Home(openthisEndDrawer), Home(openthisEndDrawer), AllSerives()];

    // final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    final List<Widget> _children = [
      Home(openthisEndDrawer),
      MyBooking(),
      AllSerives()
    ];

    return isLoading
        ? Scaffold(
            body: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [CircularProgressIndicator()],
              ),
            ),
          ))
        : showUserForm
            ? Scaffold(
                body: SafeArea(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.42,
                      child: AlertDialog(
                        content: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Enter Your Name'),
                              SizedBox(height: 20),
                              TextFormField(
                                  decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.all(10),
                                      hintText: 'Name',
                                      fillColor: Colors.white,
                                      filled: true,
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xFF0F2735))),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xFF0F2735)))),
                                  validator: (val) =>
                                      val.isEmpty ? 'Enter Your Name' : null,
                                  onChanged: (val) {
                                    setState(() => name = val);
                                  }),
                              SizedBox(height: 25),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.3,
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    backgroundColor: Color(0xFF0F2735),
                                  ),
                                  child: Text(
                                    'Continue',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 20),
                                  ),
                                  onPressed: () async {
                                    if (_formKey.currentState.validate()) {
                                      await FirebaseFirestore.instance
                                          .collection("Users")
                                          .doc(widget.user.uid)
                                          .set({
                                        "name": name,
                                        "image": ""
                                      }).whenComplete(() {
                                        setState(() {
                                          isLoading = false;
                                          showUserForm = false;
                                        });
                                      });
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
              )
            : MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
                child: Scaffold(
                    key: _scaffoldKey,
                    endDrawer: Mydrawer(),
                    body: _children[widgetNavigator],
                    bottomNavigationBar: Container(
                      padding: EdgeInsets.all(0),
                      color: Color(0xff5D5FEF),
                      height: 56,
                      width: 400,
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Positioned(
                            bottom: 0,
                            right: 0,
                            left: 0,
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 60),
                              height: 56,
                              width: 400,
                              decoration: BoxDecoration(
                                color: Color(0xff5D5FEF),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      navigator.changeWidgetIndex(0);
                                    },
                                    child: Icon(Icons.home_outlined,
                                        size: 30, color: Colors.white),
                                  ),
                                  InkWell(
                                      onTap: () {
                                        navigator.changeWidgetIndex(2);
                                      },
                                      child: Icon(
                                          Icons.medical_services_outlined,
                                          size: 30,
                                          color: Colors.white))
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            top: -20,
                            left: 100,
                            right: 100,
                            child: SizedBox(
                              height: 60,
                              width: 60,
                              child: FittedBox(
                                child: FloatingActionButton(
                                  backgroundColor: Color(0xFF0F2735),
                                  onPressed: () {
                                    navigator.changeWidgetIndex(1);
                                  },
                                  child: Icon(Icons.calendar_today,
                                      size: 30, color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
              );
  }
}
