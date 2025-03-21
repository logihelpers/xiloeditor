import 'package:flet/flet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_code_editor/flutter_code_editor.dart';
import 'package:flutter_highlight/themes/a11y-dark.dart';
import 'package:flutter_highlight/themes/a11y-light.dart';
import 'package:flutter_highlight/themes/agate.dart';
import 'package:flutter_highlight/themes/androidstudio.dart';
import 'package:flutter_highlight/themes/arta.dart';
import 'package:flutter_highlight/themes/ascetic.dart';
import 'package:flutter_highlight/themes/atom-one-dark.dart';
import 'package:flutter_highlight/themes/atom-one-light.dart';
import 'package:flutter_highlight/themes/default.dart';
import 'package:flutter_highlight/themes/dark.dart';
import 'package:flutter_highlight/themes/monokai.dart';
import 'package:flutter_highlight/themes/monokai-sublime.dart';
import 'package:flutter_highlight/themes/obsidian.dart';
import 'package:flutter_highlight/themes/vs2015.dart';
import 'package:flutter_highlight/themes/xcode.dart';
import 'package:xiloeditor/src/create_control.dart';

class XiloeditorControl extends StatefulWidget {
  final Control? parent;
  final Control control;
  final List<Control> children;
  final bool parentDisabled;
  final bool? parentAdaptive;
  final FletControlBackend backend;

  const XiloeditorControl({
    super.key,
    required this.parent,
    required this.control, 
    required this.children, 
    required this.parentDisabled, 
    required this.parentAdaptive, 
    required this.backend,
  });
  
  @override
  State<XiloeditorControl> createState() => _XiloeditorControlState();
}

class _XiloeditorControlState extends State<XiloeditorControl> with FletStoreMixin {
  final controller = CodeController(
    language: pseudocode,
    text: ''
  );

  @override
  Widget build(BuildContext context) {
    debugPrint("XiloEditor build ($hashCode): ${widget.control.id}");

    return withPageArgs((context, pageArgs) {
      var theme = parseEditorTheme(widget.control.attrString("editorTheme", "default")!.toLowerCase());
      var showLineNumbers = widget.control.attrBool("showLineNumbers", true)!;

      var editor = CodeTheme(
        data: CodeThemeData(styles: theme),
        child: SingleChildScrollView(
          child: CodeField(
            controller: controller,
            gutterStyle: GutterStyle(
              showErrors: false,
              showFoldingHandles: false,
              showLineNumbers: showLineNumbers
            ),
          ),
        )
      );

      return constrainedControl(context, editor, widget.parent, widget.control);
    });
  }
  
  parseEditorTheme(String theme) {
    switch (theme) {
      case "a11y-dark":
        return a11yDarkTheme;
      case "a11y-light":
        return a11yLightTheme;
      case "agate":
        return agateTheme;
      case "androidstudio":
        return androidstudioTheme;
      case "arta":
        return artaTheme;
      case "ascetic":
        return asceticTheme;
      case "atom-one-dark":
        return atomOneDarkTheme;
      case "atom-one-light":
        return atomOneLightTheme;
      case "default":
        return defaultTheme;
      case "dark":
        return darkTheme;
      case "monokai":
        return monokaiTheme;
      case "monokai-sublime":
        return monokaiSublimeTheme;
      case "obsidian":
        return obsidianTheme;
      case "vs2015":
        return vs2015Theme;
      case "xcode":
        return xcodeTheme;
      default:
        return defaultTheme;
    }
  }
}

