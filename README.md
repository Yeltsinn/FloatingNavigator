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
```swift
    func addSearchBar() -> Bool {
        return true
    }
```

# Customization Methods

### Setting up Spacings

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
