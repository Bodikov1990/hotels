import 'package:flutter/material.dart';

class FeaturesList extends StatelessWidget {
  final List<String>? features;

  const FeaturesList({
    Key? key,
    this.features,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      runSpacing: 8.0,
      children: features != null
          ? features!
              .map((feature) => Chip(
                    side: const BorderSide(
                        color: Color.fromARGB(255, 255, 255, 255), width: 0),
                    label: Text(
                      feature,
                      style: const TextStyle(
                        color: Color(0xFF828796),
                        fontSize: 16,
                        fontFamily: 'SF Pro Display',
                        fontWeight: FontWeight.w500,
                        height: 0.07,
                      ),
                    ),
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ))
              .toList()
          : [],
    );
  }
}
