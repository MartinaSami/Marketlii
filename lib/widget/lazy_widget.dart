import 'package:flutter/material.dart';

class LazyWidget extends StatefulWidget {

  final bool loaded;
  final Widget child;

  LazyWidget({ this.loaded , this.child});

  @override
  _LazyWidgetState createState() => _LazyWidgetState();

}

class _LazyWidgetState extends State<LazyWidget> {

  bool _didLoad = false;

  @override
  void initState() {

    super.initState();

    if (widget.loaded) {
      _didLoad = true;
    }

  }

  @override
  void didUpdateWidget(LazyWidget oldWidget) {

    if (!_didLoad) {
      _didLoad = widget.loaded;
    }

    super.didUpdateWidget(oldWidget);

  }

  @override
  Widget build(BuildContext context) {

    if (_didLoad) {

      return widget.child;

    }

    return SizedBox();

  }

}
