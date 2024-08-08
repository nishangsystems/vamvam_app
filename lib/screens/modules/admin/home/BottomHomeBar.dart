// ignore_for_file: unused_field, prefer_final_fields
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vam_vam/providers/bannerProvider.dart';
import 'package:vam_vam/providers/roleProvider.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/imageResources.dart';
import '../../../../widgets/commonWidgets/commonWidgets.dart';
import 'HomeScreen.dart';

class AdminBottomHomeBar extends StatefulWidget {
  const AdminBottomHomeBar({Key? key}) : super(key: key);

  @override
  State<AdminBottomHomeBar> createState() => _AdminBottomHomeBarState();
}

class _AdminBottomHomeBarState extends State<AdminBottomHomeBar> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
    // const CalendarScreen(),
    // const MeetingScreen(),
    // const CalendarScreen()
    /* Screen44(),
    Screen45(),
    Screen46(),
    Screen7(),*/
  ];

  @override
  void initState() {
    super.initState();
    // _init();
    // Provider.of<AuthProvider>(context, listen: false).getDeviceToken();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryDark,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(appBarHeight),
          child: homeAppbar(
              context: context,
              profileImage: ImageResources.profileImage,
              name: 'deepak',
              location: 'H 106')),
      body: Center(
        child: _widgetOptions.elementAt(0),
      ),

      // bottomNavigationBar: BottomNavigationBar(
      //     backgroundColor: Colors.blue[800],
      //     items: const <BottomNavigationBarItem>[
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.home),
      //         label: 'Hom',
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.search),
      //         label: 'Search',
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.people),
      //         label: 'Menu',
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.timelapse_outlined),
      //         label: 'History',
      //       ),
      //     ],
      //     type: BottomNavigationBarType.fixed,
      //     currentIndex: 0,
      //     selectedItemColor: Colors.white,
      //     unselectedItemColor: Colors.white,
      //     iconSize: 20,
      //     onTap: _onItemTapped,
      //     elevation: 0),
    );
  }

  _init() {
    var banner = Provider.of<BannerProvider>(context, listen: false);
    var role = Provider.of<RoleProvider>(context, listen: false);

    banner.getBanner(role.roleType, context);
  }
}
