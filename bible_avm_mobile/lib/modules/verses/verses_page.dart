import 'dart:developer';

import 'package:bible_avm_mobile/modules/charpters/charpters_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../custom_app_bar.dart';
import '../../theme_provider.dart';

class VersesPage extends StatefulWidget {
  const VersesPage({
    Key? key,
    required this.charptersEntity,
    required this.themeProvider,
  }) : super(key: key);

  final CharptersEntity charptersEntity;
  final ThemeProvider themeProvider;

  @override
  State<VersesPage> createState() => _VersesPageState();
}

class _VersesPageState extends State<VersesPage> {
  ThemeProvider get themeProvider => widget.themeProvider;
  final key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      appBar: CustomAppBar(
        themeProvider: widget.themeProvider,
        title: '${widget.charptersEntity.bookName}, ${widget.charptersEntity.charpterNumber}',
      ),
      body: Padding(
          padding: const EdgeInsets.all(8),
          child: ListView.separated(
              itemBuilder: (context, index) {
                final item = widget.charptersEntity.verses[index];
                var data = '${item.verseNumber}. ${item.verseText}';
                return Tooltip(
                  message: 'Pressione e segure para copiar',
                  child: InkWell(
                      onHover: (value) {
                        log(value.toString());
                      },
                      onLongPress: () {
                        Clipboard.setData(ClipboardData(text: data));
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Copied to Clipboard"),
                        ));
                      },
                      child: SelectableText(data)),
                );
              },
              separatorBuilder: (context, index) => const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Divider(),
                  ),
              itemCount: widget.charptersEntity.verses.length)),
    );
  }
}
