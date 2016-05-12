import UIKit

class RootViewController: UIViewController, UIPageViewControllerDelegate, PageControllerDelegate {

    var pageViewController: UIPageViewController?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.pageViewController = UIPageViewController(transitionStyle: .PageCurl,
                                                       navigationOrientation: .Horizontal,
                                                       options: nil)
        self.pageViewController!.delegate = self

        let firstViewController = modelController.viewControllerAtIndex(0, storyboard: storyboard!)!
        firstViewController.delegate = self
        let viewControllers = [firstViewController]
        self.pageViewController!.setViewControllers(viewControllers,
                                                    direction: .Forward,
                                                    animated: false,
                                                    completion: nil)

        self.pageViewController!.dataSource = self.modelController

        self.addChildViewController(self.pageViewController!)
        self.view.addSubview(self.pageViewController!.view)

        self.pageViewController!.view.frame = CGRectInset(self.view.bounds, 20.0, 20.0)
        self.pageViewController!.didMoveToParentViewController(self)
    }

    var modelController: ModelController {
        if modelControllerSingleton == nil {
            modelControllerSingleton = ModelController()
            modelControllerSingleton!.delegate = self
        }
        return modelControllerSingleton!
    }

    var modelControllerSingleton: ModelController? = nil

    func swipeRight() {
        pageViewController?.swipeRight()
    }

    func swipeLeft() {
        pageViewController?.swipeLeft()
    }
}
