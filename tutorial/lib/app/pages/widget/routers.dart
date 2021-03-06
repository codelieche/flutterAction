/// 组件示例相关的路由
/// 前缀：/widget/
import 'package:tutorial/app/pages/widget/column/index.dart';
import 'package:tutorial/app/pages/widget/other.dart';

// 引入/widget相关的页面

// simple:基础组件
import 'text/index.dart';
import 'image/index.dart';
import 'button/index.dart';
import 'listview/index.dart';
import 'gridview/index.dart';
import 'customScrollView/index.dart';
import 'datetime/index.dart';
import 'other/simpleOtherIndex.dart';

// layout：布局组件
import 'container/index.dart';
import 'row/index.dart';
import 'column/index.dart';
import 'wrap/index.dart';
import 'expanded/index.dart';
import 'stack/index.dart';
import 'positioned/index.dart';
import 'card/index.dart';
import 'expansionTile/index.dart';
import 'other/layoutOtherIndex.dart';

// complex: 复杂组件
import 'scaffold/index.dart';
import 'dialog/index.dart';
import 'draggable/index.dart';
import 'table/index.dart';
import 'provider/index.dart';

// 表单组件
import 'textField/index.dart';
import 'radio/index.dart';
import 'checkbox/index.dart';
import 'switch/index.dart';

// 其它
import 'other/socket/index.dart';

Map<String, Function> widgetRoutes = {
  // 基础组件：simple
  "/widget/text/index": (context) => TextWidgetIndexPage(),
  "/widget/image/index": (context) => ImageWidgetIndexPage(),
  "/widget/button/index": (context) => ButtonWidgetIndexPage(),
  "/widget/listview/index": (context) => ListViewWidgetIndexPage(),
  "/widget/gridview/index": (context) => GridViewWidgetIndexPage(),
  "/widget/customscrollview/index": (context) =>
      CustomScrollViewDemoIndexPage(),
  "/widget/datetime/index": (context) => DateTimeIndexPage(),
  "/widget/other/simple/index": (context) => SimpleOtherWidgetIndexPage(),

  // 布局相关组件：layout
  "/widget/container/index": (context) => ContainerWidgetIndexPage(),
  "/widget/row/index": (context) => RowWidgetIndexPage(),
  "/widget/column/index": (context) => ColumnWidgetIndexPage(),
  "/widget/wrap/index": (context) => WrapWidgetIndexPage(),
  "/widget/expanded/index": (context) => ExpandedWidgetIndexPage(),
  "/widget/stack/index": (context) => StackWidgetIndexPage(),
  "/widget/positioned/index": (context) => PositionedWidgetIndexPage(),
  "/widget/card/index": (context) => CardWidgetIndexPage(),
  "/widget/expansiontile/index": (context) => ExpansionTileIndexPage(),
  "/widget/other/layout/index": (context) => LayoutOtherWidgetIndexPage(),

  // 复杂组件
  "/widget/scaffold/index": (context) => ScaffoldWidgetIndexPage(),
  "/widget/dialog/index": (context) => DialogIndexPage(),
  "/widget/draggable/index": (context) => DraggableIndexPage(),
  "/widget/table/index": (context) => TableDemoIndexPage(),
  "/widget/provider/index": (context) => ProviderIndexPage(),

  // 表单组件
  "/widget/textfield/index": (context) => TextFieldIndexDemoPage(),
  "/widget/radio/index": (context) => RadioIndexDemoPage(),
  "/widget/checkbox/index": (context) => CheckBoxIndexDemoPage(),
  "/widget/switch/index": (context) => SwitchDemoIndexPage(),

  // 其它
  "/widget/other/index": (context) => OtherWidgetIndexPage(),
  "/widget/other/socket/index": (context) => SocketDemoIndexPage(),
};
