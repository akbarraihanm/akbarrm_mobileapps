import 'package:akbarrm_mobileapps/core/config/app_color.dart';
import 'package:akbarrm_mobileapps/core/config/app_typography.dart';
import 'package:akbarrm_mobileapps/core/helper/currency_formatter.dart';
import 'package:akbarrm_mobileapps/core/widgets/app_button.dart';
import 'package:akbarrm_mobileapps/core/widgets/app_text.dart';
import 'package:akbarrm_mobileapps/features/main/domain/entity/food_entity.dart';
import 'package:flutter/material.dart';

class MainItem extends StatelessWidget {
  final FoodEntity data;
  final Function tapOrder;

  const MainItem({
    Key? key,
    required this.data,
    required this.tapOrder
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(6)),
            child: Image.network(
              data.picture ?? "",
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          AppText(
            title: data.name ?? "-",
            textStyle: AppTypography.titleSmall(color: AppColor.hitamPekat),
            margin: const EdgeInsets.fromLTRB(12, 16, 12, 24),
          ),
          Row(
            children: [
              AppText(
                title: CurrencyFormatter.compat(
                  data.price != null? data.price?.isNotEmpty == true?
                  data.price: "0": "0",
                ),
                textStyle: AppTypography.titleSmall(color: AppColor.biruGelap),
                margin: const EdgeInsets.only(left: 12),
              ),
              AppText(
                title: " /Porsi",
                textStyle: AppTypography.bodyMedium(color: AppColor.abuGelap),
              ),
            ],
          ),
          const SizedBox(height: 8),
          AppButton(
            title: "Order",
            radius: 6,
            height: 32,
            color: AppColor.biruGelap,
            isEnable: true,
            margin: const EdgeInsets.symmetric(horizontal: 8),
            onPressed: () => tapOrder.call(),
          ),
        ],
      ),
    );
  }
}
