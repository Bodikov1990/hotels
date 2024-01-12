import 'package:flutter/material.dart';
import 'package:hotels/src/hotels_page/data/models/hotel_model.dart';
import 'package:hotels/src/hotels_page/presentation/views/fake_list.dart';
import 'package:hotels/src/hotels_page/presentation/views/feature_list.dart';

class AboutHotel extends StatelessWidget {
  const AboutHotel({
    super.key,
    required this.hotel,
  });

  final HotelModel hotel;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text('Об отеле',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontFamily: 'SF Pro Display',
                  fontWeight: FontWeight.w500)),
          const SizedBox(
            height: 16,
          ),
          FeaturesList(
            features: hotel.features,
          ),
          const SizedBox(
            height: 16,
          ),
          Text(hotel.description ?? '',
              style: TextStyle(
                color: Colors.black.withOpacity(0.8999999761581421),
                fontSize: 16,
                fontFamily: 'SF Pro Display',
                fontWeight: FontWeight.w400,
              )),
          const SizedBox(
            height: 16,
          ),
          const FakeList()
        ]),
      ),
    );
  }
}
