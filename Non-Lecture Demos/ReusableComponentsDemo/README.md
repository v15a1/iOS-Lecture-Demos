# `ReusableComponentsDemo`

## Contents

* Creating custom views
  * Using extension functions to extend functionality.
  * Embedding the created custom view.
  * Using `Cocoa Touch Classes` to create templates for views

## How to create a custom UIView?

### Checklist

#### Creating the files
- [ ] Create Project & set it up
- [ ] Select a directory and open the Create New File wizard by pressing on `Command` + `N` keys.
- [ ] Select `Cocoa Touch Class`
  * Here notice that there are 2 text fields (i.e., Class and Subclass of)
    *  `Class` - Name of your class
    *  `Subclass of` - You can select the type of view you want to inherit from. We will be using `UIView` so type that in.
  * Also note the checkbox `Also create XIB file`. Ticking that allows you to create both the controlling file and the XIB file (File we can drag and drop to) at once. By doing so we can skip the next 3 steps.
  * However, for `UIView`s the checkbox is disabled.
- [ ] Once the controller file is created, open the New File wizard and this time select `View` from the `Interface` section. Name it the same as your controller class

#### Setting the File Owner and layout
- [ ] Open your XIB folder and layout the UI as you wish (You can't connect to the custom class just yet)
- [ ] Afterwards, Set the class as your File Owner by following the steps below:
  * Open the **View Hierarchy**
  * Under **Placeholders** select the **File's Owner** option
  * Open the **Inspector panel** (top right icon).
  * Out of the inspectors select the **Identity Inspector** (4th icon from the left)
  * Set the `Class` property to the custom controller class and hit `Enter`.
  * Now open your View Assistant (`Command` + `Option` + `Control` + `Enter`) and you should see your XIB file and view class side by side.
  * You can now connect the XIB views to the class.

#### Loading the XIB onto your Custom View
- [ ] For this, you will have to open you custom class and add the initializer by typing in
 
    ```swift
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit() // initial configurations + XIB loading
    }
    ```
- [ ] Add the other initializer when XCode prompts for it.
- [ ] Next we need to create an extension so that we don't have to type the XIB loading code repeatedly. To do this...
  * Create a new file, and name it `Extensions`
  * Type in the following code:

    ```swift
    extension UIView {
        /// Loads the UIView from the XIB (Nib is the more popular name. It stems from Swifts predecessor -- Objective-C)
        /// - Parameter nibName: Name of the XIB/Nib in string
        /// - Returns: The UIView corresponding to the given `nibName`
        func loadFromNib(_ nibName: String) -> UIView? {
            let bundle = Bundle(for: type(of: self)) // Searching the bundle directory for the nibName
            let nib = UINib(nibName: nibName, bundle: bundle) // Caching the view in memory
            return nib.instantiate(withOwner: self, options: nil).first as? UIView // instantiating and returning the view as an optional
        }
    }
    ```
- [ ] Let's go back to the view/controlling class and configure the view so that we can display the loaded view. To do that,
  * Enter the following code in the `commonInit()` function:
  
    ```swift
    guard let view = self.loadFromNib("ReusableImageView") else { return } // Another way of unwrapping optionals. unlike the other options, this will break function execution.
    view.frame = self.bounds // Settig the frame of the view to the current bound (Frame/dimensions) of the current view
    self.addSubview(view) // Adding the loaded view as a subview
    ```
#### Demonstration of Reusability

- [ ] Open the `Main.storyboard`, and add 2 `UIViews` from the library.
- [ ] Select the 2 views and open the `Identity Inspector` and as done previously, change the `Class` attribute to your custom view class.
- [ ] Connect the views to the View Controller
- [ ] Configure the views in the View Controller, by accessing the `@IBOutlets`.

#### That's it folks!




    



