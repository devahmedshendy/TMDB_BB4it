How I thought about the process:
- Planning composable network layer
- Planning URLSession over Alamofire
- Planning clean arch structure with MVC as its presentation layer
- Planning testing
- Implement movie list request
- Implement Xcode config for safely use api keys without committing it in code
- Planning swiftlint


Why I made my decisions:
- I don't do "Clean Architecture" expect for large projects, this project was enough done by MVC pattern itself .. but for everyone wants it anyway.
- I choose MVC over MVVM, because there is no need for presentation logic here.
- I don't believe in useless test cases and there is no business logic to test (I intentionally skipped UI test since testing wasn't required at all).
- I choose URLSession due to task simplicity. I believe Alamofire is used for advanced network configurations done easily by it.
- I avoid optional in code, that would add more code, but in most cases prevent lots of headache.
- I don't do custom CodingKeys for model layer data, properties are named as expected from the datasource. Domain models is named in the swift-way though.

