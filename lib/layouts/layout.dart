import 'package:flutter/material.dart';

class TabsLayout extends StatefulWidget {
  const TabsLayout({super.key, required this.title, required this.tabs, required this.tabViews});

  final String title;
  final List<Tab> tabs;
  final List<Widget> tabViews;

  @override
  State<TabsLayout> createState() => _TabsLayoutState();
}

class _TabsLayoutState extends State<TabsLayout> with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: widget.tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: TabBarView(
        controller: _tabController,
        children: widget.tabViews,
      ),
      bottomNavigationBar: BottomAppBar(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        child: TabBar(
          dividerColor: Colors.transparent,
          controller: _tabController,
          tabs: widget.tabs,
        ),
      ),
    );
  }
}