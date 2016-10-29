# FloatingNavigator

# Sample Code
```swift

class ViewController: FNViewController, FNViewControllerDataSource, FNViewControllerSearchBarCustomize, FNViewControllerDelegate {
    
    var controllersArray: [UIViewController]!
    
    var iconsActiveState = ["eventsIcon", "mapIcon", "favoriteIcon"]
    var iconsInactiveState = ["eventsIconOff", "mapIconOff", "favoriteIconOff"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Get Controllers By StoryBoard
        let controller1 = storyboard!.instantiateViewController(withIdentifier: "Controller1")
        let controller2 = storyboard!.instantiateViewController(withIdentifier: "Controller2")
        let controller3 = storyboard!.instantiateViewController(withIdentifier: "Controller3")
        
        // Adding Controllers to Array
        controllersArray = [controller1, controller2, controller3]
        
        // Setting Delegates and DataSource
        self.fNViewControllerDataSource = self
        self.fNViewControllerDelegate = self
        self.fNViewControllerSearchBarCustomize = self
        
        // Setup FloatingNavigator SegmentContol
        self.setupFNSegmentControl()
    }
```


# Setup DataSource

> To use these methods is necessary implement FNViewControllerDataSource

### Required Methods
```swift
    func numberOfTabsInSegmentControl() -> Int {
        return controllersArray.count
    }
    
    func controllerOfTabViewAtIndex(index: Int) -> UIViewController {
        return controllersArray[index]
    }
```

### Optional Methods
```swift

    func titleForTabViewAtIndex(index: Int) -> String {
        return controllersArray[index].title!
    }

    func imageForTabViewAtIndexInActiveState(index: Int) -> UIImage {
        return UIImage(named: iconsActiveState[index])!
    }

    func imageForTabViewAtIndexInInactiveState(index: Int) -> UIImage {
        return UIImage(named: iconsInactiveState[index])!
    }
```

### Adding SearchBar

> To use this methods is necessary implement FNViewControllerDelegate

```swift
    func addSearchBar() -> Bool {
        return true
    }
```

# Customization Methods

### Setting up Spacings

> To use these methods is necessary implement FNViewControllerDelegate

![spacing1](https://raw.githubusercontent.com/Yeltsinn/FloatingNavigator/master/Resources/distanceBetweenTabViewComponentsImg.png)
```swift
    func setDistanceBetweenTabViewComponents() -> CGFloat {
        return 8
    }
```
![spacing2](https://raw.githubusercontent.com/Yeltsinn/FloatingNavigator/master/Resources/distanceTabViewComponentsToSideBoundsImg.png)
```swift
    func setDistanceTabViewComponentsToSideBounds() -> CGFloat {
        return 20
    }
```

## SearchBar Customization
> To use these methods is necessary implement FNViewControllerSearchBarCustomize

![spacing2](https://raw.githubusercontent.com/Yeltsinn/FloatingNavigator/master/Resources/searchBarCustomization.png)
```swift
    func setColorOfSearchBarBox() -> UIColor {
        return UIColor.lightGray
    }
    
    func setColorOfSearchBarIcon() -> UIColor {
        return UIColor.lightGray
    }
    
    func setColorOfSearchBarText() -> UIColor {
        return UIColor.black
    }
    
    func setColorOfSearchBarPlaceholder() -> UIColor {
        return UIColor.lightGray
    }
    
    func setColorOfSearchBarTextField() -> UIColor {
        return UIColor(colorLiteralRed: 225.0/255, green: 228.0/255, blue: 229.0/255, alpha: 1.0)
    }
```

## SearchController Responder

To use the FloatingNavigator you just need do setup the protocols UISearchResultsUpdating and UISearchBarDelegate in your tableview classes that will respond to the SearchBar, this way, when the tabview is selected, SearchBar automatically will respond to the methods and protocols from its TableView. 

> Case you need access the SearchController out of the UISearchResultsUpdating and UISearchBarDelegate protocols methods you must create a reference of the main ViewController that inherits from FNViewController in your TabViews Controller Classes.

```swift
class ViewController: FNViewController, FNViewControllerDataSource, FNViewControllerSearchBarCustomize, FNViewControllerDelegate {
    
    var controllersArray: [UIViewController]!
    var iconsActiveState = ["eventsIcon", "mapIcon", "favoriteIcon"]
    var iconsInactiveState = ["eventsIconOff", "mapIconOff", "favoriteIconOff"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let controller1 = storyboard!.instantiateViewController(withIdentifier: "Controller1") as! TableViewController
        let controller2 = storyboard!.instantiateViewController(withIdentifier: "Controller2")
        let controller3 = storyboard!.instantiateViewController(withIdentifier: "Controller3")
        
        // Setting FNViewController rootController in TabView Class
        controller1.rootController = self
        
        controllersArray = [controller1, controller2, controller3]
        
        self.fNViewControllerDataSource = self
        self.fNViewControllerDelegate = self
        self.fNViewControllerSearchBarCustomize = self
        self.setupFNSegmentControl()
        self.tabViewsSeparatorStyle = .singleLine
    }
```
```swift
class TableViewController: UITableViewController, UISearchResultsUpdating {
    
    var rootController: ViewController!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Accessing SearchBar By SearchController
        rootController.searchController.searchBar
    }
```

## License

[MIT License](https://github.com/Yeltsinn/FloatingNavigator/blob/master/LICENSE)

