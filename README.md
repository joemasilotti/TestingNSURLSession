# Testing `NSURLSession`

This repo accompanies a series of blog posts covering [how to test `NSURLSession` with Swift](http://masilotti.com/testing-nsurlsession/). Each post covers a different aspect of the testing process.

First, learn how to verify that you send the right parameters to the session. Next, speed up your test suite by making all `NSURLSession` API calls synchronous. Finally, tie it all together by stubbing JSON responses when running UI Tests.

## Posts
1. [Mocking Classes You Don't Own](http://masilotti.com/testing-nsurlsession-input)

> Not owning a class doesn't mean you can't mock it! Learn how to unit test `NSURLSession` with Swift and protocol-oriented programming.

My go-to approach when unit-testing Swift is protocol-oriented programming. As requested by you, let's see a real-world example. What better way to show some code than with the networking stack, something every iOS developer has dealt with!

1. [Flattening Asynchronous Tests](http://masilotti.com/testing-nsurlsession-async)

> Shave time off your test suite by flattening asynchronous tests. Learn how to mock more of `NSURLSession` to test response data, network errors, and status codes.

You've sent your fully tested HTTP request off into the wild. Now, what happens when it returns? How do you test for response data? What about network errors? Server errors? Let's take a look at how to test these network responses, and more, in this second post on testing `NSURLSession`.

1. [Stubbing Data for UI Testing](http://masilotti.com/ui-testing-stub-network-data)

> Learn how to stub network data when running UI Tests with the magic of some “secret” XCTest APIs.

We've all been there. We get super excited to try out UI Testing and start to use it for all the app's flows. And then one of the tests requires the user to be logged in.

What do we do? Have a "test user" whose password never changes? Create a mock server? Forget the test entirely? There's got to be something better!

With just a little bit of code, we can stub out network data when running our UI Tests. How? With the magic of some "secret" XCTest APIs.
