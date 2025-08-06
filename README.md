# Todo Mobile App 📱✅

A modern, feature-rich Todo application built with Flutter and Firebase, providing seamless task management with user authentication and a beautiful Material Design interface.

## 🌟 Features

### Core Functionality
- ✅ **Task Management**: Create, view, and manage your daily tasks
- 🔄 **Task Status Toggle**: Mark tasks as completed or pending with a single tap
- 📝 **Task Details**: Add titles and descriptions to your tasks
- 🎨 **Intuitive UI**: Clean, modern interface with Material Design principles

### Authentication & Security
- 🔐 **User Registration**: Create new accounts with email validation
- 🔑 **Secure Login**: Sign in with email and password
- 👤 **User Profile**: Display name support for personalized experience
- 🔄 **Auto-Login**: Automatic session management
- 🚪 **Secure Logout**: Safe sign-out functionality

### User Experience
- 📱 **Responsive Design**: Optimized for various screen sizes
- ⚡ **Real-time Updates**: Instant task status changes
- 🎯 **Form Validation**: Smart input validation for all forms
- 🔍 **Password Visibility**: Toggle password visibility during input
- 📋 **Custom Components**: Reusable UI components for consistency

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (3.8.1 or higher)
- Dart SDK
- Android Studio / VS Code
- Firebase account for authentication

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/Yassinbassam11/Todo_Mobile_App.git
   cd todo_starter
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Firebase Setup**
   - Create a new Firebase project at [Firebase Console](https://console.firebase.google.com/)
   - Enable Authentication with Email/Password
   - Download and add your `google-services.json` to `android/app/`
   - Add your iOS configuration if building for iOS

4. **Run the app**
   ```bash
   flutter run
   ```

## 📱 Screenshots & Demo

### Main Screens
- **Sign In Screen**: Welcome back interface with email/password login
- **Sign Up Screen**: Account creation with full name, email, and password
- **Todo Screen**: Main task management interface with task list

### Key UI Components
- **Custom Text Fields**: Professional input components with validation and styling
- **Task Widgets**: Interactive task cards with status indicators and visual feedback
- **Status Icons**: Size-optimized (30px) icons with color coding for task states
- **Material Design**: App bars, navigation, and consistent component styling
- **Responsive Layouts**: Adaptive design for different screen sizes and orientations

## 🏗️ Project Structure

```
lib/
├── main.dart                 # App entry point with Firebase initialization
├── screens/                  # Application screens
│   ├── signin_screen.dart    # User authentication login
│   ├── signup_screen.dart    # User registration
│   └── todo_screen.dart      # Main task management interface
└── widgets/                  # Reusable UI components
    ├── custom_texfield.dart  # Custom input field component
    └── task.dart            # Task display widget with status toggle
```

## 🔧 Technical Details

### Dependencies
- **flutter**: Core Flutter framework
- **firebase_core**: Firebase SDK initialization
- **firebase_auth**: User authentication services

### Key Components

#### TaskWidget
- Displays individual tasks with title and description
- Interactive toggle functionality between pending/completed states
- Enhanced visual feedback with size-optimized icons (30px)
- Color-coded status indicators (purple for completed, grey for pending)
- Material Design card layout with subtle shadows and rounded corners
- Responsive layout with proper spacing and typography hierarchy
- Strikethrough text effect for completed tasks

#### Custom Text Fields
- Email validation with proper formatting
- Password confirmation matching
- Visibility toggle for password fields
- Consistent styling across the app

#### Authentication Flow
- Form validation before submission
- Firebase error handling with user-friendly messages
- Automatic navigation based on authentication state
- Session persistence across app launches

## 🎨 Design System

### Color Scheme & Visual Design
- **Primary Color**: Purple 800 (`Colors.purple[800]`) for branding and completed tasks
- **Background**: Light grey (`Colors.grey[300]`) for app background
- **Cards**: Pure white with subtle shadow effects for depth
- **Text Colors**: 
  - Black for active task titles
  - Grey for descriptions and secondary text
  - Grey for pending task icons
- **Interactive Elements**: Color transitions for status changes
- **Shadows**: Soft grey shadows with 0.2 opacity for card elevation

### Typography & Iconography
- **App Title**: Bold, 24px for main screen headers
- **Task Titles**: Bold, 18px, uppercase styling for emphasis
- **Task Descriptions**: Regular, 14px, grey color for readability
- **Body Text**: 16px for forms and general content
- **Icons**: 30px size for task status indicators
- **Text Effects**: Strikethrough decoration for completed tasks

## 🎯 Current Implementation Details

### Task Management System
- **StatefulWidget**: TaskWidget uses local state for immediate UI updates
- **Status Enum**: Clean TaskStatus enum (pending/completed) for type safety
- **Visual Feedback**: Instant visual changes when toggling task status
- **Icon States**: 
  - `Icons.check_circle` (purple, 30px) for completed tasks
  - `Icons.circle_outlined` (grey, 30px) for pending tasks

### UI/UX Enhancements
- **Card Design**: Elevated cards with 8px border radius
- **Spacing**: 16px padding inside cards, 12px horizontal margins
- **Shadows**: Multi-layer shadow effect for depth perception
- **Typography**: Uppercase task titles for visual hierarchy
- **Interactive Areas**: Properly sized touch targets for accessibility

### Code Quality
- Proper widget separation for maintainability
- Consistent naming conventions throughout the codebase
- Flutter linting rules enforced for code quality
- Comprehensive error handling for authentication flows

## 🔐 Security Features

- Firebase Authentication integration with secure token management
- Email format validation with regex patterns
- Password strength requirements and confirmation matching
- Secure session management with automatic token refresh
- Comprehensive error handling for authentication failures
- Protection against common authentication vulnerabilities

## 🚀 Future Enhancements

### Planned Features
- [ ] Task editing and deletion
- [ ] Task categories and tags
- [ ] Due dates and reminders
- [ ] Cloud sync across devices
- [ ] Dark mode support
- [ ] Task search and filtering
- [ ] Data export functionality

### Technical Improvements
- [ ] State management with Provider/Bloc
- [ ] Local storage with Hive/SQLite
- [ ] Push notifications
- [ ] Offline mode support
- [ ] Unit and integration tests
- [ ] CI/CD pipeline setup

## 📝 Development Notes

### Code Organization
- Follows Flutter best practices
- Separated concerns with screens and widgets
- Consistent naming conventions
- Comprehensive error handling

### Performance Considerations
- Efficient widget rebuilding with targeted setState calls
- Optimized list rendering with ListView.separated for smooth scrolling
- Minimal Firebase authentication calls with session persistence
- Lightweight widget tree structure for fast rendering
- Proper state management to prevent unnecessary rebuilds

## 🤝 Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👨‍💻 Developer

**Yassin Bassam**
- GitHub: [@Yassinbassam11](https://github.com/Yassinbassam11)

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- Firebase for robust authentication services
- Material Design for beautiful UI components
- The Flutter community for inspiration and support

---

Built with ❤️ using Flutter and Firebase
