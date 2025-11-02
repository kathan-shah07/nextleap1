# Google OAuth Setup Guide

## Fixing "Access blocked: Authorization Error"

This error occurs when your Google Cloud Console OAuth credentials aren't properly configured. Follow these steps:

### Step 1: Configure OAuth Consent Screen

1. Go to [Google Cloud Console](https://console.cloud.google.com/)
2. Select your project
3. Navigate to **APIs & Services > OAuth consent screen**
4. Fill in the required information:
   - **User Type**: Choose "External" (unless you have a Google Workspace)
   - **App name**: Your app name (e.g., "My Login App")
   - **User support email**: Your email address
   - **Developer contact email**: Your email address
5. Click **Save and Continue**
6. On the **Scopes** page, click **Save and Continue** (no scopes needed for basic sign-in)
7. On the **Test users** page (if your app is in Testing mode):
   - Click **Add Users**
   - Add the email addresses of users who should be able to test the app
   - **IMPORTANT**: Only test users can sign in when app is in Testing mode
8. Click **Save and Continue**
9. Review and go back to the dashboard

### Step 2: Configure OAuth Client ID

1. Go to **APIs & Services > Credentials**
2. Find your OAuth 2.0 Client ID (or create a new one)
3. Click **Edit** (pencil icon)
4. Under **Authorized JavaScript origins**, add:
   - `http://localhost` (for local testing)
   - `http://localhost:8080` (if using a local server)
   - `http://127.0.0.1` (alternative localhost)
   - Your production domain (e.g., `https://yourdomain.com`)
5. Under **Authorized redirect URIs**, you can leave this empty for Google Identity Services (it doesn't use redirect URIs)
6. Click **Save**

### Step 3: Publish Your App (Optional)

If you want anyone to use your app (not just test users):
1. Go back to **OAuth consent screen**
2. Click **Publish App** button
3. This will make your app available to all Google users (after verification if needed)

### Step 4: Verify Configuration

1. Make sure your Client ID is correct in `login.html`
2. Make sure the origin URL matches what you added in Authorized JavaScript origins
3. If testing locally, use `http://localhost` (not `file://`)
   - You may need to run a local server:
     ```bash
     # Python 3
     python -m http.server 8000
     
     # Or use Node.js http-server
     npx http-server -p 8000
     ```
   - Then access: `http://localhost:8000/login.html`

### Common Issues:

1. **"Access blocked" error**: 
   - Check Authorized JavaScript origins includes your exact URL (including http/https)
   - Make sure OAuth consent screen is configured
   - If in Testing mode, add your email as a test user

2. **Button doesn't work**:
   - Make sure you're accessing via `http://localhost` not `file://`
   - Check browser console for errors
   - Verify Client ID is correct

3. **"Error 400: redirect_uri_mismatch"**:
   - This shouldn't happen with Google Identity Services, but if it does, check Authorized JavaScript origins

### Testing Mode vs Published:

- **Testing Mode**: Only test users (up to 100) can sign in
- **Published**: All Google users can sign in (may require verification for sensitive scopes)

For development, Testing mode is fine - just add yourself as a test user!

