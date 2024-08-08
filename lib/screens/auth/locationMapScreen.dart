import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:vam_vam/helpers/enumHelper.dart';
import 'package:vam_vam/providers/addComplaintProvider.dart';
import 'package:vam_vam/providers/locationMapProvider.dart';
import 'package:vam_vam/providers/roleProvider.dart';
import 'package:vam_vam/screens/loader/loaderOverlay.dart';
import '../../utils/colors.dart';
import '../../utils/constant.dart';
import '../../utils/fontConstant.dart';
import '../../utils/paddingConstant.dart';
import '../../utils/stringResources.dart';
import '../../widgets/commonWidgets/appDesign.dart';
import '../../widgets/commonWidgets/commonWidgets.dart';

class LocationMapScreen extends StatefulWidget {
  final String locator;
  const LocationMapScreen({super.key, required this.locator});

  @override
  State<LocationMapScreen> createState() => _LocationMapScreenState();
}

class _LocationMapScreenState extends State<LocationMapScreen> {
  @override
  void initState() {
    super.initState();
    // Provider.of<LocationMapProvider>(context, listen: false)
    //     .determinePositionNew();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Consumer<LocationMapProvider>(
        builder: (context, location, child) => LoadingOverlay(
              isLoading: location.isLoading,
              child: Scaffold(
                resizeToAvoidBottomInset: false,
                body: SafeArea(
                  child: Stack(children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.only(left: 16, right: 16),
                          child: commonBackButton(
                              context: context,
                              title: '',
                              backBtnColor: backButton),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 8, right: 8, top: 10),
                          child: Text('What’s your location?',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500)),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                            left: 8,
                            right: 8,
                          ),
                          child: Text('We need your location',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: black,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 50,
                            alignment: Alignment.center,
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            // margin: const EdgeInsets.only(
                            //     left: 16, right: 16, top: 10),
                            decoration: textFieldDecoration,
                            child: Center(
                              child: TextField(
                                keyboardType: TextInputType.streetAddress,
                                textInputAction: TextInputAction.done,
                                controller: location.searchController,
                                decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Search Location',
                                    hintStyle: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w300),
                                    prefixIcon:
                                        Icon(Icons.search_sharp, size: 22)),
                                onChanged: (value) =>
                                    location.searchAddress(value),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            location.googleMapController.animateCamera(
                                CameraUpdate.newCameraPosition(CameraPosition(
                              target: location.currentMarkerLocation,
                              tilt: 50,
                              zoom: 19.5,
                            )));
                            location.setPickUpMarkerPosition(
                                location.currentMarkerLocation);
                            location.determinePositionNew();
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 6),
                              // height: 20,
                              width: 160,
                              decoration: BoxDecoration(
                                  color: grey.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Row(
                                children: [
                                  Icon(Icons.location_on,
                                      color: primaryDark, size: 14),
                                  Text('Use my current location',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          color: black,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400)),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Stack(
                          children: [
                            SizedBox(
                              height: height * 0.47,
                              child: GoogleMap(
                                mapType: MapType.hybrid,
                                onMapCreated: (GoogleMapController controller) {
                                  location.setGoogleController(controller);
                                },
                                initialCameraPosition: CameraPosition(
                                  target: location.pickUpMarkerPosition,
                                  zoom: 15,
                                ),
                                zoomGesturesEnabled: true,
                                onTap: (coordinate) =>
                                    location.moveMarkerToNewPosition(LatLng(
                                        coordinate.latitude,
                                        coordinate.longitude)),
                                markers: {
                                  Marker(
                                    markerId: const MarkerId('marker_01'),
                                    position: location.pickUpMarkerPosition,
                                    draggable: false,
                                  ),
                                },
                              ),
                            ),
                            if (location.searchAddressList.isNotEmpty) ...[
                              Positioned(
                                top: -25,
                                child: Container(
                                  margin: const EdgeInsets.all(14),
                                  padding: const EdgeInsets.all(16),
                                  height: height * 0.3,
                                  width: MediaQuery.of(context).size.width - 28,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.white,
                                  ),
                                  child: ListView.builder(
                                      itemCount:
                                          location.searchAddressList.length,
                                      itemBuilder: (context, index) {
                                        return GestureDetector(
                                          onTap: () =>
                                              location.moveMarkerToNewPosition(
                                            LatLng(
                                                location
                                                    .searchAddressList[index]
                                                    .geometry!
                                                    .location
                                                    .lat,
                                                location
                                                    .searchAddressList[index]
                                                    .geometry!
                                                    .location
                                                    .lng),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 10),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                    '${location.searchAddressList[index].formattedAddress}'),
                                              ],
                                            ),
                                          ),
                                        );
                                      }),
                                ),
                              )
                            ],
                          ],
                        ),
                        bottomSec('Current Location')
                      ],
                    ),
                  ]),
                ),
              ),
            ));
  }

  Widget bottomSec(String title) {
    return Consumer3<LocationMapProvider, RoleProvider, AddComplaintProvider>(
      builder: (context, location, role, complaint, child) => Padding(
        padding: const EdgeInsets.all(PaddingConstant.m),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              title,
              style: const TextStyle(
                  color: Color(0xff3F434A), fontSize: FontConstant.s),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(Icons.location_on, size: 18),
                const SizedBox(width: 10),
                Flexible(
                  child: Text(
                    location.currentAddress,
                    maxLines: 2,
                    style: const TextStyle(
                        color: Color(0xff09051C),
                        fontWeight: FontWeight.w500,
                        overflow: TextOverflow.ellipsis),
                  ),
                )
              ],
            ),
            SizedBox(height: 20),
            commonButton(
                width: width,
                onTap: () {
                  if (widget.locator == '1') {
                    complaint.setAdressController(location.currentAddress);
                    complaint
                        .setLat('${location.pickUpMarkerPosition.latitude}');
                    complaint
                        .setLng('${location.pickUpMarkerPosition.longitude}');
                    context.pop();
                  } else {
                    if (role.roleType == getRoleType(RoleEnum.student)) {
                      context.push(userBottomHomeBar);
                    } else if (role.roleType == getRoleType(RoleEnum.parent)) {
                      context.push(adminBottomHomeBar);
                    } else if (role.roleType == getRoleType(RoleEnum.teacher)) {
                      context.push(represantativeBottomHomeBar);
                    } else {
                      context.push(represantativeBottomHomeBar);
                    }
                  }
                },
                child: const Text(
                  StringResources.continueText,
                  style: TextStyle(
                      fontSize: FontConstant.m,
                      fontWeight: FontWeight.w600,
                      color: white),
                ))
          ],
        ),
      ),
    );
  }
}
