import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Photo extends StatelessWidget {
  final String url;
  final int radius;
  final BoxFit fit;
  final double width, height;
  final GestureTapCallback? onTap;
  final bool isLocal;
  final bool isSvg;
  const Photo({
    Key? key,
    this.url = "https://via.placeholder.com/150x200",
    this.radius = 15,
    this.fit = BoxFit.cover,
    this.onTap,
    this.width = 200,
    this.height = 200,
    this.isLocal = false,
    this.isSvg = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(double.parse(radius.toString())),
        child: GestureDetector(
          onTap: onTap,
          child: isLocal
              ? (isSvg
                  ? SvgPicture.asset(
                      url,
                      fit: BoxFit.contain,
                      width: width,
                      height: height,
                    )
                  : Image.asset(
                      url,
                      fit: BoxFit.contain,
                      width: width,
                      height: height,
                    ))
              : CachedNetworkImage(
                  width: width,
                  height: width,
                  imageUrl: url,
                  useOldImageOnUrlChange: true,
                  fadeInCurve: Curves.easeIn,
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                        fit: fit,
                      ),
                    ),
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
        ),
      ),
    );
  }
}
