# Taka Manager (তাকা ম্যানেজার)

Production-ready Android-first personal finance app for Bangladesh, built with Flutter + Firebase + Hive (offline-first) + Riverpod.

## Implemented Architecture

```text
lib/
  core/            # constants, DI, security, networking
  data/            # models, datasources, repositories, sync engine
  domain/          # repository contracts
  presentation/    # app, providers, screens/widgets
firebase/          # firestore/storage security rules
functions/         # Cloud Functions (TypeScript)
docs/              # Play Store + policy templates
```

## Key Features Covered
- Transactions: expense, income, loan given/taken, gift.
- Offline-first write path using Hive + sync queue.
- Auto sync engine with connectivity detection.
- Firebase Auth datasource scaffold (email + phone OTP flow support).
- Firestore + Storage rules for strict per-user isolation.
- Dashboard with totals, income-vs-expense chart, recent transactions, high-expense warning.
- Material 3 Bengali-first UI with bottom navigation.
- PIN/biometric service scaffold with secure local storage.
- Cloud Functions for recurring transactions, monthly summaries, and reminders.

## Setup
1. Install Flutter stable and Android SDK.
2. Create Firebase project.
3. Enable Authentication providers:
   - Email/Password
   - Phone
4. Add Android app package and download `google-services.json` to `android/app/`.
5. Configure Firebase CLI and deploy:
   ```bash
   cd firebase && firebase deploy --only firestore:rules,storage:rules
   cd ../functions && npm install && npm run build && firebase deploy --only functions
   ```
6. Install Flutter dependencies:
   ```bash
   flutter pub get
   ```
7. Run app:
   ```bash
   flutter run
   ```

## Offline-first Sync Design
1. User action writes to Hive immediately (low latency).
2. Change saved into `sync_queue` with collection/doc/payload.
3. Connectivity listener triggers sync when online.
4. Firestore upsert with last-write-wins based on `updatedAt`.
5. Synced queue item removed after success.

## Backup & Restore
- Recommended path: serialize local Hive content to JSON, encrypt with app PIN-derived key, upload to Firebase Storage path:
  - `backups/{userId}/{timestamp}.json.enc`
- Restore: fetch file, decrypt, replay to Hive boxes.

## Reports Export
- CSV export via `csv` package.
- PDF export via `pdf` + `printing`.
- Share/export through `share_plus`.

## Android Release (.aab)
1. Configure signing key in `android/key.properties` and Gradle.
2. Build bundle:
   ```bash
   flutter build appbundle --release
   ```
3. Output:
   - `build/app/outputs/bundle/release/app-release.aab`

## Play Store Checklist
- App icon: `assets/icons/`
- Splash image: `assets/images/`
- Privacy policy: `docs/privacy_policy_template.md`
- Store listing: `docs/play_store_listing.md`
- Semantic versioning from `pubspec.yaml`.

## Performance Notes
- Hive local reads for fast startup on low-end devices.
- Non-blocking sync via async background operations.
- ListView.builder and incremental rendering.
- Pagination-ready repository pattern.

## Next Production Hardening Tasks
- Add full feature modules for budgets, goals, loans, shopping, reports with dedicated repositories.
- Add full localization resource files (`arb`) for complete Bengali/English coverage.
- Add crash reporting (Firebase Crashlytics) and analytics events.
- Add widget/integration tests and CI pipeline.
