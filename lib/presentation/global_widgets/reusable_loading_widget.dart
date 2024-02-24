import 'package:bus_tracking_application/core/constants/animation_constants.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ReusableLoadingWidget extends StatelessWidget {
  const ReusableLoadingWidget({super.key, this.isBlack = true});
  final bool isBlack;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        isBlack ? AnimationConstants.loadingBlackAnimation : AnimationConstants.loadingWhiteAnimation,
        height: 50,
        width: 50,
      ),
    );
  }
}
