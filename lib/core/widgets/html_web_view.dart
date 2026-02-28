import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// 一个简单的 HTML 内容显示组件，基于 webview_flutter 实现。
class HtmlWebView extends StatefulWidget {
  const HtmlWebView({
    super.key,
    required this.htmlContent,
    this.backgroundColor,
  });

  final String htmlContent;
  final Color? backgroundColor;

  @override
  State<HtmlWebView> createState() => _HtmlWebViewState();
}

class _HtmlWebViewState extends State<HtmlWebView> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(widget.backgroundColor ?? Colors.transparent)
      ..loadHtmlString(_wrapHtml(widget.htmlContent));
  }

  @override
  void didUpdateWidget(HtmlWebView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.htmlContent != widget.htmlContent) {
      _controller.loadHtmlString(_wrapHtml(widget.htmlContent));
    }
  }

  String _wrapHtml(String content) {
    // 包装 HTML 以确保在 WebView 中正确显示，特别是处理编码和视口
    return '''
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
  <style>
    body {
      font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif;
      font-size: 14px;
      line-height: 1.6;
      color: inherit;
      margin: 0;
      padding: 16px;
      word-wrap: break-word;
    }
    h1 { font-size: 20px; font-weight: bold; text-align: center; margin-bottom: 24px; }
    h2 { font-size: 16px; font-weight: bold; margin-top: 20px; margin-bottom: 12px; }
    h3 { font-size: 15px; font-weight: 600; margin-top: 16px; margin-bottom: 8px; }
    p { margin-bottom: 12px; text-align: justify; }
    ul, ol { padding-left: 20px; margin-bottom: 12px; }
    li { margin-bottom: 8px; }
    a { color: #2196F3; text-decoration: none; }
    img { max-width: 100%; height: auto; }
  </style>
</head>
<body>
  $content
</body>
</html>
''';
  }

  @override
  Widget build(BuildContext context) {
    return WebViewWidget(controller: _controller);
  }
}
