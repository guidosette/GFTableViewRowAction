# GFTableViewRowAction
Custom TableViewRowAction

![Alt Text](https://github.com/guidosette/GFTableViewRowAction/blob/master/example.gif)

How to use:
- add #import "GFTableViewRowAction.h" in TableViewController

<br />
Example:
<br />
// custom UITableViewRowAction
- (NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {
float heightCell = [self tableView:tableView heightForRowAtIndexPath:indexPath];

GFTableViewRowAction* actionDelete = [GFTableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"Delete" textColor:[UIColor redColor] backgroundColor:[UIColor whiteColor] icon:[UIImage imageNamed:@"delete"] heightCell:heightCell handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
NSLog(@"Delete action");
[data removeObjectAtIndex:indexPath.row];
[tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
}];

GFTableViewRowAction* actionAttach = [GFTableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"Attach" textColor:[UIColor blueColor] backgroundColor:[UIColor greenColor] icon:[UIImage imageNamed:@"attach"] heightCell:heightCell handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
NSLog(@"Attach action");
}];

return @[actionDelete, actionAttach];
}

