import 'package:akbarrm_mobileapps/core/config/app_color.dart';
import 'package:akbarrm_mobileapps/core/config/app_typography.dart';
import 'package:akbarrm_mobileapps/core/util/stretch_overscroll.dart';
import 'package:akbarrm_mobileapps/core/widgets/app_text.dart';
import 'package:akbarrm_mobileapps/core/widgets/refresh_builder.dart';
import 'package:akbarrm_mobileapps/features/main/domain/entity/food_entity.dart';
import 'package:akbarrm_mobileapps/features/main/presentation/widgets/main_item.dart';
import 'package:flutter/material.dart';

class MainGridView extends StatelessWidget {
  final List<FoodEntity> list;
  final Function onRefresh;
  final ValueChanged<FoodEntity>? tapOrder;

  const MainGridView({
    Key? key,
    required this.list,
    required this.onRefresh,
    this.tapOrder
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StretchOverScrollWidget(
      child: RefreshBuilder(
        refresh: () => onRefresh.call(),
        child: list.isNotEmpty? GridView.builder(
          itemCount: list.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 288,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 128),
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (ctx, pos) => MainItem(
            data: list[pos],
            tapOrder: () => tapOrder?.call(list[pos]),
          ),
        ): Center(
          child: AppText(
            title: "Data is empty",
            textStyle: AppTypography.titleSmall(color: AppColor.abuGelap),
          ),
        ),
      ),
    );
  }
}
