import UIKit

extension UIPageViewController {
    func swipeRight() {
        guard let current = viewControllers?.first as? DataViewController else { return }
        guard let model = dataSource as? ModelController else { return }
        let index = model.indexOfViewController(current) + 1
        if let storyboard = current.storyboard,
            let next = model.viewControllerAtIndex(index, storyboard: storyboard) {
            setViewControllers([next], direction: .Forward, animated: true, completion: nil)
        }
    }

    func swipeLeft() {
        guard let current = viewControllers?.first as? DataViewController else { return }
        guard let model = dataSource as? ModelController else { return }
        let index = model.indexOfViewController(current) - 1
        if let storyboard = current.storyboard,
            let next = model.viewControllerAtIndex(index, storyboard: storyboard) {
            setViewControllers([next], direction: .Reverse, animated: true, completion: nil)
        }
    }
}
