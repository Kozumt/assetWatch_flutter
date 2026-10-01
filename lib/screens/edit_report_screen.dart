import 'package:flutter/material.dart';

class EditReportScreen extends StatelessWidget {
  const EditReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: const Text('Edit Report', style: TextStyle(fontSize: 18, color: Colors.white)),
        backgroundColor: const Color(0xFF4285F4),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
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
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Delete', style: TextStyle(color: Colors.red)),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF1A73E8)),
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Save changes', style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}