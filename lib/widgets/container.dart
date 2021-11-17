part of '../utilities.dart';

Widget scaffold({
  required Widget body,
  Key? key,
  PreferredSizeWidget? appBar,
  Drawer? drawer,
  Widget? floatingActionButton,
  Widget? bottomNavigationBar,
  EdgeInsets? padding,
  Color? color,
  BoxDecoration? decoration,
  bool resizeToAvoidBottomInset = false,
  bool extendBodyBehindAppBar = false,
  FloatingActionButtonLocation floatingActionButtonLocation = FloatingActionButtonLocation.endFloat,
  BoxConstraints? constraints,
  Alignment? alignment,
}) =>
    GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
      child: Scaffold(
        key: key,
        backgroundColor: color,
        appBar: appBar,
        drawer: drawer,
        extendBodyBehindAppBar: extendBodyBehindAppBar,
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        floatingActionButton: floatingActionButton,
        floatingActionButtonLocation: floatingActionButtonLocation,
        bottomNavigationBar: bottomNavigationBar,
        body: Container(
          constraints: constraints,
          decoration: decoration,
          padding: padding,
          alignment: alignment,
          child: body,
        ),
      ),
    );

Widget pullRefresh({
  required RefreshController controller,
  Function? onLoading,
  Function? onRefresh,
  Widget? child,
}) =>
    SmartRefresher(
      controller: controller,
      onLoading: onLoading as void Function()?,
      onRefresh: onRefresh as void Function()?,
      enablePullDown: true,
      enablePullUp: true,
      child: child,
    );

Widget radius({required Widget child, required double radius}) => ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: child,
    );

Widget column({
  EdgeInsets padding = EdgeInsets.zero,
  EdgeInsets margin = EdgeInsets.zero,
  List<Widget> children = const <Widget>[],
  MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
  MainAxisSize mainAxisSize = MainAxisSize.max,
  CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
  VerticalDirection verticalDirection = VerticalDirection.down,
  BoxDecoration? decoration,
  double? width,
  double? height,
}) =>
    Container(
      width: width,
      height: height,
      decoration: decoration,
      padding: padding,
      margin: margin,
      child: Column(
        mainAxisAlignment: mainAxisAlignment,
        mainAxisSize: mainAxisSize,
        crossAxisAlignment: crossAxisAlignment,
        verticalDirection: verticalDirection,
        children: children,
      ),
    );

Widget row({
  EdgeInsets padding = EdgeInsets.zero,
  EdgeInsets margin = EdgeInsets.zero,
  List<Widget> children = const <Widget>[],
  MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
  MainAxisSize mainAxisSize = MainAxisSize.max,
  CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
  VerticalDirection verticalDirection = VerticalDirection.down,
  BoxDecoration? decoration,
  double? width,
  double? height,
}) =>
    Container(
      width: width,
      height: height,
      decoration: decoration,
      padding: padding,
      margin: margin,
      child: Row(
        mainAxisAlignment: mainAxisAlignment,
        mainAxisSize: mainAxisSize,
        crossAxisAlignment: crossAxisAlignment,
        verticalDirection: verticalDirection,
        children: children,
      ),
    );

class TabBarViewModel {
  final Tab tab;
  final Widget view;

  TabBarViewModel({required this.tab, required this.view});
}

Widget defaultTabBar({
  required List<TabBarViewModel> tabs,
  required Widget tabBar,
  double? width,
  double? height = 500,
  int initialIndex = 0,
}) =>
    DefaultTabController(
      initialIndex: initialIndex,
      length: tabs.length,
      child: Column(
        children: [
          tabBar,
          Container(
            width: width ?? screenWidth,
            height: height,
            child: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              children: tabs.map((TabBarViewModel view) => view.view).toList(),
            ),
          )
        ],
      ),
    );

Widget iconTextHorizontal({
  required Widget leading,
  required Widget trailing,
  EdgeInsets margin = EdgeInsets.zero,
  VoidCallback? onTap,
  double spaceBetween = 6,
  MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
  MainAxisSize mainAxisSize = MainAxisSize.min,
}) =>
    GestureDetector(
      onTap: onTap,
      child: row(
        mainAxisAlignment: mainAxisAlignment,
        mainAxisSize: mainAxisSize,
        margin: margin,
        children: [leading, SizedBox(width: spaceBetween), trailing],
      ),
    );

Widget iconTextVertical({
  required Widget leading,
  required Widget trailing,
  EdgeInsets margin = EdgeInsets.zero,
  VoidCallback? onTap,
  double spaceBetween = 6,
  MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
  MainAxisSize mainAxisSize = MainAxisSize.min,
}) =>
    GestureDetector(
      onTap: onTap,
      child: column(
        mainAxisAlignment: mainAxisAlignment,
        mainAxisSize: mainAxisSize,
        margin: margin,
        children: [leading, SizedBox(width: spaceBetween), trailing],
      ),
    );
