import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';

import '../utils/colors.dart';
import '../widgets/commonWidgets/commonWidgets.dart';

class LocationMapProvider extends ChangeNotifier {
  late GoogleMapController _googleMapController;

  GoogleMapController get googleMapController => _googleMapController;

  LatLng _pickUpMarkerPosition = const LatLng(28.6263287, 77.3774035);
  LatLng get pickUpMarkerPosition => _pickUpMarkerPosition;

  LatLng _currentMarkerLocation = const LatLng(28.6263287, 77.3774035);
  LatLng get currentMarkerLocation => _currentMarkerLocation;

  List<PlacesSearchResult> _searchAddressList = [];
  List<PlacesSearchResult> get searchAddressList => _searchAddressList;

  final TextEditingController _searchController = TextEditingController();
  TextEditingController get searchController => _searchController;

  String _currentAddress = "";
  String get currentAddress => _currentAddress;

  String _street = "";
  String get street => _street;

  String _subLocality = "";
  String get subLocality => _subLocality;

  String _locality = "";
  String get locality => _locality;

  String _district = "";
  String get district => _district;

  String _postalCode = "";
  String get postalCode => _postalCode;

  String _state = "";
  String get state => _state;

  String _country = "";
  String get country => _country;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  startLoader(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  setCurrentAddress(String value) {
    _currentAddress = value;
    notifyListeners();
  }

  setStreet(String value) {
    _street = value;
    notifyListeners();
  }

  setSubLocality(String value) {
    _subLocality = value;
    notifyListeners();
  }

  setLocality(String value) {
    _locality = value;
    notifyListeners();
  }

  setGoogleController(GoogleMapController controller) {
    _googleMapController = controller;
    notifyListeners();
  }

  setDistrict(String value) {
    _district = value;
    notifyListeners();
  }

  setPostalCode(String value) {
    _postalCode = value;
    notifyListeners();
  }

  setState(String value) {
    _state = value;
    notifyListeners();
  }

  setCountry(String value) {
    _country = value;
    notifyListeners();
  }

  clearSearchAddressList() {
    _searchAddressList.clear();
    notifyListeners();
  }

  setPickUpMarkerPosition(LatLng newPosition) {
    _pickUpMarkerPosition = newPosition;
    notifyListeners();
  }

  setSearchAddressList(List<PlacesSearchResult> value) {
    _searchAddressList = value;
    notifyListeners();
  }

  Future<void> determinePositionNew() async {
    startLoader(true);
    bool serviceEnabled;
    LocationPermission permission;
    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      startLoader(false);
      customToast(msg: "Enable Location service", color: primaryDark);
      Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      startLoader(false);
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Geolocator.openLocationSettings();
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      startLoader(false);
      Geolocator.openLocationSettings();
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    var location = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
    List<Placemark> placeMark =
        await placemarkFromCoordinates(location.latitude, location.longitude);
    Placemark place = placeMark[0];
    String address =
        '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.administrativeArea},${place.country}';
    setCurrentAddress(address);
    setStreet(place.street.toString());
    setSubLocality(place.subLocality.toString());
    setLocality(place.locality.toString());
    setPostalCode(place.postalCode.toString());
    setState(place.administrativeArea.toString());
    setCountry(place.country.toString());
    setPickUpMarkerPosition(LatLng(location.latitude, location.longitude));
    _currentMarkerLocation = LatLng(location.latitude, location.longitude);
    notifyListeners();
    startLoader(false);
  }

  moveMarkerToNewPosition(LatLng newPosition) {
    clearSearchAddressList();
    setPickUpMarkerPosition(newPosition);
    _googleMapController.moveCamera(CameraUpdate.newLatLng(newPosition));
    notifyListeners();
    getAddressFromPosition(newPosition);
  }

  searchAddress(search) async {
    final places =
        GoogleMapsPlaces(apiKey: 'AIzaSyDj3cT9n9bW6AJOZohaDJNb3cTn2gCYjlY');
    PlacesSearchResponse response = await places.searchByText(search);

    clearSearchAddressList();
    log(response.results.toString());
    if (response.errorMessage == null) {
      setSearchAddressList(response.results);
    } else {
      log('${response.errorMessage}');
    }
    places.dispose();
    ChangeNotifier();
  }

  getAddressFromPosition(LatLng position) async {
    startLoader(true);
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placemarks.isNotEmpty) {
        Placemark placemark = placemarks.first;
        String address =
            '${placemark.street}, ${placemark.subLocality}, ${placemark.locality}, ${placemark.administrativeArea}, ${placemark.country}, ${placemark.postalCode}';
        setCurrentAddress(address);
      }
    } catch (e) {
      rethrow;
    }
    startLoader(false);
  }
}
