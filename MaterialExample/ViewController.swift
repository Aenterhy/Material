import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var errorTextField: ErrorTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        errorTextField.font = UIFont.systemFont(ofSize: 16)
        errorTextField.placeholderLabel.font = UIFont.systemFont(ofSize: 16)
        errorTextField.placeholderLabel.text = "Дратути"
        errorTextField.placeholderActiveScale = 0.75
        errorTextField.detailLabel.font = UIFont.systemFont(ofSize: 12)
        errorTextField.detailLabel.numberOfLines = 0
        errorTextField.detailColor = UIColor.red
        errorTextField.detailLabel.text = "Привет белочка"
        errorTextField.isErrorRevealed = true
        errorTextField.placeholderNormalColor = UIColor.gray
        errorTextField.placeholderActiveColor = UIColor.gray
        errorTextField.textColor = .black
        errorTextField.dividerNormalColor = UIColor.gray
        errorTextField.dividerActiveColor = UIColor.gray

    }

    override public var prefersStatusBarHidden: Bool {
        return false
    }
    
    override public var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
}
