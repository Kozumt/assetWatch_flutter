import 'package:flutter/material.dart';

class AdminReportsScreen extends StatelessWidget {
  const AdminReportsScreen({super.key});

  Widget _buildStatusBadge(String status) {
    Color bg;
    Color text;
    if (status == 'Pending') {
      bg = const Color(0xFFFFEBEB);
      text = const Color(0xFFE53935);
    } else if (status == 'In Progress') {
      bg = const Color(0xFFFFF4E5);
      text = const Color(0xFFB78103);
    } else {
      bg = const Color(0xFFE8F5E9);
      text = const Color(0xFF2E7D32);
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(12)),
      child: Text(status, style: TextStyle(color: text, fontSize: 10, fontWeight: FontWeight.bold)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF4285F4), Color(0xFFE8F0FE)],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'ADMIN DASHBOARD',
                          style: TextStyle(color: Colors.white70, fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                          icon: const Icon(Icons.logout, color: Colors.white, size: 20),
                          tooltip: 'Logout',
                          onPressed: () {
                            Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Text('AD', style: TextStyle(color: Color(0xFF1A73E8), fontWeight: FontWeight.bold)),
                            ),
                            const SizedBox(width: 12),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text('Welcome,', style: TextStyle(color: Colors.white, fontSize: 12)),
                                Text('Admin', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ],
                        ),
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          ),
                          onPressed: () => Navigator.pushNamed(context, '/admin_users'),
                          icon: const Icon(Icons.people, size: 16, color: Color(0xFF1A73E8)),
                          label: const Text('Manage Users', style: TextStyle(color: Color(0xFF1A73E8), fontSize: 11, fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('All Reported Issues', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                          const SizedBox(height: 12),
                          Expanded(
                            child: ListView(
                              children: [
                                _buildAdminReportCard(
                                  context,
                                  'Advance Lab • PC #15',
                                  'Power Supply Failure',
                                  'Reported Aug 18 • Updated Sep 20',
                                  'Pending',
                                ),
                                _buildAdminReportCard(
                                  context,
                                  'Library • Chair',
                                  'Broken Leg',
                                  'Reported Aug 19 • Updated Sep 20',
                                  'In Progress',
                                ),
                                _buildAdminReportCard(
                                  context,
                                  'MB105 • Projector',
                                  'No Signal from HDMI Input',
                                  'Reported Aug 18 • Updated Sep 21',
                                  'Resolved',
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAdminReportCard(
    BuildContext context,
    String title,
    String subtitle,
    String date,
    String status,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 0.5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                _buildStatusBadge(status),
              ],
            ),
            const SizedBox(height: 4),
            Text(subtitle, style: const TextStyle(fontSize: 12)),
            Text(date, style: const TextStyle(color: Colors.grey, fontSize: 11)),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.grey.shade100,
                      side: BorderSide.none,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                    ),
                    onPressed: () => Navigator.pushNamed(context, '/admin_report_details'),
                    icon: const Icon(Icons.visibility, size: 15, color: Colors.black87),
                    label: const Text('View Details', style: TextStyle(fontSize: 11, color: Colors.black87)),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1A73E8),
                      elevation: 0,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                    ),
                    onPressed: () => Navigator.pushNamed(context, '/admin_update_status'),
                    icon: const Icon(Icons.edit, size: 15, color: Colors.white),
                    label: const Text('Update Status', style: TextStyle(fontSize: 11, color: Colors.white)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}