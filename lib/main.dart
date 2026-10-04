import 'package:flutter/material.dart';

void main() {
  runApp(const VakilDeskApp());
}

class VakilDeskApp extends StatelessWidget {
  const VakilDeskApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'VakilDesk',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF17365D),
        ),
        fontFamily: 'sans',
      ),
      home: const DashboardPage(),
    );
  }
}

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFF17365D),
        foregroundColor: Colors.white,
        title: const Row(
          children: [
            Icon(Icons.gavel_rounded),
            SizedBox(width: 10),
            Text(
              'VakilDesk',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none_rounded),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Good Evening, Advocate 👋',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              'Your legal practice at a glance',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 20),

            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.35,
              children: const [
                StatCard(
                  title: 'Total Cases',
                  value: '0',
                  icon: Icons.folder_copy_rounded,
                ),
                StatCard(
                  title: 'Clients',
                  value: '0',
                  icon: Icons.people_alt_rounded,
                ),
                StatCard(
                  title: 'Today Hearings',
                  value: '0',
                  icon: Icons.gavel_rounded,
                ),
                StatCard(
                  title: 'Pending Fees',
                  value: '₹0',
                  icon: Icons.currency_rupee_rounded,
                ),
              ],
            ),

            const SizedBox(height: 25),

            const Text(
              'Quick Actions',
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),

            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: const [
                QuickAction(
                  icon: Icons.person_add_alt_1_rounded,
                  title: 'Add Client',
                ),
                QuickAction(
                  icon: Icons.create_new_folder_rounded,
                  title: 'New Case',
                ),
                QuickAction(
                  icon: Icons.event_available_rounded,
                  title: 'Add Hearing',
                ),
                QuickAction(
                  icon: Icons.description_rounded,
                  title: 'Documents',
                ),
                QuickAction(
                  icon: Icons.calculate_rounded,
                  title: 'Limitation',
                ),
                QuickAction(
                  icon: Icons.smart_toy_rounded,
                  title: 'AI Drafting',
                ),
              ],
            ),

            const SizedBox(height: 25),

            const Text(
              'Upcoming Hearings',
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),

            Card(
              elevation: 0,
              child: Padding(
                padding: const EdgeInsets.all(22),
                child: Column(
                  children: const [
                    Icon(
                      Icons.calendar_month_rounded,
                      size: 48,
                      color: Color(0xFF17365D),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'No upcoming hearings',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Your next court hearing will appear here.',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: 0,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.dashboard_outlined),
            selectedIcon: Icon(Icons.dashboard_rounded),
            label: 'Dashboard',
          ),
          NavigationDestination(
            icon: Icon(Icons.people_outline_rounded),
            label: 'Clients',
          ),
          NavigationDestination(
            icon: Icon(Icons.folder_outlined),
            label: 'Cases',
          ),
          NavigationDestination(
            icon: Icon(Icons.calendar_month_outlined),
            label: 'Hearings',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings_outlined),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}

class StatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const StatCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: const Color(0xFF17365D), size: 28),
            const Spacer(),
            Text(
              value,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              title,
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

class QuickAction extends StatelessWidget {
  final IconData icon;
  final String title;

  const QuickAction({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 155,
      child: Card(
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            children: [
              Icon(
                icon,
                color: const Color(0xFF17365D),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
