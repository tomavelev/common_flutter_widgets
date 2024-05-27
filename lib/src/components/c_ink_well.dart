import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'platform/get_platform.dart';

class CInkWell extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;

  const CInkWell({
    super.key,
    this.onPressed,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    if (isApple()) {
      return CupertinoInkWell(
        onTap: onPressed,
        child: child,
      );
    }

    return InkWell(
      onTap: onPressed,
      child: child,
    );
  }
}

// https://github.com/flutter/flutter/issues/48017
/// An [InkWell] equivalent for Cupertino. Simply colors the background of the container.
class CupertinoInkWell extends StatefulWidget {
  const CupertinoInkWell({
    super.key,
    required this.child,
    required this.onTap,
  });

  final Widget child;
  final VoidCallback? onTap;

  bool get enabled => onTap != null;

  @override
  State<CupertinoInkWell> createState() => _CupertinoInkWellState();
}

class _CupertinoInkWellState extends State<CupertinoInkWell> {
  bool _buttonHeldDown = false;

  void _handleTapDown(TapDownDetails event) {
    if (!_buttonHeldDown) {
      setState(() {
        _buttonHeldDown = true;
      });
    }
  }

  void _handleTapUp(TapUpDetails event) {
    if (_buttonHeldDown) {
      setState(() {
        _buttonHeldDown = false;
      });
    }
  }

  void _handleTapCancel() {
    if (_buttonHeldDown) {
      setState(() {
        _buttonHeldDown = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final enabled = widget.enabled;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTapDown: enabled ? _handleTapDown : null,
      onTapUp: enabled ? _handleTapUp : null,
      onTapCancel: enabled ? _handleTapCancel : null,
      onTap: widget.onTap,
      child: Semantics(
        button: true,
        child: _buttonHeldDown
            ? Container(
                color: CupertinoColors.secondarySystemFill.resolveFrom(context),
                child: widget.child,
              )
            : widget.child,
      ),
    );
  }
}

class CFabWell extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;

  const CFabWell({super.key, this.onTap, required this.child});

  @override
  Widget build(BuildContext context) {
    if (isApple()) {
      return CupertinoInkWell(onTap: onTap, child: child);
    }

    return FloatingActionButton(onPressed: onTap, child: child);
  }
}
