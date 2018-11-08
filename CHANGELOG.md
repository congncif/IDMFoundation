# Change Log
All notable changes to this project will be documented in this file.

#### 1.x Releases
- `1.8.x` Releases  - [1.9.0](#190)
- `1.8.x` Releases  - [1.8.0](#180) | [1.8.1](#181)
- `1.7.x` Releases  - [1.7.0](#170)
- `1.6.x` Releases  - [1.6.0](#160) | [1.6.1](#161) | [1.6.2](#162)  | [1.6.3](#163)
- `1.5.x` Releases  - [1.5.0](#150)
- `1.4.x` Releases  - [1.4.0](#140)
- `1.3.x` Releases  - [1.3.0](#130)
- `1.2.x` Releases  - [1.2.0](#120) | [1.2.3](#123)  | [1.2.4](#124)
- `1.1.x` Releases  - [1.1.0](#110) | [1.1.1](#111) | [1.1.2](#112) | [1.1.3](#113) | [1.1.4](#114)  | [1.1.5](#115) | [1.1.6](#116) | [1.1.7](#117) [1.1.8](#118) [1.1.9](#119) 

---
## [1.9.0](https://github.com/congncif/IDMFoundation/releases/tag/1.9.0)
Released on 2018-11-8

- Added Router
- Added ViewState as a sub spec

## [1.8.1](https://github.com/congncif/IDMFoundation/releases/tag/1.8.1)
Released on 2018-9-19

- Migrate to swift 4.2
- Update template to clean the flow

## [1.8.0](https://github.com/congncif/IDMFoundation/releases/tag/1.8.0)
Released on 2018-8-11

- Added `BaseUploadProvider`
- Update template

## [1.7.0](https://github.com/congncif/IDMFoundation/releases/tag/1.7.0)
Released on 2018-7-21

- Updated Core submodule
- Added `IntegrationProvider`
---
## [1.6.3](https://github.com/congncif/IDMFoundation/releases/tag/1.6.3)
Released on 2018-6-20

- Added default header to session manager

---
## [1.6.2](https://github.com/congncif/IDMFoundation/releases/tag/1.6.2)
Released on 2018-6-20

- Added more custom methods for data provider

---
## [1.6.1](https://github.com/congncif/IDMFoundation/releases/tag/1.6.1)
Released on 2018-6-6

- Removed extra data from response protocol

---
## [1.6.0](https://github.com/congncif/IDMFoundation/releases/tag/1.6.0)
Released on 2018-5-30

- Added `ResponseModelProtocol`
- Add new sub-spec `RequestParameter` 

---
## [1.5.0](https://github.com/congncif/IDMFoundation/releases/tag/1.5.0)
Released on 2018-5-30

- Rename sub-spec `Loading` to `JGProgressHUD` to make sense
- Add new sub-spec `JSONMapper` to remove couple links

---
## [1.4.0](https://github.com/congncif/IDMFoundation/releases/tag/1.4.0)
Released on 2018-4-25
---
## [1.3.0](https://github.com/congncif/IDMFoundation/releases/tag/1.3.0)
Released on 2018-4-19

#### Updated
- `IDMFoundation` now supports subspec

## [1.2.4](https://github.com/congncif/IDMFoundation/releases/tag/1.2.4)
Released on 2018-4-17

#### Added
- `BridgeResponseProvider` 

#### Updated

## [1.2.3](https://github.com/congncif/IDMFoundation/releases/tag/1.2.3)
Released on 2018-4-13

#### Updated
- Rename Response `code` key to `status` key
- `ResponseModel`: added `extra` & `extraMapping`

## [1.2.0](https://github.com/congncif/IDMFoundation/releases/tag/1.2.0)
Released on 2018-4-11

#### Updated
- Removed trackingProgress closure and progressDelegate from Provider. We should handle progress from here, please use `<call>.onProgress(_:)` instead.
- Renamed `ParameterProvider` to `ConvertProvider`
- Renamed `ForwardParameterProvider` to `ForwardProvider`
- Removed extension `Integrator . setProgressLoadingPresenter`
- Removed `UIViewController + ProviderProgressTrackingDelegate`

## [1.1.9](https://github.com/congncif/IDMFoundation/releases/tag/1.1.9)
Released on 2018-4-9

#### Updated
- `StandardProgressDataResponseModel`: Added `invalidDataError`

## [1.1.8](https://github.com/congncif/IDMFoundation/releases/tag/1.1.8)
Released on 2018-4-9

#### Updated
- Change to Reachability

## [1.1.7](https://github.com/congncif/IDMFoundation/releases/tag/1.1.7)
Released on 2018-4-9

#### Updated
- Added customRequest to `ProviderConfiguration`

## [1.1.6](https://github.com/congncif/IDMFoundation/releases/tag/1.1.6)
Released on 2018-4-9

#### Updated
- Added `credential` to `ProviderConfiguration`
- Updated `customRequest()`

## [1.1.5](https://github.com/congncif/IDMFoundation/releases/tag/1.1.5)
Released on 2018-4-8

#### Updated
- Added `validator` to `ResponseModelConfiguration`

## [1.1.4](https://github.com/congncif/IDMFoundation/releases/tag/1.1.4)
Released on 2018-4-8

#### Updated
- Added `baseParameter` to Request Parameter

## [1.1.3](https://github.com/congncif/IDMFoundation/releases/tag/1.1.3)
Released on 2018-4-7

#### Fixed
- String Key Value Protocol: Remove escape string

## [1.1.2](https://github.com/congncif/IDMFoundation/releases/tag/1.1.2)
Released on 2018-4-7

#### Updated
- String Key Value Protocol: Allow sending array in parameter
- Moved parameterEncoding to BaseDataProvider

## [1.1.1](https://github.com/congncif/IDMFoundation/releases/tag/1.1.1)
Released on 2018-4-6

#### Added
- Added Notification InternetAvailable/InternetNotAvailable

## [1.1.0](https://github.com/congncif/IDMFoundation/releases/tag/1.1.0)
Released on 2018-4-6

#### Added
- Added ReachabilitySwift
- Added CWStatusBarNotification
- Added ConnectionManager to check internet connection

## [1.0.0](https://github.com/congncif/IDMFoundation/releases/tag/1.0.0)

#### Added
- Initial release of IDMFoundation.
- Added by [NGUYEN CHI CONG](https://github.com/congncif).
