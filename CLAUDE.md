# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project

`ligtasalert` — a Flutter app for a campus rescue/safety alert system. One screen today: pick an alert type, fill in facility + room, send. No backend yet; the send action is a `TODO` stub in `lib/home_page.dart:207`.

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

Three source files, no state management package, no routing, no codegen — deps are `flutter` and `flutter_test` only.

- `lib/main.dart` — `LigtasApp` root; sets `MaterialApp` with M3 theme seeded from `kPrimary`, `home: HomePage()`.
- `lib/constants.dart` — all colors as `k*` consts, plus static data tables `alertTypes` and `facilities` as Dart 3 records (`(String type, IconData icon, String description)`). UI reads from these, never hardcodes list contents.
- `lib/home_page.dart` — `HomePage` (StatefulWidget). State is three fields: `_room` (TextEditingController), `_selectedType`, `_facility`. The screen is assembled from private `_build*` methods, each returning one section: status card, alert-type grid, form, send button. `_AlertTypeButton` is the only extracted widget; it takes `isSelected`/`onPressed` as plain params and owns no state.

There is no persistence layer and no model/entity class — form values live in widget state only.

## Conventions

- Colors are always referenced via the `k*` constants in `constants.dart`, never inline hex.
- Alert types and facilities are added by appending to the tables in `constants.dart`; the grid and dropdown pick them up automatically.
- Deliberate simplifications carry a `ponytail:` comment naming the ceiling and the upgrade path. Two exist today: the `FittedBox(scaleDown)` in `_AlertTypeButton` (`home_page.dart:285`) and the 320px-width gap documented at `test/home_page_test.dart:18` — the suite guards 360x640 and 375x667 only.
- Tests assert layout safety by pumping at a fixed size via `tester.view.physicalSize` and checking `tester.takeException()` for overflow. Add a new size guard rather than a pixel-snapshot test.
