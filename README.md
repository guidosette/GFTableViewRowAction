# GFTableViewRowAction
Custom TableViewRowAction

![Alt Text](https://github.com/guidosette/GFTableViewRowAction/blob/master/example.gif)

How to use:
- add #import "GFTableViewRowAction.h" in TableViewController

<br />
Example:
<br />
// custom UITableViewRowAction
<br />
- (NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {
<br />
float heightCell = [self tableView:tableView heightForRowAtIndexPath:indexPath];
<br />

GFTableViewRowAction* actionDelete = [GFTableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"Delete" textColor:[UIColor redColor] backgroundColor:[UIColor whiteColor] icon:[UIImage imageNamed:@"delete"] heightCell:heightCell handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
<br />
NSLog(@"Delete action");
<br />
}];
<br />
<br />

GFTableViewRowAction* actionAttach = [GFTableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"Attach" textColor:[UIColor blueColor] backgroundColor:[UIColor greenColor] icon:[UIImage imageNamed:@"attach"] heightCell:heightCell handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
<br />
NSLog(@"Attach action");
<br />
}];
<br />
<br />

return @[actionDelete, actionAttach];
<br />
}

