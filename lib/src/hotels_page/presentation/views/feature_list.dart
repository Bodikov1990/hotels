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
                    label: Text(feature),
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ))
              .toList()
          : [],
    );
  }
}
