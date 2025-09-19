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

## Architectural Approach

How I thought about the process:

-   Planning a composable network layer.
-   Planning to use `URLSession` over `Alamofire`.
-   Planning a Clean Architecture structure with MVC as its presentation layer.
-   Implementing the movie list request.
-   Implementing Xcode Configurations to safely use API keys without committing them to the codebase.
-   Planning for SwiftLint integration.

## Design Decisions

Why I made my decisions:

-   I don't typically use "Clean Architecture" except for large projects; MVC would have been sufficient for this task, but I implemented it to show that I can.
-   I chose MVC over MVVM because there was no need for presentation logic here.
-   I don't believe in writing useless test cases, and there is no business logic to test. (I intentionally skipped UI tests since testing wasn't required at all).
-   I chose `URLSession` due to the simplicity of the task. I believe `Alamofire` is best used for advanced network configurations that it makes easier.
-   I avoid optionals in my code. This can add more code, but in most cases, it prevents a lot of headaches.
-   I don't use custom `CodingKeys` for the data model layer; the properties are named as expected from the data source. The domain models, however, are named in the standard Swift way.
