import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ServiceListSalon extends StatelessWidget {
  final service;
  ServiceListSalon({this.service});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(service.image), fit: BoxFit.cover),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Flexible(flex: 5, child: Container()),
          Flexible(
            flex: 11,
            child: Container(
              decoration: BoxDecoration(
                  color: Color(0xff0F2735),
                  borderRadius: BorderRadius.circular(10)),
              margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              height: 130,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    Icon(
                      CupertinoIcons.location,
                      color: Colors.green,
                    ),
                    Text(service.location,
                        style: TextStyle(
                            color: Colors.green,
                            fontSize: 15,
                            fontWeight: FontWeight.w400))
                  ]),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(
                        CupertinoIcons.scissors,
                        size: 20,
                        color: Colors.white,
                      ),
                      Text(service.salonName,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 18)),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.14,
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5)),
                        child: Text('\u{2B50}   4.4',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12)),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [
                        Icon(
                          CupertinoIcons.clock,
                          color: Color(0xff5D5FEF),
                        ),
                        Text('Visiting hour',
                            style: TextStyle(
                              color: Colors.white,
                            ))
                      ]),
                      Text('10:00 AM - 5:00PM',
                          style: TextStyle(color: Color(0xff00A676)))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [
                        Icon(
                          Icons.wb_sunny,
                          color: Color(0xff5D5FEF),
                        ),
                        Text('Days', style: TextStyle(color: Colors.white)),
                      ]),
                      Text('MON-THU',
                          style: TextStyle(color: Color(0xff00A676)))
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}