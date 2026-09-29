# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project

`ligtasalert` — a Flutter app for a campus rescue/safety alert system. Two screens: log in, then pick an alert type, fill in facility + room, send. No backend yet; `onLoggedIn` and the send button are both stubs that call through to the caller.

## Commands

```bash
flutter pub get
flutter run                      # debug on connected device/emulator
flutter run -d chrome            # web target
flutter test                     # all tests
flutter test test/home_page_test.dart              # single file
flutter test --plain-name "choosing an alert type enables send"   # single test
flutter analyze                  # lint (flutter_lints ^5.0.0, no custom rules yet)
```

## Architecture

Four source files, no state management package, no routing, no codegen — deps are `flutter` and `flutter_test` only.

- `lib/main.dart` — `LigtasApp` root; sets `MaterialApp` with M3 theme seeded from `kPrimary`, `home: Builder(...)` wrapping `LoginPage(onLoggedIn: ...)`, which does a `pushReplacement` to `HomePage`. The `Builder` is required: the callback captures the *inner* context, because `LigtasApp's own context is above the `Navigator` and `Navigator.of()` on it throws.
- `lib/login_page.dart` — `LoginPage` (StatefulWidget). State is `_email`/`_password` controllers, `_formKey`, `_obscurePassword`, `_rememberMe`. Email and password are validated by the `Form`; the button stays disabled until both fields are non-empty. No auth backend: a valid submit calls `onLoggedIn`.
- `lib/constants.dart` — all colors as `k*` consts, plus static data tables `alertTypes` and `facilities` as Dart 3 records (`(String type, IconData icon, String description)`). UI reads from these, never hardcodes list contents.
- `lib/home_page.dart` — `HomePage` (StatefulWidget). State is three fields: `_room` (TextEditingController), `_selectedType`, `_facility`. The screen is assembled from private `_build*` methods, each returning one section: status card, alert-type grid, form, send button. `_EmergencyCard` is the only extracted widget; it takes `label`/`icon`/`isSelected`/`onPressed` as plain params and owns no state.

There is no persistence layer and no model/entity class — form values live in widget state only.

## Conventions

- Colors are always referenced via the `k*` constants in `constants.dart`, never inline hex.
- Alert types and facilities are added by appending to the tables in `constants.dart`; the grid and dropdown pick them up automatically.
- Deliberate simplifications carry a `ponytail:` comment naming the ceiling and the upgrade path. Two exist today: the no-op send callback in `_buildSendButton` (`home_page.dart:333`, wire the API call there) and the 320px-width gap documented at `test/home_page_test.dart:18` — the suite guards 360x640 and 375x667 only.
- Tests assert layout safety by pumping at a fixed size via `tester.view.physicalSize` and checking `tester.takeException()` for overflow. Add a new size guard rather than a pixel-snapshot test.
