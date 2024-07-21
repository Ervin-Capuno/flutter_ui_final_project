import 'package:flutter/material.dart';
import 'package:skeleton_text/skeleton_text.dart';

class SkeletonLoader extends StatelessWidget {
  final bool isLoading;
  final Widget child;

  const SkeletonLoader({
    Key? key,
    required this.isLoading,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isLoading ? _buildSkeleton() : child;
  }

  Widget _buildSkeleton() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: SkeletonAnimation(
            child: Container(
              height: 20,
              width: 150,
              color: Colors.grey[300],
            ),
          ),
        ),
        Container(
          height: 300,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (context, index) {
              return SkeletonAnimation(
                child: Container(
                  width: 300,
                  margin: EdgeInsets.all(8.0),
                  color: Colors.grey[300],
                ),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: SkeletonAnimation(
            child: Container(
              height: 20,
              width: 150,
              color: Colors.grey[300],
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return SkeletonAnimation(
                child: Container(
                  height: 120,
                  margin: EdgeInsets.all(8.0),
                  color: Colors.grey[300],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
