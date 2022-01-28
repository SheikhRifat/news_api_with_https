import 'package:flutter/material.dart';
import 'package:news_api/src/config/ktext.dart';
import 'package:news_api/src/custom_card/news_page_card.dart';

class NewsPage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<NewsPage>
    with SingleTickerProviderStateMixin {
  late ScrollController _scrollController;
  late TabController _tabController;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _tabController = TabController(length: 5, vsync: this);
    _tabController.addListener(_handleTabSelection);
    _tabController.addListener(_smoothScrollToTop);
  }

  _smoothScrollToTop() {
    if (_scrollController.hasClients)
      _scrollController.animateTo(
        0,
        duration: Duration(microseconds: 300),
        curve: Curves.easeInOut,
      );
  }

  _handleTabSelection() {
    setState(() {
      currentIndex = 0;
    });
  }

  void changePage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  List<String> navbarItem = [
    'Top Strories',
    'India',
    'Word',
    'Finance',
    'Health'
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (context, value) {
          return [
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.fromLTRB(25, 10, 25, 25),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Top News Updates",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
                child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TabBar(
                    isScrollable: true,
                    controller: _tabController,
                    indicator: BoxDecoration(
                      color: Colors.green[300],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    indicatorColor: Colors.grey,
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.white,
                    tabs: [
                      Tab(
                        child: KText(
                          text: 'Top Stories',
                          color: _tabController.index == 0
                              ? Colors.black
                              : Colors.white,
                        ),
                      ),
                      Tab(
                        child: KText(
                          text: 'India',
                          color: _tabController.index == 1
                              ? Colors.black
                              : Colors.white,
                        ),
                      ),
                      Tab(
                        child: KText(
                          text: 'Word',
                          color: _tabController.index == 2
                              ? Colors.black
                              : Colors.white,
                        ),
                      ),
                      Tab(
                        child: KText(
                          text: 'Finance',
                          color: _tabController.index == 3
                              ? Colors.black
                              : Colors.white,
                        ),
                      ),
                      Tab(
                        child: KText(
                          text: 'Health',
                          color: _tabController.index == 4
                              ? Colors.black
                              : Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )),
          ];
        },
        body: Container(
            child: Expanded(
                child: TabBarView(controller: _tabController, children: [
          NewsPageCard(),
          NewsPageCard(),
          NewsPageCard(),
          NewsPageCard(),
          NewsPageCard(),
        ]))),
      ),
    );
  }
}
