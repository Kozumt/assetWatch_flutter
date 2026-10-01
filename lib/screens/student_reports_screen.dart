import 'package:flutter/material.dart';

class StudentReportsScreen extends StatelessWidget {
  const StudentReportsScreen({super.key});

  Widget _buildStatusBadge(String status) {
    Color bg;
    Color text;
    if (status == 'Pending') {
      bg = Colors.red.shade100;
      text = Colors.red.shade800;
    } else if (status == 'In Progress') {
      bg = Colors.amber.shade100;
      text = Colors.amber.shade900;
    } else {
      bg = Colors.green.shade100;
      text = Colors.green.shade800;
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
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
                          'MCC ASSETWATCH',
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
                      children: [
                        const CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Text('MS', style: TextStyle(color: Color(0xFF1A73E8), fontWeight: FontWeight.bold)),
                        ),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text('Welcome,', style: TextStyle(color: Colors.white, fontSize: 12)),
                            Text('Miguel Santos', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                          ],
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
                          const Text('Your reported issues', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                          const SizedBox(height: 12),
                          Expanded(
                            child: ListView(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(context, '/edit_report');
                                  },
                                  child: _buildReportCard('Advance Lab • PC #15', 'Power Supply Failure', 'Reported Aug 18 • Updated Sep 20', 'Pending'),
                                ),
                                _buildReportCard('Library • Chair', 'Broken Leg', 'Reported Aug 19 • Updated Sep 20', 'In Progress'),
                                _buildReportCard('MB105 • Projector', 'No Signal from HDMI Input', 'Reported Aug 18 • Updated Sep 21', 'Resolved'),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: 48,
                            child: ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF1A73E8),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                              ),
                              onPressed: () {
                                Navigator.pushNamed(context, '/create_report');
                              },
                              icon: const Icon(Icons.add, color: Colors.white),
                              label: const Text('Report New Issue', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
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

  Widget _buildReportCard(String title, String subtitle, String date, String status) {
    return Card(
      elevation: 0.5,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                _buildStatusBadge(status),
              ],
            ),
            const SizedBox(height: 4),
            Text(subtitle, style: const TextStyle(color: Colors.black87, fontSize: 13)),
            const SizedBox(height: 8),
            Text(date, style: const TextStyle(color: Colors.grey, fontSize: 11)),
          ],
        ),
      ),
    );
  }
}