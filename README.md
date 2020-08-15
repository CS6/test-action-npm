# test-action-npm

# Authentication
First you have to create a Google Play API Access. To do that go to the Google Play Developer Console and then with the account owner go to Settings -> API access and create a Google Play Android Developer project.

After that follow the instructions to create a Service Account. When you click Create Client ID, choose Service Account. You will get a JSON file with a public key and the service email.


### Google Play publisher account
For the initial setup only, you must have access to the Google account which owns the [Google Play publisher account][gp-docs-distribute].

This is required to enable API access from GitHub Actions to your Google Play account.

Note that having admin access is not enough; you need the account owner.  
You can see who the account owner is under [Settings → User accounts & rights][gp-console-admin] in the Google Play developer console.

### Please note
- The app being uploaded must already exist in Google Play; you cannot use the API to upload brand new apps

#### Bundle size warnings
If you try to upload an AAB file to Google Play (including manually via the Google Play Developer Console), and its size is perhaps 100MB+, it may give you a warning:
> The installation of the app bundle may be too large and trigger user warning on some […] this needs to be explicitly acknowledged

This plugin automatically "acknowledges" that warning on Google Play on your behalf when uploading any AAB files, regardless of their size, so you should not see any errors.

If you _do_ see see any unexpected behaviour related to uploading bundles, or warnings appearing for end users, please [let us know](#feedback).

## Setup
### One-time: Set up Google Play credentials
The following initial setup process is demonstrated in this imge

<img width="906" alt="截圖 2020-08-16 上午6 39 25" src="https://user-images.githubusercontent.com/16307922/90322802-610e5980-df8b-11ea-885c-9ce562ba0d3f.png">


#### Install plugin
[Install this plugin via the marketplace  plugin manager.  ](https://github.com/marketplace/actions/upload-android-release-to-play-store)
 ensure that the prerequisite [Google OAuth Credentials Plugin][plugin-google-oauth], [Token Macro Plugin][plugin-token-macro] and their dependencies are also.

#### Create Google service account
To enable automated access to your Google Play account, you must create a service account:

1.  Sign in to the [Google Play developer console][gp-console] as the account owner
2.  Select Settings → Developer account → API access
3.  Under Service Accounts, click "Create Service Account"
4.  Follow the link to the Google API Console
5.  Click the "Create service account" button
6.  Give the service account any name you like, e.g. "Github Actions"
7.  Choose Service Accounts > Service Account User （ 中文搜尋要用[服務帳戶使用者]） for the "Role" field
8.  Enable "Furnish a new private key"
9.  Choose "JSON" as the key type (P12 works as well, but the Plugin suppter a JSON is a little simpler)
10. Click the "Save" button
11. Note that a .json file is downloaded, named something like "api-xxxxxxxxx-xxxxx-xxxx.json"
12. Close the dialog that appears
13. Copy the email address of the new user (something like "Github Actions@api-xxxxxxxxx-xxxxx-xxxx.iam.gserviceaccount.com")
14. You can now close the page

#### Assign permissions to the service account
1. Return to the Google Play developer console page
2. Click "Done" on the dialog
3. Note that the service account has been associated with the Google Play publisher account  
   If it hasn't, follow these additional steps before continuing:
   1. Click "Users & permissions" in the menu
   2. Click "Invite new user"
   3. Paste in the email address you copied above
   4. Continue from step 5
4.  Click the "Grant access" button for the account (e.g. "Github Actions@api-xxxxxxxxx-xxxxx-xxxx.iam.gserviceaccount.com")
5.  Ensure that at least the following permissions are enabled:
    - **View app information** — this is required for the plugin to function
    - **Manage production releases** — optional, if you want to upload APKs to production
    - **Manage testing track releases** — if you want to upload APKs to alpha, beta, internal, or custom test tracks
6.  Click "Add user" (or "Send invitation", as appropriate)
7.  You can now log out of the Google Play publisher account

To do so, visit Google Play Console to set up API access and don’t forget to click Grant Access when you are done.


Refer to

https://github.com/jenkinsci/google-play-android-publisher-plugin/blob/master/README.md
https://medium.com/@iqan/continuously-releasing-flutter-app-to-play-store-using-github-actions-eca2f5f6e996
