class AppConstants {
  static const Map<String, String> specialties = {
    'english-for-kids': 'English for kids',
    'business-english': 'English for Business',
    'conversational-english': 'Conversational',
    'starters': 'STARTERS',
    'movers': 'MOVERS',
    'flyers': 'FLYERS',
    'ket': 'KET',
    'pet': 'PET',
    'ielts': 'IELTS',
    'toefl': 'TOEFL',
    'toeic': 'TOEIC',
  };

  static const Map<String, String> specialtiesUser = {
    '3english-for-kids': 'English for Kids',
    '4business-english': 'Business English',
    '5conversational-english': 'Conversational English',
    '1starters': 'STARTERS',
    '2movers': 'MOVERS',
    '3flyers': 'FLYERS',
    '4ket': 'KET',
    '5pet': 'PET',
    '6ielts': 'IELTS',
    '7toefl': 'TOEFL',
    '8toeic': 'TOEIC',
  };

  static const Map<int, String> courseLevels = {
    1: 'Beginner',
    2: 'Upper-Beginner',
    3: 'Pre-Intermediate',
    4: 'Intermediate',
    5: 'Upper-Intermediate',
    6: 'Pre-advanced',
    7: 'Advanced',
    8: 'Very advanced',
  };

  static const Map<String, String> courseCategories = {
    '968e7e18-10c0-4742-9ec6-6f5c71c517f5': 'For Studying Abroad',
    'd95b69f7-b810-4cdf-b11d-49faaa71ff4b': 'English For Traveling',
    'c4e7f418-4006-40f2-ba13-cbade54c1fd0': 'Conversational English',
    '488cc5f8-a5b1-45cd-8d3a-47e690f9298e': 'English For Beginners',
    'f01cf003-25d1-432f-aaab-bf0e8390e14f': 'Business English',
    '975f83f6-30c5-465d-8d98-65e4182369ba': 'STARTERS',
    'fb92cf24-1736-4cd7-a042-fa3c37921cf8': 'English For Kid',
    '0b89ead7-0e92-4aec-abce-ecfeba10dea5': 'PET',
    '248ca9f5-b46d-4a55-b81c-abafebff5876': 'KET',
    '534a94f1-579b-497d-b891-47d8e28e1b2c': 'MOVERS',
    'df9bd876-c631-413c-9228-cc3d6a5c34fa': 'FLYERS',
    'd87de7ba-bd4c-442c-8d58-957acb298f57': 'TOEFL',
    '1e662753-b305-47ad-a319-fa52340f5532': 'TOEIC',
    '255c96b6-fd6f-4f43-8dbd-fec766e361e0': 'IELTS',
  };

  static const Map<String, String> learnerLevels = {
    'BEGINNER': 'Pre A1 (Beginner)',
    'HIGHER_BEGINNER': 'A1 (Higher Beginner)',
    'PRE_INTERMEDIATE': 'A2 (Pre-Intermediate)',
    'INTERMEDIATE': 'B1 (Intermediate)',
    'UPPER_INTERMEDIATE': 'B2 (Upper-Intermediate)',
    'ADVANCED': 'C1 (Advanced)',
    'PROFICIENCY': 'C2 (Proficiency)'
  };

  static const List<String> basicLevels = [
    'Beginner',
    'Intermediate',
    'Advanced',
  ];

  static const baseUrl = 'https://sandbox.api.lettutor.com';
  static const meetingServerUrl = "https://meet.lettutor.com";
}
