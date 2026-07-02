import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../theme/app_theme.dart';
import '../widgets/gradient_button.dart';

class MatchDetailsScreen extends StatefulWidget {
  final String matchId;

  const MatchDetailsScreen({super.key, required this.matchId});

  @override
  State<MatchDetailsScreen> createState() => _MatchDetailsScreenState();
}

class _MatchDetailsScreenState extends State<MatchDetailsScreen> {
  bool _isConfirmed = false;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surfaceLight,
      appBar: AppBar(
        title: const Text('Match Details'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/home'),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.statusSuccess.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.statusSuccess.withOpacity(0.3)),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.check_circle, color: AppColors.statusSuccess),
                      SizedBox(width: 8),
                      Text(
                        'MATCH CONFIRMED',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.statusSuccess,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  _InfoRow(label: 'Driver', value: 'Omar El-Sayed'),
                  _InfoRow(label: 'Vehicle', value: 'Hyundai Verna'),
                  _InfoRow(label: 'Route', value: 'Maadi → Tagamoa'),
                  _InfoRow(label: 'Departure', value: '5:45 PM (in 10 mins)'),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Package Information',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.surfaceWhite,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Column(
                children: [
                  _InputField(
                    icon: Icons.category,
                    label: 'Category',
                    value: 'Documents',
                  ),
                  SizedBox(height: 12),
                  _InputField(
                    icon: Icons.person,
                    label: 'Recipient Name',
                    value: 'Ahmed Hassan',
                  ),
                  SizedBox(height: 12),
                  _InputField(
                    icon: Icons.phone,
                    label: 'Mobile Number',
                    value: '01XX XXX XXXX',
                  ),
                  SizedBox(height: 12),
                  _InputField(
                    icon: Icons.description,
                    label: 'Description',
                    value: 'House keys + ID card',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Package Photo',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: AppColors.surfaceLight,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: AppColors.textMuted.withOpacity(0.3),
                  width: 2,
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.camera_alt,
                      size: 48,
                      color: AppColors.textSecondary.withOpacity(0.5),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Tap to take a live photo',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.textSecondary,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Gallery uploads disabled for security',
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.textMuted.withOpacity(0.7),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Cost Calculation',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.surfaceWhite,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Column(
                children: [
                  _CostRow(label: 'Route Distance', value: '18.5 km'),
                  _CostRow(label: 'Avg Fuel Cost', value: '~45 EGP'),
                  _CostRow(label: 'Your Share (40%)', value: '18 EGP', isHighlighted: true),
                  _CostRow(label: 'Platform Fee (5%)', value: '2 EGP'),
                  Divider(height: 24),
                  _CostRow(label: 'TOTAL', value: '20 EGP', isTotal: true),
                ],
              ),
            ),
            const SizedBox(height: 24),
            GradientButton(
              text: _isConfirmed ? 'Confirmed!' : 'Confirm & Pay 20 EGP',
              isLoading: _isLoading,
              onPressed: () {
                setState(() {
                  _isLoading = true;
                });
                Future.delayed(const Duration(seconds: 2), () {
                  setState(() {
                    _isLoading = false;
                    _isConfirmed = true;
                  });
                  Future.delayed(const Duration(seconds: 1), () {
                    if (mounted) {
                      context.go('/tracking?tripId=${widget.matchId}');
                    }
                  });
                });
              },
            ),
            const SizedBox(height: 8),
            const Center(
              child: Text(
                'Funds held in escrow until delivery',
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.textMuted,
                ),
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const _InfoRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text(
            '$label: ',
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.textSecondary,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}

class _InputField extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _InputField({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.surfaceLight,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, size: 20, color: AppColors.gradientStart),
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
                const SizedBox(height: 2),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CostRow extends StatelessWidget {
  final String label;
  final String value;
  final bool isHighlighted;
  final bool isTotal;

  const _CostRow({
    required this.label,
    required this.value,
    this.isHighlighted = false,
    this.isTotal = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: isTotal ? 18 : 14,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
              color: isTotal ? AppColors.gradientStart : AppColors.textPrimary,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: isTotal ? 20 : 14,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.w600,
              color: isTotal ? AppColors.gradientStart : (isHighlighted ? AppColors.textPrimary : AppColors.textSecondary),
            ),
          ),
        ],
      ),
    );
  }
}
