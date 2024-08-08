import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:vam_vam/providers/AuthProvider.dart';
import 'package:vam_vam/providers/myCalendarProvider.dart';
import 'package:vam_vam/providers/toDoProvider.dart';
import 'package:vam_vam/screens/loader/loaderOverlay.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/imageResources.dart';
import '../../../../utils/paddingConstant.dart';
import '../../../../widgets/commonWidgets/commonWidgets.dart';

class CreateToDoScreen extends StatefulWidget {
  const CreateToDoScreen({super.key});

  @override
  State<CreateToDoScreen> createState() => _CreateToDoScreenState();
}

class _CreateToDoScreenState extends State<CreateToDoScreen> {
  final TextEditingController descriptionController = TextEditingController();
  String? descriptionError;

  setDescriptionError(String? value) {
    setState(() {
      descriptionError = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer3<ToDoProvider, AuthProvider, MyCalendarProvider>(
      builder: (context, todo, auth, myCalendar, child) => LoadingOverlay(
        isLoading: todo.isLoading,
        child: Scaffold(
            backgroundColor: primaryDark,
            appBar: PreferredSize(
                preferredSize: Size.fromHeight(appBarHeight),
                child: homeAppbar(
                    context: context,
                    profileImage: ImageResources.profileImage,
                    name: 'deepak',
                    location: 'H 106')),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          commonBackButton(
                              context: context, title: '', backBtnColor: white),
                          const SizedBox(width: 10),
                          const Text("Create To Do",
                              style: TextStyle(
                                fontSize: 17,
                                color: white,
                                fontWeight: FontWeight.w500,
                              )),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
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
                                border:
                                    Border.all(color: white.withOpacity(0.1)),
                                color: white),
                            child: TextFormField(
                              controller: descriptionController,
                              maxLines: null,
                              expands: true,
                              style: TextStyle(fontSize: 12),
                              keyboardType: TextInputType.multiline,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  setDescriptionError("ToDo can't be empty");
                                } else {
                                  setDescriptionError(null);
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                counterText: '',
                                hintText: 'Write Your ToDo',
                                errorStyle: TextStyle(color: errorColor),
                                hintStyle: TextStyle(
                                    color: black.withOpacity(0.4),
                                    fontSize: 12),
                                border: InputBorder.none,
                                errorBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                focusedErrorBorder: InputBorder.none,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          commonButtonWhite(
                              width: double.infinity,
                              bgColors: [Colors.red, Colors.red],
                              title: 'Create',
                              txtColor: white,
                              fontSize: 12,
                              onTap: () {
                                if (descriptionController.text.isNotEmpty) {
                                  todo.startLoader(true);
                                  todo
                                      .createToDo(
                                          executiveId: auth.getUserId(),
                                          message: descriptionController.text
                                              .toString()
                                              .trim())
                                      .then((value) {
                                    todo.startLoader(false);
                                    if (value.isSuccess) {
                                      todo.getToDo(
                                          executiveId: auth.getUserId(),
                                          filterDate: myCalendar.mySelectedDate
                                              .toString()
                                              .split(' ')[0]);
                                      successToast(msg: value.message);
                                      context.pop();
                                    } else {
                                      errorToast(msg: value.message);
                                    }
                                  });
                                } else {
                                  setDescriptionError('To Do can not be empty');
                                }
                              }),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
