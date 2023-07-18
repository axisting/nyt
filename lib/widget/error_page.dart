import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mediaprobe/general_providers.dart';

class ErrorPage extends HookConsumerWidget {
  final String? errorMessage;
  const ErrorPage({super.key, this.errorMessage});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Error"),
      ),
      body: Center(
        child: errorMessage == null
            ? Text(ref.watch(errorMessageProvider))
            : Text(errorMessage.toString()),
      ),
    );
  }
}
