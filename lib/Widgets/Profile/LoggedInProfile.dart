import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// A provider to simulate user data; in a real app, you could fetch from a backend
final userProvider = Provider<User>((ref) {
  return User(username: 'user230302049');
});

class User {
  final String username;
  User({required this.username});
}

class LoggedInProfile extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                // Circular avatar
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.grey.shade300,
                  child: const Icon(
                    Icons.person,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 16),
                // Username
                Text(
                  user.username,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 24),
            // "My Orders" section title
            const Text(
              "My Orders",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            // Order Status Icons and Text
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _OrderStatusItem(icon: Icons.payment, label: "Unpaid"),
                _OrderStatusItem(icon: Icons.autorenew, label: "Processing"),
                _OrderStatusItem(icon: Icons.local_shipping, label: "Shipped"),
                _OrderStatusItem(icon: Icons.rate_review, label: "Review"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _OrderStatusItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const _OrderStatusItem({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 30, color: Colors.grey.shade700),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(fontSize: 14),
        ),
      ],
    );
  }
}
