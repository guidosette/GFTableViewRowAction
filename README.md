# GFTableViewRowAction
Custom TableViewRowAction

![Alt Text](https://github.com/guidosette/UIBarButtonItem-ItemBadge/blob/master/example.gif)

How to use:
- import UIBarButtonItem+ItemBadge.h and UIBarButtonItem+ItemBadge.m
- add #import "UIBarButtonItem+ItemBadge.h" in ViewController

<br />
Example:
<br />
UIBarButtonItem *notificationItem = self.navigationItem.rightBarButtonItems[0];
[notificationItem setCustomBadge:[NSString stringWithFormat:@"%d", 2]];
