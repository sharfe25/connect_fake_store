import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoaderWidget extends StatelessWidget {
  const LoaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SpinKitRotatingCircle(
      color: Color(0xFFBB86FC),
      size: 50.0,
    );
  }
}
