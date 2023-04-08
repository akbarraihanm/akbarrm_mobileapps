import 'package:akbarrm_mobileapps/core/config/app_color.dart';
import 'package:akbarrm_mobileapps/core/config/app_typography.dart';
import 'package:akbarrm_mobileapps/core/helper/currency_formatter.dart';
import 'package:akbarrm_mobileapps/core/widgets/app_text.dart';
import 'package:akbarrm_mobileapps/features/main/data/models/food_data.dart';
import 'package:flutter/material.dart';

class SummaryChargeItem extends StatelessWidget {
  final FoodData data;
  final Function tapRemove;
  final Function tapAdd;

  const SummaryChargeItem({
    Key? key,
    required this.data,
    required this.tapRemove,
    required this.tapAdd
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.network(
                data.picture ?? "-",
                height: 40,
                width: 40,
                fit: BoxFit.cover,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  title: data.name ?? "",
                  textStyle: AppTypography.titleSmall(color: AppColor.biruGelap),
                  margin: const EdgeInsets.only(left: 16, bottom: 4),
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
              ],
            ),
          ],
        ),
        Row(
          children: [
            _AddOrMinusBtn(
              icon: Icons.remove,
              tapRemove: () => tapRemove.call(),
            ),
            AppText(
              title: "${data.qty}",
              textStyle: AppTypography.bodyMedium(color: Colors.black),
              margin: const EdgeInsets.symmetric(horizontal: 16),
            ),
            _AddOrMinusBtn(
              icon: Icons.add,
              isAdd: true,
              tapAdd: () => tapAdd.call(),
            ),
          ],
        )
      ],
    );
  }
}

class _AddOrMinusBtn extends StatelessWidget {
  final bool isAdd;
  final IconData icon;
  final Function? tapAdd;
  final Function? tapRemove;

  const _AddOrMinusBtn({
    Key? key,
    this.isAdd = false,
    required this.icon,
    this.tapAdd,
    this.tapRemove
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      width: 32,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: isAdd? AppColor.biruGelap: Colors.white,
        border: isAdd? null: Border.all(color: AppColor.biruGelap),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(6),
        onTap: () {
          if (isAdd) {
            tapAdd?.call();
          } else {
            tapRemove?.call();
          }
        },
        child: Center(
          child: Icon(
            icon,
            size: 20,
            color: isAdd? Colors.white: AppColor.biruGelap,
          ),
        ),
      ),
    );
  }
}
