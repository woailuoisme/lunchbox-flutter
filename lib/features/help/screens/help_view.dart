import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lunchbox/i18n/translations.g.dart';

class HelpView extends ConsumerWidget {
  const HelpView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text(t.help.title), centerTitle: true),
      body: Center(
        child: Text(t.help.developing, style: const TextStyle(fontSize: 20)),
      ),
    );
  }
}
