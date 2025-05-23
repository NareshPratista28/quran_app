import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/core/theme/theme_constants.dart';
import 'package:quran_app/presentation/providers/quran_provider.dart';
import 'package:quran_app/presentation/widgets/bookmark_list.dart';
import 'package:quran_app/presentation/widgets/juz_list.dart';
import 'package:quran_app/presentation/widgets/surah_list.dart';

class TabNavigation extends StatefulWidget {
  final QuranProvider quranProvider;
  const TabNavigation({super.key, required this.quranProvider});

  @override
  State<TabNavigation> createState() => _TabNavigationState();
}

class _TabNavigationState extends State<TabNavigation>
    with SingleTickerProviderStateMixin {
  int _selectedTabIndex = 0;
  final List<String> _tabs = ['Surah', 'Juz', 'Bookmark'];
  late TabController _tabController;

  final Duration _animationDuration = const Duration(milliseconds: 300);
  final Curve _animationCurve = Curves.easeInOut;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: _tabs.length,
      vsync: this,
      initialIndex: _selectedTabIndex,
    );
    _tabController.addListener(_handleTabChange);
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabChange);
    _tabController.dispose();
    super.dispose();
  }

  void _handleTabChange() {
    if (_tabController.indexIsChanging) {
      setState(() {
        _selectedTabIndex = _tabController.index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final quranProvider = Provider.of<QuranProvider>(context);
    return Column(
      children: [
        _buildTabBar(),
        const SizedBox(height: 16),
        quranProvider.isLoading
            ? const Center(child: CircularProgressIndicator())
            : _buildTabContent(),
      ],
    );
  }

  Widget _buildTabBar() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(_tabs.length, (index) {
            return Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() => _selectedTabIndex = index);
                  _tabController.animateTo(
                    index,
                    duration: _animationDuration,
                    curve: _animationCurve,
                  );
                },
                child: _buildTabItem(_tabs[index], index == _selectedTabIndex),
              ),
            );
          }),
        ),
        Container(
          margin: EdgeInsets.only(top: 8),
          height: 3,
          child: Stack(
            children: [
              // Background track
              Container(
                width: double.infinity,
                height: 3,
                decoration: BoxDecoration(
                  color: Colors.white24,
                  borderRadius: BorderRadius.circular(1.5),
                ),
              ),

              // Animated indicator
              AnimatedAlign(
                alignment: Alignment(
                  -1.0 + 2.0 * (_selectedTabIndex / (_tabs.length - 1)),
                  0,
                ),
                duration: _animationDuration,
                curve: _animationCurve,
                child: AnimatedContainer(
                  duration: _animationDuration,
                  curve: _animationCurve,
                  width: MediaQuery.of(context).size.width / _tabs.length - 16,
                  height: 3,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(1.5),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withOpacity(0.4),
                        blurRadius: 6,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTabItem(String title, bool isSelected) {
    return AnimatedContainer(
      duration: _animationDuration,
      decoration: BoxDecoration(
        color:
            isSelected
                ? AppColors.primary.withOpacity(0.2)
                : Colors.transparent,
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.all(4),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Center(
        child: Text(
          title,
          style:
              isSelected
                  ? AppTextStyles.activeTabItem
                  : AppTextStyles.inActiveTabItem,
        ),
      ),
    );
  }

  Widget _buildTabContent() {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 400),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return FadeTransition(
          opacity: animation,
          child: SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0.05, 0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        );
      },
      child: _getTabContent(),
    );
  }

  Widget _getTabContent() {
    Widget content;
    switch (_selectedTabIndex) {
      case 0:
        content = SurahList(
          key: ValueKey('surah'),
          quranProvider: widget.quranProvider,
        );
        break;
      case 1:
        content = JuzList(
          key: ValueKey('juz'),
          quranProvider: widget.quranProvider,
        );
        break;
      case 2:
        content = BookmarkList(
          key: ValueKey('bookmark'),
          quranProvider: widget.quranProvider,
        );
        break;
      default:
        return const SizedBox.shrink();
    }
    return content;
  }
}
