
import Foundation
import UIKit

struct Loader {
    static func show() {
        LoadingOverlay.shared.showOverlay()
    }
    static func hide() {
        LoadingOverlay.shared.hideOverlayView()
    }
    
}

private class LoadingOverlay {
    
    var overlayView : UIView!
    var activityIndicator : UIActivityIndicatorView!
    
    class var shared: LoadingOverlay {
        struct Static {
            static let instance: LoadingOverlay = LoadingOverlay()
        }
        return Static.instance
    }
    
     let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    
    init() {
        overlayView = UIView()
        overlayView.frame = UIScreen.main.bounds
        overlayView.layer.zPosition = 1
        overlayView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        overlayView.layer.zPosition = 1
        
        activityIndicator = UIActivityIndicatorView()
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        activityIndicator.center = CGPoint(x: overlayView.bounds.width / 2, y: overlayView.bounds.height / 2)
        activityIndicator.style = .whiteLarge
//        activityIndicator.color = .gray
        overlayView.addSubview(activityIndicator)
    }
    
    public func showOverlay() {
        
//        let view = UIApplication.shared.keyWindow
//        overlayView.center = (view?.center)!
       let view = currentVC?.view
        view?.addSubview(overlayView)
        activityIndicator.startAnimating()
    }
    
    public func hideOverlayView() {
        activityIndicator.stopAnimating()
        overlayView.removeFromSuperview()
    }
    
    var currentVC:UIViewController? {
        return UIApplication.shared.keyWindow?.rootViewController


    }

}
