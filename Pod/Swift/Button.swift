import UIKit

open class Button: UIButton {
    /**
     A CAShapeLayer used to manage elements that would be affected by
     the clipToBounds property of the backing layer. For example, this
     allows the dropshadow effect on the backing layer, while clipping
     the image to a desired shape within the visualLayer.
     */
    public let visualLayer = CAShapeLayer()

    /// A property that accesses the backing layer's background
    @IBInspectable
    open override var backgroundColor: UIColor? {
        didSet {
            layer.backgroundColor = backgroundColor?.cgColor
        }
    }
    
    /// A preset property for updated contentEdgeInsets.
    open var contentEdgeInsetsPreset = EdgeInsetsPreset.none {
        didSet {
            contentEdgeInsets = EdgeInsetsPresetToValue(preset: contentEdgeInsetsPreset)
        }
    }
    
    /// Sets the normal and highlighted image for the button.
    @IBInspectable
    open var image: UIImage? {
        didSet {
            setImage(image, for: .normal)
            setImage(image, for: .selected)
            setImage(image, for: .highlighted)
            setImage(image, for: .disabled)
            
            if #available(iOS 9, *) {
                setImage(image, for: .application)
                setImage(image, for: .focused)
                setImage(image, for: .reserved)
            }
        }
    }
    
    /// Sets the normal and highlighted title for the button.
    @IBInspectable
    open var title: String? {
        didSet {
            setTitle(title, for: .normal)
            setTitle(title, for: .selected)
            setTitle(title, for: .highlighted)
            setTitle(title, for: .disabled)
            
            if #available(iOS 9, *) {
                setTitle(title, for: .application)
                setTitle(title, for: .focused)
                setTitle(title, for: .reserved)
            }
            
            guard nil != title else {
                return
            }
            
            guard nil == titleColor else {
                return
            }
            
            titleColor = Color.blue.base
        }
    }
    
    /// Sets the normal and highlighted titleColor for the button.
    @IBInspectable
    open var titleColor: UIColor? {
        didSet {
            setTitleColor(titleColor, for: .normal)
            setTitleColor(titleColor, for: .highlighted)
            setTitleColor(titleColor, for: .disabled)
            
            if nil == selectedTitleColor {
                setTitleColor(titleColor, for: .selected)
            }
            
            if #available(iOS 9, *) {
                setTitleColor(titleColor, for: .application)
                setTitleColor(titleColor, for: .focused)
                setTitleColor(titleColor, for: .reserved)
            }
        }
    }
    
    /// Sets the selected titleColor for the button.
    @IBInspectable
    open var selectedTitleColor: UIColor? {
        didSet {
            setTitleColor(selectedTitleColor, for: .selected)
        }
    }
    
    /**
     An initializer that initializes the object with a NSCoder object.
     - Parameter aDecoder: A NSCoder instance.
     */
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        prepare()
    }
    
    /**
     An initializer that initializes the object with a CGRect object.
     If AutoLayout is used, it is better to initilize the instance
     using the init() initializer.
     - Parameter frame: A CGRect instance.
     */
    public override init(frame: CGRect) {
        super.init(frame: frame)
        tintColor = Color.blue.base
        prepare()
    }
    
    /// A convenience initializer.
    public convenience init() {
        self.init(frame: .zero)
    }
    
    /**
     A convenience initializer that acceps an image and tint
     - Parameter image: A UIImage.
     - Parameter tintColor: A UI
     */
    public init(image: UIImage?, tintColor: UIColor = Color.blue.base) {
        super.init(frame: .zero)
        prepare(with: image, tintColor: tintColor)
        prepare()
    }
    
    /**
     A convenience initializer that acceps a title and title
     - Parameter title: A String.
     - Parameter titleColor: A UI
     */
    public init(title: String?, titleColor: UIColor = Color.blue.base) {
        super.init(frame: .zero)
        prepare(with: title, titleColor: titleColor)
        prepare()
    }
    
    func layoutShape() {
        layer.layoutShape()
    }
    
    func layoutShadowPath() {
        layer.layoutShape()
    }
    
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        layoutShape()
        layoutVisualLayer()
        layoutShadowPath()
    }
    
    open func bringImageViewToFront() {
        guard let v = imageView else {
            return
        }
        
        bringSubview(toFront: v)
    }
    
    /**
     Prepares the view instance when intialized. When subclassing,
     it is recommended to override the prepare method
     to initialize property values and other setup operations.
     The super.prepare method should always be called immediately
     when subclassing.
     */
    open func prepare() {
        contentScaleFactor = UIScreen.main.scale
        prepareVisualLayer()
    }
}

extension Button {
    /// Prepares the visualLayer property.
    fileprivate func prepareVisualLayer() {
        visualLayer.zPosition = 0
        visualLayer.masksToBounds = true
        layer.addSublayer(visualLayer)
    }
    /**
     Prepares the Button with an image and tint
     - Parameter image: A UIImage.
     - Parameter tintColor: A UI
     */
    fileprivate func prepare(with image: UIImage?, tintColor: UIColor) {
        self.image = image
        self.tintColor = tintColor
    }
    
    /**
     Prepares the Button with a title and title
     - Parameter title: A String.
     - Parameter titleColor: A UI
     */
    fileprivate func prepare(with title: String?, titleColor: UIColor) {
        self.title = title
        self.titleColor = titleColor
    }
}

extension Button {
    /// Manages the layout for the visualLayer property.
    fileprivate func layoutVisualLayer() {
        visualLayer.frame = bounds
        visualLayer.cornerRadius = layer.cornerRadius
    }
}
