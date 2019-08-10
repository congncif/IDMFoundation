# IDMFoundation

[![CI Status](http://img.shields.io/travis/congncif/IDMFoundation.svg?style=flat)](https://travis-ci.org/congncif/IDMFoundation)
[![Version](https://img.shields.io/cocoapods/v/IDMFoundation.svg?style=flat)](http://cocoapods.org/pods/IDMFoundation)
[![License](https://img.shields.io/cocoapods/l/IDMFoundation.svg?style=flat)](http://cocoapods.org/pods/IDMFoundation)
[![Platform](https://img.shields.io/cocoapods/p/IDMFoundation.svg?style=flat)](http://cocoapods.org/pods/IDMFoundation)

## Summary

**IDMFoundation** is a collection of what is needed to create a popular ios application that uses web services.

As part of the base project, **IDMFoundation** includes the foundation classes built with [**IDMCore**](https://github.com/congncif/IDMCore) concpet and a standard error handling and loading mechanism. **IDMFoundation** is divided into several sub-specs, you can choose which really needed sub-spec to install for your project to not become redundant.

**IDMFoudation** uses:
- [`Alamofire`](https://github.com/Alamofire/Alamofire)
- [`ObjectMapper`](https://github.com/tristanhimmelman/ObjectMapper)

## Installation

### CocoaPods
```
pod 'IDMFoundation`
```

### Carthage
```
github "congncif/IDMFoundation"
```

## Requirements

Xcode 9.3+

Swift 4.1+

## [Bonus] Template

**IDMFoundation** provides templates to help quickly create an ios app which follows [**IDMCore**](https://github.com/congncif/IDMCore) & [**ModuleX**](https://github.com/congncif/ModuleX).

To install template, clone this repo then go to the project directory, run command `./install-template.sh`.

Once that's done, when you create a new file, you'll see them appears.

![alt text](https://i.imgur.com/uq5KaBrl.png)

*Happy coding!*

## Author

congncif, congnc.if@gmail.com

## License

IDMFoundation is available under the MIT license. See the LICENSE file for more info.
