// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hotels/core/utils/constants.dart';
import 'package:hotels/router/auto_routes.dart';
import 'package:hotels/src/hotels_page/data/models/hotel_model.dart';
import 'package:hotels/src/hotels_page/presentation/views/widgets/feature_list.dart';
import 'package:hotels/src/hotels_page/presentation/views/widgets/image_carousel_widget.dart';

import 'package:hotels/src/room_page/data/models/room_model.dart';
import 'package:hotels/src/room_page/presentation/bloc/room_bloc.dart';

@RoutePage()
class RoomPage extends StatefulWidget {
  final HotelModel hotel;
  const RoomPage({
    Key? key,
    required this.hotel,
  }) : super(key: key);

  @override
  State<RoomPage> createState() => _RoomPageState();
}

class _RoomPageState extends State<RoomPage> {
  final _roomBloc = RoomBloc();

  @override
  void initState() {
    super.initState();
    _roomBloc.add(RoomLoadingEvent(hotel: widget.hotel));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RoomBloc, RoomState>(
      bloc: _roomBloc,
      builder: (context, state) {
        if (state is RoomLoadingState) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is RoomLoadedState) {
          return Scaffold(
              appBar: AppBar(
                title: Text(state.hotel.name ?? ''),
                centerTitle: true,
              ),
              body: ListView.builder(
                itemCount: state.hotel.toRoomModel().length,
                itemBuilder: (context, index) {
                  final room = state.hotel.toRoomModel()[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Container(
                      decoration: const ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ImageCarousel(urlImages: room.images),
                            const SizedBox(
                              height: 16,
                            ),
                            _buildRoomName(room),
                            const SizedBox(
                              height: 13,
                            ),
                            FeaturesList(
                              features: room.features,
                            ),
                            const SizedBox(
                              height: 13,
                            ),
                            _fakeAboutRoom(),
                            const SizedBox(
                              height: 20,
                            ),
                            _buildPrice(room),
                            const SizedBox(
                              height: 20,
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  AutoRouter.of(context).push(BookingRoute(
                                      hotel: state.hotel, room: room));
                                },
                                child: const Text(
                                  chooseRoom,
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
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ));
        }
        return Container();
      },
    );
  }

  Row _buildPrice(RoomModel room) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          room.price ?? '',
          style: const TextStyle(
            color: Colors.black,
            fontSize: 30,
            fontFamily: 'SF Pro Display',
            fontWeight: FontWeight.w600,
            height: 0.18,
          ),
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          room.count ?? '',
          style: const TextStyle(
            color: Color(0xFF828796),
            fontSize: 16,
            fontFamily: 'SF Pro Display',
            fontWeight: FontWeight.w400,
            height: 0.01,
          ),
        )
      ],
    );
  }

  Container _fakeAboutRoom() {
    return Container(
      height: 29,
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      decoration: ShapeDecoration(
        color: const Color(0x190D72FF),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      ),
      child: Row(mainAxisSize: MainAxisSize.min, children: [
        const Text(
          detailsRoom,
          style: TextStyle(
            color: Color(0xFF0D72FF),
            fontSize: 16,
            fontFamily: 'SF Pro Display',
            fontWeight: FontWeight.w500,
            height: 0.07,
          ),
        ),
        const SizedBox(
          width: 4,
        ),
        SvgPicture.asset(
          "assets/images/Vector 55.svg",
          width: 24,
          height: 24,
          color: const Color(0xFF0D72FF),
        ),
      ]),
    );
  }

  Text _buildRoomName(RoomModel room) {
    return Text(
      room.name ?? '',
      overflow: TextOverflow.visible,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 22,
        fontFamily: 'SF Pro Display',
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
