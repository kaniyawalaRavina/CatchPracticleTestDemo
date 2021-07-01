# This project is using Cocoapods dependencies.

# Motivation

Test demo app made with MVVM architecture

# Installation

run `pod install` to update dependencies.

open `CatchPracticleTestDemo.xcworkspace` to run code in xcode simulatror

# Features

1) When you run the app, app will load the data from API. 
2) Load 1st 20 data and displays in the tableView. Upon scrolling you have more tupples of 20 records. 
3) Pull to refresh -> Pull down to refresh new data.
4) When you pull to refresh, tableview load 1st 20 data in tableview and upon scrolling scroll more data.
5) not loading all the data at the same time coz if we have large no of data it can take time, so loading tupples of 20 records. 

# Unit Test

`UsersListTests.swift` file, click run button beside test methods. -> Test succes if fetch data else will get failed. This testcases for List viewcontroller of main tableView. Mainly to check if we are getting Data or not?
`UserDetailsTests.swift` file, click run button beside test methods to check if test succes or not. This has test cases for detailed viewcontroller. If data found with valid id it will get success else it will get fail.

# Dependencies

pod 'Moya'
(Which manges alamofire and moya)
