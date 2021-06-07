import 'package:flutter/material.dart';

import '../../widgets/horizontal_scroll/category_labels.dart';
import '../../widgets/summary_service_provider/summary_service_provider.dart';

class ExploreHome extends StatelessWidget {
  const ExploreHome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          AndroidCategoryLabels(),
          Divider(),
          AndroidSummaryService(),
          AndroidSummaryService(),
          AndroidSummaryService(),
        ],
      ),
    );
  }
}