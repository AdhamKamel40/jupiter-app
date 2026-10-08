import 'dart:math';
import 'package:flutter/material.dart';

import 'features/top_students/presentation/widgets/top_students_section.dart';
import 'features/top_students/presentation/view_models/top_students_view_model.dart';
import 'features/top_students/top_students_feature.dart';
import 'profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  late final TopStudentsViewModel topStudentsViewModel;

  static const Color purple = Color(0xFF85009B);
  static const Color darkPurple = Color(0xFF650075);
  static const Color textColor = Color(0xFF26334D);

  final List<Map<String, String>> branches = [
    {
      'name': 'Bitash Branch',
      'address':
          'Al-Ajami - Omar Effendi Street, branching off from Al-Bitash Main Street, above Matcha Cafe',
    },
    {
      'name': 'Asafra Branch',
      'address':
          'Palace Tower, Friends of the Bible Street, branching off from Gamal Abdel Nasser Street, next to Karam Al Sham',
    },
    {
      'name': 'Engineers Syndicate',
      'address':
          '36 Boursaid St, intersection of Mohamed Aziz Fekry St, directly in front of Saint Mark College, Shatby',
    },
  ];

  @override
  void initState() {
    super.initState();
    topStudentsViewModel = TopStudentsFeature.createViewModel()..load();
  }

  @override
  void dispose() {
    topStudentsViewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            _header(),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    _hero(),
                    TopStudentsSection(viewModel: topStudentsViewModel),
                    Container(
                      color: purple,
                      padding: const EdgeInsets.fromLTRB(18, 30, 18, 30),
                      child: Column(
                        children: [
                          _sectionTitle(),
                          const SizedBox(height: 18),
                          ...branches.map(
                            (branch) => Padding(
                              padding: const EdgeInsets.only(bottom: 18),
                              child: _branchCard(
                                branch['name']!,
                                branch['address']!,
                              ),
                            ),
                          ),
                          _contactSection(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _bottomNavigation(),
    );
  }

  Widget _header() {
    return Container(
      height: 92,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Container(
            width: 57,
            height: 57,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                colors: [purple, darkPurple],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              border: Border.all(color: const Color(0xFFE8DCEB), width: 3),
            ),
            child: const Icon(
              Icons.rocket_launch_rounded,
              color: Colors.white,
              size: 28,
            ),
          ),
          const SizedBox(width: 13),
          const Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hi, Welcome',
                  style: TextStyle(
                    color: purple,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  'AdhamKamelAhmedKamel',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Color(0xFF650075),
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Transform.rotate(
                angle: -0.05,
                child: const Text(
                  'JUPITER',
                  style: TextStyle(
                    color: purple,
                    fontSize: 21,
                    fontWeight: FontWeight.w900,
                    fontStyle: FontStyle.italic,
                    letterSpacing: -1.5,
                  ),
                ),
              ),
              const Text(
                'ACADEMY',
                style: TextStyle(
                  color: textColor,
                  fontSize: 10,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1.3,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _hero() {
    return SizedBox(
      height: 310,
      child: Stack(
        clipBehavior: Clip.hardEdge,
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF8E10A5), Color(0xFF680078)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          ..._stars(),
          Positioned(
            right: -75,
            top: 50,
            child: Container(
              width: 330,
              height: 135,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white.withOpacity(.14)),
                borderRadius: BorderRadius.circular(200),
              ),
              transform: Matrix4.rotationZ(-.17),
            ),
          ),
          Positioned(
            right: -45,
            top: 100,
            child: Container(
              width: 250,
              height: 95,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white.withOpacity(.11)),
                borderRadius: BorderRadius.circular(200),
              ),
              transform: Matrix4.rotationZ(.2),
            ),
          ),
          Positioned(right: -25, top: 73, child: _planet()),
          const Positioned(
            left: 29,
            top: 42,
            child: Text(
              'EXPLORE YOUR FUTURE',
              style: TextStyle(
                color: Color(0xBFFFFFFF),
                fontSize: 10,
                fontWeight: FontWeight.w800,
                letterSpacing: 2,
              ),
            ),
          ),
          const Positioned(
            left: 29,
            top: 65,
            child: Text.rich(
              TextSpan(
                text: 'Welcome to\n',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 29,
                  height: 1.2,
                  fontWeight: FontWeight.w800,
                ),
                children: [
                  TextSpan(
                    text: 'Jupiter Academy',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Positioned(
            left: 29,
            top: 145,
            child: Text(
              'Learn. Grow. Reach the stars.',
              style: TextStyle(
                color: Color(0xCCFFFFFF),
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Positioned(
            left: 29,
            top: 185,
            child: Container(
              height: 45,
              padding: const EdgeInsets.symmetric(horizontal: 17),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(.14),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: Colors.white.withOpacity(.25)),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Explore Academy',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(width: 9),
                  Icon(
                    Icons.arrow_forward_rounded,
                    color: Colors.white,
                    size: 19,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _planet() {
    return Container(
      width: 150,
      height: 150,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [Color(0xFFB735C2), Color(0xFF8C159D)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: ClipOval(
        child: Stack(
          children: [
            Positioned(
              top: 30,
              left: -20,
              child: Transform.rotate(
                angle: -.1,
                child: Container(
                  width: 190,
                  height: 13,
                  color: Colors.white.withOpacity(.12),
                ),
              ),
            ),
            Positioned(
              top: 65,
              left: -10,
              child: Transform.rotate(
                angle: .08,
                child: Container(
                  width: 180,
                  height: 10,
                  color: Colors.white.withOpacity(.10),
                ),
              ),
            ),
            Positioned(
              top: 102,
              left: -20,
              child: Transform.rotate(
                angle: -.07,
                child: Container(
                  width: 190,
                  height: 15,
                  color: Colors.white.withOpacity(.11),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _stars() {
    final random = Random(12);

    return List.generate(42, (index) {
      final size = random.nextDouble() * 2.5 + 1;
      final left = random.nextDouble() * MediaQuery.of(context).size.width;
      final top = random.nextDouble() * 290;

      return Positioned(
        left: left,
        top: top,
        child: Container(
          width: size,
          height: size,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
        ),
      );
    });
  }

  Widget _sectionTitle() {
    return Row(
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(.14),
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Icon(
            Icons.location_on_rounded,
            color: Colors.white,
            size: 25,
          ),
        ),
        const SizedBox(width: 13),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'FIND US',
              style: TextStyle(
                color: Color(0xA8FFFFFF),
                fontSize: 10,
                fontWeight: FontWeight.w800,
                letterSpacing: 1.7,
              ),
            ),
            SizedBox(height: 1),
            Text(
              'Our Branches',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _branchCard(String name, String address) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 25),
      decoration: BoxDecoration(
        color: const Color(0xFFF9F9FB),
        borderRadius: BorderRadius.circular(27),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.12),
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 39,
                height: 39,
                decoration: BoxDecoration(
                  color: purple,
                  borderRadius: BorderRadius.circular(13),
                ),
                child: const Icon(
                  Icons.location_on_rounded,
                  color: Colors.white,
                  size: 21,
                ),
              ),
              const SizedBox(width: 11),
              Expanded(
                child: Text(
                  name,
                  style: const TextStyle(
                    color: Color(0xFF700080),
                    fontSize: 21,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 17),
          Text(
            address,
            style: const TextStyle(
              color: textColor,
              fontSize: 16,
              height: 1.55,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: _actionButton(Icons.location_on_rounded, 'Location'),
              ),
              Expanded(child: _actionButton(Icons.phone_rounded, 'Call')),
            ],
          ),
          const SizedBox(height: 22),
          Center(
            child: _actionButton(Icons.chat_bubble_outline_rounded, 'WhatsApp'),
          ),
        ],
      ),
    );
  }

  Widget _actionButton(IconData icon, String label) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 4),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: purple, size: 27),
            const SizedBox(width: 9),
            Text(
              label,
              style: const TextStyle(
                color: purple,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _contactSection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(27, 27, 27, 30),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [darkPurple, Color(0xFF730083)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Stack(
        children: [
          Positioned(
            right: -30,
            top: -30,
            child: Container(
              width: 130,
              height: 130,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white.withOpacity(.08)),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'STAY CONNECTED',
                style: TextStyle(
                  color: Color(0xA8FFFFFF),
                  fontSize: 10,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 2,
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                'Contact Us',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 29,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 9),
              const Text(
                'Follow Jupiter Academy and stay up to date with everything happening across our academy.',
                style: TextStyle(
                  color: Color(0xB8FFFFFF),
                  fontSize: 14,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 23),
              Row(
                children: [
                  _socialButton(Icons.facebook_rounded),
                  const SizedBox(width: 14),
                  _socialButton(Icons.business_center_rounded),
                  const SizedBox(width: 14),
                  _socialButton(Icons.camera_alt_rounded),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _socialButton(IconData icon) {
    return Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.13),
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white.withOpacity(.1)),
      ),
      child: Icon(icon, color: Colors.white, size: 28),
    );
  }

  Widget _bottomNavigation() {
    return Container(
      height: 82,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.grey.shade200)),
      ),
      child: Row(
        children: [
          _navItem(Icons.home_rounded, 'Home', 0),
          _navItem(Icons.menu_book_rounded, 'My Batches', 1),
          _navItem(
            Icons.notifications_rounded,
            'Notifications',
            2,
            notification: true,
          ),
          _navItem(Icons.person_rounded, 'Profile', 3),
        ],
      ),
    );
  }

  Widget _navItem(
    IconData icon,
    String label,
    int index, {
    bool notification = false,
  }) {
    final active = currentIndex == index;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          if (index == 3) {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const ProfileScreen()),
            );
            return;
          }

          setState(() {
            currentIndex = index;
          });
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Icon(
                  icon,
                  size: 28,
                  color: active ? purple : const Color(0xFFA5A5A5),
                ),
                if (notification)
                  Positioned(
                    right: -4,
                    top: -2,
                    child: Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: Colors.redAccent,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: active ? purple : const Color(0xFFA5A5A5),
                fontSize: 13,
                fontWeight: active ? FontWeight.w600 : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
