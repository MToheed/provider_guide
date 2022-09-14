import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_guide/core/viewmodels/base_model.dart';
import '../../locator.dart';

class BaseView<T extends BaseModel> extends StatefulWidget {
  const BaseView({Key? key, required this.builder, this.onModelReady})
      : super(key: key);

  final Widget Function(
    BuildContext context,
    T model,
    Widget? child,
  ) builder;

  final Function(T)? onModelReady;

  @override
  State<BaseView<T>> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseModel> extends State<BaseView<T>> {
  var model = locator<T>();

  @override
  void initState() {
    super.initState();

    if (widget.onModelReady != null) {
      widget.onModelReady!(model);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: (context) => model,
      child: Consumer(
        builder: widget.builder,
      ),
    );
  }
}
