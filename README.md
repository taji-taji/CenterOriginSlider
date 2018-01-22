# About CenterOriginSlider

This is the subclass of UISlider.  
This slider can set track color between center point and track thumb image.

# Support Version

- Swift4
- iOS 9.0 (or higher)

# Features

- Haptics at center.
- InterfaceBuilder supporting.
  - `@IBDesignable`
  - `@IBInspectable`

![1](https://raw.githubusercontent.com/taji-taji/CenterOriginSlider/master/Resources/images/1.png "1")  
![2](https://raw.githubusercontent.com/taji-taji/CenterOriginSlider/master/Resources/images/2.png "2")

# Properties

## minimumTrackBackgroundColor, minimumTrackForegroundColor

The minimum track background color.  
If the value is less than or equal center value, minimum track color between minimum point and track thumb image is filled with **`minimumTrackBackgroundColor `**.  
On the other hand, if the value is greater than center value, minimum track color between minimum point and center point is filled with **`minimumTrackBackgroundColor `**.  
And minimum track color between center point and track thumb image is filled with **`minimumTrackForegroundColor `**.

### minimumTrackBackgroundColor

```swift
@IBInspectable public var minimumTrackBackgroundColor: UIColor
```

#### default

`UIColor.lightGray`

### minimumTrackForegroundColor

```swift
@IBInspectable public var minimumTrackForegroundColor: UIColor
```

#### default

`UIColor.black`


## maximumTrackBackgroundColor, maximumTrackForegroundColor

The maximum track background color.  
If the value is greater than or equal center value, maximum track color between maximum point and track thumb image is filled with **`maximumTrackBackgroundColor `**.  
On the other hand, if the value is less than center value, maximum track color between minimum point and center point is filled with **`maximumTrackBackgroundColor `**.  
And minimum track color between center point and track thumb image is filled with **`maximumTrackForegroundColor `**.

### maximumTrackBackgroundColor

```swift
@IBInspectable public var maximumTrackBackgroundColor: UIColor
```

#### default

`UIColor.lightGray`

### maximumTrackForegroundColor

```swift
@IBInspectable public var maximumTrackForegroundColor: UIColor
```

#### default

`UIColor.black`

## trackHeight

The height for track.

```swift
@IBInspectable public var trackHeight: CGFloat
```

#### default

`1.5`
