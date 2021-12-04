
import UIKit

class CMLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    init(text: String,
         textSize: CGFloat,
         textColor: UIColor = UIColor.black) {
        super.init(frame: .zero)
        self.text = text
        self.textAlignment = textAlignment
        self.font = UIFont.systemFont(ofSize: CGFloat(textSize))
        self.textColor = textColor
        self.translatesAutoresizingMaskIntoConstraints = false
        
    }
}

