Create a Todo List with Swift 2.1
===

### Step 1
Checkout the branch `$ git checkout grocery-images-01` and open the `Main.storyboard`. On the storyboard there are two view controllers, using auto layout set the appropriate constraints to having the `textField` and the `pickerView` centered. Even more, assign a constraint to the `textField` to have it large enough to cover most of the screen.
Checkout then the branch `$ git checkout grocery-images-01-solved` and explore the actual implementation.

### Step 2
Checkout the branch `$ git checkout grocery-images-02` and explore the project files. There is a new file in place named `GroceryItemTableViewCell`, this file represents a custom `TableViewCell`. Open now the `Main.storyboard` and select the cell. As you can see there are a `Label` and a `UIImageView` in the cell and the custom class for the cell matches the name of the new Swift file added to the project.
Using the _Assistant Editor_ create an outlet between the `Label` and the `UIImageView` with the names `name` and `icon`. Open then the file `MainTableViewController` and  return 1 in the method 

	override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
	
and in the method 
	
	override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
	
Checkout then the branch `$ git checkout grocery-images-02-solved` and explore the actual implementation.

### Step 3
Checkout the branch `$ git checkout grocery-images-03` and go back on the _Project navigator_. There is a new group in the project named _model_ and inside there is a new file named `GroceryItem`. This file represents one of the values that will be added to the `UITableViewController`. Open the file `MainTableViewController` and explore it, in the `viewDidLoad` method and in the

	override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell { 

one there are the building blocks needed to render a list of grocery items.
Using a public property pass the data stored in the `UITableViewController` to the `GroceryItemTableViewCell` and render the name of the grocery item using the `UILabel` previously created.
Checkout then the branch `$ git checkout grocery-images-03-solved` and explore the actual implementation.

### Step 4
Checkout the branch `$ git checkout grocery-images-04` and explore the _Project navigator_. There is a new group in the project named _images_ and, even more, in the file `Assets.xcassets`, there are two image sets defined. Those image sets represent the icons for _vegetables_ and _meat_.
Right click on the _images_ group and add the PNGs still available in the _images_ folder (aka the icons for the wine) and create a new image set named `wine`. 
Open then the `GroceryItem` class and define a private variable containing the categories supported by the current image sets 

	private let categories:[String] = ["vegetables", "meat", "wine”]

Continue to work in this class and define a method named `categoryIcon` to get the current category and then use it from the `GroceryItemTableViewCell` class to assign an image to to the `UIIMageView` available in each cell `icon.image = UIImage(named: currentData.categoryIcon())`.
Checkout then the branch `$ git checkout grocery-images-04-solved` and explore the actual implementation.

### Step 5
Checkout the branch `$ git checkout grocery-images-05` and explore the _Project navigator_. Opening the file `GroceryDataImages.xcdatamodeld` you can see that a new entity is defined in the _CoreData_ model. Expanding the _model_ group you can see a new version of the `GroceryItem` class that support now _CoreData_. Always in the _model_ group you can find the `DataManager` class, this class is responsible to add an item to the list and to recover all the saved items. Our app, in fact, is now ready to save data locally using _CoreData_.
Create a new subclass of the `UIViewController` named `AddItemViewController` and associate it to the View Controller you previously worked on to position the `UIPIckerView`. Add a button on the View Controller and, using the assistant editor, create an `IBAction` to save an item every time the button is pressed. On the same View Controller, create also an `IBOutlet` for the `UITextField` and for the `UIPIckerView` to get access to them from the View Controller. In the `AddItemViewController` create an instance of the `DataManager` class and use the method `addItem` to store not empty items. 
Checkout then the branch `$ git checkout grocery-images-05-solved` and explore the actual implementation.

### Step 6
Checkout the branch `$ git checkout grocery-images-06` and explore the _Project navigator_. Open the file `MainTableViewController` and take a look to what's new. There grocery items are now stored in an optional `Array` and there is an instance of the `DataManager` class instantiated inline with the property declaration. Even more, the `DataManager` class is actually used to recover the data that need to be rendered in the `viewDidLoad` method in the `onGroceryItemsUpdated` notification handler with the following line

	items = dataManager.getItems()
	
Try the app and verify that when you add an item and hit the save button, nothing is happening. If you close and restart the app you can see that data are updated, but this is not the best experience for your user.
In order to fix this behavior the app needs to pass a reference to the `DataManager` from the `MainTableViewController` class to the `AddItemViewController` and then, when the _save_ button is pressed, dismiss the current view controller.
Change the `dataManager` property on the `AddItemViewController` so that it can be accessed from outside of the class and uncomment the line of code `vc.dataManager = dataManager` you can find in the method `override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {`. Now you are using the same instance of the `DataManager` across views and data are updated consistently. Please add the following snippet ` navigationController!.popViewControllerAnimated(true)` to your app in order to dismiss the view controller when the hit button is tapped.
Checkout then the branch `$ git checkout grocery-images-06-solved` and explore the actual implementation.


### Step 7
Checkout the branch `$ git checkout grocery-images-07` and explore the _Project navigator_. Open the file `GroceryItem` and take a look to the `categories` property that is now declared as `static` and how it's used in the `categoryIcon` function.
The problem solved with the `static` accessor is that the possible categories can be now accessed also from different classes of your app, discuss with your pair alternative solutions to this problem.

### Step 8
Checkout the branch `$ git checkout grocery-images-08` and explore the _Project navigator_. Open the `AddItemViewController` class and take a look to the implementation of the `UIPickerViewDataSource` protocol and of the `UIPickerViewDelegate` delegate. The `category` property data will be now feed from the `AddItemViewController`. Try to run the app and to modify the properties stored in the `categories` property declared in the `GroceryItem` class; you should see your changes rendered in the `UIPickerView` right away. 
Open the `MainTableViewController` and explore what is now uncommented on the method `tableview`

	override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, 							 forRowAtIndexPath indexPath: NSIndexPath) {
	
        						if editingStyle == .Delete {
        						
        							// ...
     
Your app now allows the user to remove items from the grocery list! However, when you run the app, you will see that the data are not actually removed from CoreData.
Using the method `removeItem` of the `DataManager`, remove the data from your app. 
 