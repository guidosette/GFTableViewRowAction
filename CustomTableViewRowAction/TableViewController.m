//
//  TableViewController.m
//  CustomTableViewRowAction
//
//  Created by Guido Fanfani on 29/09/17.
//  Copyright © 2017 Guido Fanfani. All rights reserved.
//

#import "TableViewController.h"
#import "TableViewCell.h"
#import "GFTableViewRowAction.h"

@interface TableViewController ()

@end

@implementation TableViewController {
    NSMutableArray *data;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    data = [[NSMutableArray alloc] init];
    for (int j = 0; j < 10; j++) {
        NSString* item = [NSString stringWithFormat:@"Item %d",j];
        [data addObject:item];
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.label.text = [data objectAtIndex:indexPath.row];
    
    return cell;
}

// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

// Override to support editing the table view.
// standard UITableViewRowAction
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [data removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

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

@end
