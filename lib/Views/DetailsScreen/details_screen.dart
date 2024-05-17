import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rest_api_assignment_ostad/Models/detail_page_model.dart';
import 'package:rest_api_assignment_ostad/Utils/constants.dart';

class DetailsScreen extends StatefulWidget {
  final DetailPageModel detailPageModel;

  const DetailsScreen({super.key, required this.detailPageModel});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(secondAppbarTitle),
      ),
      body: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          return Container(
            width: double.infinity,
            height: double.infinity,
            margin: const EdgeInsets.all(5.00),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.00),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: (orientation == Orientation.portrait)? MediaQuery.of(context).size.height * 0.08 : 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: (orientation == Orientation.portrait) ? MediaQuery.of(context).size.height * 0.45 : MediaQuery.of(context).size.height * 0.91,
                          width: (orientation == Orientation.portrait) ? MediaQuery.of(context).size.width * 0.91 : MediaQuery.of(context).size.width * 0.45,
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: FastCachedImage(
                              url: widget.detailPageModel.photoModel.thumbnailUrl,
                              fit: BoxFit.fill,
                              fadeInDuration: const Duration(seconds: 1),
                              loadingBuilder: (context,progress){
                                return CircularProgressIndicator(value: progress.progressPercentage.value,);
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Wrap(
                      children: [
                        Text(
                          "Title: ${widget.detailPageModel.photoModel.title}",
                          style: const TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Wrap(
                          children: [
                            Text(
                              "ID: ${widget.detailPageModel.photoModel.id}",
                              style: const TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },

      ),
    );
  }
}
