import SwiftUI
extension UIView {
    func addToParent(_ view: UIView) {
        view.addSubview(self)

        translatesAutoresizingMaskIntoConstraints = false
        leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
}
extension UIView {
    func applyBlurEffect(style: UIBlurEffect.Style) {
        let blurEffectView = UIVisualEffectView()
        blurEffectView.frame = bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        blurEffectView.effect = UIBlurEffect(style: style)

        addSubview(blurEffectView)
    }
}

extension Int {
    static var blurViewTag: Int { 2137 }
    static var focusIndicatorTag: Int { 29 }
}
