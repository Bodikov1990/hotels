// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:hotels/src/hotels_page/presentation/bloc/hotels_bloc.dart';

@RoutePage()
class HotelsPage extends StatefulWidget {
  const HotelsPage({super.key});

  @override
  State<HotelsPage> createState() => _HotelsPageState();
}

class _HotelsPageState extends State<HotelsPage> {
  final _hotelsBloc = HotelsBloc();

  @override
  void initState() {
    super.initState();
    _hotelsBloc.add(HotelsLoadingEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HotelsBloc, HotelsState>(
      bloc: _hotelsBloc,
      listener: (context, state) {
        // TODO: implement listener
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Отель'),
          centerTitle: true,
        ),
        body: BlocBuilder<HotelsBloc, HotelsState>(
          bloc: _hotelsBloc,
          builder: (context, state) {
            if (state is HotelsLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is HotelsLoadedState) {
              return ListView.builder(
                itemCount: state.hotels.length,
                itemBuilder: (context, index) {
                  final hotel = state.hotels[index];
                  return Column(
                    children: [
                      ImageCarousel(urlImages: hotel.images),
                    ],
                  );
                },
              );
            } else if (state is HotelsLoadingErrorState) {
              const Center(
                child: Text("Что то пошло не так!"),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}

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
            height: 250,
            autoPlay: true,
            enableInfiniteScroll: false,
            autoPlayAnimationDuration: const Duration(seconds: 2),
            enlargeCenterPage: true,
            onPageChanged: (index, reason) =>
                setState(() => activeIndex = index),
          ),
        ),
        Positioned(
          bottom:
              10, // Вы можете изменить это значение, чтобы настроить положение индикатора
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
                // maxVisibleDots: 5,
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
