import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../config/dependency_handler.dart';
import '../../../core/utils/enums/page_enum.dart';
import '../../blocs/movies_bloc.dart';
import 'movies_row/movies_row.dart';
import 'preview_header/preview_header.dart';

class PagePreview extends StatefulWidget {
  final PageEnum page;

  const PagePreview({
    super.key,
    required this.page,
  });

  @override
  State<StatefulWidget> createState() => _PagePreviewState();
}

class _PagePreviewState extends State<PagePreview> {
  late MoviesBloc moviesBloc;

  @override
  void initState() {
    super.initState();
    moviesBloc = Provider.of<DependencyHandler>(
      context,
      listen: false,
    ).moviesBloc;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PreviewHeader(page: widget.page),
          MoviesRow(
            endpoint: widget.page.endpoint,
            moviesBloc: moviesBloc,
          ),
        ],
      ),
    );
  }
}
