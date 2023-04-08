import 'package:akbarrm_mobileapps/core/config/app_color.dart';
import 'package:akbarrm_mobileapps/core/util/app_util.dart';
import 'package:akbarrm_mobileapps/core/util/stretch_overscroll.dart';
import 'package:akbarrm_mobileapps/core/widgets/search_form_field.dart';
import 'package:akbarrm_mobileapps/features/main/di/di_object.dart';
import 'package:akbarrm_mobileapps/features/main/presentation/blocs/main_bloc.dart';
import 'package:akbarrm_mobileapps/features/main/presentation/blocs/main_event.dart';
import 'package:akbarrm_mobileapps/features/main/presentation/blocs/main_state.dart';
import 'package:akbarrm_mobileapps/features/main/presentation/widgets/main_grid_view.dart';
import 'package:akbarrm_mobileapps/features/main/presentation/widgets/main_loading.dart';
import 'package:akbarrm_mobileapps/features/main/presentation/widgets/main_summary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatefulWidget {
  static const routeName = "/main";

  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _bloc = MainLocator.bloc;

  @override
  void initState() {
    super.initState();
    _bloc.add(GetAllFood());
  }

  @override
  void dispose() {
    super.dispose();
    _bloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.pageBg,
      body: Stack(
        children: [
          Column(
            children: [
              SearchFormField(
                hint: "Cari Menu",
                controller: _bloc.searchCtrl,
                margin: const EdgeInsets.fromLTRB(16, 32, 16, 0),
                borderColor: Colors.transparent,
                bgColor: AppColor.abuAbu,
                onSubmit: (v) {
                  if (v.isNotEmpty) {
                    _bloc.add(SearchFood(int.parse(v)));
                  } else {
                    _bloc.add(GetAllFood());
                  }
                },
              ),
              Expanded(
                child: BlocBuilder<MainBloc, MainState>(
                  bloc: _bloc,
                  builder: (ctx, state) {
                    return state.when(
                      onLoading: (state) => const MainLoading(),
                      onInit: (state) => MainGridView(
                        list: _bloc.foods,
                        onRefresh: () {
                          _bloc.searchCtrl.clear();
                          _bloc.add(GetAllFood());
                        },
                        tapOrder: (v) => _bloc.add(AddToBag(v)),
                      ),
                      onError: (state) {
                        AppUtil.showError(context, message: state.message);
                        return MainGridView(
                          list: const [],
                          onRefresh: () => _bloc.add(GetAllFood()),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
          BlocBuilder<MainBloc, MainState>(
            bloc: _bloc,
            builder: (ctx, state) {
              return state.when(
                onInit: (state) => StretchOverScrollWidget(
                  child: DraggableScrollableSheet(
                    initialChildSize: 0.11,
                    minChildSize: 0.11,
                    maxChildSize: _bloc.bag.isNotEmpty? 0.3: 0.11,
                    builder: (ctx, scrollController) => MainSummary(
                      controller: scrollController,
                      bag: _bloc.bag,
                      totalPrice: _bloc.totalPrice,
                      qty: _bloc.qty,
                      addOrRemove: (a, b) => _bloc.add(AddOrRemove(b, a)),
                    ),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
