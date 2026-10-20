import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

const background = Color(0xFFFCFEFB);
const red = Color(0xFFD36163);
const darkRed = Color(0xFF963C3C);

void main() {
  runApp(const MyApp());
} 

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: background,
        colorScheme: ColorScheme.fromSeed(seedColor: red),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.black, fontSize: 14),
        ),
      ),
      
      home: const RegistrationPage(),
    );
  }
}


class PageLayout extends StatelessWidget {
  final Widget child;
  const PageLayout({super.key, required this.child});

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navigator.of(context).canPop()
          ? AppBar(backgroundColor: background, toolbarHeight: 40)
          : null,
      body: SafeArea(
        child: Center(
          child: SizedBox(
            width: 375,
            height: double.infinity,
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 34),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}

Widget inputField({String hint = '', bool password = false, bool number = false}) {
  return SizedBox(
    height: 36,
    child: TextField(
      obscureText: password,
      keyboardType: number ? TextInputType.number : TextInputType.text,
      inputFormatters: number ? [FilteringTextInputFormatter.digitsOnly] : null,
      style: const TextStyle(fontSize: 13),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Color(0xFFB5B5B5), fontSize: 13),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(horizontal: 13, vertical: 8),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7),
          borderSide: const BorderSide(color: Color(0xFFDCDCDC)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7),
          borderSide: const BorderSide(color: red),
        ),
      ),
    ),
  );
}

Widget redButton(String text, {bool play = false, VoidCallback? onPressed}) {
  return SizedBox(
    height: 34,
    child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: red,
        foregroundColor: Colors.white,
        disabledBackgroundColor: red,
        disabledForegroundColor: Colors.white,
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        shape: const StadiumBorder(),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (play) ...[
            const Icon(Icons.play_arrow, size: 16),
            const SizedBox(width: 6),
          ],
          Text(text, style: const TextStyle(fontSize: 12)),
        ],
      ),
    ),
  );
}

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageLayout(
      child: Column(
        children: [
          const SizedBox(height: 190),
          SvgPicture.asset('assets/group_2.svg', width: 95, height: 95),
          const SizedBox(height: 24),
          const Text('Create your account', style: TextStyle(fontSize: 18)),
          const SizedBox(height: 22),
          SizedBox(
            width: 205,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                inputField(hint: 'Username'),
                const SizedBox(height: 20),
                inputField(hint: 'email'),
                const SizedBox(height: 20),
                inputField(hint: 'Password', password: true),
                const SizedBox(height: 26),
                redButton('Register', onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));
                }),
              ],
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageLayout(
      child: Column(
        children: [
          const SizedBox(height: 190),
          SvgPicture.asset('assets/group_2.svg', width: 95, height: 95),
          const SizedBox(height: 24),
          const Text('Welcome back', style: TextStyle(fontSize: 18)),
          const SizedBox(height: 22),
          SizedBox(
            width: 205,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                inputField(hint: 'Username'),
                const SizedBox(height: 20),
                inputField(hint: 'Password', password: true),
                const SizedBox(height: 26),
                redButton('Login', onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const MainPage()));
                }),
              ],
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageLayout(
      child: Column(
        children: [
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const StatisticsPage()));
                },
                style: ButtonStyle(
                  foregroundColor: WidgetStatePropertyAll(Colors.black),
                ),
                child: Text('Report'),
              ),
              const SizedBox(width: 10),
              Container(
                width: 28,
                height: 28,
                decoration: const BoxDecoration(color: red, shape: BoxShape.circle),
                child: IconButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingsPage()));
                  },
                  color: Colors.white,
                  padding: EdgeInsets.zero,
                  disabledColor: Colors.white,
                  icon: Icon(Icons.settings_outlined, size: 19),
                ),
              ),
            ],
          ),
          const SizedBox(height: 145),
          SvgPicture.asset('assets/tomato.svg', width: 225, height: 222),
          const SizedBox(height: 200),
          redButton('Start focusing', play: true),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}

Widget settingsField(String label) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(label, style: const TextStyle(fontSize: 12)),
      const SizedBox(height: 8),
      inputField(number: true),
    ],
  );
}

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageLayout(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 48),
          const Text('Settings', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
          const SizedBox(height: 110),
          const Text('Timer (minutes)', style: TextStyle(fontWeight: FontWeight.w500)),
          const SizedBox(height: 32),
          settingsField('Work time'),
          const SizedBox(height: 28),
          settingsField('Short break'),
          const SizedBox(height: 28),
          settingsField('Long break'),
          const SizedBox(height: 96),
          const Text('Intervals', style: TextStyle(fontWeight: FontWeight.w500)),
          const SizedBox(height: 26),
          settingsField('Intervals before long break'),
          const SizedBox(height: 92),
          redButton('Save'),
          const SizedBox(height: 36),
        ],
      ),
    );
  }
}

Widget statisticCard(String title, String value) {
  return Expanded(
    child: Container(
      constraints: const BoxConstraints(minHeight: 80),
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFE0E0E0)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title, textAlign: TextAlign.center, style: const TextStyle(fontSize: 11)),
          const SizedBox(height: 7),
          Text(value, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500)),
        ],
      ),
    ),
  );
}

// Столбики графика — обычные Container, высота задана вручную.
Widget chartBar(String day, double height) {
  return Expanded(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 30,
          height: height,
          decoration: const BoxDecoration(
            color: Color(0xFFF0D1CE),
            border: Border(top: BorderSide(color: darkRed)),
          ),
        ),
        const SizedBox(height: 10),
        Text(day, style: const TextStyle(fontSize: 11, color: darkRed)),
      ],
    ),
  );
}

Widget insightRow(String label, String value) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 15),
    decoration: const BoxDecoration(
      border: Border(top: BorderSide(color: Color(0xFFE0E0E0))),
    ),
    child: Row(
      children: [
        Expanded(child: Text(label, style: const TextStyle(fontSize: 11, color: darkRed))),
        SizedBox(width: 155, child: Text(value, style: const TextStyle(fontSize: 12))),
      ],
    ),
  );
}

class StatisticsPage extends StatelessWidget {
  const StatisticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageLayout(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 48),
          const Text('Statistics', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
          const SizedBox(height: 26),
          const Text('Track your progress to optimize your workflow',
              style: TextStyle(fontSize: 12, color: darkRed)),
          const SizedBox(height: 40),
          const Row(
            children: [
              IconButton(onPressed: null, disabledColor: Colors.black,
                  icon: Icon(Icons.arrow_left, size: 18)),
              Text('This week'),
              IconButton(onPressed: null, disabledColor: Colors.black,
                  icon: Icon(Icons.arrow_right, size: 18)),
            ],
          ),
          Row(
            children: [
              statisticCard('Completed\nintervals', '25'),
              const SizedBox(width: 10),
              statisticCard('Total focus\ntime', '12h 30m'),
              const SizedBox(width: 10),
              statisticCard('Average focus\ntime', '25m'),
            ],
          ),
          const SizedBox(height: 34),
          const Text('Weekly Overview', style: TextStyle(fontWeight: FontWeight.w500)),
          const SizedBox(height: 20),
          const Text('Completed intervals', style: TextStyle(fontSize: 12, color: darkRed)),
          const SizedBox(height: 38),
          SizedBox(
            height: 200,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                chartBar('Mon', 15),
                chartBar('Tue', 58),
                chartBar('Wed', 41),
                chartBar('Thu', 110),
                chartBar('Fri', 148),
                chartBar('Sat', 40),
                chartBar('Sun', 82),
              ],
            ),
          ),
          const SizedBox(height: 40),
          const Text('Insights', style: TextStyle(fontWeight: FontWeight.w500)),
          const SizedBox(height: 8),
          insightRow('Most Productive Day', 'Friday'),
          insightRow('Average intervals per Day', '5'),
          insightRow('Longest focus Session', '50m'),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}




