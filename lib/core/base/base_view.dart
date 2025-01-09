import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rune/core/services/locator.dart';
import 'base_view_model.dart';

class BaseView<T extends BaseViewModel> extends StatefulWidget {
  final Widget Function(BuildContext context, T viewModel, Widget? child)
      builder;
  final Function(T)? onModelReady;
  final Function(T)? onModelDispose;
  const BaseView(
      {super.key,
      required this.builder,
      this.onModelReady,
      this.onModelDispose});

  @override
  State<BaseView<T>> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseViewModel> extends State<BaseView<T>> {
  late T model;

  @override
  void initState() {
    super.initState();
    model = getIt<T>();
    if (widget.onModelReady != null) {
      widget.onModelReady!(model);
    }
  }

  @override
  void dispose() {
    super.dispose();
    if (widget.onModelDispose != null) {
      widget.onModelDispose!(model);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: (_) => model,
      child: Consumer<T>(
        builder: (context, model, child) =>
            widget.builder(context, model, child),
      ),
    );
  }
}
