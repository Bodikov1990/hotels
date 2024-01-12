import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width - 16;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Заказ оплачен'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 88,
                    height: 88,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.3),
                      shape: BoxShape.circle,
                    ),
                  ),
                  Image.asset(
                    'assets/images/party.png',
                    width: 44,
                    height: 44,
                  ),
                ],
              ),
              const SizedBox(height: 24),
              const Text(
                'Ваш заказ принят в работу',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              const Text(
                'Подтверждение заказа №104893 может занять некоторое время (от 1 часа до суток). '
                'Как только мы получим ответ от туроператора, вам на почту придет уведомление.',
                style: TextStyle(
                  color: Color(0xFF828796),
                  fontSize: 16,
                  fontFamily: 'SF Pro Display',
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        width: width,
        height: 48,
        child: FloatingActionButton.extended(
          backgroundColor: const Color(0xFF0D72FF),
          foregroundColor: Colors.white,
          onPressed: () {
            AutoRouter.of(context).popUntilRoot();
          },
          label: const Text('Супер!'),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
