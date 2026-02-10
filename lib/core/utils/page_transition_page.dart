import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';

/// 适配 GoRouter 的 PageTransition 封装
///
/// 使用方法:
/// ```dart
/// @override
/// Page<void> buildPage(BuildContext context, GoRouterState state) =>
///     PageTransitionPage(
///       key: state.pageKey,
///       child: const MyPage(),
///       type: PageTransitionType.rightToLeft,
///     );
/// ```
class PageTransitionPage<T> extends CustomTransitionPage<T> {
  PageTransitionPage({
    required super.child,
    required PageTransitionType type,
    super.key,
    super.name,
    super.arguments,
    super.restorationId,
    Duration duration = const Duration(milliseconds: 300),
    Duration reverseDuration = const Duration(milliseconds: 300),
    Curve curve = Curves.linear,
    Alignment? alignment,
    super.maintainState,
    super.fullscreenDialog,
    super.opaque,
  }) : super(
         transitionDuration: duration,
         reverseTransitionDuration: reverseDuration,
         transitionsBuilder: (context, animation, secondaryAnimation, child) {
           switch (type) {
             case PageTransitionType.fade:
               return FadeTransition(opacity: animation, child: child);

             case PageTransitionType.rightToLeft:
               return SlideTransition(
                 position: Tween<Offset>(
                   begin: const Offset(1, 0),
                   end: Offset.zero,
                 ).animate(CurvedAnimation(parent: animation, curve: curve)),
                 child: child,
               );

             case PageTransitionType.leftToRight:
               return SlideTransition(
                 position: Tween<Offset>(
                   begin: const Offset(-1, 0),
                   end: Offset.zero,
                 ).animate(CurvedAnimation(parent: animation, curve: curve)),
                 child: child,
               );

             case PageTransitionType.topToBottom:
               return SlideTransition(
                 position: Tween<Offset>(
                   begin: const Offset(0, -1),
                   end: Offset.zero,
                 ).animate(CurvedAnimation(parent: animation, curve: curve)),
                 child: child,
               );

             case PageTransitionType.bottomToTop:
               return SlideTransition(
                 position: Tween<Offset>(
                   begin: const Offset(0, 1),
                   end: Offset.zero,
                 ).animate(CurvedAnimation(parent: animation, curve: curve)),
                 child: child,
               );

             case PageTransitionType.scale:
               return ScaleTransition(
                 alignment: alignment ?? Alignment.center,
                 scale: CurvedAnimation(parent: animation, curve: curve),
                 child: child,
               );

             case PageTransitionType.rotate:
               return RotationTransition(
                 alignment: alignment ?? Alignment.center,
                 turns: animation,
                 child: ScaleTransition(
                   alignment: alignment ?? Alignment.center,
                   scale: animation,
                   child: FadeTransition(opacity: animation, child: child),
                 ),
               );

             case PageTransitionType.size:
               return Align(
                 alignment: alignment ?? Alignment.center,
                 child: SizeTransition(
                   sizeFactor: CurvedAnimation(parent: animation, curve: curve),
                   child: child,
                 ),
               );

             case PageTransitionType.rightToLeftWithFade:
               return SlideTransition(
                 position: Tween<Offset>(
                   begin: const Offset(1, 0),
                   end: Offset.zero,
                 ).animate(CurvedAnimation(parent: animation, curve: curve)),
                 child: FadeTransition(opacity: animation, child: child),
               );

             case PageTransitionType.leftToRightWithFade:
               return SlideTransition(
                 position: Tween<Offset>(
                   begin: const Offset(-1, 0),
                   end: Offset.zero,
                 ).animate(CurvedAnimation(parent: animation, curve: curve)),
                 child: FadeTransition(opacity: animation, child: child),
               );

             default:
               return FadeTransition(opacity: animation, child: child);
           }
         },
       );
}
