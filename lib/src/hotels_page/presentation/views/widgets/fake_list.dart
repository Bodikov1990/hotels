import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hotels/core/utils/constants.dart';

class FakeList extends StatelessWidget {
  const FakeList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 184,
      decoration: ShapeDecoration(
        color: const Color(0xFFFBFBFC),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              width: double.infinity,
              height: 38,
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset("assets/images/emoji-happy.svg",
                          width: 24, height: 24),
                      const SizedBox(
                        width: 8,
                      ),
                      const Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            convinients,
                            style: TextStyle(
                              color: Color(0xFF2C3035),
                              fontSize: 16,
                              fontFamily: 'SF Pro Display',
                              fontWeight: FontWeight.w500,
                              height: 0.07,
                            ),
                          ),
                          Text(
                            bestNeeds,
                            style: TextStyle(
                              color: Color(0xFF828696),
                              fontSize: 14,
                              fontFamily: 'SF Pro Display',
                              fontWeight: FontWeight.w500,
                              height: 0.09,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  SvgPicture.asset("assets/images/Vector 55.svg",
                      width: 24, height: 24),
                ],
              )),
          const Divider(),
          Container(
              width: double.infinity,
              height: 38,
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset("assets/images/tick-square.svg",
                          width: 24, height: 24),
                      const SizedBox(
                        width: 8,
                      ),
                      const Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            allInclusive,
                            style: TextStyle(
                              color: Color(0xFF2C3035),
                              fontSize: 16,
                              fontFamily: 'SF Pro Display',
                              fontWeight: FontWeight.w500,
                              height: 0.07,
                            ),
                          ),
                          Text(
                            bestNeeds,
                            style: TextStyle(
                              color: Color(0xFF828696),
                              fontSize: 14,
                              fontFamily: 'SF Pro Display',
                              fontWeight: FontWeight.w500,
                              height: 0.09,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  SvgPicture.asset("assets/images/Vector 55.svg",
                      width: 24, height: 24),
                ],
              )),
          const Divider(),
          Container(
              width: double.infinity,
              height: 38,
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset("assets/images/close-square.svg",
                          width: 24, height: 24),
                      const SizedBox(
                        width: 8,
                      ),
                      const Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            includs,
                            style: TextStyle(
                              color: Color(0xFF2C3035),
                              fontSize: 16,
                              fontFamily: 'SF Pro Display',
                              fontWeight: FontWeight.w500,
                              height: 0.07,
                            ),
                          ),
                          Text(
                            bestNeeds,
                            style: TextStyle(
                              color: Color(0xFF828696),
                              fontSize: 14,
                              fontFamily: 'SF Pro Display',
                              fontWeight: FontWeight.w500,
                              height: 0.09,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  SvgPicture.asset("assets/images/Vector 55.svg",
                      width: 24, height: 24),
                ],
              )),
        ],
      ),
    );
  }
}
