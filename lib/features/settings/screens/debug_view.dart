import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lunchbox/core/network/dio_provider.dart';
import 'package:material_symbols_icons/symbols.dart';

class DebugView extends ConsumerWidget {
  const DebugView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        title: const Text('Debug Tools'),
        centerTitle: true,
        backgroundColor: colorScheme.surface,
        elevation: 0,
      ),
      body: ListView(
        padding: EdgeInsets.all(16.w),
        children: [
          Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(16.w),
                  child: Text(
                    'Sentry Verification',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Symbols.bug_report, color: Colors.red),
                  title: const Text('Throw Test Exception'),
                  subtitle: const Text(
                    'Verify Sentry setup by throwing a StateError',
                  ),
                  onTap: () {
                    throw StateError('This is test exception from DebugView');
                  },
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(
                    Symbols.network_check,
                    color: Colors.blue,
                  ),
                  title: const Text('Test Network Error'),
                  subtitle: const Text('Verify Sentry Dio interceptor'),
                  onTap: () async {
                    try {
                      await ref
                          .read(dioProvider)
                          .get<dynamic>('/invalid-endpoint-for-testing-sentry');
                    } catch (e) {
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Network error triggered and reported to Sentry',
                            ),
                          ),
                        );
                      }
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
