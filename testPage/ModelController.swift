import UIKit

class ModelController: NSObject, UIPageViewControllerDataSource, PageControllerDelegate {

    var pageData: [String] = []
    var delegate: PageControllerDelegate?

    override init() {
        super.init()
        let dateFormatter = NSDateFormatter()
        pageData = dateFormatter.monthSymbols
    }

    func viewControllerAtIndex(index: Int, storyboard: UIStoryboard) -> DataViewController? {
        if (self.pageData.count == 0) || (index >= self.pageData.count) || (index < 0) {
            return nil
        }

        let identifier = "DataViewController"
        let viewController = storyboard.instantiateViewControllerWithIdentifier(identifier)
        let dataViewController = viewController as? DataViewController
        dataViewController?.dataObject = self.pageData[index]
        dataViewController?.delegate = self
        return dataViewController
    }

    func indexOfViewController(viewController: DataViewController?) -> Int {
        return pageData.indexOf(viewController?.dataObject ?? "") ?? NSNotFound
    }

    func pageViewController(pageViewController: UIPageViewController,
                            viewControllerBeforeViewController
                            viewController: UIViewController) -> UIViewController? {
        var index = indexOfViewController(viewController as? DataViewController)
        if (index == 0) || (index == NSNotFound) {
            return nil
        }

        index -= 1
        return self.viewControllerAtIndex(index, storyboard: viewController.storyboard!)
    }

    func pageViewController(pageViewController: UIPageViewController,
                            viewControllerAfterViewController viewController: UIViewController)
        -> UIViewController? {
        var index = indexOfViewController(viewController as? DataViewController)
        if index == NSNotFound {
            return nil
        }

        index += 1
        if index == self.pageData.count {
            return nil
        }
        return self.viewControllerAtIndex(index, storyboard: viewController.storyboard!)
    }

    func swipeRight() {
        delegate?.swipeRight()
    }


    func swipeLeft() {
        delegate?.swipeLeft()
    }
}
