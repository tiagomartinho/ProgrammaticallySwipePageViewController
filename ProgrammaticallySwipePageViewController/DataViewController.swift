import UIKit

class DataViewController: UIViewController {

    @IBOutlet weak var dataLabel: UILabel!

    var dataObject: String = ""
    var delegate: PageControllerDelegate?

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.dataLabel!.text = dataObject
    }

    @IBAction func next(sender: AnyObject) {
        delegate?.swipeRight()
    }
    @IBAction func previous(sender: AnyObject) {
        delegate?.swipeLeft()
    }
}
