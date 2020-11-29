# Loblaw iOS app exercise
Sample app for swift news


- I have chosen MVC architecture with usage of dependecy injection and blocks etc. Although this app could have been built on MVVM to support testing and scalability but to save time and considering that this app is simple enough to be supported by MVC/ MVP

- Still I have given limited responsibility to classes along side other layers like service, Adapter, Networking, Extensions etc and tried to make view and the controller as much seperate as possible to make unit test cases easier to write.

- Because of time constraint i have not written unit or UI Test cases. Most of the time was spent on design principles 
- I have used cocoapods.

Third parties used (using cocoapods) : 
1) SwiftLint : A tool to enforce Swift style and conventions, loosely based on GitHub's Swift Style Guide and to support clean code. 
2) SwiftHash : To avoid malformed and very long file names, we can hash them. I used MD5 from SwiftHash, which gives dead simple usage let key = MD5(key).


Acceptance Criteria:
-This application should pull JSON data from the following: https://www.reddit.com/r/swift/.json : 
=> i tried creating the complete model to map the data directly from JSON to swift model , but since the json was quite complex and lenghty thereofre i did not write model for whole json and instead chose specific fields for model like 'title' and 'thumbnail' for the article
-The data should be serialized into some kind of type safe object or objects
=> Data is serialized into 'Article' model
-The 'main' view must pass the article 'object' in some way to the 'article view'
=> Main view is passing the article object to detail view ( article view)
-The app should be tested to run on a real iPhone / iPod device- meaning auto-layout works on different size devices as intended and ATS set up correctly and safely
=> App supports auto layout and is tested on iphone/iPad simulators 
-The codebase should be written entirely using Swift, build for iOS 12.x 
=> Writen in swift 5 , build for ios 12.x 
-You must upload your completed code to a public GitHub repository and send us the link!
=> Uploaded :)




