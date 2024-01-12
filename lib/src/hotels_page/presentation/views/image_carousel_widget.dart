import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImageCarousel extends StatefulWidget {
  final List<String>? urlImages;
  const ImageCarousel({
    Key? key,
    this.urlImages,
  }) : super(key: key);

  @override
  State<ImageCarousel> createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  int activeIndex = 0;
  final CarouselController controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CarouselSlider.builder(
          carouselController: controller,
          itemCount: widget.urlImages?.length ?? 0,
          itemBuilder: (context, index, realIndex) {
            final urlImage = widget.urlImages?[index];
            return ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image.network(urlImage ?? '', fit: BoxFit.cover),
            );
          },
          options: CarouselOptions(
            aspectRatio: 16 / 9,
            viewportFraction: 1.0,
            autoPlay: false,
            enableInfiniteScroll: false,
            disableCenter: true,
            autoPlayAnimationDuration: const Duration(seconds: 2),
            enlargeCenterPage: true,
            onPageChanged: (index, reason) =>
                setState(() => activeIndex = index),
          ),
        ),
        Positioned(
          bottom: 10,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(6))),
            child: AnimatedSmoothIndicator(
              activeIndex: activeIndex,
              count: widget.urlImages?.length ?? 0,
              effect: const ScrollingDotsEffect(
                activeStrokeWidth: 1.5,
                activeDotScale: 1.3,
                radius: 8,
                spacing: 10,
                dotHeight: 12,
                dotWidth: 12,
                activeDotColor: Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
