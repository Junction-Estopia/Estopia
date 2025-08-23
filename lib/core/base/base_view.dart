import 'package:estopia/core/base/base_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BaseView<S, T extends BaseViewModel<S>> extends StatefulWidget {
  const BaseView({
    super.key,
    required this.create,
    required this.builder,
    this.listen,
    this.buildWhen,
    this.onInit,
    this.onDispose,
    this.listenOnInitState = true,
  }) : viewModel = null;

  final T Function(BuildContext context) create;
  final void Function(S? previous, S current, T viewModel)? listen;
  final bool listenOnInitState;
  final bool Function(S previous, S current)? buildWhen;
  final void Function(BuildContext context, T viewModel)? onInit;
  final void Function(BuildContext context, T viewModel)? onDispose;
  final Widget Function(BuildContext context, T viewModel, S state) builder;
  final T? viewModel;

  @override
  State<BaseView<S, T>> createState() => _BaseViewState<S, T>();
}

class _BaseViewState<S, T extends BaseViewModel<S>>
    extends State<BaseView<S, T>> {
  late final T viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = widget.create(context);
    widget.onInit?.call(context, viewModel);
    if (widget.listenOnInitState) {
      widget.listen?.call(null, viewModel.state, viewModel);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: BlocBuilder<T, S>(
        buildWhen: (previous, current) {
          widget.listen?.call(previous, current, viewModel);
          if (widget.buildWhen != null) {
            return widget.buildWhen!(previous, current);
          } else {
            return previous != current;
          }
        },
        builder: (context, state) {
          return widget.builder(context, viewModel, state);
        },
      ),
    );
  }
}
