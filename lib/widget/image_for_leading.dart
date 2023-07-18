import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ImageForLeading extends HookConsumerWidget {
    final String imageUrl;
  const ImageForLeading({super.key, required this.imageUrl});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      child: imageUrl == ''
          ? const SizedBox(
              height: 50,
              width: 50, //MediaQuery.of(context).size.width / 8,
              child: CircleAvatar(
                  //radius: MediaQuery.of(context).size.width / 4,
                  child: Icon(Icons.newspaper)
                ),
            )
          : CachedNetworkImage(
              imageUrl: imageUrl,
              height: 50,
              width: 50,
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    )),
              ),
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
    );
  }
}