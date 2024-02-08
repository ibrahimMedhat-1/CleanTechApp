import 'package:flutter/material.dart';

class PaginatedScrollViewWidget extends StatefulWidget {
  const PaginatedScrollViewWidget(
      {super.key, required this.child, required this.onPaginate});
  final Widget child;
  final Future<List<dynamic>?> Function() onPaginate;

  @override
  State<PaginatedScrollViewWidget> createState() =>
      _PaginatedScrollViewWidgetState();
}

class _PaginatedScrollViewWidgetState extends State<PaginatedScrollViewWidget> {
  @override
  void initState() {
    super.initState();
  }

  bool isReachedToEnd = false;

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollEndNotification>(
      onNotification: (scrollEnd) {
        final metrics = scrollEnd.metrics;
        if (metrics.atEdge) {
          bool isBottom = metrics.pixels != 0;
          if (isBottom) {
            if (!isReachedToEnd) {
              widget.onPaginate().then((value) {
                if (value?.isEmpty == true) {
                  isReachedToEnd = true;
                }
              });
            }
          }
        }
        return true;
      },
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: widget.child,
      ),
    );
  }
}
