import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('Fade Out SVG'),
      ),
      body: Center(
        child: FadeOutSVG(),
      ),
    ),
  ));
}
class FadeOutSVG extends StatefulWidget {
  @override
  _FadeOutSVGState createState() => _FadeOutSVGState();
}

class _FadeOutSVGState extends State<FadeOutSVG> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  double opacity = 1.0;
  @override
  void initState() {
    super.initState();

    // Create the animation controller
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
    );

    // Create the fade animation
    _fadeAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(_animationController);

    // Start the animation
    _animationController.forward();
  }

  @override
  void dispose() {
    // Dispose the animation controller
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        setState(() {
          opacity = 0.0;
        });
      },
      child: AnimatedOpacity(
        opacity: opacity,
        curve: Curves.easeOut,
        duration: Duration(milliseconds: 600),
        child: SvgPicture.asset(
          'assets/material-symbols_sos.svg', // Replace with your SVG image path
          width: 200,
          height: 200,
        ),
      ),
    );
  }
}
