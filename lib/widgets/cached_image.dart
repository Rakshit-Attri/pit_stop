import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedImage extends StatefulWidget {
  String imageUrl;
  BoxFit? fit;
  double? shimmerSize;
  double? height;
  double? width;
  BorderRadiusGeometry borderRadius;

  CachedImage({
    super.key,
    required this.imageUrl,
    this.fit,
    this.shimmerSize,
    this.height,
    this.width,
    this.borderRadius = BorderRadius.zero,
  });

  @override
  State<CachedImage> createState() => _MyCachedNetworkWidgetState();
}

class _MyCachedNetworkWidgetState extends State<CachedImage> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: widget.borderRadius,
      child: CachedNetworkImage(
        height: widget.height,
        width: widget.width ?? double.maxFinite,
        imageUrl: widget.imageUrl,
        placeholder: (a, b) {
          return LayoutBuilder(builder: (_, d) {
            return Container(
              height:
                  widget.height ?? (d.maxHeight.isInfinite ? 250 : d.maxHeight),
              width: widget.width ?? (d.maxWidth.isInfinite ? 250 : d.maxWidth),
              color: Colors.grey[300],
            );
          });
        },
        fit: widget.fit ?? BoxFit.cover,
        errorWidget: (context, url, error) {
          return CachedNetworkImage(
            width: widget.width,
            height: widget.height,
            imageUrl:
                "https://firebasestorage.googleapis.com/v0/b/panda-af5f0.appspot.com/o/noImagePlaceholder.png?alt=media&token=f916e3dc-5afd-4650-8753-6e6e5aae0546",
            fit: BoxFit.cover,
          );
        },
      ),
    );
  }
}
