import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../theme/app_theme.dart';
import '../widgets/gradient_button.dart';

class PostRouteScreen extends StatefulWidget {
  const PostRouteScreen({super.key});

  @override
  State<PostRouteScreen> createState() => _PostRouteScreenState();
}

class _PostRouteScreenState extends State<PostRouteScreen> {
  int _availableSeats = 2;
  String? _packageSize;
  final List<String> _preferences = [];

  final List<String> _preferenceOptions = [
    'Same gender only',
    'No smoking',
    'AC on',
    'Quiet ride',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surfaceLight,
      appBar: AppBar(
        title: const Text('Post Route'),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => context.go('/home'),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Route Information',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 16),
            _buildLocationField(
              icon: Icons.location_on,
              label: 'Start Location',
              hint: 'Enter start location',
              color: AppColors.gradientStart,
              onChanged: (value) {},
            ),
            const SizedBox(height: 12),
            _buildLocationField(
              icon: Icons.flag,
              label: 'Destination',
              hint: 'Enter destination',
              color: AppColors.statusSuccess,
              onChanged: (value) {},
            ),
            const SizedBox(height: 24),
            const Text(
              'Departure Time',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 12),
            const Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _TimeChip(label: 'Now', isSelected: false),
                _TimeChip(label: 'In 10 min', isSelected: true),
                _TimeChip(label: 'In 30 min', isSelected: false),
                _TimeChip(label: 'Custom', isSelected: false),
              ],
            ),
            const SizedBox(height: 24),
            const Text(
              'Available Capacity',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.surfaceWhite,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.directions_car, color: AppColors.accentRide),
                      const SizedBox(width: 12),
                      const Expanded(
                        child: Text(
                          'Passenger Seats',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textPrimary,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove_circle_outline),
                            onPressed: _availableSeats > 0
                                ? () => setState(() => _availableSeats--)
                                : null,
                          ),
                          Text(
                            '$_availableSeats',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.add_circle_outline, color: AppColors.gradientStart),
                            onPressed: () => setState(() => _availableSeats++),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.surfaceWhite,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.local_shipping, color: AppColors.accentPackage),
                      const SizedBox(width: 12),
                      const Expanded(
                        child: Text(
                          'Package Space',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textPrimary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    children: [
                      _PackageSizeChip(
                        label: 'Small',
                        isSelected: _packageSize == 'small',
                        onTap: () => setState(() => _packageSize = 'small'),
                      ),
                      _PackageSizeChip(
                        label: 'Medium',
                        isSelected: _packageSize == 'medium',
                        onTap: () => setState(() => _packageSize = 'medium'),
                      ),
                      _PackageSizeChip(
                        label: 'Large',
                        isSelected: _packageSize == 'large',
                        onTap: () => setState(() => _packageSize = 'large'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Preferences',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: _preferenceOptions.map((pref) {
                final isSelected = _preferences.contains(pref);
                return FilterChip(
                  label: Text(pref),
                  selected: isSelected,
                  onSelected: (selected) {
                    setState(() {
                      if (selected) {
                        _preferences.add(pref);
                      } else {
                        _preferences.remove(pref);
                      }
                    });
                  },
                  selectedColor: AppColors.gradientStart.withOpacity(0.2),
                  checkmarkColor: AppColors.gradientStart,
                );
              }).toList(),
            ),
            const SizedBox(height: 32),
            GradientButton(
              text: 'Post Route',
              icon: Icons.post_add,
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Route posted successfully!'),
                    backgroundColor: AppColors.statusSuccess,
                  ),
                );
                Future.delayed(const Duration(seconds: 1), () {
                  if (mounted) context.go('/home');
                });
              },
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildLocationField({
    required IconData icon,
    required String label,
    required String hint,
    required Color color,
    required Function(String) onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surfaceWhite,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: color),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.textSecondary,
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: hint,
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.zero,
                  ),
                  onChanged: onChanged,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TimeChip extends StatelessWidget {
  final String label;
  final bool isSelected;

  const _TimeChip({required this.label, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (_) {},
      backgroundColor: AppColors.surfaceWhite,
      selectedColor: AppColors.gradientStart,
      labelStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: isSelected ? Colors.white : AppColors.textPrimary,
      ),
    );
  }
}

class _PackageSizeChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _PackageSizeChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.accentPackage.withOpacity(0.2) : AppColors.surfaceLight,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? AppColors.accentPackage : AppColors.textMuted.withOpacity(0.3),
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: isSelected ? AppColors.accentPackage : AppColors.textPrimary,
          ),
        ),
      ),
    );
  }
}
