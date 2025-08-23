import 'package:flutter/material.dart';

class AnimTransOpacity extends StatefulWidget {
  const AnimTransOpacity({
    super.key,
    required this.child,
    this.opacity,
    this.offset,
    this.curve,
    this.delayIndex = 0,
    Duration? initDelay,
    Duration? delay,
    Duration? duration,
    bool? isShow,
    double? offsetDelta,
    AxisDirection? direction,
  }) : initDelay = initDelay ?? Duration.zero,
       delay = delay ?? const Duration(milliseconds: 55),
       duration = duration ?? const Duration(milliseconds: 333),
       isShow = isShow ?? true,
       offsetDelta = offsetDelta ?? 12,
       direction = direction ?? AxisDirection.up;

  final Widget child;

  /// Opacity
  final Tween<double>? opacity;

  /// Transition
  final Tween<Offset>? offset;
  final double offsetDelta;

  /// Curve
  final Curve? curve;

  /// Start delay
  final Duration initDelay;
  final Duration delay;
  final int delayIndex;

  /// Animate duration
  final Duration duration;

  /// Show flag
  final bool isShow;

  /// Direction
  final AxisDirection direction;

  @override
  State<AnimTransOpacity> createState() => _AnimTransOpacityState();
}

class _AnimTransOpacityState extends State<AnimTransOpacity>
    with SingleTickerProviderStateMixin {
  /// Animation controller
  late final AnimationController controller = AnimationController(
    duration: widget.duration,
    vsync: this,
  );

  /// Animation
  late final Animation<double> animation = CurvedAnimation(
    parent: controller,
    curve: widget.curve ?? Curves.easeInOutCubic,
  );

  /// Opacity animation
  late final Animation<double> opacity =
      (widget.opacity ??
              Tween<double>(
                begin: 0.0,
                end: 1.0,
              ))
          .animate(animation);

  /// Offset tween by direction
  Tween<Offset> get offsetByDirection {
    return switch (widget.direction) {
      AxisDirection.up => Tween<Offset>(
        begin: Offset(0, widget.offsetDelta),
        end: const Offset(0, 0),
      ),
      AxisDirection.down => Tween<Offset>(
        begin: Offset(0, -widget.offsetDelta),
        end: const Offset(0, 0),
      ),
      AxisDirection.left => Tween<Offset>(
        begin: Offset(widget.offsetDelta, 0),
        end: const Offset(0, 0),
      ),
      AxisDirection.right => Tween<Offset>(
        begin: Offset(-widget.offsetDelta, 0),
        end: const Offset(0, 0),
      ),
    };
  }

  late final Animation<Offset> offset = (widget.offset ?? offsetByDirection)
      .animate(animation);

  @override
  void initState() {
    super.initState();
    startAnimation();
    controller.addStatusListener((status) {
      if (status == AnimationStatus.dismissed) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(AnimTransOpacity oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (mounted && oldWidget.isShow != widget.isShow) {
      startAnimation();
    }
  }

  void startAnimation() {
    final delayMillies =
        widget.initDelay.inMilliseconds +
        widget.delay.inMilliseconds * widget.delayIndex;
    Future.delayed(Duration(milliseconds: delayMillies), () {
      if (!mounted) return;
      if (widget.isShow) {
        controller.forward();
      } else {
        controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.isShow || controller.status != AnimationStatus.dismissed,
      child: AnimatedBuilder(
        animation: controller,
        child: widget.child,
        builder: (context, child) {
          return Transform.translate(
            offset: offset.value,
            child: Opacity(
              opacity: opacity.value,
              child: child,
            ),
          );
        },
      ),
    );
  }
}
