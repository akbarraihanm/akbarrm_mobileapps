import 'package:akbarrm_mobileapps/core/config/app_color.dart';
import 'package:akbarrm_mobileapps/core/config/app_typography.dart';
import 'package:akbarrm_mobileapps/core/const/tool_const.dart';
import 'package:akbarrm_mobileapps/core/helper/currency_formatter.dart';
import 'package:akbarrm_mobileapps/core/widgets/app_button.dart';
import 'package:akbarrm_mobileapps/core/widgets/app_text.dart';
import 'package:akbarrm_mobileapps/features/main/data/models/food_data.dart';
import 'package:flutter/material.dart';

class SummaryCharge extends StatelessWidget {
  final EdgeInsets? margin;
  final List<FoodData> bag;
  final double totalPrice;
  final int qty;

  const SummaryCharge({
    Key? key,
    this.margin,
    required this.bag,
    required this.totalPrice,
    required this.qty
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(
                width: 24,
                height: 24,
                child: Stack(
                  children: [
                    Icon(
                      Icons.shopping_bag_outlined,
                      size: 20,
                      color: AppColor.biruGelap,
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: CircleAvatar(
                        radius: 5,
                        backgroundColor: AppColor.merahPekat,
                        child: AppText(
                          title: "$qty",
                          textStyle: AppTypography.body8(color: AppColor.biruGelap),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              AppText(
                title: CurrencyFormatter.compat("$totalPrice"),
                textStyle: AppTypography.titleSmall(color: AppColor.biruGelap),
                margin: const EdgeInsets.only(left: 8),
              )
            ],
          ),
          AppButton(
            height: 30,
            width: Tools.mediaHeight(context)/6,
            title: "Charge",
            color: AppColor.biruGelap,
            radius: 6,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
