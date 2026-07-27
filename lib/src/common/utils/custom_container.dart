import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    this.onTap,
    this.height,
    this.width,
    this.color,
    this.boxShadow,
    this.padding,
    this.boxConstraints,
    this.borderRadius,
    this.borderColor,
    this.borderWidth,
    this.child,
    this.margin,
    this.image,
    this.onLongPress,
    this.gradient,
    this.swipedown,
  });
  final Gradient? gradient;
  final EdgeInsets? margin;
  final BoxConstraints? boxConstraints;
  final EdgeInsets? padding;
  final Color? color;
  final Widget? child;
  final double? borderRadius;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final double? width;
  final double? height;
  final double? borderWidth;
  final Color? borderColor;
  final List<BoxShadow>? boxShadow;
  final DecorationImage? image;
  final Function(DragUpdateDetails)? swipedown;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: onLongPress,
      onVerticalDragUpdate: swipedown,
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        constraints: boxConstraints,
        padding: padding,
        margin: margin,
        decoration: BoxDecoration(
          gradient: gradient,
          image: image,
          boxShadow: boxShadow,
          border: Border.all(
            color: borderColor ?? Colors.transparent,
            width: borderWidth ?? 0,
          ),
          color: color,
          borderRadius: BorderRadius.circular(borderRadius ?? 0),
        ),
        child: child,
      ),
    );
  }
}

class GradientText extends StatelessWidget {
  const GradientText(this.text, {this.style});

  final String text;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) {
        return LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.yellow,
            Colors.yellow,
            Colors.orange,
            Colors.orange,
            Colors.orange,
          ], // Example gradient colors
        ).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height));
      },
      // shaderCallback: (bounds) => gradient.createShader(
      //   Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      // ),
      child: Text(text, style: style),
    );
  }
}

List<BoxShadow> boxShadowMethod({
  double colorOpacity = 0.1,
  double offsetX = 0,
  double offsetY = 0,
  double blurRadius = 10.0,
  double spreadRadius = 0.0,
  Color? color,
}) {
  return [
    BoxShadow(
      color: color ?? Colors.black.withOpacity(colorOpacity),
      offset: Offset(offsetX, offsetY),
      spreadRadius: spreadRadius,
      blurRadius: blurRadius,
    ),
  ];
}
