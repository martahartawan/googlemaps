import 'package:flutter/material.dart';
import 'package:googlemaps/screens/gotohospital_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hospital Google Maps"),
        centerTitle: true,
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (BuildContext context) {
                          return const SimpleMapScreen();
                        }));
                      },
                      child: Container(
                        padding: EdgeInsets.all(10.0),
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.asset("assets/images/hospital.png"),
                      ),
                    ),
                    SizedBox(height: 5),
                    Text("Go to Hospital", style: TextStyle(fontSize: 15))
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
