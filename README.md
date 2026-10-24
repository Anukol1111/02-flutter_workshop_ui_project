# 02-flutter_workshop_ui_project

**Orange ส้ม** — Workshop 02: build 6 UI screens from the Figma design (tested at iPhone 15 Pro Max size, 430 x 932).

## Screens

| File | Class | Screen |
| --- | --- | --- |
| `lib/views/e01_page_ui.dart` | `E01PageUI` | Berry Juice (first page) |
| `lib/views/e02_page_ui.dart` | `E02PageUI` | Welcome back (Log In) |
| `lib/views/e03_page_ui.dart` | `E03PageUI` | Register |
| `lib/views/e04_page_ui.dart` | `E04PageUI` | Forgot your password? |
| `lib/views/e05_page_ui.dart` | `E05PageUI` | OTP Verification |
| `lib/views/e06_page_ui.dart` | `E06PageUI` | Create New Password |

Shared colors and widgets (text field, orange button, OR divider, social icons) are in
`lib/widgets/app_widgets.dart`.

Screenshots (1290 x 2796, iPhone 15 Pro Max) and Figma comparisons are in `screenshots/`.

## Navigation

E01 `Explore Now` → E02 → `Forgot Password ?` → E04 → `Send code` → E05 → `Verify` → E06 → `Submit` → back to E02.
E02 / E04 `Create Account` → E03, and E03 `Log In` / `Sign Up` → E02.

## Run

```sh
flutter pub get
flutter run -d chrome
```

Fonts (Poppins, Inter) come from the `google_fonts` package, so the first run needs internet.

## Quality checks

```sh
flutter analyze
flutter test
```
