// ignore_for_file: prefer_initializing_formals

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hotels/router/auto_routes.dart';
import 'package:hotels/src/booking_page/presentation/bloc/booking_bloc.dart';
import 'package:hotels/src/booking_page/presentation/views/booking_details_widget.dart';
import 'package:hotels/src/booking_page/presentation/views/booking_price_widget.dart';
import 'package:hotels/src/hotels_page/data/models/hotel_model.dart';
import 'package:hotels/src/room_page/data/models/room_model.dart';

@RoutePage()
class BookingPage extends StatefulWidget {
  final HotelModel hotel;
  final RoomModel room;
  const BookingPage({super.key, required this.hotel, required this.room});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  final _bookingBloc = BookingBloc();

  final List<TouristInfo> tourists = [
    TouristInfo(isExpanded: true, name: 'Иван', lastName: 'Иванов'),
    TouristInfo(isExpanded: false, name: '', lastName: '')
  ];

  @override
  void initState() {
    super.initState();
    _bookingBloc
        .add(BookingLoadingEvent(hotel: widget.hotel, room: widget.room));
  }

  void _addNewTourist() {
    setState(() {
      tourists.add(TouristInfo(isExpanded: true));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Бронирование'),
        centerTitle: true,
      ),
      body: BlocBuilder<BookingBloc, BookingState>(
        bloc: _bookingBloc,
        builder: (context, state) {
          if (state is BookingLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is BookingLoadedState) {
            return SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  _buildHotelInfo(state),
                  const SizedBox(
                    height: 4,
                  ),
                  _buildBookingInfo(state),
                  const SizedBox(
                    height: 8,
                  ),
                  _buildClientInfo(),
                  const SizedBox(
                    height: 4,
                  ),
                  for (int i = 0; i < tourists.length; i++)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: _buildTouristInfo(tourists[i], i),
                    ),
                  _addTouristButton(),
                  const SizedBox(
                    height: 4,
                  ),
                  _buildPriceInfo(state),
                  const SizedBox(
                    height: 4,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ElevatedButton(
                        onPressed: () {
                          AutoRouter.of(context).push(const PaymentRoute());
                        },
                        child: Text(
                          'Оплатить ${state.room.price}',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
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
              ),
            );
          }
          return Container();
        },
      ),
    );
  }

  SizedBox _buildHotelInfo(BookingLoadedState state) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Container(
          decoration: const ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  _buildCategory(state.hotel),
                  const SizedBox(
                    height: 8,
                  ),
                  _buildHotelName(state),
                  const SizedBox(
                    height: 8,
                  ),
                  _buildHotelAddress(state),
                ]),
          ),
        ),
      ),
    );
  }

  Text _buildHotelAddress(BookingLoadedState state) {
    return Text(
      state.hotel.address ?? '',
      style: const TextStyle(
        color: Color(0xFF0D72FF),
        fontSize: 14,
        fontFamily: 'SF Pro Display',
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Text _buildHotelName(BookingLoadedState state) {
    return Text(
      state.hotel.name ?? '',
      style: const TextStyle(
        color: Colors.black,
        fontSize: 22,
        fontFamily: 'SF Pro Display',
        fontWeight: FontWeight.w500,
      ),
    );
  }

  SizedBox _buildBookingInfo(BookingLoadedState state) {
    return SizedBox(
      width: double.infinity,
      child: Container(
          decoration: const ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BookingDetailRow(
                    title: 'Вылет из', value: state.hotel.cityFrom ?? ''),
                BookingDetailRow(
                    title: 'Страна, город', value: state.hotel.cityTo ?? ''),
                BookingDetailRow(
                    title: 'Даты',
                    value: '${state.hotel.dateFrom} – ${state.hotel.dateTo}'),
                BookingDetailRow(
                    title: 'Кол-во ночей', value: state.room.count ?? ''),
                BookingDetailRow(title: 'Отель', value: state.hotel.name ?? ''),
                BookingDetailRow(title: 'Номер', value: state.room.name ?? ''),
                BookingDetailRow(
                    title: 'Питание', value: state.room.mainFeature ?? ''),
              ],
            ),
          )),
    );
  }

  SizedBox _buildPriceInfo(BookingLoadedState state) {
    return SizedBox(
      width: double.infinity,
      child: Container(
          decoration: const ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BookingPriceWidget(title: 'Тур', value: state.room.price ?? ''),
                BookingPriceWidget(
                    title: 'Топливный сбор', value: state.room.fuelPrice ?? ''),
                BookingPriceWidget(
                    title: 'Сервисный сбор',
                    value: state.room.servicePrice ?? ''),
                BookingPriceWidget(
                  title: 'К оплате',
                  value: state.room.price ?? '',
                  color: const Color(0xFF0D72FF),
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
          )),
    );
  }

  SizedBox _buildClientInfo() {
    return SizedBox(
      width: double.infinity,
      child: Container(
        decoration: const ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Информация о покупателе',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 24.0),
              _buildTextField(
                  label: 'Номер телефона',
                  initialValue: '+7 (777) 777-77-77',
                  onChanged: (value) => value),
              const SizedBox(height: 24.0),
              _buildTextField(
                  label: 'Почта',
                  initialValue: 'example@gmail.com',
                  onChanged: (value) => value),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'Эти данные никому не передаются. После оплаты мы вышлем чек на указанный вами номер и почту',
                  style: TextStyle(
                    color: Color(0xFF828796),
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ],
          ),
        ),
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

  Widget _buildTouristInfo(TouristInfo tourist, int index) {
    String title;
    if (index == 0) {
      title = 'Первый турист';
    } else if (index == 1) {
      title = 'Второй турист';
    } else {
      title = 'Турист ${index + 1}';
    }

    return Container(
      decoration: const ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
      ),
      child: ExpansionTile(
        backgroundColor: Colors.white,
        initiallyExpanded: tourist.isExpanded,
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontFamily: 'SF Pro Display',
            fontWeight: FontWeight.w500,
            height: 0.05,
          ),
        ),
        trailing: Container(
          padding: const EdgeInsets.only(
            top: 12,
            left: 10,
            right: 8,
            bottom: 12,
          ),
          width: 32,
          height: 32,
          decoration: ShapeDecoration(
            color: const Color(0x190D72FF),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          ),
          child: tourist.icon,
        ),
        onExpansionChanged: (bool expanded) {
          setState(() {
            tourist.icon = expanded
                ? SvgPicture.asset(
                    "assets/images/arrow_down.svg",
                  )
                : SvgPicture.asset(
                    "assets/images/arrow_up.svg",
                  );
            tourist.isExpanded = expanded;
          });
        },
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 4,
                ),
                _buildTextField(
                    label: 'Имя',
                    initialValue: tourist.name,
                    onChanged: (value) => tourist.name = value),
                const SizedBox(
                  height: 8,
                ),
                _buildTextField(
                    label: 'Фамилия',
                    initialValue: tourist.lastName,
                    onChanged: (value) => tourist.lastName = value),
                const SizedBox(
                  height: 8,
                ),
                _buildTextField(
                    label: 'Дата рождения',
                    initialValue: tourist.birthDate,
                    onChanged: (value) => tourist.birthDate = value),
                const SizedBox(
                  height: 8,
                ),
                _buildTextField(
                    label: 'Гражданство',
                    initialValue: tourist.citizenship,
                    onChanged: (value) => tourist.citizenship = value),
                const SizedBox(
                  height: 8,
                ),
                _buildTextField(
                    label: 'Номер загранпаспорта',
                    initialValue: tourist.passportNumber,
                    onChanged: (value) => tourist.passportNumber = value),
                const SizedBox(
                  height: 8,
                ),
                _buildTextField(
                    label: 'Срок действия загранпаспорта',
                    initialValue: tourist.passportExpiryDate,
                    onChanged: (value) => tourist.passportExpiryDate = value),
                const SizedBox(
                  height: 16,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required String initialValue,
    required Function(String) onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        height: 52,
        decoration: ShapeDecoration(
          color: const Color(0xFFF6F6F9),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: TextFormField(
          initialValue: initialValue,
          onChanged: onChanged,
          style: const TextStyle(
            color: Color(0xFF14132A),
            fontSize: 16,
            fontFamily: 'SF Pro Display',
            fontWeight: FontWeight.w400,
            letterSpacing: 0.75,
          ),
          decoration: InputDecoration(
            labelText: label,
            labelStyle: const TextStyle(
              color: Color(0xFFA8ABB6),
              fontSize: 12,
              fontFamily: 'SF Pro Display',
              fontWeight: FontWeight.w400,
              letterSpacing: 0.12,
            ),
            contentPadding: const EdgeInsets.only(left: 16, top: 24, bottom: 8),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            fillColor: const Color(0xFFF6F6F9),
            filled: true,
          ),
        ),
      ),
    );
  }

  Widget _addTouristButton() {
    return Container(
      width: double.infinity,
      height: 70,
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: InkWell(
        onTap: _addNewTourist,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          padding:
              const EdgeInsets.only(left: 16, top: 8, right: 23, bottom: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Добавить туриста',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontFamily: 'SF Pro Display',
                  fontWeight: FontWeight.w500,
                ),
              ),
              Container(
                  width: 32,
                  height: 32,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF0D72FF),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6)),
                  ),
                  child: const Center(
                      child: Icon(Icons.add, color: Colors.white))),
            ],
          ),
        ),
      ),
    );
  }
}

class TouristInfo {
  Widget icon;
  bool isExpanded;
  String name;
  String lastName;
  String birthDate;
  String citizenship;
  String passportNumber;
  String passportExpiryDate;
  String phone;
  String email;

  TouristInfo(
      {Widget icon = const Icon(Icons.arrow_drop_down),
      this.isExpanded = false,
      this.name = '',
      this.lastName = '',
      this.birthDate = '',
      this.citizenship = '',
      this.passportNumber = '',
      this.passportExpiryDate = '',
      this.phone = '',
      this.email = ''})
      : icon = SvgPicture.asset(
          "assets/images/arrow_down.svg",
          width: 24,
          height: 24,
        );
}
