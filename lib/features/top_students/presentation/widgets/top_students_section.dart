import 'package:flutter/material.dart';

import '../../domain/entities/top_student.dart';
import '../view_models/top_students_view_model.dart';

class TopStudentsSection extends StatelessWidget {
  const TopStudentsSection({super.key, required this.viewModel});

  final TopStudentsViewModel viewModel;

  static const Color _purple = Color(0xFF85009B);
  static const Color _darkPurple = Color(0xFF650075);
  static const Color _lightPurple = Color(0xFFA82BBC);
  static const Color _background = Color(0xFFF7F5FA);
  static const Color _textColor = Color(0xFF26334D);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: viewModel,
      builder: (context, _) {
        return Container(
          width: double.infinity,
          color: _background,
          padding: const EdgeInsets.fromLTRB(18, 28, 18, 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              const SizedBox(height: 18),
              if (viewModel.isLoading)
                _buildLoading()
              else if (viewModel.students.isEmpty)
                _buildError()
              else
                ...List.generate(
                  viewModel.students.length,
                  (index) => Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: _buildStudentCard(viewModel.students[index], index),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [_purple, _darkPurple],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          child: const Icon(
            Icons.emoji_events_rounded,
            color: Colors.white,
            size: 26,
          ),
        ),
        const SizedBox(width: 13),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'JUPITER COINS',
              style: TextStyle(
                color: _purple,
                fontSize: 10,
                fontWeight: FontWeight.w800,
                letterSpacing: 1.7,
              ),
            ),
            SizedBox(height: 1),
            Text(
              'Top Students',
              style: TextStyle(
                color: _textColor,
                fontSize: 25,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildLoading() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: const Column(
        children: [
          SizedBox(
            width: 28,
            height: 28,
            child: CircularProgressIndicator(strokeWidth: 3, color: _purple),
          ),
          SizedBox(height: 12),
          Text(
            'Loading top students...',
            style: TextStyle(
              color: _textColor,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildError() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          const Icon(Icons.emoji_events_outlined, color: _purple, size: 38),
          const SizedBox(height: 10),
          const Text(
            'Top students unavailable',
            style: TextStyle(
              color: _textColor,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            viewModel.errorMessage ?? 'No student records were returned.',
            textAlign: TextAlign.center,
            style: const TextStyle(color: Color(0xFF7A8090), fontSize: 13),
          ),
          const SizedBox(height: 8),
          TextButton.icon(
            onPressed: viewModel.load,
            icon: const Icon(Icons.refresh_rounded),
            label: const Text('Retry'),
          ),
        ],
      ),
    );
  }

  Widget _buildStudentCard(TopStudent student, int index) {
    const medals = ['🥇', '🥈', '🥉'];

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 17),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(23),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .07),
            blurRadius: 14,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: _purple.withValues(alpha: .09),
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Text(
              medals[index],
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
            ),
          ),
          const SizedBox(width: 12),
          _buildAvatar(student),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _formatStudentName(student.name),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: _textColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                if (student.branch?.isNotEmpty ?? false) ...[
                  const SizedBox(height: 3),
                  Text(
                    student.branch!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Color(0xFF7A8090),
                      fontSize: 12,
                    ),
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.monetization_on_rounded,
                    color: _lightPurple,
                    size: 20,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    '${student.jupiterCoins}',
                    style: const TextStyle(
                      color: _purple,
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 2),
              const Text(
                'Jupiter Coins',
                style: TextStyle(
                  color: Color(0xFF8A8E9A),
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAvatar(TopStudent student) {
    return ClipOval(
      child: SizedBox.square(
        dimension: 48,
        child: student.profileImagePath.isEmpty
            ? _avatarPlaceholder()
            : Image.network(
                student.profileImagePath,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    _avatarPlaceholder(),
              ),
      ),
    );
  }

  Widget _avatarPlaceholder() {
    return Container(
      color: _purple.withValues(alpha: .09),
      alignment: Alignment.center,
      child: const Icon(Icons.person_rounded, color: _purple),
    );
  }

  String _formatStudentName(String name) {
    final spaced = name.replaceAllMapped(
      RegExp(r'(?<=[a-z])(?=[A-Z])'),
      (match) => ' ',
    );
    return spaced.replaceAll(RegExp(r'\s+'), ' ').trim();
  }
}
