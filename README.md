How I thought about the process:

- Planning a composable network layer.
- Planning to use URLSession over Alamofire.
- Planning a Clean Architecture structure with MVC as its presentation layer.
- Planning a practical testing strategy.
- Implementing the movie list request.
- Implementing Xcode Configurations to safely use API keys without committing them to the codebase.
- Planning for SwiftLint integration.


Why I made my decisions:
- I don't typically use "Clean Architecture" except for large projects; MVC would have been sufficient for this task, but I implemented it to show that I can.
- I chose MVC over MVVM because there was no need for presentation logic here.
- I don't believe in writing useless test cases, and there is no business logic to test. (I intentionally skipped UI tests since testing wasn't required at all).
- I chose URLSession due to the simplicity of the task. I believe Alamofire is best used for advanced network configurations that it makes easier.
- I avoid optionals in my code. This can add more code, but in most cases, it prevents a lot of headaches.
- I don't use custom CodingKeys for the data model layer; the properties are named as expected from the data source. The domain models, however, are named in the standard Swift way.