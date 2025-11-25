import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

// =======================================================
// 1. WINDOW WIPER INDICATOR (Infinity Sweep & Continuous Fade)
// =======================================================

class WiperLoadingIndicator extends StatefulWidget {
  final Color wiperBladeColor;
  final Color handleColor;
  final Color cleanTrailColor;
  final double size;

  const WiperLoadingIndicator({
    super.key,
    this.wiperBladeColor = const Color(0xFF1E88E5), // Blue blade
    this.handleColor = const Color(0xFF607D8B), // Grey handle
    this.cleanTrailColor = const Color(0xFFBBDEFB), // Light blue clean trail
    this.size = 100.0,
  });

  @override
  State<WiperLoadingIndicator> createState() => _WiperLoadingIndicatorState();
}

class _WiperLoadingIndicatorState extends State<WiperLoadingIndicator> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  // Set duration for the full cycle sweep
  @override
  void initState() {
    super.initState();
    // The duration is now set low and the animation will NOT repeat.
    // Instead, it will be instructed to repeat, making the value grow continuously (0.0, 1.0, 2.0, 3.0...)
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat(); // `repeat` allows the value to exceed 1.0
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return CustomPaint(
            painter: SShapedWiperPainter(
              sweepValue: _controller.value,
              bladeColor: widget.wiperBladeColor,
              handleColor: widget.handleColor,
              cleanTrailColor: widget.cleanTrailColor,
            ),
          );
        },
      ),
    );
  }
}

class SShapedWiperPainter extends CustomPainter {
  final double sweepValue; // Grows continuously (0.0, 1.0, 2.0, ...)
  final Color bladeColor;
  final Color handleColor;
  final Color cleanTrailColor;

  SShapedWiperPainter({
    required this.sweepValue,
    required this.bladeColor,
    required this.handleColor,
    required this.cleanTrailColor,
  });

  static const double radiusRatio = 0.40;
  static const double bladeWidthRatio = 0.05;
  static const double bladeLengthRatio = 0.3;

  // Defines the Infinity (Figure-Eight) shaped path (Continuous Loop)
  Path _getInfinityPath(Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width * radiusRatio;

    // Normalized points (-1 to 1) for a horizontal infinity symbol (figure 8)
    const pStart = Offset(-1.0, 0.0); // Start/End point (Left)
    const c1 = Offset(-1.0, -1.0);
    const c2 = Offset(1.0, -1.0);
    const pMid = Offset(1.0, 0.0); // Mid point (Right)
    const c3 = Offset(1.0, 1.0);
    const c4 = Offset(-1.0, 1.0);

    // Scaling function to map normalized points to canvas coordinates
    Offset scale(Offset p) {
      return Offset(
        center.dx + p.dx * radius,
        center.dy + p.dy * radius,
      );
    }

    final path = Path()
      ..moveTo(scale(pStart).dx, scale(pStart).dy)
      // Segment 1: Top loop (from Left to Right, crossing at center)
      ..cubicTo(
        scale(c1).dx,
        scale(c1).dy,
        scale(c2).dx,
        scale(c2).dy,
        scale(pMid).dx,
        scale(pMid).dy,
      )
      // Segment 2: Bottom loop (from Right back to Left, crossing at center)
      ..cubicTo(
        scale(c3).dx,
        scale(c3).dy,
        scale(c4).dx,
        scale(c4).dy,
        scale(pStart).dx,
        scale(pStart).dy, // Connects back to start
      );

    return path;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final Offset center = Offset(size.width / 2, size.height / 2);
    final fullPath = _getInfinityPath(size);

    // ====================================================
    // 0. Draw the background (Removed the dark color, now draws nothing for background)
    // ====================================================

    // Draw the bounding circle border for context (optional, but helpful if background is white)
    final borderPaint = ui.Paint()
      ..color = Colors.grey.shade300
      ..style = ui.PaintingStyle.stroke
      ..strokeWidth = 1.0;
    canvas.drawCircle(center, size.width / 2, borderPaint);

    // ====================================================
    // 1. Draw the Fading Trail (Segmented)
    // ====================================================

    final pathMetrics = fullPath.computeMetrics();
    final ui.PathMetric metric = pathMetrics.elementAt(0) as ui.PathMetric;
    final double totalLength = metric.length;

    // The key change: We use the continuous sweepValue to find the total distance covered.
    final double totalDistanceCovered = totalLength * sweepValue;

    // Configuration for the fading trail
    // 75% of ONE full path is visible (fading) behind the wiper head
    const double trailFadeRatio = 0.75;
    final double fadeDistanceLength = totalLength * trailFadeRatio;

    // The segment of the path that is currently visible and fading (behind the wiper)
    // startLength is the length traveled MINUS the fade distance
    final double startLength = totalDistanceCovered - fadeDistanceLength;
    // endLength is the current length traveled
    final double endLength = totalDistanceCovered;

    // Define the number of steps for a smooth gradient effect
    const int segments = 30; // Increased segments for smoother fading
    final double segmentLength = fadeDistanceLength / segments;
    const double maxOpacity = 0.8;

    // Loop through the fading segment and draw each piece with increasing opacity
    for (int i = 0; i < segments; i++) {
      // Calculate the position of the segment relative to the start of the entire animation
      final double relativeSegmentStart = startLength + i * segmentLength;
      final double relativeSegmentEnd = startLength + (i + 1) * segmentLength;

      // Path segment coordinates on the continuous loop (always between 0 and totalLength)
      // We use the remainder (%) operator to map the growing distance back onto the 0.0-to-totalLength loop
      final double segmentStart = relativeSegmentStart.remainder(totalLength);
      final double segmentEnd = relativeSegmentEnd.remainder(totalLength);

      Path segmentPath;
      if (segmentStart > segmentEnd) {
        // Path wraps around (e.g., segment goes from 0.8*length to 0.2*length)
        segmentPath = metric.extractPath(segmentStart, totalLength);
        segmentPath.addPath(metric.extractPath(0.0, segmentEnd), ui.Offset.zero);
      } else {
        segmentPath = metric.extractPath(segmentStart, segmentEnd);
      }

      // Calculate fade progress: 0.0 (oldest part of tail, 75% behind) to 1.0 (just behind wiper head)
      final double fadeProgress = i / segments;

      // Opacity scales from 0.0 (faded) to 0.8 (freshly cleaned)
      final double opacity = fadeProgress * maxOpacity;

      // Apply paint
      final segmentPaint = ui.Paint()
        ..style = ui.PaintingStyle.stroke
        ..strokeWidth = size.width * bladeLengthRatio * 0.9
        ..strokeCap = ui.StrokeCap.round
        ..strokeJoin = ui.StrokeJoin.round
        ..color = cleanTrailColor.withOpacity(opacity);

      canvas.drawPath(segmentPath, segmentPaint);
    }

    // ====================================================
    // 2. Draw the Wiper Blade and Handle
    // ====================================================

    // The wiper head position is always calculated using the total distance covered
    final ui.Tangent? tangent = metric.getTangentForOffset(totalDistanceCovered);

    if (tangent != null) {
      final wiperPos = tangent.position;
      final tangentAngle = tangent.angle; // Direction of the path at this point

      // Draw the Wiper Handle (from center to wiper head)
      final handlePaint = ui.Paint()
        ..color = handleColor
        ..style = ui.PaintingStyle.stroke
        ..strokeWidth = size.width * 0.02
        ..strokeCap = ui.StrokeCap.round;

      canvas.drawLine(center, wiperPos, handlePaint);

      // Draw the Wiper Blade (perpendicular to the tangent)
      final bladePaint = ui.Paint()
        ..color = bladeColor
        ..style = ui.PaintingStyle.stroke
        ..strokeWidth = size.width * bladeWidthRatio
        ..strokeCap = ui.StrokeCap.round;

      final bladeHalfLength = size.width * bladeLengthRatio * 0.5;

      // Angle perpendicular to the tangent
      final perpAngle = tangentAngle + pi / 2;

      final bladeP1 = Offset(
        wiperPos.dx + bladeHalfLength * cos(perpAngle),
        wiperPos.dy + bladeHalfLength * sin(perpAngle),
      );
      final bladeP2 = Offset(
        wiperPos.dx - bladeHalfLength * cos(perpAngle),
        wiperPos.dy - bladeHalfLength * sin(perpAngle),
      );

      canvas.drawLine(bladeP1, bladeP2, bladePaint);
    }
  }

  @override
  bool shouldRepaint(covariant SShapedWiperPainter oldDelegate) {
    return oldDelegate.sweepValue != sweepValue || oldDelegate.bladeColor != bladeColor || oldDelegate.handleColor != handleColor || oldDelegate.cleanTrailColor != cleanTrailColor;
  }
}
