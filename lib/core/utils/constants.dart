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

  static const Map<int, String> courseLevels = {
    0: 'Beginner',
    1: 'Upper-Beginner',
    2: 'Pre-Intermediate',
    3: 'Intermediate',
    4: 'Upper-Intermediate',
    5: 'Pre-advanced',
    6: 'Advanced',
    7: 'Very advanced',
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

  static const List<String> learnerLevels = [
    'Pre A1 (Beginner)',
    'A1 (Higher Beginner)',
    'Upper A1 (High Beginner)',
    'A2 (Pre-Intermediate)',
    'Upper A2 (Pre Intermediate)',
    'B1 (Intermediate)',
    'B2 (Upper-Intermediate)',
    'C1 (Advanced)',
    'C2 (Proficiency)'
  ];

  static const List<String> basicLevels = [
    'Beginner',
    'Intermediate',
    'Advanced',
  ];

  static const baseUrl = 'https://sandbox.api.lettutor.com';
}
