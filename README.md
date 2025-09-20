# TMDB iOS Client

## Getting Started

To run this project, you need to provide your TMDB API access token.

1.  Create a `.env` file in the root of the project.
2.  Add your API token to the file like this:

```markdown
    ACCESS_TOKEN = "YOUR_API_ACCESS_TOKEN_HERE"
```
3.  Build the project once in Xcode. This will run a script that populates Secrets.xcconfig with your key.
4.  Tell Git to ignore your local changes to the secrets file by running this command in your terminal from the project root:
```shell
    git update-index --skip-worktree "TMDB BB4it/Secrets.xcconfig"
```
5. After running the app, you can read about the [Architectural Approach](#Architectural-Approach) or the [Design Decisions](#Design-Decisions) I made.

## Architectural Approach

How I thought about the process:

-   [x] Implemented a composable network layer.
-   [x] Used `URLSession` over `Alamofire`.
-   [x] Implemented a Clean Architecture structure with MVC as its presentation layer.
-   [x] Implemented the movie list request.
-   [x] Implemented Xcode Configurations to safely use API keys without committing them to the codebase.
-   [ ] Implement SwiftLint for code style consistency.
-   [x] Implemented reusability for the Now Playing, Upcoming, and Popular features.
-   [x] Improved the implementation for the Now Playing, Upcoming, and Popular features.
-   [x] Implement success and failure handling in the controllers for readability.
-   [x] Implemented proper error handling for the network layer.
-   [x] Implemented proper error handling for the Now Playing, Upcoming, and Popular features.
-   [x] Implemented a toast notification feature.
-   [x] Implemented Movie Detail feature.
-   [ ] Implemented Favorite feature.
-   [ ] Re-check all TODOs for cleanup and any remaining tasks.

## Design Decisions

Why I made my decisions:

-   I don't typically use "Clean Architecture" except for large projects; MVC would have been sufficient for this task, but I implemented it to show that I can.
-   I chose MVC over MVVM because there was no need for presentation logic here.
-   I don't believe in writing useless test cases, and there is no business logic to test. (I intentionally skipped UI tests since testing wasn't required at all).
-   I chose `URLSession` due to the simplicity of the task. I believe `Alamofire` is best used for advanced network configurations that it makes easier.
-   I avoid optionals in my code. This can add more code, but in most cases, it prevents a lot of headaches.
-   I don't use custom `CodingKeys` for the data model layer; the properties are named as expected from the data source. The domain models, however, are named in the standard Swift way.
-   I didn't create separate presentation models; for productivity, the views use the domain models directly.
