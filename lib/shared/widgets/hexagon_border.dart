import 'package:artsays_app/constants/svg_asset_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HexagonBorder extends StatelessWidget {
  final Widget child;
  final double size;
  final Color borderColor;
  final double strokeWidth;

  const HexagonBorder({
    super.key,
    required this.child,
    this.size = 35,
    this.borderColor = Colors.white,
    this.strokeWidth = 1,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: AlignmentGeometry.center,
        children: [
          SvgPicture.asset(
            SvgImageAssetConstant.polygon,
            width: size,
            height: size,
          ),
          child,
        ],
      ),
    );
  }
}
