# JBInputTableView
UITableView subclass which handles input text view. Suitable plugin for chat applications.
It uses [PHFComposeBarView](https://github.com/fphilipe/PHFComposeBarView) as input view, great and easy to customize resizable text view.

![alt tag](https://cloud.githubusercontent.com/assets/2537227/6373575/ed7ab498-bd0b-11e4-9028-5bc7af3fb639.PNG)

### Installation with CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Objective-C, which automates and simplifies the process of using 3rd-party libraries like JBInputTableView in your projects.

#### Podfile

```ruby
platform :ios, '8.0'
pod 'JBInputTableView'
```

## USAGE
You can use it from Storyboards, XIBs or directly from code.
Change your UITableView to JBInputTableView and make it firstResponder in viewDidLoad.

```objective-c
- (void)viewDidLoad {

    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"CellIdentifier"];
    self.tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeInteractive;
    [self.tableView becomeFirstResponder];
}
```

