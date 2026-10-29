import UIKit

public extension UIView {

    /// Adds multiple subviews in order.
    func addSubviews(_ views: UIView...) {
        views.forEach { addSubview($0) }
    }

    /// Applies corner radius; optionally masks to bounds.
    func roundCorners(radius: CGFloat, masksToBounds: Bool = true) {
        layer.cornerRadius = radius
        layer.masksToBounds = masksToBounds
    }

    /// Fades the view in or out with a short animation.
    func fade(to alpha: CGFloat, duration: TimeInterval = 0.25, completion: ((Bool) -> Void)? = nil) {
        UIView.animate(withDuration: duration, animations: { self.alpha = alpha }, completion: completion)
    }

    /// Pins the receiver to all edges of `container` using Auto Layout.
    func pinToEdges(of container: UIView, insets: UIEdgeInsets = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: container.topAnchor, constant: insets.top),
            leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: insets.left),
            trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -insets.right),
            bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -insets.bottom)
        ])
    }
}
