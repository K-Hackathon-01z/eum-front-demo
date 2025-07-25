import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../widgets/user/navigation.dart';
import 'career_test.dart';
import 'map.dart';
import 'my_info.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [HomeScreen(), MapScreen(), CareerTestScreen(), MyInfoScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F1F1),
      body: SafeArea(
        child: IndexedStack(index: _currentIndex, children: _pages),
      ),
      bottomNavigationBar: CustomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

class PopularClassCard extends StatelessWidget {
  const PopularClassCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(30)),
            child: const Center(
              child: Text('Photo', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '원데이 클래스 상세 설명을 위한 공간입니다.',
                  style: const TextStyle(fontSize: 8, fontWeight: FontWeight.bold),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Text(
                  '52,000원',
                  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BannerButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback? onTap;
  const BannerButton({super.key, required this.icon, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 4)],
        ),
        child: Row(
          children: [
            Icon(icon, size: 28, color: Colors.black54),
            const SizedBox(width: 16),
            Text(text, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios, size: 18, color: Colors.black26),
          ],
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double bannerHeight = 108;

    return SingleChildScrollView(
      child: Column(
        children: [
          // 헤더
          Container(
            height: 70,
            width: double.infinity,
            padding: const EdgeInsets.only(left: 24, right: 24, top: 10, bottom: 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 98,
                    height: 52,
                    child: Center(child: Image.asset('assets/logos/eum_logo_home.png', fit: BoxFit.contain)),
                  ),
                ),
              ],
            ),
          ),
          // 오늘의 인기 강의
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            child: Container(
              margin: const EdgeInsets.only(bottom: 8),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(30)),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Text('오늘의 인기 강의', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                            const SizedBox(width: 4),
                            Icon(Icons.whatshot, color: Colors.redAccent, size: 20),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/oneday-class');
                          },
                          child: Icon(Icons.arrow_forward, size: 28, color: Colors.grey[700]),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 170,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 16), // 좌우 여백 균일하게
                      itemCount: 3,
                      separatorBuilder: (_, __) => const SizedBox(width: 12),
                      itemBuilder: (context, index) {
                        return PopularClassCard();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          // 위치 기반 추천 강의
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            child: Container(
              margin: const EdgeInsets.only(bottom: 8),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(30)),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Text('사용자 위치 기반 추천 강의', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                            const SizedBox(width: 4),
                            Icon(Icons.place, size: 20),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/oneday-class');
                          },
                          child: Icon(Icons.arrow_forward, size: 28, color: Colors.grey[700]),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 170,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 16), // 좌우 여백 균일하게
                      itemCount: 3,
                      separatorBuilder: (_, __) => const SizedBox(width: 12),
                      itemBuilder: (context, index) {
                        return PopularClassCard();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          // 정부지원금 배너 (반응형, 그라데이션, SVG, 너비 통일)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Container(
              width: double.infinity,
              height: bannerHeight,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xB3FFE082), // 파스텔 금빛 (밝은 노랑/금, 50% 불투명도)
                    Color(0xB3FFF9C4), // 밝은 파스텔 노랑 (연노랑, 50% 불투명도)
                  ],
                  stops: [0.10, 0.95],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.circular(30),
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
              ),
              child: Row(
                children: [
                  Flexible(
                    flex: 0,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 24, right: 12),
                      child: Container(
                        width: 72,
                        height: 72,
                        decoration: const BoxDecoration(shape: BoxShape.circle),
                        child: Center(
                          child: SvgPicture.asset(
                            'assets/icons/money.svg',
                            width: 64,
                            height: 64,
                            colorFilter: const ColorFilter.mode(Color.fromARGB(255, 83, 83, 83), BlendMode.srcIn),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    '이음 제안',
                                    style: TextStyle(
                                      color: Colors.black.withOpacity(0.5),
                                      fontSize: 13,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w700,
                                      height: 1.69,
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                  Icon(Icons.auto_awesome, color: Colors.black.withOpacity(0.5), size: 18),
                                ],
                              ),
                              const SizedBox(height: 4),
                              const Text(
                                '나에게 꼭 맞는 정부 지원 혜택',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w700,
                                  height: 1.29,
                                ),
                              ),
                              const SizedBox(height: 8),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    '/government-help', // 정부 지원 혜택 페이지로 이동
                                  );
                                },
                                child: Container(
                                  width: 200, // 텍스트 길이에 따라 자동 조절
                                  height: 28,
                                  decoration: BoxDecoration(
                                    color: const Color(0x7F4E4E4E),
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: const Center(
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 12),
                                      child: Text(
                                        '클릭 한 번으로 확인하기',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 11,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w700,
                                          height: 2,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // 목록들 배너
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Column(
              children: [
                BannerButton(
                  icon: Icons.handyman,
                  text: '전통 기술 목록 보기',
                  onTap: () {
                    Navigator.pushNamed(context, '/skill-list');
                  },
                ),
                BannerButton(
                  icon: Icons.people,
                  text: '장인 • 작가 목록 보기',
                  onTap: () {
                    Navigator.pushNamed(context, '/creator-list');
                  },
                ),
              ],
            ),
          ),
          //const SizedBox(height: 24),
        ],
      ),
    );
  }
}
