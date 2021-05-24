import 'package:flutter/material.dart';

class ServiceDetailsMainCard extends StatelessWidget {
  final String title;
  final String speciality;

  ServiceDetailsMainCard(this.title, this.speciality);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.30,
      margin: const EdgeInsets.symmetric(horizontal: 37, vertical: 37),
      child: Card(
        elevation: 5,
        color: Color(0xff0F2735),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.4)),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(flex: 5, child: Image.asset('assets/Ellipse.png')),
                Flexible(
                  flex: 1,
                  child: Center(
                    child: Text(
                      title,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Center(
                    child: Text(
                      speciality,
                      style: TextStyle(
                          color: Color(0xff00A676),
                          fontWeight: FontWeight.w400,
                          fontSize: 16),
                    ),
                  ),
                )
              ]),
        ),
      ),
    );
  }
}