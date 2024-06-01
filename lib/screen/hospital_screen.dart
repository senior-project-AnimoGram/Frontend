import 'dart:convert';
import 'package:anipet/component/top_search_bar.dart';
import 'package:anipet/const/baseurl.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:geocoding/geocoding.dart';

class HospitalScreen extends StatefulWidget {
  const HospitalScreen({Key? key}) : super(key: key);

  @override
  State<HospitalScreen> createState() => _HospitalScreenState();
}

class _HospitalScreenState extends State<HospitalScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10.0,
        ),
        TopSearchBar(),
        _UserMapInfoState(),
        SizedBox(
          height: 15.0,
        ),
      ],
    );
  }
}

class _UserMapInfoState extends StatefulWidget {
  const _UserMapInfoState({Key? key}) : super(key: key);

  @override
  State<_UserMapInfoState> createState() => _UserMapInfoStateState();
}

class _UserMapInfoStateState extends State<_UserMapInfoState> {
  late GoogleMapController mapController;
  List<Marker> _markers = [];

  LatLng? _currentPosition;

  late var jsonArray;
  late var selectedHospital;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    _fetchAndSetMarkers();
  }

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  void setHospital(var name) {
    setState(() {
      selectedHospital = name;
    });
  }

  void _getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    setState(() {
      _currentPosition = LatLng(position.latitude, position.longitude);
    });
  }
  Future<void> _fetchAndSetMarkers() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/getAddress'));

      if (response.statusCode == 200) {
        final List<dynamic> addressesWithEmotion = json.decode(response.body);

        for (var addressData in addressesWithEmotion) {
          String address = addressData['address'];
          String emotion = addressData['emotion'];
          print('Fetched address: $address, Emotion: $emotion');

          LatLng? coordinates = await _getCoordinatesFromAddress(address);
          if (coordinates != null) {
            // Determine marker icon based on emotion
            BitmapDescriptor markerIcon;
            if (emotion == 'happy') {
              markerIcon = BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow);
            } else if (emotion == 'sad') {
              markerIcon = BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue);
            } else if(emotion == 'relaxed'){
              markerIcon = BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet);
            }else{
              markerIcon = BitmapDescriptor.defaultMarker;
            }

            // Add marker to the map with custom icon
            setState(() {
              _markers.add(
                Marker(
                  markerId: MarkerId(address),
                  position: coordinates,
                  infoWindow: InfoWindow(title: address),
                  icon: markerIcon,
                ),
              );
            });
          }
        }
      } else {
        print('Failed to load addresses');
      }
    } catch (e) {
      print('Error fetching addresses: $e');
    }
  }



  Future<LatLng?> _getCoordinatesFromAddress(String address) async {
    try {
      List<Location> locations = await locationFromAddress(address);
      if (locations.isNotEmpty) {
        Location location = locations.first;
        return LatLng(location.latitude, location.longitude);
      } else {
        print('No coordinates found for address: $address');
      }
    } catch (e) {
      print('Error getting coordinates: $e');
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500.0,
      child: _currentPosition == null
          ? Center(child: CircularProgressIndicator())
          : GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _currentPosition!,
          zoom: 14.0,
        ),
        markers: Set<Marker>.of(_markers),
      ),
    );
  }
}
