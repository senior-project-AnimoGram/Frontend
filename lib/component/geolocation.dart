import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

class Geolocation extends StatefulWidget {
  const Geolocation({Key? key}) : super(key: key);

  @override
  State<Geolocation> createState() => _GeolocationState();
}

class _GeolocationState extends State<Geolocation> {
  late GoogleMapController mapController;
  List<Marker> _markers = [];
  List<Marker> markers = [];

  LatLng? _currentPosition;

  bool _isLoading = true;
  late var jsonArray;

  @override
  void initState() {
    super.initState();
    getLocation();
    fetchData(); // 데이터 가져오기
  }

  Future<void> fetchData() async {
    var res = await http.get(Uri.parse("http://192.168.32.1:3000/users"));
    jsonArray = json.decode(res.body);

    for (var jsonData in jsonArray) {
      String lat = jsonData['lat'];
      String lng = jsonData['lng'];
      String name = jsonData['name'];
      String address = jsonData['address'];
      String tel = jsonData['tel'];
      String operatingTime = jsonData['operatingTime'];
      String str = '예약하기';

      Marker marker = Marker(
        markerId: MarkerId(lat),
        position: LatLng(double.parse(lat), double.parse(lng)),
        infoWindow: InfoWindow(
          title: name,
          snippet: str,
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(20),
      );
      markers.add(marker);
    }

    setState(() {
      _markers = markers;
    });
  }

  getLocation() async {
    LocationPermission permission;
    permission = await Geolocator.requestPermission();

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    double lat = position.latitude;
    double long = position.longitude;

    LatLng location = LatLng(lat, long);

    setState(() {
      _currentPosition = location;
      _isLoading = false;
    });
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 370.0,
      height: 220.0,
      child: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : GoogleMap(
              onMapCreated: _onMapCreated,
              mapType: MapType.terrain,
              initialCameraPosition: CameraPosition(
                target: _currentPosition!,
                zoom: 16.0,
              ),
              myLocationEnabled: true,
              markers: Set<Marker>.of(_markers),
            ),
    );
  }
}
