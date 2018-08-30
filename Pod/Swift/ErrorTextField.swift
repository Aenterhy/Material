import UIKit

open class ErrorTextField: TextField {
    /// Controls the visibility of detailLabel
    @IBInspectable
    open var isErrorRevealed = false {
        didSet {
            detailLabel.isHidden = !isErrorRevealed
            layoutSubviews()
        }
    }
    
    open override func prepare() {
        super.prepare()
        isErrorRevealed = false
        detailColor = Color.red.base
    }
}
