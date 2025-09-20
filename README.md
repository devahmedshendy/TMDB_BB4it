# TMDB iOS Client

## Getting Started

1.  **Create an environment file.**
    Create a `.env` file in the root of the project.

2.  **Add your API Token.**
    Open the `.env` file and add your TMDB API Access Token like this:

```markdown
    ACCESS_TOKEN = "YOUR_API_ACCESS_TOKEN_HERE"
```

You can now build and run the project. For more details on the setup, see the notes below.


## Developer Notes

### How API Keys Are Managed

The project uses a build script to automatically populate a `Secrets.xcconfig` file from your `.env` file. This ensures your keys are never committed to the repository.

However, this means the `Secrets.xcconfig` file will show as modified in Git. To prevent accidentally committing this file, it's recommended to tell Git to ignore local changes by running this command once from the project root:

```shell
git update-index --skip-worktree "TMDB_BB4it/Secrets.xcconfig"
```

### Documentation Index

After running the app, you can read more about the project:
-   [Architectural Approach](Architectural-Approach)
-   [Design Decisions](Design-Decisions)

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
