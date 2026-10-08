import 'package:flutter/material.dart';
import './profile_viewmodel.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late final ProfileViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = ProfileViewModel();
  }

  @override
  void dispose() {
    viewModel.dispose();
    super.dispose();
  }

  void showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: const Color(0xff9400a8),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: viewModel,
      builder: (context, child) {
        return Scaffold(
          body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xff18073d),
                  Color(0xff30005e),
                  Color(0xff8b009f),
                ],
              ),
            ),
            child: SafeArea(
              child: Column(
                children: [
                  _buildTopBar(),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          _buildMainContent(),
                          _buildFooter(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          floatingActionButton: GestureDetector(
            onTap: () => showMessage('WhatsApp contact'),
            child: Container(
              width: 64,
              height: 64,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xff20c777),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x5520c777),
                    blurRadius: 20,
                    spreadRadius: 4,
                  ),
                ],
              ),
              child: const Icon(
                Icons.phone_in_talk,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildTopBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 4,
      ),
      child: Container(
        height: 82,
        decoration: BoxDecoration(
          color: const Color(0xdd180735),
          borderRadius: BorderRadius.circular(44),
          border: Border.all(
            color: const Color(0x55ffffff),
          ),
          boxShadow: const [
            BoxShadow(
              color: Color(0x66000000),
              blurRadius: 25,
              offset: Offset(0, 10),
            ),
          ],
        ),
        child: Row(
          children: [
            const SizedBox(width: 22),
            _buildLogo(),
            const SizedBox(width: 40),
            Expanded(
              child: Center(
                child: _buildNavigation(),
              ),
            ),
            _buildWelcome(),
            const SizedBox(width: 18),
            _buildNotification(),
            const SizedBox(width: 18),
          ],
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return GestureDetector(
      onTap: () => showMessage('Home'),
      child: SizedBox(
        width: 145,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Transform.rotate(
              angle: -0.03,
              child: const Text(
                'JUPITER',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      color: Color(0xffc600d9),
                      blurRadius: 1,
                    ),
                  ],
                ),
              ),
            ),
            const Positioned(
              bottom: 3,
              child: Text(
                'ACADEMY',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavigation() {
    return Container(
      height: 48,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: const Color(0xff281148),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _navItem('Home'),
          _navItem('Courses'),
          _navItem('Competitions'),
          _navItem('Students'),
          _navItem('Team'),
        ],
      ),
    );
  }

  Widget _navItem(String title) {
    return InkWell(
      borderRadius: BorderRadius.circular(25),
      onTap: () => showMessage(title),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              color: Color(0xffeee8f5),
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildWelcome() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 9,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        border: Border.all(
          color: Colors.white,
          width: 1.5,
        ),
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '👋',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(width: 10),
          Text(
            'Welcome, ADHAMKAMELAHMEDKAMEL',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNotification() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        const Icon(
          Icons.notifications_none_rounded,
          color: Colors.white,
          size: 39,
        ),
        Positioned(
          right: -3,
          top: -8,
          child: Container(
            width: 28,
            height: 28,
            decoration: const BoxDecoration(
              color: Color(0xffff8919),
              shape: BoxShape.circle,
            ),
            child: const Center(
              child: Text(
                '0',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMainContent() {
    return Container(
      margin: const EdgeInsets.only(
        top: 0,
        left: 8,
        right: 8,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x55000000),
            blurRadius: 30,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          22,
          22,
          22,
          35,
        ),
        child: Column(
          children: [
            _buildPageTitle(),
            const SizedBox(height: 18),
            _buildProfileCard(),
            const SizedBox(height: 14),
            _buildMonthSelector(),
            const SizedBox(height: 18),
            _buildTabs(),
            const SizedBox(height: 16),
            _buildActivityCard(),
          ],
        ),
      ),
    );
  }

  Widget _buildPageTitle() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(bottom: 18),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0xffe9e1ed),
          ),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              color: const Color(0xffffe7fc),
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Icon(
              Icons.badge_outlined,
              color: Color(0xffc900cf),
              size: 25,
            ),
          ),
          const SizedBox(width: 13),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'My profile',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: Color(0xff25212e),
                ),
              ),
              SizedBox(height: 3),
              Text(
                'Bitash · Student',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xff787080),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProfileCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 18,
      ),
      decoration: BoxDecoration(
        color: const Color(0xfffcf9fd),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xffe9deed),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 96,
            height: 96,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xffeee8f4),
            ),
            child: const Icon(
              Icons.person_outline_rounded,
              color: Color(0xff81778b),
              size: 48,
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 12,
                  runSpacing: 8,
                  children: [
                    const Text(
                      'ADHAM KAMEL AHMED KAMEL',
                      style: TextStyle(
                        color: Color(0xff211e2b),
                        fontSize: 29,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 9,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xffffe1fb),
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(
                          color: const Color(0xffdf8edc),
                        ),
                      ),
                      child: const Text(
                        'Student',
                        style: TextStyle(
                          color: Color(0xffb900bc),
                          fontSize: 13,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 9),
                Wrap(
                  spacing: 22,
                  runSpacing: 8,
                  children: const [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          size: 21,
                          color: Color(0xff807788),
                        ),
                        SizedBox(width: 6),
                        Text(
                          'Bitash',
                          style: TextStyle(
                            color: Color(0xff6f6877),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.mail_outline,
                          size: 21,
                          color: Color(0xff807788),
                        ),
                        SizedBox(width: 6),
                        Text(
                          'adhamkamel280@gmail.com',
                          style: TextStyle(
                            color: Color(0xff6f6877),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMonthSelector() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _monthButton(
          Icons.chevron_left_rounded,
          () => viewModel.changeMonth(-1),
        ),
        const SizedBox(width: 75),
        Column(
          children: [
            Text(
              '${viewModel.monthName} ${viewModel.selectedMonth.year}',
              style: const TextStyle(
                color: Color(0xff292331),
                fontSize: 17,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 7),
            GestureDetector(
              onTap: viewModel.resetMonth,
              child: const Text(
                'Today',
                style: TextStyle(
                  color: Color(0xffc300c7),
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(width: 75),
        _monthButton(
          Icons.chevron_right_rounded,
          () => viewModel.changeMonth(1),
        ),
      ],
    );
  }

  Widget _monthButton(
    IconData icon,
    VoidCallback onTap,
  ) {
    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: onTap,
      child: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: const Color(0xffeadff0),
          ),
        ),
        child: Icon(
          icon,
          color: const Color(0xffbd00c2),
          size: 30,
        ),
      ),
    );
  }

  Widget _buildTabs() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          viewModel.tabs.length,
          (index) {
            final selected = viewModel.selectedTab == index;

            return Padding(
              padding: const EdgeInsets.only(right: 8),
              child: InkWell(
                borderRadius: BorderRadius.circular(25),
                onTap: () => viewModel.selectTab(index),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 17,
                    vertical: 11,
                  ),
                  decoration: BoxDecoration(
                    color: selected
                        ? const Color(0xffffe2fb)
                        : Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(
                      color: selected
                          ? const Color(0xffe39adc)
                          : const Color(0xffe7dfeb),
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        viewModel.tabIcon(index),
                        size: 20,
                        color: selected
                            ? const Color(0xffb900be)
                            : const Color(0xff777080),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        viewModel.tabs[index],
                        style: TextStyle(
                          color: selected
                              ? const Color(0xffb900be)
                              : const Color(0xff777080),
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildActivityCard() {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 250),
      child: Container(
        key: ValueKey(viewModel.selectedTab),
        width: double.infinity,
        height: 318,
        decoration: BoxDecoration(
          color: const Color(0xfffbf7fb),
          borderRadius: BorderRadius.circular(22),
          border: Border.all(
            color: const Color(0xffebe0ed),
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 65,
                height: 65,
                decoration: BoxDecoration(
                  color: const Color(0xfff4e5ed),
                  borderRadius: BorderRadius.circular(17),
                ),
                child: const Icon(
                  Icons.error_outline_rounded,
                  color: Color(0xffb45c7b),
                  size: 28,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                viewModel.selectedTab == 0
                    ? 'Activity unavailable'
                    : '${viewModel.tabs[viewModel.selectedTab]} unavailable',
                style: const TextStyle(
                  color: Color(0xff40394a),
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Could not load ${viewModel.tabs[viewModel.selectedTab].toLowerCase()} for this month.',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(0xff807789),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 28),
              ElevatedButton.icon(
                onPressed: () {
                  viewModel.retry();
                  showMessage('Retrying API request...');
                },
                icon: const Icon(
                  Icons.refresh_rounded,
                  color: Colors.white,
                ),
                label: const Text(
                  'Try again',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff92009f),
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 15,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(9),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFooter() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(
        70,
        40,
        70,
        25,
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xffa92bdb),
            Color(0xffb500c9),
          ],
        ),
      ),
      child: Column(
        children: [
          LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth < 850) {
                return Column(
                  children: [
                    _footerAbout(),
                    const SizedBox(height: 30),
                    _footerLocations(),
                    const SizedBox(height: 30),
                    _footerContact(),
                  ],
                );
              }

              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: _footerContact()),
                  const SizedBox(width: 30),
                  Expanded(child: _footerLocations()),
                  const SizedBox(width: 30),
                  Expanded(child: _footerAbout()),
                ],
              );
            },
          ),
          const SizedBox(height: 45),
          Container(
            height: 1,
            color: const Color(0x44ffffff),
          ),
          const SizedBox(height: 28),
          RichText(
            textAlign: TextAlign.center,
            text: const TextSpan(
              children: [
                TextSpan(
                  text: '© 2025 Jupiter Academy. جميع الحقوق محفوظة. ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                TextSpan(
                  text: 'سياسة الخصوصية',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _footerContact() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0x22111111),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: const Color(0x336ffffff),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'تواصل معنا 📞',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 22),
          _contactRow('Online', '01500626688'),
          const SizedBox(height: 16),
          _contactRow('Bitash', '01025997642'),
          const SizedBox(height: 16),
          _contactRow('Asafra', '01011310180'),
        ],
      ),
    );
  }

  Widget _contactRow(String name, String number) {
    return Row(
      children: [
        const Icon(
          Icons.phone,
          color: Colors.white,
          size: 22,
        ),
        const SizedBox(width: 9),
        Expanded(
          child: Text(
            '$name: $number',
            textAlign: TextAlign.right,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  Widget _footerLocations() {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0x22111111),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: const Color(0x33ffffff),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              'فروعنا 📍',
              textAlign: TextAlign.right,
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          const SizedBox(height: 18),
          _locationCard('Online', 'Online'),
          const SizedBox(height: 12),
          _locationCard(
            'Sporting',
            'Sporting, Alexandria, Egypt',
          ),
          const SizedBox(height: 12),
          _locationCard(
            'Bitash',
            'Al Bitash, Al Beitash Gharb, Dekhela, 73 Alexandria Governorate 5314602, Egypt',
          ),
          const SizedBox(height: 12),
          _locationCard(
            'Asafra',
            'Al Qasr Tower, Friends of the Bible Street, off Gamal Abdel Nasser Street, next to Karam El Sham',
          ),
        ],
      ),
    );
  }

  Widget _locationCard(String title, String address) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        color: const Color(0x33ffffff),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Icon(
                Icons.business,
                color: Colors.white,
                size: 19,
              ),
              const SizedBox(width: 6),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
          const SizedBox(height: 7),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                Icons.location_on,
                color: Colors.white70,
                size: 19,
              ),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  address,
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                    height: 1.35,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _footerAbout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Text(
          'Jupiter Academy </>',
          textAlign: TextAlign.right,
          style: TextStyle(
            color: Colors.white,
            fontSize: 32,
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: 13),
        const Text(
          'انطلق في عالم البرمجة مع جوبيتر أكاديمي! نؤمن أن كل شخص يمكنه أن يصبح مبرمجًا محترفًا. نحن هنا لنكتشف شغفك ونحقق طموحاتك خطوة بخطوة، من الأساسيات حتى الاحتراف.',
          textAlign: TextAlign.right,
          style: TextStyle(
            color: Colors.white,
            fontSize: 17,
            height: 1.55,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 25),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            _socialButton('in', () {}),
            _socialButton('◎', () {}),
            _socialButton('◉', () {}),
            _socialButton('f', () {}),
          ],
        ),
      ],
    );
  }

  Widget _socialButton(
    String text,
    VoidCallback onTap,
  ) {
    return Padding(
      padding: const EdgeInsets.only(left: 14),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(50),
        child: Container(
          width: 58,
          height: 58,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                color: Color(0xffa500c2),
                fontSize: 25,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ),
      ),
    );
  }
}