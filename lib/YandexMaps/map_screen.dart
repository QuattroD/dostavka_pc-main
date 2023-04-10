import 'dart:async';
import 'LocationModel.dart';
import 'app_location.dart';
import 'package:flutter/material.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class MapScreen extends StatefulWidget {
 const MapScreen({Key? key}) : super(key: key);

 @override
 State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final mapControllerCompleter = Completer<YandexMapController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 59, 74, 92),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 134, 145, 159),
        title: const Text('Select your position'),
        centerTitle: true,
      ),
      body: YandexMap(
        onMapCreated: (controller) {
          mapControllerCompleter.complete(controller);
          
          Future<void> moveToCurrentLocation(
            AppLatLong appLatLong,
          ) async {
            (await mapControllerCompleter.future).moveCamera(
              animation: const MapAnimation(type: MapAnimationType.linear, duration: 1),
              CameraUpdate.newCameraPosition(
                CameraPosition(
                  target: Point(
                    latitude: appLatLong.lat,
                    longitude: appLatLong.long,
                  ),
                  zoom: 12,
                ),
              ),
            );
          }

          Future<void> fetchCurrentLocation() async {
            AppLatLong location;
            const defLocation = KazanLocation();
            try {
              location = await LocationService().getCurrentLocation();
            } catch (_) {
              location = defLocation;
            }
            moveToCurrentLocation(location);
          }

          Future<void> initPermission() async {
          if (!await LocationService().checkPermission()) {
            await LocationService().requestPermission();
          }
          await fetchCurrentLocation();
          }       
          initPermission().ignore();
        }   
      ),
    ); 
  }
  @override
  void initState() {
    super.initState();
  }
}