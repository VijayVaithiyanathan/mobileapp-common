# Google Drive Auto-Sync Setup (one-time, ~10 minutes)

This app supports automatic backup to your Google Drive so your data survives reinstalls and phone changes. Auto-sync requires a one-time Google OAuth Client ID setup.

If you skip this setup, **local automatic backups still work** — your data is saved every 6 hours and after every change inside the app's folder, kept across app launches but lost on uninstall.

## Steps

1. Go to https://console.cloud.google.com/
2. Create a new project (e.g., "Finance Tracker")
3. Enable the Google Drive API:
   - APIs & Services → Library → search "Google Drive API" → Enable
4. Create OAuth consent screen:
   - APIs & Services → OAuth consent screen → External → fill basic info → Save
   - Add scope: `https://www.googleapis.com/auth/drive.appdata`
   - Add yourself as a test user
5. Create Android OAuth Client:
   - APIs & Services → Credentials → Create credentials → OAuth Client ID
   - Application type: **Android**
   - Package name: `com.fintracker.app`
   - SHA-1 fingerprint: get it from your EAS build:
     ```
     eas credentials
     ```
     Choose Android → Production → it shows the SHA-1.
6. Paste the resulting Client ID into the file:
   - Open `src/utils/gdrive.js`
   - Replace `GOOGLE_CLIENT_ID_ANDROID = ''` with `GOOGLE_CLIENT_ID_ANDROID = 'your-client-id.apps.googleusercontent.com'`
7. Rebuild the APK:
   ```
   EAS_NO_VCS=1 eas build --platform android --profile preview
   ```

## After setup

- Open the app → Settings → Sign in with Google
- Toggle **Auto-sync on changes** ON
- Every edit you make automatically uploads a backup to your Google Drive (in the app's hidden `appDataFolder` — invisible to other apps)
- On a new phone or after reinstall: Settings → Sign in with Google → tap **↓ Restore** → all data comes back

## Privacy

The app uses the `drive.appdata` scope which means it can ONLY see files it created. It cannot read your other Drive files.
