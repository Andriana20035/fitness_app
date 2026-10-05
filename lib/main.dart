import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const kGreen = Color(0xFF20BB62);
const kInk = Color(0xFF17191E);
const kGrey = Color(0xFF818898);
const kLine = Color(0xFFE0E5ED);

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );

  runApp(const FitnessApp());
}

class FitnessApp extends StatelessWidget {
  const FitnessApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fitness',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'PlusJakartaSans',
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: kGreen),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _showDetails(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const GymDetailsPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.white,
      ),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(24, 29, 0, 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Friday, 20 May',
                            style: TextStyle(
                              fontSize: 12,
                              color: kGrey,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Good Morning',
                            style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.w700,
                              color: kInk,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: 46,
                        height: 46,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: kLine),
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            const Icon(
                              Icons.notifications_none,
                              size: 25,
                            ),
                            Positioned(
                              right: 14,
                              top: 11,
                              child: Container(
                                width: 6,
                                height: 6,
                                decoration: const BoxDecoration(
                                  color: Color(0xFFED475B),
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 29),

                Padding(
                  padding: const EdgeInsets.only(right: 24),
                  child: Container(
                    height: 84,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: const Color(0xFF131316),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        const Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Today's Challenge",
                                style: TextStyle(
                                  color: Color(0xFFABB1C0),
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                'Running',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 17,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 50,
                          width: 50,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              const SizedBox.expand(
                                child: CircularProgressIndicator(
                                  value: .75,
                                  strokeWidth: 4,
                                  backgroundColor: Color(0xFF34343C),
                                  valueColor:
                                  AlwaysStoppedAnimation<Color>(kGreen),
                                ),
                              ),
                              const Text(
                                '15/20',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 11,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 27),

                _sectionHeader('Featured Plan'),

                const SizedBox(height: 15),

                SizedBox(
                  height: 144,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.only(right: 24),
                    children: [
                      _featuredCard(
                        context,
                        'Massive Upper Body',
                        'assets/images/upper_body.jpg',
                      ),
                      const SizedBox(width: 16),
                      _featuredCard(
                        context,
                        'Muscle Building',
                        'assets/images/upper_body.jpg',
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 27),

                _sectionHeader('Workout Programs'),

                const SizedBox(height: 16),

                SizedBox(
                  height: 34,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _chip('All Type', selected: true),
                      _chip('Pilates'),
                      _chip('Cardio'),
                      _chip('Boxing'),
                      _chip('Yoga'),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                SizedBox(
                  height: 184,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.only(right: 24),
                    children: [
                      _programCard(
                        context,
                        'Yoga',
                        'assets/images/yoga.jpg',
                        false,
                      ),
                      const SizedBox(width: 16),
                      _programCard(
                        context,
                        'Arm\nStrengthening',
                        'assets/images/strengthening.jpg',
                        true,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _sectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(right: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: kInk,
            ),
          ),
          const Text(
            'See All',
            style: TextStyle(
              color: Color(0xFF00A64A),
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _featuredCard(
      BuildContext context,
      String title,
      String photo,
      ) {
    return GestureDetector(
      onTap: () => _showDetails(context),
      child: Container(
        width: 296,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              photo,
              fit: BoxFit.cover,
              alignment: Alignment.center,
            ),

            const DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xF31A2330),
                    Color(0x001A2330),
                  ],
                  stops: [0.10, 1],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Row(
                    children: [
                      Image.asset(
                        'assets/icons/Vector.png',
                        width: 15,
                        height: 10,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(width: 5),
                      const Text(
                        '5 week  •  4×/week',
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),

                  const Spacer(),

                  Container(
                    height: 32,
                    padding:
                    const EdgeInsets.symmetric(horizontal: 16),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: kGreen,
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: const Text(
                      'Start Now',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _chip(
      String label, {
        bool selected = false,
      }) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.symmetric(horizontal: 14),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: selected ? kGreen : Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: selected ? null : Border.all(color: kLine),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: selected ? Colors.white : kGrey,
          fontSize: 14,
          fontWeight:
          selected ? FontWeight.w600 : FontWeight.w400,
        ),
      ),
    );
  }

  Widget _programCard(
      BuildContext context,
      String title,
      String image,
      bool isPro,
      ) {
    return GestureDetector(
      onTap: () => _showDetails(context),
      child: Container(
        width: 156,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              image,
              fit: BoxFit.cover,
            ),

            const DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Color(0xD9000000),
                  ],
                  stops: [0.38, 1],
                ),
              ),
            ),

            if (isPro)
              Positioned(
                top: 10,
                right: 10,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE7FFF1),
                    borderRadius: BorderRadius.circular(9),
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/icons/Vector (4).png',
                        width: 12,
                        height: 9,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(width: 3),
                      const Text(
                        'Pro',
                        style: TextStyle(
                          color: kGreen,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

            Positioned(
              bottom: 12,
              left: 13,
              right: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      height: 1.35,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const SizedBox(height: 7),

                  Row(
                    children: [
                      Image.asset(
                        'assets/icons/Vector (3).png',
                        width: 7,
                        height: 10,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(width: 2),
                      const Text(
                        '210 kcl',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.schedule,
                        size: 11,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 2),
                      const Text(
                        '120 min',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GymDetailsPage extends StatelessWidget {
  const GymDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final statusBarHeight =
        MediaQuery.paddingOf(context).top;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness:
        Brightness.dark,
      ),
      child: Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 120),
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 350 + statusBarHeight,
                    width: double.infinity,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.asset(
                          'assets/images/gym.jpg',
                          fit: BoxFit.cover,
                          alignment: Alignment.center,
                        ),

                        Positioned(
                          top: statusBarHeight + 17,
                          left: 24,
                          child: GestureDetector(
                            onTap: () =>
                                Navigator.pop(context),
                            child: Container(
                              width: 44,
                              height: 44,
                              decoration:
                              const BoxDecoration(
                                color:
                                Color(0xADFFFFFF),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),

                        Positioned(
                          top: statusBarHeight + 17,
                          right: 22,
                          child: const Icon(
                            Icons.more_vert,
                            color: Colors.white,
                            size: 28,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding:
                    const EdgeInsets.fromLTRB(
                      24,
                      24,
                      24,
                      0,
                    ),
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        const Row(
                          children: [
                            Icon(
                              Icons.star,
                              size: 17,
                              color:
                              Color(0xFFFFB23F),
                            ),
                            SizedBox(width: 7),
                            Text(
                              '4.5',
                              style: TextStyle(
                                color: kInk,
                                fontSize: 14,
                                fontWeight:
                                FontWeight.w700,
                              ),
                            ),
                            SizedBox(width: 3),
                            Text(
                              '(1,232 reviews)',
                              style: TextStyle(
                                fontSize: 13,
                                color: kGrey,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 16),

                        const Text(
                          'Mid City Gym Training',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight:
                            FontWeight.w700,
                            color: kInk,
                          ),
                        ),

                        const SizedBox(height: 12),

                        const Text(
                          'California, New York',
                          style: TextStyle(
                            fontSize: 14,
                            color: kGrey,
                          ),
                        ),

                        const SizedBox(height: 16),

                        const Divider(
                          color: kLine,
                          height: 1,
                        ),

                        const SizedBox(height: 21),

                        RichText(
                          text: const TextSpan(
                            style: TextStyle(
                              fontFamily:
                              'PlusJakartaSans',
                              fontSize: 14,
                              height: 1.6,
                              color: kGrey,
                            ),
                            children: [
                              TextSpan(
                                text:
                                'Lorem ipsum dolor sit amet consectetur. Blandit vitae aliquet eros laoreet quam sollicitudin. Duis non eu habitant id vel nisi eget amet tellus... ',
                              ),
                              TextSpan(
                                text: 'Read more',
                                style: TextStyle(
                                  color:
                                  Color(0xFF00A64A),
                                  fontWeight:
                                  FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 20),

                        const Text(
                          'Amenities',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight:
                            FontWeight.w700,
                            color: kInk,
                          ),
                        ),

                        const SizedBox(height: 16),

                        Row(
                          children: [
                            Expanded(
                              child: _amenity(
                                Image.asset(
                                  'assets/icons/Vector (5).png',
                                  width: 17,
                                  height: 16,
                                  fit: BoxFit.contain,
                                ),
                                'Showers',
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: _amenity(
                                Image.asset(
                                  'assets/icons/Vector (6).png',
                                  width: 15,
                                  height: 15,
                                  fit: BoxFit.contain,
                                ),
                                'Lockers',
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 16),

                        Row(
                          children: [
                            Expanded(
                              child: _amenity(
                                const Icon(
                                  Icons.wifi,
                                  color: kGrey,
                                  size: 19,
                                ),
                                'Free Wi-fi',
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: _amenity(
                                const Icon(
                                  Icons.local_parking,
                                  color: kGrey,
                                  size: 19,
                                ),
                                'Parking',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                padding:
                const EdgeInsets.fromLTRB(
                  24,
                  16,
                  24,
                  20,
                ),
                decoration:
                const BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    top: BorderSide(
                      color: Color(0xFFF0F1F4),
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    const Expanded(
                      child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        mainAxisSize:
                        MainAxisSize.min,
                        children: [
                          Text(
                            'Total',
                            style: TextStyle(
                              fontSize: 14,
                              color: kGrey,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: '\$69.00',
                                  style: TextStyle(
                                    fontSize: 19,
                                    fontWeight:
                                    FontWeight
                                        .w700,
                                    color: kInk,
                                  ),
                                ),
                                TextSpan(
                                  text: ' /week',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: kGrey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    Container(
                      height: 51,
                      width: 154,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: kGreen,
                        borderRadius:
                        BorderRadius.circular(
                          12,
                        ),
                      ),
                      child: const Text(
                        'Reserve',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight:
                          FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _amenity(
      Widget icon,
      String text,
      ) {
    return Container(
      height: 52,
      padding:
      const EdgeInsets.symmetric(
        horizontal: 14,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFD),
        border: Border.all(color: kLine),
        borderRadius:
        BorderRadius.circular(9),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 20,
            height: 20,
            child: Center(
              child: icon,
            ),
          ),
          const SizedBox(width: 10),
          Flexible(
            child: Text(
              text,
              maxLines: 1,
              overflow:
              TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 13,
                color: kGrey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}