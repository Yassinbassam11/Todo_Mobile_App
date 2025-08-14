# Todo Mobile App 📱✅

A modern, feature-rich Todo application built with Flutter and Firebase, providing seamless task management with user authentication, cloud storage, and a beautiful Material Design interface.

## 🌟 Features

### Core Functionality
- ✅ **Task Management**: Create, view, update, and delete tasks with full CRUD operations
- ☁️ **Cloud Storage**: Tasks are stored in Cloud Firestore and synced across devices
- ➕ **Add New Tasks**: Floating Action Button with modal bottom sheet for quick task creation
- 🔄 **Task Status Toggle**: Mark tasks as completed or pending with a single tap
- 📝 **Task Details**: Add titles and descriptions to your tasks
- 🗂️ **Task Model**: Structured data management with TaskModel class and TaskStatus enum
- 🧠 **AppBrain**: Centralized task management system with Firestore integration
- 🎨 **Intuitive UI**: Clean, modern interface with Material Design principles
- 🗑️ **Bulk Operations**: Clear all tasks at once with confirmation

### Authentication & Security
- 🔐 **User Registration**: Create new accounts with email validation
- 🔑 **Secure Login**: Sign in with email and password
- 👤 **User-Specific Data**: Each user's tasks are stored separately in Firestore
- 🔄 **Auto-Login**: Automatic session management with Firebase Auth
- 🚪 **Secure Logout**: Safe sign-out functionality with navigation to login screen

### User Experience
- 📱 **Responsive Design**: Optimized for various screen sizes
- ⚡ **Real-time Updates**: Instant task status changes with Firestore synchronization
- 🎯 **Form Validation**: Smart input validation for all forms
- 🔍 **Password Visibility**: Toggle password visibility during input
- 📋 **Custom Components**: Reusable UI components for consistency
- ➕ **Quick Task Creation**: Modal bottom sheet with custom text fields
- 🗑️ **Task Actions**: Delete individual tasks or clear all tasks
- 📊 **Dynamic Lists**: ListView.builder for efficient task rendering
- ⏳ **Loading States**: Loading indicators while fetching data from Firestore

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
   - Enable Authentication with Email/Password provider
   - Create a Firestore database in production mode
   - Set up Firestore security rules for user-specific data
   - Download and add your `google-services.json` to `android/app/`
   - Add your iOS configuration if building for iOS

4. **Firestore Security Rules**
   ```javascript
   rules_version = '2';
   service cloud.firestore {
     match /databases/{database}/documents {
       match /users/{userId}/tasks/{taskId} {
         allow read, write: if request.auth != null && request.auth.uid == userId;
       }
     }
   }
   ```

5. **Run the app**
   ```bash
   flutter run
   ```

## 📱 App Structure & Database

### Main Screens
- **Sign In Screen**: Welcome back interface with email/password login
- **Sign Up Screen**: Account creation with full name, email, and password
- **Todo Screen**: Main task management interface with Firestore-synced task list

### Firestore Database Structure
```
users/
  └── {userId}/
      └── tasks/
          └── {taskId}/
              ├── id: string
              ├── title: string
              ├── description: string
              └── status: string ("Pending" | "Completed")
```

### Key UI Components
- **Custom Text Fields**: Professional input components with validation and styling
- **Task Widgets**: Interactive task cards with TaskModel integration and visual feedback
- **Status Icons**: Size-optimized (30px) icons with color coding for task states
- **Floating Action Button**: Purple-themed FAB with add icon for quick task creation
- **Modal Bottom Sheet**: Bottom sheet for task creation with custom text fields
- **Loading Indicators**: Circular progress indicators while fetching from Firestore
- **Material Design**: App bars, navigation, and consistent component styling
- **Responsive Layouts**: Adaptive design for different screen sizes and orientations

## 🏗️ Project Structure

```
lib/
├── main.dart                 # App entry point with Firebase initialization & AppBrain instance
├── app_brain.dart           # Centralized task management with Firestore integration
├── models/                  # Data models
│   └── task_model.dart      # TaskModel class with TaskStatus enum
├── screens/                 # Application screens
│   ├── signin_screen.dart   # User authentication login
│   ├── signup_screen.dart   # User registration
│   └── todo_screen.dart     # Main task management interface with Firestore sync
└── widgets/                 # Reusable UI components
    ├── custom_button.dart   # Custom button component
    ├── custom_texfield.dart # Custom input field component
    └── task_item.dart       # Task display widget with TaskModel integration
```

## 🔧 Technical Details

### Dependencies
- **flutter**: Core Flutter framework
- **firebase_core**: Firebase SDK initialization
- **firebase_auth**: User authentication services
- **cloud_firestore**: NoSQL database for task storage

### Key Components

#### AppBrain System
- **Centralized Management**: Global AppBrain instance for task coordination with Firestore
- **CRUD Operations**: Complete Create, Read, Update, Delete functionality
- **User-Specific Data**: Tasks are stored per authenticated user
- **Firestore Integration**: Real-time synchronization with cloud database
- **Error Handling**: Comprehensive error management for network operations
- **Authentication State**: Manages current user ID for data isolation

#### TaskWidget
- Displays individual tasks using TaskModel data structure from Firestore
- Interactive toggle functionality between pending/completed states with cloud sync
- Enhanced visual feedback with size-optimized icons (30px)
- Color-coded status indicators (purple for completed, grey for pending)
- Material Design card layout with subtle shadows and rounded corners
- Responsive layout with proper spacing and typography hierarchy
- Strikethrough text effect for completed tasks
- Direct model binding for efficient data management
- Delete functionality with Firestore synchronization

#### Task Creation Flow
- **Floating Action Button**: Intuitive purple-themed FAB for task creation
- **Modal Bottom Sheet**: Clean bottom sheet interface for new task input
- **Custom Form Fields**: Title and description input with CustomTextField widgets
- **Firestore Integration**: Automatic saving to cloud database upon creation
- **Action Buttons**: Cancel and Add Task options with Material Design styling
- **Loading States**: Progress indicators during save operations

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

### Task Management System with Firestore
- **TaskModel Class**: Structured data model with id, title, description, and status properties
- **AppBrain Pattern**: Centralized task management system with Firestore integration
- **Cloud Storage**: All tasks are stored in user-specific Firestore collections
- **Real-time Sync**: Tasks sync between local state and cloud database
- **User Isolation**: Each user's tasks are stored separately using Firebase Auth UID
- **CRUD Operations**: Complete Create, Read, Update, Delete functionality with cloud sync
- **Error Handling**: Comprehensive error management for network and database operations

### Data Architecture
- **TaskStatus Enum**: Type-safe status management (pending/completed)
- **Global Instance**: AppBrain singleton pattern for shared state management
- **Firestore Structure**: Hierarchical data organization (users/{userId}/tasks/{taskId})
- **Model Structure**: Clean separation between data models and UI components
- **Efficient Updates**: Direct model property manipulation with cloud synchronization
- **Authentication Integration**: Firebase Auth for user management and data isolation

### UI/UX Enhancements
- **Card Design**: Elevated cards with 8px border radius
- **Spacing**: 16px padding inside cards, 12px horizontal margins
- **Shadows**: Multi-layer shadow effect for depth perception
- **Typography**: Clean task titles and descriptions with proper hierarchy
- **Interactive Areas**: Properly sized touch targets for accessibility
- **Floating Action Button**: Circular purple FAB with consistent theming
- **Modal Bottom Sheet**: User-friendly task creation interface
- **Loading States**: Progress indicators during Firestore operations
- **Visual Feedback**: Instant status changes with icon and text updates
- **Icon States**: 
  - `Icons.check_circle` (purple, 30px) for completed tasks
  - `Icons.circle_outlined` (grey, 30px) for pending tasks

### Code Quality
- **Clean Architecture**: Separated data models, business logic, and UI components
- **TaskModel Pattern**: Structured approach to data management with Firestore integration
- **Global State**: AppBrain singleton for coordinated task management with cloud sync
- **Widget Composition**: Reusable components with clear responsibilities
- **Consistent Naming**: Following Dart and Flutter conventions throughout
- **Flutter Linting**: Enforced code quality rules and best practices
- **Error Handling**: Comprehensive error management for authentication and Firestore operations
- **Type Safety**: Strong typing with enums and model classes
- **Async Programming**: Proper Future/async handling for database operations

## 🔐 Security Features

- Firebase Authentication integration with secure token management
- Email format validation with regex patterns
- Password strength requirements and confirmation matching
- Secure session management with automatic token refresh
- Comprehensive error handling for authentication failures
- Protection against common authentication vulnerabilities
- Firestore security rules for user-specific data access
- Server-side data validation and authorization

## 🚀 Future Enhancements

### Planned Features
- [x] **Task Creation**: Add new tasks via floating action button ✅
- [x] **Task Status Toggle**: Mark tasks as completed/pending ✅
- [x] **Data Models**: Structured TaskModel implementation ✅
- [x] **Cloud Storage**: Firestore integration for task persistence ✅
- [x] **User Authentication**: Firebase Auth with sign-up/sign-in ✅
- [x] **Task Deletion**: Remove individual tasks or clear all ✅
- [ ] Task editing functionality
- [ ] Task categories and tags
- [ ] Due dates and reminders
- [ ] Task search and filtering
- [ ] Push notifications for reminders
- [ ] Dark mode support
- [ ] Task reordering and prioritization
- [ ] Task sharing between users

### Technical Improvements
- [x] **Centralized State Management**: AppBrain pattern implementation ✅
- [x] **Data Models**: TaskModel with proper structure ✅
- [x] **Dynamic UI**: ListView.builder for efficient rendering ✅
- [x] **Cloud Database**: Firestore integration for data persistence ✅
- [x] **User Authentication**: Firebase Auth implementation ✅
- [ ] Advanced state management with Provider/Bloc
- [ ] Offline mode support with local caching
- [ ] Push notifications for task reminders
- [ ] Unit and integration tests
- [ ] CI/CD pipeline setup
- [ ] Performance optimization and caching
- [ ] Real-time collaboration features

## 📝 Development Notes

### Code Organization
- Follows Flutter best practices
- Separated concerns with screens and widgets
- Consistent naming conventions
- Comprehensive error handling

### Performance Considerations
- **Efficient Rendering**: ListView.builder for optimal list performance
- **Targeted State Updates**: Local setState calls for immediate UI feedback
- **Model-Based Updates**: Direct TaskModel property changes for efficiency
- **Minimal Rebuilds**: Proper widget tree structure to prevent unnecessary rebuilds
- **Firebase Optimization**: Efficient Firestore queries and minimal read operations
- **Authentication Optimization**: Session persistence to reduce auth calls
- **Memory Management**: Lightweight widget composition and proper disposal
- **Loading States**: Proper loading indicators to improve perceived performance
- **Error Recovery**: Graceful error handling without app crashes

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
