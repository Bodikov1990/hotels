// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hotels/router/auto_routes.dart';
import 'package:hotels/src/hotels_page/data/models/hotel_model.dart';
import 'package:hotels/src/hotels_page/presentation/views/about_hotel_widget.dart';
import 'package:hotels/src/hotels_page/presentation/views/image_carousel_widget.dart';
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
        if (state is HotelsLoadingErrorState) {
          _showAlert(context: context, content: state.message);
        }
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
                      Container(
                        decoration: const ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(12),
                                bottomRight: Radius.circular(12)),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ImageCarousel(urlImages: hotel.images),
                              const SizedBox(
                                height: 16,
                              ),
                              _buildCategory(hotel),
                              const SizedBox(
                                height: 8,
                              ),
                              _buildHotelName(hotel),
                              const SizedBox(
                                height: 8,
                              ),
                              _buildHotelAddress(hotel),
                              const SizedBox(
                                height: 8,
                              ),
                              _buildHotelPrice(hotel)
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      AboutHotel(hotel: hotel),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: ElevatedButton(
                            onPressed: () {
                              AutoRouter.of(context)
                                  .push(RoomRoute(hotel: hotel));
                            },
                            child: const Text(
                              'К выбору номера',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: 'SF Pro Display',
                                fontWeight: FontWeight.w500,
                                height: 0.07,
                                letterSpacing: 0.10,
                              ),
                            )),
                      ),
                      const SizedBox(
                        height: 16,
                      )
                    ],
                  );
                },
              );
            }
            return const Center(
              child: Text("Что то пошло не так! Попробуйте позже!"),
            );
          },
        ),
      ),
    );
  }

  Row _buildHotelPrice(HotelModel hotel) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "от ${hotel.price ?? ''} ",
          style: const TextStyle(
            color: Colors.black,
            fontSize: 30,
            fontFamily: 'SF Pro Display',
            fontWeight: FontWeight.w600,
          ),
        ),
        const Text(
          "за тур с перелётом",
          style: TextStyle(
            color: Color(0xFF828796),
            fontSize: 16,
            fontFamily: 'SF Pro Display',
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Text _buildHotelAddress(HotelModel hotel) {
    return Text(
      hotel.address ?? '',
      style: const TextStyle(
        color: Color(0xFF0D72FF),
        fontSize: 14,
        fontFamily: 'SF Pro Display',
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Text _buildHotelName(HotelModel hotel) {
    return Text(
      hotel.name ?? '',
      style: const TextStyle(
        color: Colors.black,
        fontSize: 22,
        fontFamily: 'SF Pro Display',
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Container _buildCategory(HotelModel hotel) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
        decoration: ShapeDecoration(
          color: const Color(0x33FFC600),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset("assets/images/star.svg", width: 24, height: 24),
            const SizedBox(
              width: 4,
            ),
            Text(
              hotel.category ?? '',
              style: const TextStyle(
                color: Color(0xFFFFA800),
                fontSize: 16,
                fontFamily: 'SF Pro Display',
                fontWeight: FontWeight.w500,
                height: 0.07,
              ),
            ),
          ],
        ));
  }

  _showAlert({required BuildContext context, String? title, String? content}) {
    final content0 = content ?? '';
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: title != null
            ? Text(title, style: const TextStyle(fontWeight: FontWeight.w600))
            : null,
        content: Text(content0),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              AutoRouter.of(context).pop();
            },
            child: const Text(
              'Ок',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
