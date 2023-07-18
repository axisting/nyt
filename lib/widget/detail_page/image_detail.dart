import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mediaprobe/constant/general_constants.dart';

class ImageForDetailPage extends HookConsumerWidget {
  final String url;
  const ImageForDetailPage({super.key, required this.url});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return newsImage(url, context);
  }

  Widget newsImage(String imageUrl, BuildContext context) {
    double imgHeight = MediaQuery.of(context).size.height / 3;
    double imgWidth = MediaQuery.of(context).size.width;

    //ImageSource? imageSource;
    return Center(
        child: imageUrl == ''
            ? const SizedBox()
            : CachedNetworkImage(
                imageUrl: imageUrl,
                height: imgHeight,
                width: imgWidth,
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius:
                          BorderRadius.circular(GeneralConstant.borderRadius),
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      )),
                ),
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ));
  }
}
