import 'dart:convert';

import 'package:anipet/component/hospital_component.dart';
import 'package:anipet/component/top_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

class HospitalScreen extends StatefulWidget {
  const HospitalScreen({Key? key}) : super(key: key);

  @override
  State<HospitalScreen> createState() => _HospitalScreenState();
}

class _HospitalScreenState extends State<HospitalScreen> {
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        SizedBox(
          height: 10.0,
        ),
        TopSearchBar(),
        _UserMapInfoState(),
        SizedBox(
          height: 15.0,
        ),
        HospitalList(),
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
  List<Marker> markers = [];

  LatLng? _currentPosition;

  bool _isLoading = true;
  late var jsonArray;
  late var selectedHospital;

  @override
  void initState() {
    super.initState();
    getLocation();
    fetchData(); // 데이터 가져오기
  }

  void setHospital(var name) {
    selectedHospital = name;
  }

  Future<void> fetchData() async {
    var res = await http.get(Uri.parse("http://192.168.32.1:3000/users"));
    jsonArray = json.decode(res.body);

    for (var jsonData in jsonArray) {
      String lat = jsonData['lat'];
      String lng = jsonData['lng'];
      String name = jsonData['hospital_name'];
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

    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
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
      height: 200.0,
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

class HospitalList extends StatelessWidget {
  const HospitalList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child:  Column(
          children: [
            HospitalComponent(
              hospitalName: '에코특수동물병원',
              hospitalAddress: '서울 송파구 동남로 161 청공빌딩 101호',
              hospitalTel: '02-443-2222',
              operationHours: '09:30 - 17:00',
            ),
            SizedBox(
              height: 15.0,
            ),
            HospitalComponent(
              hospitalName: '아크리스동물의료센터',
              hospitalAddress: '서울 강남구 봉은사로104길 10 아이큐타워 3층',
              hospitalTel: '02-583-7582',
              operationHours: '10:00 - 19:00',
            ),
            SizedBox(
              height: 15.0,
            ),
            HospitalComponent(
              hospitalName: '가람동물병원',
              hospitalAddress: '경기 고양시 일산동구 강석로 156 선경상가 101호',
              hospitalTel: '031-906-0976',
              operationHours: '10:00 - 19:00',
            ),
            SizedBox(
              height: 15.0,
            ),
            HospitalComponent(
              hospitalName: '파우동물병원',
              hospitalAddress: '경기 용인시 수지구 현암로 125번길 6 그린프라자 105호',
              hospitalTel: '031-898-0330',
              operationHours: '10:00 - 20:00',
            ),
            SizedBox(
              height: 15.0,
            ),
            HospitalComponent(
              hospitalName: '24시 휴동물의료센터',
              hospitalAddress: '경기도 용인시 성남시 수정구 성산대로 309 2층',
              hospitalTel: '031-735-7582',
              operationHours: '00:00 - 24:00',
            ),
            // ㅈㅓㄴ화번호
            //운영시간
            SizedBox(
              height: 15.0,
            ),
            HospitalComponent(
              hospitalName: '24시 폴동물병원',
              hospitalAddress: '경기 성남시 분당구 성남대로 385 102호 ',
              hospitalTel: '0507-1393-7558',
              operationHours: '00:00 - 24:00',
            ),
            SizedBox(
              height: 15.0,
            ),
          ],
        ),
      ),
    );
  }
}
