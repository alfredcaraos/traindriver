import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:traintracker/sign in.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class TrackingPage extends StatefulWidget {
  const TrackingPage({Key? key}) : super(key: key);

  @override
  State<TrackingPage>createState() => _TrackingState();
}

class _TrackingState extends State<TrackingPage> {
  final TextEditingController _stationController = TextEditingController();
  final TextEditingController _directionController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _stationController.dispose();
    _directionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Flexible(
            child: SingleChildScrollView(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
            ),
          ),
          Flexible(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 50.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 30.0),
                          child: Row(
                            children: [
                              const Text(
                                'Tracking Module',
                                style: TextStyle(
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(width: 125.0), // Replace Spacer with SizedBox and adjust the width as needed
                              OutlinedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const SigninPage()),
                                  );
                                },
                                style: OutlinedButton.styleFrom(
                                  shape: const CircleBorder(),
                                  padding: const EdgeInsets.all(10.0),
                                  side: BorderSide.none, // Set the border side to none
                                ),
                                child: const Icon(
                                  IconData(0xf199, fontFamily: 'MaterialIcons'),
                                  size: 40.0,
                                  color: Colors.black,
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),
                      const Divider(
                        color: Colors.black,
                        height: 20.0,
                        thickness: 2.0,
                        indent: 20.0,
                        endIndent: 20.0,
                      ),
                      const SizedBox(height: 12.0),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 15.0),
                        padding: const EdgeInsets.symmetric(
                          vertical: 15.0,
                          horizontal: 15.0,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        child: Column(
                          children: [
                            Container(
                              height: 300,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(
                                  color: Colors.black,
                                  width: 1.0,
                                ),
                              ),
                              child: FlutterMap(
                                options: MapOptions(
                                  center: LatLng(14.5995, 120.9842), // Set the initial map center coordinates
                                  zoom: 13.0, // Set the initial zoom level
                                ),
                                layers: [
                                  TileLayerOptions(
                                    urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                                    subdomains: ['a', 'b', 'c'],
                                  ),
                                  MarkerLayerOptions(
                                    markers: [
                                      Marker(
                                        width: 80.0,
                                        height: 80.0,
                                        point: LatLng(14.5995, 120.9842), // Set the marker coordinates
                                        builder: (ctx) => const Icon(
                                          Icons.location_pin,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                            const Divider(
                              color: Colors.black,
                              height: 20.0,
                              thickness: 2.0,
                              indent: 0.0,
                              endIndent: 0.0,
                            ),
                            const SizedBox(height: 12.0),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: DropdownButtonFormField<String>(
                                decoration: const InputDecoration(
                                  labelText: 'Directions',
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.symmetric(
                                    vertical: 12.0,
                                    horizontal: 16.0,
                                  ),
                                ),
                                value: _directionController.text.isEmpty ? null : _directionController.text,
                                items: ['From Alabang to Tutuban', 'From Tutuban to Alabang'].map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    _directionController.text = newValue ?? '';
                                  });
                                },
                              ),
                            ),
                            const SizedBox(height: 16.0),
                          ],
                        ),
                      ),
                      const Divider(
                        color: Colors.black,
                        height: 20.0,
                        thickness: 2.0,
                        indent: 20.0,
                        endIndent: 20.0,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 15.0),
                        padding: const EdgeInsets.symmetric(
                          vertical: 15.0,
                          horizontal: 15.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 20.0),
                              child: const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Tracking Status:",
                                    style: TextStyle(fontSize: 24.0),
                                  ),
                                  SizedBox(height: 20.0),
                                  Text(
                                    "Current Location:",
                                    style: TextStyle(fontSize: 24.0),
                                  ),
                                  SizedBox(height: 20.0),
                                  Text(
                                    "Time Remaining:",
                                    style: TextStyle(fontSize: 24.0),
                                  ),
                                  SizedBox(height: 20.0),
                                  Text(
                                    "Time Arrival:",
                                    style: TextStyle(fontSize: 24.0),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 10.0),
                              child: const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Active",
                                    style: TextStyle(fontSize: 24.0),
                                  ),
                                  SizedBox(height: 20.0),
                                  Text(
                                    "Sample",
                                    style: TextStyle(fontSize: 24.0),
                                  ),
                                  SizedBox(height: 20.0),
                                  Text(
                                    "Sample",
                                    style: TextStyle(fontSize: 24.0),
                                  ),
                                  SizedBox(height: 20.0),
                                  Text(
                                    "Sample",
                                    style: TextStyle(fontSize: 24.0),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 15.0),
                        padding: const EdgeInsets.symmetric(
                          vertical: 15.0,
                          horizontal: 15.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () {

                              },
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 12.0,
                                  horizontal: 24.0,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                minimumSize: const Size(130.0, 0),
                                backgroundColor: Colors.amber,
                              ),
                              child: const Text(
                                'Start',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            const SizedBox(width: 40.0),
                          ],
                        ),
                      ),
                      const Divider(
                        color: Colors.black,
                        height: 20.0,
                        thickness: 2.0,
                        indent: 20.0,
                        endIndent: 20.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}