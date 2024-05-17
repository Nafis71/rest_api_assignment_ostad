import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../Models/detail_page_model.dart';
import '../../Models/photo_model.dart';
import '../../Utils/routes.dart';

class HomeScreenListLayout extends StatelessWidget {
  final Orientation orientation;
  final List<PhotoModel> photoModel;
  final int index;

  const HomeScreenListLayout(
      {super.key,
      required this.orientation,
      required this.photoModel,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: ListTile(
        leading: SizedBox(
          height: (orientation == Orientation.portrait)
              ? MediaQuery.of(context).size.height * .1
              : MediaQuery.of(context).size.height * 0.2,
          width: (orientation == Orientation.portrait)
              ? MediaQuery.of(context).size.width * .15
              : MediaQuery.of(context).size.height * 0.2,
          child: CircleAvatar(
            radius: 50,
            child: InkWell(
              splashColor: Colors.transparent,
              onTap: () {
                Navigator.pushNamed(context, Routes.detailsScreen,
                    arguments: DetailPageModel(photoModel[index], index));
              },
              child: FastCachedImage(
                url: photoModel[index].thumbnailUrl,
                fit: BoxFit.cover,
                fadeInDuration: const Duration(milliseconds: 500),
                loadingBuilder: (context, progress) {
                  return const CircularProgressIndicator();
                },
              ),
            ),
          ),
        ),
        title: Text(
          photoModel[index].title,
          textAlign: TextAlign.justify,
        ),
      ),
    );
  }
}
