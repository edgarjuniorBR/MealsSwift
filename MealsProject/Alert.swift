import Foundation
import UIKit

public class Alert
{
    let _controller: UIViewController
    public init(controller: UIViewController)
    {
        self._controller = controller;
    }
    public func Show(message:String = "Unexpected Error. Be Careful")
    {
        let alert = UIAlertController(title: "Sorry", message: message, preferredStyle: UIAlertControllerStyle.Alert)
        let ok = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
        alert.addAction(ok)
        _controller.presentViewController(alert, animated: true, completion: nil)
    }
}