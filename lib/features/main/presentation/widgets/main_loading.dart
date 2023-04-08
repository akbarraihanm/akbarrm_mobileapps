import 'package:akbarrm_mobileapps/core/config/app_color.dart';
import 'package:akbarrm_mobileapps/core/util/stretch_overscroll.dart';
import 'package:akbarrm_mobileapps/core/widgets/app_button.dart';
import 'package:akbarrm_mobileapps/core/widgets/app_shimmer.dart';
import 'package:flutter/material.dart';

class MainLoading extends StatelessWidget {
  const MainLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StretchOverScrollWidget(
      child: GridView.builder(
        itemCount: 10,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 288,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (ctx, pos) => const _MainItem(),
      ),
    );
  }
}

class _MainItem extends StatelessWidget {
  const _MainItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      color: Colors.white,
      child: AppShimmer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150,
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(6)),
                color: Colors.white,
              ),
            ),
            Container(
              height: 16,
              width: 52,
              color: Colors.white,
              margin: const EdgeInsets.fromLTRB(12, 16, 12, 24),
            ),
            Row(
              children: [
                Container(
                  height: 14,
                  width: 36,
                  color: Colors.white,
                  margin: const EdgeInsets.only(left: 12),
                ),
                Container(
                  height: 14,
                  width: 20,
                  color: Colors.white,
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
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
