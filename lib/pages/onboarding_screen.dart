import 'package:avatar_element/config/colors.dart';
import 'package:avatar_element/pages/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final List<Map<String, dynamic>> _pages = [
    {
      'images': 'assets/elemental.png',
      'title': 'Explore the Elemental Nations',
      'desc':
          'Dive deep into the lore and landscapes of the Avatar universe. Explore maps, learn about different cultures, and uncover hidden secrets scattered throughout the world.',
    },
    {
      'images': 'assets/character.png',
      'title': 'Explore Character Profiles',
      'desc':
          'Discover comprehensive profiles for every character in the Avatar series. learn about their backgrounds, personalities, and pivotal moments throughout their journeys.',
    },
    {
      'images': 'assets/episode.png',
      'title': 'Episode Guides',
      'desc':
          "Relive key moments and episodes from the series with our detailed episode guides. Explore summaries to deepen your understanding of each character's development.",
    },
  ];

  final PageController _controller = PageController();
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Stack(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              },
              child: Container(
                margin: const EdgeInsets.only(top: 60),
                alignment: Alignment.topRight,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Skip',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: airTribe,
                          fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
            PageView.builder(
                controller: _controller,
                itemCount: _pages.length,
                onPageChanged: (index) {
                  setState(() {
                    onLastPage = (index == _pages.length - 1);
                  });
                },
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 120, horizontal: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Image.asset(_pages[index]['images']),
                        const SizedBox(height: 30),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            _pages[index]['title'],
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: airTribe),
                          ),
                        ),
                        Text(
                          _pages[index]['desc'],
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: airTribe),
                        )
                      ],
                    ),
                  );
                }),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                alignment: const Alignment(0, 0.95),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SmoothPageIndicator(
                      controller: _controller,
                      count: _pages.length,
                      effect: const ExpandingDotsEffect(
                        dotColor: Colors.white,
                        activeDotColor: airTribe,
                      ),
                      onDotClicked: (index) => _controller.animateToPage(
                        index,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      ),
                    ),
                    GestureDetector(
                      onTap: onLastPage
                          ? () {
                              // Navigator.pushNamed(context, '/homepage');
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomeScreen()),
                              );
                            }
                          : () {
                              _controller.nextPage(
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeIn);
                            },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50)),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.arrow_forward,
                            color: airTribe,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
