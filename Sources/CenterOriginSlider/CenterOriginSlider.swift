import UIKit

@IBDesignable
open class CenterOriginSlider: UISlider {
    
    /**
     The minimum track background color.
    
     If the value is less than or equal center value,
     minimum track color between minimum point and track thumb image is filled with **`minimumTrackBackgroundColor `**.
     On the other hand, if the value is greater than center value,
     minimum track color between minimum point and center point is filled with **`minimumTrackBackgroundColor `**.
     And minimum track color between center point and track thumb image is filled with **`minimumTrackForegroundColor `**.
     */
    @IBInspectable open var minimumTrackBackgroundColor: UIColor = .lightGray {
        didSet {
            prepareMinimumTrackImage()
            setMinimumTrackImage()
        }
    }
    
    /**
     The minimum track foreground color.
     
     If the value is less than or equal center value,
     minimum track color between minimum point and track thumb image is filled with **`minimumTrackBackgroundColor `**.
     On the other hand, if the value is greater than center value,
     minimum track color between minimum point and center point is filled with **`minimumTrackBackgroundColor `**.
     And minimum track color between center point and track thumb image is filled with **`minimumTrackForegroundColor `**.
     */
    @IBInspectable open var minimumTrackForegroundColor: UIColor = .black {
        didSet {
            prepareMinimumTrackImage()
            setMinimumTrackImage()
        }
    }
    
    /**
     The maximum track background color.
     
     If the value is greater than or equal center value,
     maximum track color between maximum point and track thumb image is filled with **`maximumTrackBackgroundColor `**.
     On the other hand, if the value is less than center value,
     maximum track color between minimum point and center point is filled with **`maximumTrackBackgroundColor `**.
     And minimum track color between center point and track thumb image is filled with **`maximumTrackForegroundColor `**.
     */
    @IBInspectable open var maximumTrackBackgroundColor: UIColor = .lightGray {
        didSet {
            prepareMaximumTrackImage()
            setMaximumTrackImage()
        }
    }
    
    /**
     The maximum track foreground color.
     
     If the value is greater than or equal center value,
     maximum track color between maximum point and track thumb image is filled with **`maximumTrackBackgroundColor `**.
     On the other hand, if the value is less than center value,
     maximum track color between minimum point and center point is filled with **`maximumTrackBackgroundColor `**.
     And minimum track color between center point and track thumb image is filled with **`maximumTrackForegroundColor `**.
     */
    @IBInspectable open var maximumTrackForegroundColor: UIColor = .black {
        didSet {
            prepareMaximumTrackImage()
            setMaximumTrackImage()
        }
    }
    
    /// The height for track.
    @IBInspectable open var trackHeight: CGFloat = 1.5 {
        didSet {
            prepareTrackImage()
            setTrackImage()
        }
    }
    
    /// If true, light impact feedback will occur when the value of the slider is changed to the center value.
    open var isCenterFeedbackEnabled: Bool = true
    
    override open var bounds: CGRect {
        didSet {
            prepareTrackImage()
            setTrackImage()
        }
    }
    
    private var centerValue: Float { return (minimumValue + maximumValue) / 2 }
    private var minimumBackgroundImage = UIImage()
    private var maximumBackgroundImage = UIImage()
    private var minimumTrackStretchableImage = UIImage()
    private var maximumTrackStretchableImage = UIImage()
    private var feedbackGenerator: Any? = {
        if #available(iOS 10.0, *) {
            let generator: UIImpactFeedbackGenerator = UIImpactFeedbackGenerator(style: .light)
            generator.prepare()
            return generator
        } else {
            return nil
        }
    }()
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        self.comminInit()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.comminInit()
    }
    
    open override func prepareForInterfaceBuilder() {
        prepareMinimumTrackImage()
        prepareMaximumTrackImage()
        setTrackImage()
    }
    
    fileprivate func comminInit() {
        self.addTarget(self, action: #selector(CenterOriginSlider.valueChanged), for: .valueChanged)
    }
    
    override open func draw(_ rect: CGRect) {
        super.draw(rect)
        prepareMinimumTrackImage()
        prepareMaximumTrackImage()
        setTrackImage()
    }
    
    private func prepareTrackImage() {
        prepareMinimumTrackImage()
        prepareMaximumTrackImage()
    }
    
    private func prepareMinimumTrackImage() {
        minimumBackgroundImage = UIImage.filled(with: minimumTrackBackgroundColor, size: CGSize(width: (self.frame.size.width / 2 - alignmentRectInsets.left), height: trackHeight))
        let minimumForegroundImage = UIImage.filled(with: minimumTrackForegroundColor, size: CGSize(width: 3, height: trackHeight))
        let compositeImage = minimumBackgroundImage.composite(otherImage: minimumForegroundImage, size: CGSize(width: minimumBackgroundImage.size.width + minimumForegroundImage.size.width, height: trackHeight), position: CGPoint(x: minimumBackgroundImage.size.width, y: 0))
        minimumTrackStretchableImage = compositeImage.resizableImage(withCapInsets: UIEdgeInsets(top: 0, left: minimumBackgroundImage.size.width + 1, bottom: 0, right: 1), resizingMode: .tile)
    }
    
    private func prepareMaximumTrackImage() {
        maximumBackgroundImage = UIImage.filled(with: maximumTrackBackgroundColor, size: CGSize(width: (self.frame.size.width / 2 - alignmentRectInsets.right), height: trackHeight))
        let maximumForegroundImage = UIImage.filled(with: maximumTrackForegroundColor, size: CGSize(width: 3, height: trackHeight))
        let compositeImage = maximumForegroundImage.composite(otherImage: maximumBackgroundImage, size: CGSize(width: maximumBackgroundImage.size.width + maximumForegroundImage.size.width, height: trackHeight), position: CGPoint(x: maximumForegroundImage.size.width, y: 0))
        maximumTrackStretchableImage = compositeImage.resizableImage(withCapInsets: UIEdgeInsets(top: 0, left: 1, bottom: 0, right: maximumBackgroundImage.size.width + 1), resizingMode: .tile)
    }
    
    @objc private func valueChanged() {
        setTrackImage()
        if self.value == self.centerValue {
            if #available(iOS 10.0, *), self.isCenterFeedbackEnabled {
                (feedbackGenerator as? UIImpactFeedbackGenerator)?.impactOccurred()
            }
        }
    }
    
    private func setTrackImage() {
        setMinimumTrackImage()
        setMaximumTrackImage()
    }
    
    private func setMinimumTrackImage() {
        if self.value <= centerValue {
            self.setMinimumTrackImage(minimumBackgroundImage, for: .normal)
        } else {
            self.setMinimumTrackImage(minimumTrackStretchableImage, for: .normal)
        }
    }
    
    private func setMaximumTrackImage() {
        if self.value <= centerValue {
            self.setMaximumTrackImage(maximumTrackStretchableImage, for: .normal)
        } else {
            self.setMaximumTrackImage(maximumBackgroundImage, for: .normal)
        }
    }
    
}

extension UIImage {
    
    fileprivate static func filled(with color: UIColor, size: CGSize) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        let context = UIGraphicsGetCurrentContext()!
        context.setFillColor(color.cgColor)
        context.fill(CGRect(origin: .zero, size: size))
        let image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
    
    fileprivate func composite(otherImage: UIImage, size: CGSize, position: CGPoint) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        let rect = CGRect(origin: .zero, size: size)
        self.draw(in: rect)
        
        let otherRect = CGRect(origin: position, size: otherImage.size)
        otherImage.draw(in: otherRect)
        let compositeImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return compositeImage
    }
    
}
