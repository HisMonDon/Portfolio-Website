import 'package:flutter/material.dart';
import 'dart:async';

class ProjectsImageScroller extends StatefulWidget {
  final List<String> images;

  const ProjectsImageScroller({super.key, required this.images});

  @override
  State<ProjectsImageScroller> createState() => _ProjectsImageScrollerState();
}

class _ProjectsImageScrollerState extends State<ProjectsImageScroller> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      if (_pageController.hasClients && _pageController.page != null) {
        setState(() {
          _currentPage = _pageController.page!.round();
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.images.isEmpty) {
      print("devnote: empty list of images?");
      return Container();
    }

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (widget.images.length > 1)
              _buildArrowButton(
                icon: Icons.arrow_back_ios_new,
                onPressed: _currentPage > 0
                    ? () => _pageController.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.ease,
                      )
                    : null,
              ),
            Expanded(
              child: AspectRatio(
                aspectRatio: 17 / 9,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: widget.images.length,
                  onPageChanged: (int page) {
                    setState(() {
                      _currentPage = page;
                    });
                  },
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          widget.images[index],
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            if (widget.images.length > 1)
              _buildArrowButton(
                icon: Icons.arrow_forward_ios,
                onPressed: _currentPage < widget.images.length - 1
                    ? () => _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.ease,
                      )
                    : null,
              ),
          ],
        ),
        const SizedBox(height: 12),
        if (widget.images.length > 1)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(widget.images.length, (index) {
              return _buildDotIndicator(index);
            }),
          ),
      ],
    );
  }

  Widget _buildArrowButton({
    required IconData icon,
    required VoidCallback? onPressed,
  }) {
    return IconButton(
      icon: Icon(icon, size: 18),
      onPressed: onPressed,
      color: onPressed != null ? Theme.of(context).primaryColor : Colors.grey,
    );
  }

  Widget _buildDotIndicator(int index) {
    bool isActive = _currentPage == index;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      height: 8.0,
      width: 8.0,
      decoration: BoxDecoration(
        color: isActive
            ? Theme.of(context).primaryColor
            : Colors.white.withOpacity(0.5),
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
