import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rest_api_assignment_ostad/Services/api_fetch.dart';
import 'package:rest_api_assignment_ostad/Views/HomeScreen/home_screen_list_layout.dart';

import '../../Controllers/data_controller.dart';
import '../../Models/photo_model.dart';
import '../../Utils/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late DataController dataController;
  List<PhotoModel> photoModel = [];

  @override
  void initState() {
    dataController = DataController(ApiFetch());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(firstAppbarTitle),
      ),
      body: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          return Container(
            margin: const EdgeInsets.all(5.00),
            child: Column(
              children: [
                FutureBuilder(
                  future: dataController.loadPhotos(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      photoModel = snapshot.data!;
                      return Visibility(
                        visible: photoModel.isNotEmpty &&
                            !dataController.isErrorOccurred,
                        replacement: Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: SvgPicture.asset(
                                  errorImage,
                                  height: MediaQuery.of(context).size.height * 0.4,
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                              const SizedBox(height: 10,),
                              const Text(errorMessage),
                            ],
                          ),
                        ),
                        child: Expanded(
                          child: ListView.separated(
                            itemCount: photoModel.length,
                            itemBuilder: (BuildContext context, int index) {
                              return HomeScreenListLayout(
                                  orientation: orientation,
                                  photoModel: photoModel,
                                  index: index);
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return const SizedBox(
                                height: 10,
                              );
                            },
                          ),
                        ),
                      );
                    }
                    return const Center(
                      child: LinearProgressIndicator(),
                    );
                  },
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
