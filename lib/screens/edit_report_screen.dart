import 'package:flutter/material.dart';

class EditReportScreen extends StatelessWidget {
  const EditReportScreen({super.key});

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
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 18),
                      onPressed: () => Navigator.pop(context),
                    ),
                    const Text('Edit Report', style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16.0),
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Asset ID / Name', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 4),
                          TextFormField(initialValue: 'PC #15', decoration: const InputDecoration(border: OutlineInputBorder(), filled: true, fillColor: Colors.white)),
                          const SizedBox(height: 12),
                          const Text('Location', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 4),
                          TextFormField(initialValue: 'Advance Lab', decoration: const InputDecoration(border: OutlineInputBorder(), filled: true, fillColor: Colors.white)),
                          const SizedBox(height: 12),
                          const Text('Date Reported', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 4),
                          TextFormField(initialValue: '08/20/2026 - 11:29 AM', decoration: const InputDecoration(border: OutlineInputBorder(), filled: true, fillColor: Colors.white)),
                          const SizedBox(height: 12),
                          const Text('Problem', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 4),
                          TextFormField(initialValue: 'Power Supply Failure', decoration: const InputDecoration(border: OutlineInputBorder(), filled: true, fillColor: Colors.white)),
                          const SizedBox(height: 12),
                          const Text('Issue details', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 4),
                          TextFormField(
                            initialValue: 'Urgent - Power supply failure. Won\'t turn on, please check.',
                            maxLines: 3,
                            decoration: const InputDecoration(border: OutlineInputBorder(), filled: true, fillColor: Colors.white),
                          ),
                          const SizedBox(height: 12),
                          const Text('Photo evidence', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 4),
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(color: Colors.white, border: Border.all(color: Colors.grey.shade300), borderRadius: BorderRadius.circular(8)),
                            child: Row(
                              children: const [
                                Icon(Icons.attach_file, color: Color(0xFF1A73E8), size: 18),
                                SizedBox(width: 8),
                                Text('PC15.jpeg', style: TextStyle(color: Color(0xFF1A73E8), fontSize: 13, fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                          const SizedBox(height: 24),
                          Row(
                            children: [
                              Expanded(
                                child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(vertical: 12),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                  ),
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text('Delete', style: TextStyle(color: Colors.red)),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF1A73E8),
                                    padding: const EdgeInsets.symmetric(vertical: 12),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                  ),
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text('Save changes', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                                ),
                              ),
                            ],
                          )
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
}