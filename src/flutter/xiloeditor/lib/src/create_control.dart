import 'package:flet/flet.dart';
import 'package:highlight/highlight_core.dart';

import 'xiloeditor.dart';

final Mode pseudocode = Mode(
  className: 'pseudocode',
  case_insensitive: true, // Make keywords case-insensitive (e.g., FOR, for, For)
  keywords: {
    'keyword': [
      'for', 'to', 'if', 'then', 'else', 'end', 'print', 'while', 'do', 'begin'
    ],
  },
  contains: [
    Mode(
      className: 'string',
      begin: '"',
      end: '"',
      relevance: 0,
    ),
    Mode(
      className: 'number',
      begin: r'\b\d+\b',
      relevance: 0,
    ),
    Mode(
      className: 'comment',
      begin: r'//',
      end: r'$',
      relevance: 0,
    ),
  ],
);

CreateControlFactory createControl = (CreateControlArgs args) {
  switch (args.control.type) {
    case "xiloeditor":
      return XiloeditorControl(
        parent: args.parent,
        control: args.control,
        children: args.children,
        parentAdaptive: args.parentAdaptive,
        parentDisabled: args.parentDisabled,
        backend: args.backend,
      );
    default:
      return null;
  }
};

void ensureInitialized() {
  highlight.registerLanguage('pseudocode', pseudocode);
}
