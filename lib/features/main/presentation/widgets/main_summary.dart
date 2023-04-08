import 'package:akbarrm_mobileapps/core/config/app_color.dart';
import 'package:akbarrm_mobileapps/core/widgets/filter_indicator.dart';
import 'package:akbarrm_mobileapps/features/main/data/models/food_data.dart';
import 'package:akbarrm_mobileapps/features/main/presentation/widgets/summary_charge.dart';
import 'package:akbarrm_mobileapps/features/main/presentation/widgets/summary_charge_item.dart';
import 'package:flutter/material.dart';

class MainSummary extends StatelessWidget {
  final ScrollController controller;
  final List<FoodData> bag;
  final double totalPrice;
  final int qty;
  final Function(bool isAdd, FoodData data) addOrRemove;

  const MainSummary({
    Key? key,
    required this.controller,
    required this.bag,
    required this.totalPrice,
    required this.qty,
    required this.addOrRemove
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.pageBg,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
        border: Border.all(color: AppColor.biruGelap),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 2.5,
            offset: Offset(2.5, 2.5),
          ),
        ],
      ),
      child: Column(
        children: [
          const FilterIndicator(
            margin: EdgeInsets.only(top: 8, bottom: 2),
          ),
          Expanded(
            child: SingleChildScrollView(
              controller: controller,
              child: Column(
                children: [
                  SummaryCharge(
                    margin: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                    bag: bag,
                    totalPrice: totalPrice,
                    qty: qty,
                  ),
                  bag.isNotEmpty? SizedBox(
                    height: 100,
                    child: ListView.separated(
                      itemCount: bag.length,
                      shrinkWrap: true,
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                      separatorBuilder: (ctx, pos) => const SizedBox(height: 16),
                      itemBuilder: (ctx, pos) => SummaryChargeItem(
                        data: bag[pos],
                        tapAdd: () => addOrRemove.call(true, bag[pos]),
                        tapRemove: () => addOrRemove.call(false, bag[pos]),
                      ),
                    ),
                  ): const SizedBox(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
