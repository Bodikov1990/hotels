import 'package:flutter/material.dart';

class BookingPriceWidget extends StatelessWidget {
  final String title;
  final String value;
  final Color? color;
  final FontWeight? fontWeight;

  const BookingPriceWidget({
    Key? key,
    required this.title,
    required this.value,
    this.color = Colors.black,
    this.fontWeight = FontWeight.w400,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width / 2 - 20;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Color(0xFF828796),
                    fontSize: 16,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w400,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            width: width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  value,
                  style: TextStyle(
                    color: color,
                    fontSize: 16,
                    fontFamily: 'SF Pro Display',
                    fontWeight: fontWeight,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
