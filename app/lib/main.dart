import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.blue),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _language = 'en';

  static const Map<String, _LocalizedContent> _contentByLanguage = {
    'th': _LocalizedContent(
      title: 'นักออกแบบฟอร์ม Flutter',
      welcome: 'ยินดีต้อนรับ',
      subtitle: 'สลับภาษาได้จากปุ่มมุมขวาบน',
    ),
    'en': _LocalizedContent(
      title: 'Flutter Form Designer',
      welcome: 'Welcome',
      subtitle: 'Use the top-right buttons to switch language.',
    ),
    'ja': _LocalizedContent(
      title: 'Flutterフォームデザイナー',
      welcome: 'ようこそ',
      subtitle: '右上のボタンで言語を切り替えます。',
    ),
  };

  @override
  Widget build(BuildContext context) {
    final content = _contentByLanguage[_language] ?? _contentByLanguage['en']!;

    return Scaffold(
      appBar: AppBar(
        title: Text(content.title),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Center(
              child: SegmentedButton<String>(
                segments: const [
                  ButtonSegment(value: 'th', label: Text('Thai')),
                  ButtonSegment(value: 'en', label: Text('English')),
                  ButtonSegment(value: 'ja', label: Text('Japanese')),
                ],
                selected: {_language},
                onSelectionChanged: (Set<String> selected) {
                  setState(() {
                    _language = selected.first;
                  });
                },
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(content.welcome, style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 12),
            Text(content.subtitle),
          ],
        ),
      ),
    );
  }
}

class _LocalizedContent {
  const _LocalizedContent({
    required this.title,
    required this.welcome,
    required this.subtitle,
  });

  final String title;
  final String welcome;
  final String subtitle;
}
