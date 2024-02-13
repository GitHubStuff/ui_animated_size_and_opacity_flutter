import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum ExpansionEnum { expand, dropdown }

class UIAnimatedSizeAndOpacityCubit extends Cubit<bool> {
  UIAnimatedSizeAndOpacityCubit() : super(false);

  void collapse() => emit(false);
  void expand() => emit(true);
  void toggle() => emit(!state);
}

class UIAnimatedSizeAndOpacity extends StatefulWidget {
  final Cubit<bool> expandableAnimatedCubit;
  final Size size;
  final Size minimalSize;
  final Duration duration;
  final Curve curve;
  final ExpansionEnum expandableType;
  final bool animateOpacity;
  final Widget child;
  final Function()? onEnd;

  const UIAnimatedSizeAndOpacity({
    super.key,
    required this.expandableAnimatedCubit,
    required this.size,
    this.animateOpacity = true,
    this.curve = Curves.easeInOut,
    this.duration = const Duration(milliseconds: 500),
    this.expandableType = ExpansionEnum.dropdown,
    this.minimalSize = const Size(0.0, 0.0),
    this.onEnd,
    required this.child,
  });

  @override
  State<UIAnimatedSizeAndOpacity> createState() =>
      _UIAnimatedSizeAndOpacityState();
}

class _UIAnimatedSizeAndOpacityState extends State<UIAnimatedSizeAndOpacity> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UIAnimatedSizeAndOpacityCubit, bool>(
      builder: (context, state) {
        return _buildAnimatedContainer(state);
      },
    );
  }

  Widget _buildAnimatedContainer(bool expanded) {
    double width;
    switch (widget.expandableType) {
      case ExpansionEnum.expand:
        width = (expanded) ? widget.size.width : widget.minimalSize.width;
        break;
      case ExpansionEnum.dropdown:
        width = widget.size.width;
        break;
    }

    final Widget child = (widget.animateOpacity)
        ? AnimatedOpacity(
            opacity: (expanded) ? 1.0 : 0.0,
            duration: widget.duration,
            curve: widget.curve,
            alwaysIncludeSemantics: false,
            child: widget.child,
          )
        : widget.child;

    return AnimatedContainer(
      constraints: BoxConstraints(
        maxHeight: widget.size.height,
        maxWidth: widget.size.width,
        minHeight: widget.minimalSize.height,
        minWidth: widget.minimalSize.width,
      ),
      curve: widget.curve,
      duration: widget.duration,
      height: (expanded) ? widget.size.height : widget.minimalSize.height,
      onEnd: widget.onEnd,
      width: width,
      child: child,
    );
  }
}
