// ignore_for_file: unrelated_type_equality_checks
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:vam_vam/data/model/params/RepAppointmentModelParams.dart';
import 'package:vam_vam/helpers/dateTimeHelper.dart';
import 'package:vam_vam/providers/AuthProvider.dart';
import 'package:vam_vam/providers/appointmentProvider.dart';
import 'package:vam_vam/screens/loader/loaderOverlay.dart';

import '../../../../../helpers/responsiveHelper.dart';
import '../../../../../utils/colors.dart';
import '../../../../../utils/imageResources.dart';
import '../../../../../utils/paddingConstant.dart';
import '../../../../../widgets/commonWidgets/commonWidgets.dart';
import '../../../../../widgets/commonWidgets/customTextFormField.dart';
import '../../helpers/regexHelper.dart';

class RepBookAppointmentScreen extends StatefulWidget {
  const RepBookAppointmentScreen({super.key});

  @override
  State<RepBookAppointmentScreen> createState() =>
      _RepBookAppointmentScreenState();
}

class _RepBookAppointmentScreenState extends State<RepBookAppointmentScreen> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController selectedDateController = TextEditingController();
  final TextEditingController startTimeController = TextEditingController();
  final TextEditingController endTimeController = TextEditingController();
  final TextEditingController reasonController = TextEditingController();

  DateTime? selectedDate;
  TimeOfDay? startTime;
  TimeOfDay? endTime;
  String? reason;
  String? descriptionError;
  bool isLoading = false;

  setDescriptionError(String? value) {
    setState(() {
      descriptionError = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<AuthProvider, AppointmentProvider>(
      builder: (context, auth, data, child) => Scaffold(
          backgroundColor: primaryDark,
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(appBarHeight),
              child: homeAppbar(
                  context: context,
                  profileImage: ImageResources.profileImage,
                  name: 'deepak',
                  location: 'H 106')),
          body: LoadingOverlay(
            isLoading: isLoading,
            child: SafeArea(
              top: false,
              child: SingleChildScrollView(
                  child: Padding(
                padding: const EdgeInsets.only(
                    left: PaddingConstant.l,
                    right: PaddingConstant.l,
                    top: PaddingConstant.xxl),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: ResponsiveHelper.height(context) * 0.01),
                      Row(
                        children: [
                          commonBackButton(
                              context: context, title: '', backBtnColor: white),
                          const SizedBox(width: 10),
                          const Text("Book An Appointment",
                              style: TextStyle(
                                fontSize: 16,
                                color: white,
                                fontWeight: FontWeight.w500,
                              )),
                        ],
                      ),
                      SizedBox(height: 20),

                      // Select Date
                      customTextFormField2(
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Image.asset(
                            IconResource.calenderIcon,
                            height: 16,
                            width: 16,
                          ),
                        ),
                        isRead: true,
                        controller: selectedDateController,
                        title: 'Date',
                        color: black,
                        textRegex: addressReg,
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate:
                                  DateTime.now().add(Duration(days: 1)),
                              firstDate: DateTime.now().add(Duration(days: 1)),
                              lastDate:
                                  DateTime.now().add(Duration(days: 365 * 10)));

                          if (pickedDate != null) {
                            String formattedDate =
                                DateFormat('yyyy-MM-dd').format(pickedDate);

                            setState(() {
                              selectedDateController.text = formattedDate;
                            });
                          }
                        },
                      ),
                      SizedBox(height: 15),

                      // Start Time
                      customTextFormField2(
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Image.asset(
                            IconResource.clockIcon,
                            height: 16,
                            width: 16,
                          ),
                        ),
                        isRead: true,
                        controller: startTimeController,
                        title: 'Start Time',
                        color: black,
                        textRegex: addressReg,
                        onTap: () => selectTime(context, isStartTime: true),
                      ),
                      SizedBox(height: 15),

                      customTextFormField5(
                        textRegex: addressReg,
                        controller: reasonController,
                        title: 'Reason for Appointment',
                        //length: 100,
                        color: black,
                        keyboardType: TextInputType.text,
                      ),
                      SizedBox(height: 20),
                      Container(
                        alignment: Alignment.topLeft,
                        padding: const EdgeInsets.all(PaddingConstant.xs),
                        height: 200,
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8)),
                            boxShadow: const [
                              BoxShadow(blurRadius: 2.0, color: white),
                            ],
                            border: Border.all(color: white.withOpacity(0.1)),
                            color: white),
                        child: TextFormField(
                          controller: descriptionController,
                          maxLines: null,
                          expands: true,
                          style: TextStyle(fontSize: 12),
                          keyboardType: TextInputType.multiline,
                          validator: (value) {
                            if (value!.isEmpty) {
                              setDescriptionError("Description can't be empty");
                            } else {
                              setDescriptionError(null);
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            counterText: '',
                            hintText: 'Additional Notes/Comments description',
                            errorStyle: TextStyle(color: errorColor),
                            hintStyle: TextStyle(fontSize: 12),
                            border: InputBorder.none,
                            errorBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            focusedErrorBorder: InputBorder.none,
                          ),
                        ),
                      ),

                      if (descriptionError != null) ...[
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "   ${descriptionError!}",
                          style: TextStyle(color: errorColor, fontSize: 12),
                        )
                      ],

                      SizedBox(height: 90),
                      commonButtonWhite(
                          width: double.infinity,
                          bgColors: [Colors.red, Colors.red],
                          title: 'Submit',
                          txtColor: white,
                          fontSize: 12,
                          onTap: () {
                            setState(() {
                              isLoading = true;
                            });
                            // for representative/executive booking
                            if (formKey.currentState!.validate()) {
                              // data.startLoader(true);

                              RepAppointmentModelData
                                  repAppointmentModelParams =
                                  RepAppointmentModelData(
                                executiveId: auth.getUserId(),
                                appointmentDate: selectedDateController.text
                                    .toString()
                                    .split(" ")[0],
                                description:
                                    descriptionController.text.toString(),
                                reason: reasonController.text.toString(),
                                appointmentTime: DateTimeHelper()
                                    .convertTo24HourFormat(
                                        startTimeController.text),
                              );

                              data
                                  .repBookAppointment(
                                      repAppointmentModelParams, context)
                                  .then((value) {
                                setState(() {
                                  isLoading = false;
                                });
                                data.startLoader(false);
                                if (value.isSuccess) {
                                  successToast(msg: value.message);
                                  data.repGetAppointment;
                                  context.pop();
                                } else {
                                  errorToast(msg: value.message);
                                }
                              });
                            } else {
                              setState(() {
                                isLoading = false;
                              });
                            }
                          }),
                      SizedBox(height: 30),
                    ],
                  ),
                ),
              )),
            ),
          )),
    );
  }

  Future<void> selectTime(BuildContext context,
      {bool isStartTime = true}) async {
    final picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (isStartTime) {
      if (picked != null && picked != startTime) {
        if (endTime != null) {
          if (timeOfDayToDouble(endTime!) < timeOfDayToDouble(picked) ||
              timeOfDayToDouble(endTime!) == timeOfDayToDouble(picked)) {
            errorToast(msg: 'Please Select Valid Time');
          } else {
            setState(() {
              startTime = picked;
              startTimeController.text = picked.format(context).toString();
            });
          }
        } else {
          setState(() {
            startTime = picked;
            startTimeController.text = picked.format(context).toString();
          });
        }
      }
    } else {
      if (picked != null && picked != endTime) {
        if (startTime != null) {
          if (timeOfDayToDouble(startTime!) > timeOfDayToDouble(picked) ||
              timeOfDayToDouble(startTime!) == timeOfDayToDouble(picked)) {
            errorToast(msg: 'Please Select Valid Time');
          } else {
            setState(() {
              endTime = picked;
              endTimeController.text = picked.format(context).toString();
            });
          }
        } else {
          setState(() {
            endTime = picked;
            endTimeController.text = picked.format(context).toString();
          });
        }
      }
    }
  }

  double timeOfDayToDouble(TimeOfDay tod) => tod.hour + tod.minute / 60.0;
}
