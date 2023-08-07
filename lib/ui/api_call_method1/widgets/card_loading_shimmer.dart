import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CardLoadingShimmer extends StatelessWidget {
  const CardLoadingShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      direction: ShimmerDirection.btt,
      period: const Duration(milliseconds: 1000),
      child: ListView(
        children: List.generate(
          4,
          (index) => Container(
            margin: const EdgeInsets.all(15),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            height: MediaQuery.of(context).size.height / 4,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white,
            ),
            // child: Row(
            //   children: [
            //     Container(
            //       height: 50,
            //       color: Colors.white,
            //       width: 50,
            //     ),
            //     Expanded(
            //       child: Column(
            //         children: [
            //           Container(
            //             height: 15,
            //             color: Colors.white,
            //             width: double.infinity,
            //             margin:
            //                 EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            //           ),
            //           Container(
            //             height: 15,
            //             width: double.infinity,
            //             color: Colors.white,
            //             margin:
            //                 EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            //           )
            //         ],
            //       ),
            //     ),
            //   ],
            // ),
          ),
        ),
      ),
    );
  }
}
