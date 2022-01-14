import 'package:flutter/material.dart';

enum LoadState { STATE_SUCCESS, STATE_ERROR, STATE_LOADING, STATE_EMPTY }

class LoadSateWidget extends StatefulWidget {
  final LoadState state;
  final Widget successWidget;
  final VoidCallback errorRetry;
  final VoidCallback emptyRetry;

  const LoadSateWidget(
      {Key key,
      this.state,
      this.successWidget,
      this.errorRetry,
      this.emptyRetry})
      : super(key: key);

  @override
  _LoadSateWidgetState createState() => _LoadSateWidgetState();
}

class _LoadSateWidgetState extends State<LoadSateWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: _buildWidget(),
    );
  }

  _buildWidget() {
    switch (widget.state) {
      case LoadState.STATE_SUCCESS:
        widget.successWidget;
        break;
      case LoadState.STATE_ERROR:
        _errorView;
        break;
    }
  }

  void _errorView() {
    Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      child: InkWell(
        onTap: widget.errorRetry,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300,
              height: 300,
              child: Icon(Icons.error),
            ),
            Text("加载失败，请轻触重试",
                style: TextStyle(color: Colors.grey, fontSize: 12))
          ],
        ),
      ),
    );
  }
}
