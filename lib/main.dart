import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stop_watch/Provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider<TimeCounter>(
        create: (context) => TimeCounter(),
        child: StopWatchScreen(),
      ),
    );
  }
}

class StopWatchScreen extends StatelessWidget {
  const StopWatchScreen({Key key}) : super(key: key);
  final Watch controller = Watch.Play;
  @override
  Widget build(BuildContext context) {
    var listner = Provider.of<TimeCounter>(context);
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //=========================== Widget for showing the time
            Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.transparent,
                border: Border.all(
                  width: 1,
                  color: Colors.red,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 2,
                    height: 10,
                    color: Colors.red,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 10,
                        height: 2,
                        color: Colors.red,
                      ),
                      Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.transparent,
                          border: Border.all(
                            width: 1,
                            color: Colors.red,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "${listner.hour} : ${listner.minute} : ${listner.seconed}",
                            style: TextStyle(fontSize: 30),
                          ),
                        ),
                      ),
                      Container(
                        width: 10,
                        height: 2,
                        color: Colors.red,
                      ),
                    ],
                  ),
                  Container(
                    width: 2,
                    height: 10,
                    color: Colors.red,
                  ),
                ],
              ),
            ),
            //=========================== End
            SizedBox(
              height: 100,
            ),
            //=========================== Controlle Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //====================== Play \ Stop Butoon
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.transparent,
                    border: Border.all(
                      width: 1,
                      color: Colors.red,
                    ),
                  ),
                  child: Center(
                    child: IconButton(
                      icon: Icon(listner.icon, color: Colors.black),
                      onPressed: () {
                        if (listner.controller == Watch.Play) {
                          listner.play = Timer.periodic(
                            Duration(seconds: 1),
                            (time) {
                              listner.changeTime();
                            },
                          );
                        } else
                          listner.stop();
                        (listner.controller == Watch.Play)
                            ? listner.changeController = Watch.Stop
                            : listner.changeController = Watch.Play;
                      },
                    ),
                  ),
                ),
                //====================== Rest Button
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.transparent,
                    border: Border.all(
                      width: 1,
                      color: Colors.red,
                    ),
                  ),
                  child: Center(
                    child: IconButton(
                      icon: Icon(
                        Icons.stop,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        listner.rest();
                        listner.stop();
                        listner.changeController = Watch.Play;
                      },
                    ),
                  ),
                ),
              ],
            ),
            //=========================== End
          ],
        ),
      ),
    );
  }
}
