library carousel_slider;

import 'dart:async';
import 'package:flutter/material.dart';

import 'carousel_options.dart';
import 'carousel_state.dart';
import 'utils.dart';

export 'carousel_controller.dart';
export 'carousel_options.dart';

typedef Widget ExtendedIndexedWidgetBuilder(
    BuildContext context, int index, int realIndex);

class CarouselSlider extends StatefulWidget {
  final CarouselOptions options;
  final bool? disableGesture;
  final List<Widget>? items;
  final ExtendedIndexedWidgetBuilder? itemBuilder;
  final CarouselController carouselController;
  final int? itemCount;

  CarouselSlider({
    required this.items,
    required this.options,
    this.disableGesture,
    CarouselController? carouselController,
    Key? key,
  })  : itemBuilder = null,
        itemCount = items?.length ?? 0,
        carouselController = carouselController ?? CarouselController(),
        super(key: key);

  CarouselSlider.builder({
    required this.itemCount,
    required this.itemBuilder,
    required this.options,
    this.disableGesture,
    CarouselController? carouselController,
    Key? key,
  })  : items = null,
        carouselController = carouselController ?? CarouselController(),
        super(key: key);

  @override
  CarouselSliderState createState() => CarouselSliderState(carouselController);
}

class CarouselSliderState extends State<CarouselSlider>
    with TickerProviderStateMixin {
  final CarouselController carouselController;
  Timer? timer;

  CarouselOptions get options => widget.options;
  CarouselState? carouselState;
  PageController? pageController;
  CarouselPageChangedReason mode = CarouselPageChangedReason.controller;

  CarouselSliderState(this.carouselController);

  void changeMode(CarouselPageChangedReason newMode) {
    mode = newMode;
  }

  @override
  void initState() {
    super.initState();
    carouselState = CarouselState(
      options,
      clearTimer,
      resumeTimer,
      changeMode,
    );
    carouselState!.itemCount = widget.itemCount;
    carouselController.state = carouselState;
    carouselState!.initialPage = options.initialPage;
    carouselState!.realPage = options.enableInfiniteScroll
        ? carouselState!.initialPage + carouselState!.realPage
        : carouselState!.initialPage;

    pageController = PageController(
      viewportFraction: options.viewportFraction,
      initialPage: carouselState!.realPage,
    );
    carouselState!.pageController = pageController;

    handleAutoPlay();
  }

  @override
  void didUpdateWidget(CarouselSlider oldWidget) {
    super.didUpdateWidget(oldWidget);

    carouselState!.options = options;
    carouselState!.itemCount = widget.itemCount;

    pageController = PageController(
      viewportFraction: options.viewportFraction,
      initialPage: carouselState!.realPage,
    );
    carouselState!.pageController = pageController;

    handleAutoPlay();
  }

  Timer? getTimer() {
    return options.autoPlay
        ? Timer.periodic(options.autoPlayInterval, (_) {
            if (!mounted) {
              clearTimer();
              return;
            }
            final route = ModalRoute.of(context);
            if (route?.isCurrent == false) {
              return;
            }

            final previousReason = mode;
            changeMode(CarouselPageChangedReason.timed);
            int nextPage = carouselState!.pageController!.page!.round() + 1;
            if (nextPage >= (widget.itemCount ?? widget.items!.length) &&
                !options.enableInfiniteScroll) {
              if (options.pauseAutoPlayInFiniteScroll) {
                clearTimer();
                return;
              }
              nextPage = 0;
            }
            carouselState!.pageController!
                .animateToPage(
                  nextPage,
                  duration: options.autoPlayAnimationDuration,
                  curve: options.autoPlayCurve,
                )
                .then((_) => changeMode(previousReason));
          })
        : null;
  }

  void clearTimer() {
    timer?.cancel();
    timer = null;
  }

  void resumeTimer() {
    if (timer == null) {
      timer = getTimer();
    }
  }

  void handleAutoPlay() {
    if (options.autoPlay && timer == null) {
      resumeTimer();
    } else {
      clearTimer();
    }
  }

  @override
  void dispose() {
    clearTimer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: carouselState!.pageController,
      itemCount: options.enableInfiniteScroll ? null : widget.itemCount,
      onPageChanged: (index) {
        final currentPage = getRealIndex(
          index + carouselState!.initialPage,
          carouselState!.realPage,
          widget.itemCount,
        );
        if (options.onPageChanged != null) {
          options.onPageChanged!(currentPage, mode);
        }
      },
      itemBuilder: (context, idx) {
        final index = getRealIndex(
          idx + carouselState!.initialPage,
          carouselState!.realPage,
          widget.itemCount,
        );
        return widget.items != null
            ? widget.items![index]
            : widget.itemBuilder!(context, index, idx);
      },
    );
  }
}

extension on CarouselController {
  set state(CarouselState? state) {}
}

Widget getCenterWrapper(Widget child, dynamic widget) {
  if (widget.option.disable) {
    return Container(
      alignment: Alignment.topCenter,
      child: child,
    );
  }
  return Center(
    child: child,
  );
}

