import 'package:awesome_card/credit_card.dart';
import 'package:awesome_card/extra/card_type.dart';
import 'package:awesome_card/extra/helper.dart';
import 'package:flutter/cupertino.dart';

import '../../../Utils/App_colors/app_color_file.dart';
import '../home_screen.dart';

class HomeCreditCardWidget extends StatelessWidget {
  const HomeCreditCardWidget({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final HomeScreen widget;

  @override
  Widget build(BuildContext context) {
    return CreditCard(
      cardNumber: "5122 7568 2354 1247",
      cardExpiry: "5/24",
      cardHolderName: "Marvel Adebayo",
      cvv: "157",
      bankName: 'Axis Bank',
      showBackSide: widget.showBack,
      frontBackground: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        color: AppColors.primaryColor,
      ),
      backBackground: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        color: AppColors.primaryColor,
      ),
      showShadow: true,
      mask: getCardTypeMask(cardType: CardType.americanExpress),
    );
  }
}
