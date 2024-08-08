import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vam_vam/helpers/dialogHelper.dart';
import 'package:vam_vam/helpers/enumHelper.dart';
import 'package:vam_vam/providers/roleProvider.dart';
import '../../helpers/responsiveHelper.dart';
import '../../utils/colors.dart';
import '../../widgets/commonWidgets/commonWidgets.dart';
import '../../widgets/commonWidgets/textStyle.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<RoleProvider>(
      builder: (context, role, child) => Scaffold(
        backgroundColor: primaryDark,
        body: SafeArea(
            top: false,
            child: Column(
              children: [
                appBarHeaderContainer(
                    context: context, title: 'Setting', color: black),
                SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Column(
                    children: [
                      // Container(
                      //   width: ResponsiveHelper.width(context),
                      //   decoration: BoxDecoration(
                      //     boxShadow: [
                      //       BoxShadow(
                      //         color: Colors.white.withOpacity(0.4),
                      //         offset: const Offset(-6.0, -6.0),
                      //         blurRadius: 16.0,
                      //       ),
                      //       BoxShadow(
                      //         color: black.withOpacity(0.1),
                      //         offset: const Offset(6.0, 6.0),
                      //         blurRadius: 16.0,
                      //       ),
                      //     ],
                      //     color: white,
                      //     borderRadius: BorderRadius.circular(12.0),
                      //   ),
                      //   child: ListTile(
                      //       leading: Icon(
                      //         Icons.settings,
                      //         color: black,
                      //         size: 26,
                      //       ),
                      //       title: Text('Language',
                      //           style: commonTextStyle14(color: black)),
                      //       trailing: const Icon(Icons.arrow_forward_ios)),
                      // ),
                      SizedBox(
                        height: 15,
                      ),
                      if (role.roleType == getRoleType(RoleEnum.student)) ...[
                        GestureDetector(
                          onTap: () =>
                              showDeleteAccountDialog(context: context),
                          child: Container(
                            width: ResponsiveHelper.width(context),
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white.withOpacity(0.4),
                                  offset: const Offset(-6.0, -6.0),
                                  blurRadius: 16.0,
                                ),
                                BoxShadow(
                                  color: black.withOpacity(0.1),
                                  offset: const Offset(6.0, 6.0),
                                  blurRadius: 16.0,
                                ),
                              ],
                              color: white,
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: ListTile(
                                leading: Icon(
                                  Icons.delete_rounded,
                                  color: black,
                                  size: 26,
                                ),
                                title: Text('Delete Account',
                                    style: commonTextStyle14(color: black)),
                                trailing: const Icon(Icons.arrow_forward_ios)),
                          ),
                        ),
                      ],
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}
