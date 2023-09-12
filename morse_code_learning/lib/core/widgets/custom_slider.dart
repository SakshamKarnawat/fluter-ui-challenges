import 'package:flutter/material.dart';
import 'package:morse_code_learning/core/app_theme.dart';
import 'package:morse_code_learning/core/sizes.dart';

class CustomSlider extends StatefulWidget {
  const CustomSlider({
    super.key,
    this.text = "",
    this.sliderHeadBackgroundColor = AppTheme.secondaryDark,
    this.sliderHeadIconColor = AppTheme.primaryWhite,
    this.sliderHeadIconSize = 18,
    this.onDragCompleted,
    this.hasArrowAnimation = false,
  });
  final String text;
  final VoidCallback? onDragCompleted;
  final Color sliderHeadBackgroundColor;
  final Color sliderHeadIconColor;
  final double sliderHeadIconSize;
  final bool hasArrowAnimation;

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  bool isDragging = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        color: AppTheme.secondaryWhite,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Stack(
        children: [
          Visibility(
            visible: !isDragging,
            child: Center(
              child: Text(
                widget.text,
                style: AppTextStyles.getTextStyle(
                  color: AppTheme.primaryWhite,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  ffStyle: "UltraLight",
                ),
              ),
            ),
          ),
          Draggable<bool>(
              axis: Axis.horizontal,
              // Child that will be dragged:
              feedback: SliderHead(
                backgroundColor: widget.sliderHeadBackgroundColor,
                iconColor: widget.sliderHeadIconColor,
                iconSize: widget.sliderHeadIconSize,
              ),
              data: true,
              // Child when dragging:
              childWhenDragging: const SizedBox.shrink(),
              // Child when not dragging:
              child: SliderHead(
                backgroundColor: widget.sliderHeadBackgroundColor,
                iconColor: widget.sliderHeadIconColor,
                iconSize: widget.sliderHeadIconSize,
                // iconSize: 14
              ),
              onDragStarted: () {
                setState(() {
                  isDragging = true;
                });
              },
              onDragEnd: (details) {
                setState(() {
                  isDragging = false;
                });
              },
              onDragCompleted: () {
                setState(() {
                  isDragging = false;
                });
              },
              onDraggableCanceled: (velocity, offset) {
                setState(() {
                  isDragging = false;
                });
              }),
          Align(
            alignment: Alignment.centerRight,
            // to set the drag target area
            child: SizedBox(
              // * old:
              // width: 75,
              width: 100,
              height: 55,
              // * old:
              // margin: const EdgeInsets.only(left: 15),
              // color: Colors.red,
              child: Padding(
                // * old:
                // padding: const EdgeInsets.only(right: 3, top: 2.5, bottom: 2.5),
                padding: const EdgeInsets.only(
                  right: Sizes.largePadding,
                  top: Sizes.extraSmallPadding / 2,
                  bottom: Sizes.extraSmallPadding / 2,
                ),
                child: DragTarget<bool>(
                  builder: (context, candidateData, rejectedData) {
                    return candidateData.isNotEmpty
                        ? const SizedBox()
                        : !widget.hasArrowAnimation
                            ? const SizedBox()
                            : const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: AnimatedArrows(),
                                  ),
                                ],
                              );
                  },
                  onWillAccept: (data) {
                    // check if data is true
                    return data == true;
                  },
                  onAccept: (data) {
                    // calls the callback function if not null
                    widget.onDragCompleted?.call();
                  },
                  onLeave: (data) {
                    // do nothing
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AnimatedArrows extends StatefulWidget {
  const AnimatedArrows({
    super.key,
  });

  @override
  State<AnimatedArrows> createState() => _AnimatedArrowsState();
}

class _AnimatedArrowsState extends State<AnimatedArrows>
    with TickerProviderStateMixin {
  late AnimationController _controller1;
  Animation<Color?>? _animation1;

  late AnimationController _controller2;
  Animation<Color?>? _animation2;

  late AnimationController _controller3;
  Animation<Color?>? _animation3;

  @override
  void initState() {
    super.initState();

    _controller1 = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _controller2 = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _controller3 = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _animation1 = TweenSequence<Color?>(
      <TweenSequenceItem<Color?>>[
        TweenSequenceItem<Color?>(
          tween: ColorTween(
            begin: AppTheme.primaryWhite.withOpacity(0),
            end: AppTheme.primaryWhite.withOpacity(0.5),
          ),
          weight: 50,
        ),
      ],
    ).animate(_controller1);

    _animation2 = TweenSequence<Color?>(
      <TweenSequenceItem<Color?>>[
        TweenSequenceItem<Color?>(
          tween: ColorTween(
            begin: AppTheme.primaryWhite.withOpacity(0.25),
            end: AppTheme.primaryWhite.withOpacity(0.75),
          ),
          weight: 50,
        ),
      ],
    ).animate(_controller2);

    _animation3 = TweenSequence<Color?>(
      <TweenSequenceItem<Color?>>[
        TweenSequenceItem<Color?>(
          tween: ColorTween(
            begin: AppTheme.primaryWhite.withOpacity(0.5),
            end: AppTheme.primaryWhite.withOpacity(1),
          ),
          weight: 50,
        ),
      ],
    ).animate(_controller3);

    // run controller in loop:
    _controller1.repeat(reverse: true);
    _controller2.repeat(reverse: true);
    _controller3.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: AnimatedBuilder(
            animation: _controller3,
            builder: (context, child) {
              return Icon(
                Icons.arrow_forward_ios,
                color: _animation3?.value,
                size: 18,
              );
            },
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.only(right: Sizes.smallPadding),
            child: AnimatedBuilder(
              animation: _controller2,
              builder: (context, child) {
                return Icon(
                  Icons.arrow_forward_ios,
                  color: _animation2?.value,
                  size: 18,
                );
              },
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.only(right: Sizes.normalPadding),
            child: AnimatedBuilder(
              animation: _controller1,
              builder: (context, child) {
                return Icon(
                  Icons.arrow_forward_ios,
                  color: _animation1?.value,
                  size: 18,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class SliderHead extends StatelessWidget {
  const SliderHead({
    super.key,
    this.backgroundColor = AppTheme.secondaryDark,
    this.iconColor = AppTheme.primaryWhite,
    this.iconSize = 18,
  });

  final Color backgroundColor;
  final Color iconColor;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: Sizes.extraSmallPadding / 2,
        top: Sizes.extraSmallPadding / 2,
        bottom: Sizes.extraSmallPadding / 2,
      ),
      child: Container(
        height: 55,
        width: 55,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: backgroundColor,
        ),
        child: Icon(
          Icons.arrow_forward_ios,
          color: iconColor,
          size: iconSize,
        ),
      ),
    );
  }
}
