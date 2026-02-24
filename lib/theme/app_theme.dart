import 'package:flutter/material.dart';

class AppColors {
  // Sidebar
  static const Color sidebarBg = Color(0xFF1E2235);
  static const Color sidebarActiveIndicator = Color(0xFF4CAF50);

  // Background
  static const Color pageBg = Color(0xFFEEEFF8);

  // Content area
  static const Color contentBg = Colors.white;

  // Text
  static const Color textPrimary = Color(0xFF1E2235);
  static const Color textSecondary = Color(0xFF9B9FB5);
  static const Color textWhite = Colors.white;
  static const Color textSidebarInactive = Color(0xFF8B8FA8);

  // Accent
  static const Color accentGreen = Color(0xFF4CAF50);
  static const Color accentGreenLight = Color(0xFFE8F5E9);

  // Card
  static const Color cardBg = Color(0xFFF8F9FF);
  static const Color cardBorder = Color(0xFFEEEFF8);

  // Search
  static const Color searchBg = Colors.white;
  static const Color searchBorder = Color(0xFFE8E9F0);

  // Welcome banner
  static const Color bannerBg = Color(0xFFF0F1FA);

  // Progress
  static const Color progressBg = Color(0xFFE8E9F0);

  // Activity icons
  static const Color activityIconBlueBg = Color(0xFFE8F0FE);
  static const Color activityIconBlue = Color(0xFF4A7CFF);
  static const Color activityIconPurpleBg = Color(0xFFF3E8FE);
  static const Color activityIconPurple = Color(0xFF9B59B6);
  static const Color activityIconOrangeBg = Color(0xFFFFF3E8);
  static const Color activityIconOrange = Color(0xFFFF9500);

  // Chat FAB
  static const Color chatFab = Color(0xFF4CAF50);

  // ── Screen 2 (Kanban) ──────────────────────────────────────────────────────
  static const Color s2PageBg = Color(0xFFA8CBBC); // mint-sage green bg
  static const Color s2OuterCard = Colors.white;
  static const Color s2TopBar = Colors.white;
  static const Color s2SidebarBg = Colors.white;
  static const Color s2ContentBg = Colors.white;
  static const Color s2Teal = Color(0xFF1CC8A0); // logo / active teal
  static const Color s2Yellow = Color(0xFFF5C518); // active tab / add btn
  static const Color s2YellowBg = Color(0xFFFFF3C4); // active tab bg
  static const Color s2SearchBg = Color(0xFFF4F5F7);
  static const Color s2Border = Color(0xFFEDEEF2);
  static const Color s2TextPrimary = Color(0xFF1A1D23);
  static const Color s2TextSecondary = Color(0xFF8C93A4);
  static const Color s2TextMeta = Color(0xFFABB0BE);

  // Kanban column backgrounds
  static const Color s2ColTodo = Color(0xFFFDE8E8); // pink
  static const Color s2ColProgress = Color(0xFFFDF0E0); // peach
  static const Color s2ColReview = Color(0xFFE0F2EE); // mint
  static const Color s2ColDone = Color(0xFFEDE8FD); // lavender

  // Kanban column dot colours
  static const Color s2DotTodo = Color(0xFFF06B6B);
  static const Color s2DotProgress = Color(0xFFFF9A3C);
  static const Color s2DotReview = Color(0xFF1CC8A0);
  static const Color s2DotDone = Color(0xFF9B7BED);

  // Priority badge colours
  static const Color s2PrioLowText = Color(0xFF1CC8A0);
  static const Color s2PrioLowBg = Color(0xFFE0F7F2);
  static const Color s2PrioMedText = Color(0xFFD4920A);
  static const Color s2PrioMedBg = Color(0xFFFFF3C4);
  static const Color s2PrioHighText = Color(0xFFE05252);
  static const Color s2PrioHighBg = Color(0xFFFDE8E8);

  // Progress bar
  static const Color s2ProgressBar = Color(0xFF1CC8A0);
  static const Color s2ProgressBg = Color(0xFFE8EBF0);

  // ── Screen 3 (Facebook dark) ───────────────────────────────────────────────
  static const Color s3PageBg = Color(0xFF18191A); // darkest bg
  static const Color s3SurfaceDark = Color(0xFF242526); // panels / cards
  static const Color s3SurfaceMid = Color(0xFF3A3B3C); // inputs / dividers
  static const Color s3SurfaceHover = Color(0xFF3A3B3C);
  static const Color s3TopBar = Color(0xFF242526);
  static const Color s3Blue = Color(0xFF1877F2); // FB blue
  static const Color s3BlueBtn = Color(0xFF1877F2);
  static const Color s3Green = Color(0xFF31A24C); // online dot
  static const Color s3TextPrimary = Color(0xFFE4E6EB);
  static const Color s3TextSecondary = Color(0xFFB0B3B8);
  static const Color s3Border = Color(0xFF3A3B3C);
  static const Color s3InputBg = Color(0xFF3A3B3C);
  static const Color s3NavActive = Color(0xFF1877F2);
  static const Color s3NavInactive = Color(0xFFB0B3B8);

  // ── Screen 4 (ACRU Finance Dashboard) ─────────────────────────────────────
  static const Color s4PageBg = Color(0xFFF0F2F5); // outer light grey
  static const Color s4CardBg = Colors.white;
  static const Color s4SidebarBg = Colors.white;
  static const Color s4TopBarBg = Colors.white;
  static const Color s4Border = Color(0xFFECEDF0);
  static const Color s4TextPrimary = Color(0xFF1A1D23);
  static const Color s4TextSecondary = Color(0xFF9CA3AF);
  static const Color s4TextMeta = Color(0xFFB0B7C3);
  static const Color s4Green = Color(0xFF8DC63F); // primary lime-green
  static const Color s4GreenDark = Color(0xFF6AAF1A);
  static const Color s4GreenLight = Color(0xFFD4EDAA);
  static const Color s4GreenBg = Color(0xFFF2F9E6);
  static const Color s4Orange = Color(0xFFF5A623);
  static const Color s4OrangeBg = Color(0xFFFFF3DC);
  static const Color s4Yellow = Color(0xFFE5D320);
  static const Color s4Red = Color(0xFFE53935);
  static const Color s4RedBg = Color(0xFFFFEBEA);
  static const Color s4Purple = Color(0xFF8B5CF6);
  static const Color s4ActiveSidebar = Color(0xFF1A1D23);
  static const Color s4ChartBar1 = Color(0xFF8DC63F); // savings bar
  static const Color s4ChartBar2 = Color(
    0xFFD4EDAA,
  ); // income bar (light green)
  static const Color s4ChartBar3 = Color(0xFFF5A623); // expenses bar
  static const Color s4UpGreen = Color(0xFF4CAF50);
  static const Color s4DownRed = Color(0xFFE53935);
  static const Color s4DebitCard = Color(0xFF8DC63F); // debit card green
  static const Color s4CreditCard = Color(0xFFD0D5DD); // credit card grey
  static const Color s4TxCompleted = Color(0xFF4CAF50);
  static const Color s4TxDeclined = Color(0xFFE53935);
}

class AppTextStyles {
  static const TextStyle logoMain = TextStyle(
    color: Colors.white,
    fontSize: 22,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.5,
  );

  static const TextStyle logoAccent = TextStyle(
    color: AppColors.accentGreen,
    fontSize: 22,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.5,
  );

  static const TextStyle sidebarItemActive = TextStyle(
    color: Colors.white,
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle sidebarItemInactive = TextStyle(
    color: AppColors.textSidebarInactive,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle pageTitle = TextStyle(
    color: AppColors.textPrimary,
    fontSize: 24,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle welcomeTitle = TextStyle(
    color: AppColors.textPrimary,
    fontSize: 26,
    fontWeight: FontWeight.w800,
  );

  static const TextStyle welcomeSubtitle = TextStyle(
    color: AppColors.textSecondary,
    fontSize: 15,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle welcomeCount = TextStyle(
    color: AppColors.accentGreen,
    fontSize: 15,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle sectionTitle = TextStyle(
    color: AppColors.textPrimary,
    fontSize: 16,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle sectionSubtitle = TextStyle(
    color: AppColors.textSecondary,
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle viewAll = TextStyle(
    color: AppColors.textSecondary,
    fontSize: 13,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle cardTitle = TextStyle(
    color: AppColors.textPrimary,
    fontSize: 14,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle cardBody = TextStyle(
    color: AppColors.textSecondary,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.5,
  );

  static const TextStyle cardMeta = TextStyle(
    color: AppColors.textSecondary,
    fontSize: 11,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle activityTime = TextStyle(
    color: AppColors.textSecondary,
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle activityText = TextStyle(
    color: AppColors.textSecondary,
    fontSize: 13,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle activityBold = TextStyle(
    color: AppColors.textPrimary,
    fontSize: 13,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle filterText = TextStyle(
    color: AppColors.textSecondary,
    fontSize: 13,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle userNameSidebar = TextStyle(
    color: Colors.white,
    fontSize: 13,
    fontWeight: FontWeight.w600,
  );

  // ── Screen 2 text styles ───────────────────────────────────────────────────
  static const TextStyle s2ProjectTitle = TextStyle(
    color: AppColors.s2TextPrimary,
    fontSize: 22,
    fontWeight: FontWeight.w800,
    letterSpacing: -0.3,
  );

  static const TextStyle s2SubMeta = TextStyle(
    color: AppColors.s2TextSecondary,
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle s2SubMetaBold = TextStyle(
    color: AppColors.s2TextPrimary,
    fontSize: 12,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle s2TabInactive = TextStyle(
    color: AppColors.s2TextSecondary,
    fontSize: 13,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle s2TabActive = TextStyle(
    color: AppColors.s2TextPrimary,
    fontSize: 13,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle s2ColTitle = TextStyle(
    color: AppColors.s2TextPrimary,
    fontSize: 14,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle s2CardTitle = TextStyle(
    color: AppColors.s2TextPrimary,
    fontSize: 13,
    fontWeight: FontWeight.w700,
    height: 1.4,
  );

  static const TextStyle s2CardNote = TextStyle(
    color: AppColors.s2TextSecondary,
    fontSize: 11.5,
    fontWeight: FontWeight.w400,
    height: 1.5,
  );

  static const TextStyle s2CardMeta = TextStyle(
    color: AppColors.s2TextMeta,
    fontSize: 11,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle s2ProgressLabel = TextStyle(
    color: AppColors.s2TextSecondary,
    fontSize: 11,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle s2ProgressValue = TextStyle(
    color: AppColors.s2TextPrimary,
    fontSize: 11,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle s2SearchHint = TextStyle(
    color: AppColors.s2TextSecondary,
    fontSize: 13,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle s2UserName = TextStyle(
    color: AppColors.s2TextPrimary,
    fontSize: 13,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle s2BtnLabel = TextStyle(
    color: AppColors.s2TextSecondary,
    fontSize: 13,
    fontWeight: FontWeight.w500,
  );

  // ── Screen 3 text styles ───────────────────────────────────────────────────
  static const TextStyle s3UserName = TextStyle(
    color: Colors.white,
    fontSize: 15,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle s3SectionTitle = TextStyle(
    color: Colors.white,
    fontSize: 15,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle s3SectionLink = TextStyle(
    color: AppColors.s3Blue,
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle s3MessengerName = TextStyle(
    color: Colors.white,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle s3NavLabel = TextStyle(
    color: AppColors.s3TextSecondary,
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle s3PostAuthor = TextStyle(
    color: Colors.white,
    fontSize: 14,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle s3PostMeta = TextStyle(
    color: AppColors.s3TextSecondary,
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle s3PostBody = TextStyle(
    color: Colors.white,
    fontSize: 15,
    fontWeight: FontWeight.w400,
    height: 1.5,
  );

  static const TextStyle s3StoryLabel = TextStyle(
    color: Colors.white,
    fontSize: 12,
    fontWeight: FontWeight.w600,
    shadows: [Shadow(color: Colors.black54, blurRadius: 4)],
  );

  static const TextStyle s3EventTitle = TextStyle(
    color: Colors.white,
    fontSize: 15,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle s3EventSubtitle = TextStyle(
    color: AppColors.s3TextSecondary,
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle s3EventItemTitle = TextStyle(
    color: Colors.white,
    fontSize: 13,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle s3EventItemDate = TextStyle(
    color: AppColors.s3TextSecondary,
    fontSize: 11,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle s3ComposerHint = TextStyle(
    color: AppColors.s3TextSecondary,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle s3CreateBtn = TextStyle(
    color: Colors.white,
    fontSize: 14,
    fontWeight: FontWeight.w700,
  );

  // ── Screen 4 text styles ───────────────────────────────────────────────────
  static const TextStyle s4Logo = TextStyle(
    color: AppColors.s4TextPrimary,
    fontSize: 20,
    fontWeight: FontWeight.w800,
    letterSpacing: -0.5,
  );

  static const TextStyle s4SidebarActive = TextStyle(
    color: AppColors.s4TextPrimary,
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle s4SidebarInactive = TextStyle(
    color: AppColors.s4TextSecondary,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle s4SidebarSub = TextStyle(
    color: AppColors.s4TextSecondary,
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle s4SidebarSubActive = TextStyle(
    color: AppColors.s4TextPrimary,
    fontSize: 12,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle s4BalanceAmount = TextStyle(
    color: AppColors.s4TextPrimary,
    fontSize: 36,
    fontWeight: FontWeight.w800,
    letterSpacing: -1,
  );

  static const TextStyle s4BalanceLabel = TextStyle(
    color: AppColors.s4TextSecondary,
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle s4StatLabel = TextStyle(
    color: AppColors.s4TextSecondary,
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle s4StatAmount = TextStyle(
    color: AppColors.s4TextPrimary,
    fontSize: 24,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.5,
  );

  static const TextStyle s4StatChange = TextStyle(
    color: AppColors.s4UpGreen,
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle s4CardTitle = TextStyle(
    color: AppColors.s4TextPrimary,
    fontSize: 15,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle s4CardSubtitle = TextStyle(
    color: AppColors.s4TextSecondary,
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle s4SectionTitle = TextStyle(
    color: AppColors.s4TextPrimary,
    fontSize: 15,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle s4TxName = TextStyle(
    color: AppColors.s4TextPrimary,
    fontSize: 13,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle s4TxDate = TextStyle(
    color: AppColors.s4TextSecondary,
    fontSize: 11,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle s4TxAmount = TextStyle(
    color: AppColors.s4TextPrimary,
    fontSize: 13,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle s4GoalTitle = TextStyle(
    color: AppColors.s4TextPrimary,
    fontSize: 13,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle s4GoalMeta = TextStyle(
    color: AppColors.s4TextSecondary,
    fontSize: 11,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle s4CostLabel = TextStyle(
    color: AppColors.s4TextSecondary,
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle s4CostPct = TextStyle(
    color: AppColors.s4TextPrimary,
    fontSize: 12,
    fontWeight: FontWeight.w600,
  );
}
