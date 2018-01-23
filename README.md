[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](#carthage)
![Swift version](https://img.shields.io/badge/swift-4.0-orange.svg)

# About CenterOriginSlider

This is the subclass of UISlider.  
This slider can set track color between center point and track thumb image.

# Requirements

- Swift4.0
- iOS 9.0+

# Installation

## Carthage

Just add to your Cartfile:

```
github "taji-taji/CenterOriginSlider"
```

# Features

- Haptics at center.
- InterfaceBuilder supporting.
  - `@IBDesignable`
  - `@IBInspectable`

# Properties

## minimumTrackBackgroundColor, minimumTrackForegroundColor

The minimum track color.  
If the value is less than or equal center value, minimum track color between minimum point and track thumb image is filled with **`minimumTrackBackgroundColor `**.  
On the other hand, if the value is greater than center value, minimum track color between minimum point and center point is filled with **`minimumTrackBackgroundColor `**.  
And minimum track color between center point and track thumb image is filled with **`minimumTrackForegroundColor `**.

## minimumTrackBackgroundColor

```swift
@IBInspectable open var minimumTrackBackgroundColor: UIColor
```

### default

`UIColor.lightGray`

## minimumTrackForegroundColor

```swift
@IBInspectable open var minimumTrackForegroundColor: UIColor
```

### default

`UIColor.black`


## maximumTrackBackgroundColor, maximumTrackForegroundColor

The maximum track color.  
If the value is greater than or equal center value, maximum track color between maximum point and track thumb image is filled with **`maximumTrackBackgroundColor `**.  
On the other hand, if the value is less than center value, maximum track color between minimum point and center point is filled with **`maximumTrackBackgroundColor `**.  
And minimum track color between center point and track thumb image is filled with **`maximumTrackForegroundColor `**.

## maximumTrackBackgroundColor

```swift
@IBInspectable open var maximumTrackBackgroundColor: UIColor
```

### default

`UIColor.lightGray`

## maximumTrackForegroundColor

```swift
@IBInspectable open var maximumTrackForegroundColor: UIColor
```

### default

`UIColor.black`

## trackHeight

The height for track.

```swift
@IBInspectable open var trackHeight: CGFloat
```

### default

`1.5`

## isCenterFeedbackEnabled

If true, light impact feedback will occur when the value of the slider is changed to the center value.


```swift
open var isCenterFeedbackEnabled: Bool
```

### default

`true`

# License
MIT