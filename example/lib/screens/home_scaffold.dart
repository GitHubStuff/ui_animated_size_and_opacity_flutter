import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../gen/assets.gen.dart';

import 'package:ui_animated_size_and_opacity_flutter/ui_animated_size_and_opacity_flutter.dart';

final UIAnimatedSizeAndOpacityCubit cubit = UIAnimatedSizeAndOpacityCubit();

class HomeScaffold extends StatelessWidget {
  const HomeScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UIAnimatedSizeAndOpacityCubit>(
      create: (context) => cubit,
      child: Scaffold(
        body: homeWidget(context),
        floatingActionButton: null,
      ),
    );
  }

  Widget homeWidget(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () => cubit.toggle(),
            child: SizedBox(
              width: 200,
              height: 200,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Assets.images.demo.image(),
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Text('Tap image to toggle'),
          const SizedBox(height: 20),
          UIAnimatedSizeAndOpacity(
            expandableAnimatedCubit: cubit,
            size: const Size(125, 125),
            child: Assets.images.demo.image(),
          )
        ],
      ),
    );
  }
}
