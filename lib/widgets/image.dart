import 'package:flutter/material.dart';

class ProfileImageWidget extends StatelessWidget {
  final String? imageURl;
  final double? height;
  final double? width;
  const ProfileImageWidget({super.key,
    this.imageURl,
    this.height,
    this.width,
  })  ;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      height: height,
      width: width,
      child: Image(
        image: AssetImage(imageURl!),
        fit: BoxFit.cover,
      ),
    );
  }
}
