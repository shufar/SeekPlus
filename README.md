# SeekPlus - Redefined. Redeigned.

## Pre-requisites
* Please install `SwiftLint` on the local machine to be able to use the linter.
Follow the steps mentioned [here](https://github.com/realm/SwiftLint.git).
* SPM (Swift Package Manager) to manage and bundle external dependecies.
* Swiftlint is used for linting and formatting code.
* Swinject is used for DI.
* Apollo iOS client is used for GrapQL integration.
* Tool-chain
  - Xcode version: 15.2
  - iOS target version: 17.0 and above

## Architecture
* The app is following the classic MVVM along with Clean Architecture (CA/Onion Arch) design principles.
* The code base is divided based on features with each layer having it's own CA layers implmentation.
* Here is a snapshot of the structure
  
| Snapshot1 | Snapshot2 |
| --- | --- |
|<img src="/Docs/Images/FolderStructure1.png" width="270px"> | <img src="/Docs/Images/FolderStructure2.png" width="270px"> |


## Features implemented
* Loing screen
  - User is authenticated with the backend and the auth token received is stored securly in device Keychain.
  - The auth token is received and added in header of all the network requests.
 
* Home Screen
   - Display the list of all `active`/`published` jobs.
   - Implemented local search.
   - Visual indicators are added to signify if a specific job has been applied to.
   - On tapping any job in the list, the user is redirected to the `details` screen.
   - On the details screen, the user can apply to the job.
 
* Applied Screen
   - Display the list of all the jobs the user has applied to.
   - Visual indicators are added to signify if a specific job has been applied to.
   - On tapping any job in the list, the user is redirected to the `details` screen.
   - The UI shows the applied status.
 
* Profile screen
   - Profile screen with standard option (dummy)
   - Logout button (no backend endpoint/implementation available)
   
- I have tried to be as close as possible with the design system used in Seek applications.
- Attention to detail on small things.
   
## Demo

<img src="/Docs/Demo/SeekPlusDemoiPhone15Pro.mp4" width="270px">

## To-do
 - Implement Unit tests.
 - Validation on login screen.
 - Toast messages on user actions with feedback.
