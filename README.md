# SwiftyBeaver Google Analytics Exception Logger

A [SwiftyBeaver](https://swiftybeaver.com) plugin to help log app errors as Google Analytics Exceptions.

## Usage

Many people use Google Analytics as a central place for metrics accross their platforms.  The Swifty Beaver GABeaver plugin provides a bridge between Google Analytics and Swifty Beaver's logging infrastructure.

The GABeaver plugin is used to log error messages to Google Analytics for reporting.  Once implemented each <i>Logger.error</i> message will be recorded as an Exception in Google Analytics.

GABeaver is super simple to setup and get running.

### Add the Plugin to Swifty Beaver

Adding the plugin is super easy and works just like all of the other Swifty Beaver plugins.  Just create a new instance of GABeaver and supply your Google Analytics key.  Once you've created a new GABeaver object, just add it to your app's Swifty Beaver Logger.

~~~
  import SwiftyBeaver
  
  let Logger = SwiftyBeaver.self
  //Create a new instance of the plugin using your Google Analytics key
  let gaLogger = GABeaver(googleAnalyticsKey: "YOUR-GA-KEY")
  //Add the plugin to your Swifty Beaver logger
  Logger.addDestination(gaLogger) 
~~~

### Options
GABeaver comes with a few options.

<b>Threshold</b>

By defaut GABeaver will push any error messages into Google Analytics as exceptions.  By adjusting the Threshold property you can change what messages are recorded as exceptions in Google Analytics.  The below snippet shows how change the threshold so all warnings or above are sent to Google Analytics as exceptions.

~~~
gaLogger.Threshold = SwiftyBeaver.Level.Warning
~~~

<b>printToConsole</b>

You can configure the GABeaver plugin to print to the console when a message is logged.  By default this is off, but you can enable this feature by setting the GABeaver to true as shown in the snippet below.

~~~
gaLogger.printToConsole = true
~~~

## Installation

Before you can use GABeaver you first need to install Swifty Beaver and Google Analytics into your app.  I recommend using [cocoapods](https://cocoapods.org).

Using [cocoapods](https://cocoapods.org):

~~~
pod 'Google/Analytics'
pod 'SwiftyBeaver'
~~~

After installing Google Analytics and SwiftyBeaver just copy  [GABeaver.swift](https://github.com/benbahrenburg/SwiftyBeaver-GA-Exception-Logger/blob/master/GABeaver.swift) into your project.

Why not create a pod for GABeaver.swift?  My thought is copying and pasting the GABeaver.swift might be a good approach for now since you are already installing two larger projects as dependencies.  Happy to take feedback on this.

## Dependencies

You will need to install both Google Analytics and SwiftyBeaver to get this plugin working. Below are links to more resources.

* [Google Analytics](https://developers.google.com/analytics/devguides/collection/ios/v3/?ver=swift)
* [SwiftyBeaver](https://swiftybeaver.com)

## Author

Ben Bahrenburg, [@bencoding](http://twitter.com/bencoding)

## License

GA Beaver is available under the MIT license. See the LICENSE file for more info.
