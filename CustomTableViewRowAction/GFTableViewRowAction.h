//
//  GFTableViewRowAction.h
//  CustomTableViewRowAction
//
//  Created by Guido Fanfani on 02/10/17.
//  Copyright © 2017 Guido Fanfani. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GFTableViewRowAction : UITableViewRowAction

@property UIColor* textColor;
@property UIImage* icon;

+ (instancetype)rowActionWithStyle:(UITableViewRowActionStyle)style title:(NSString *)title textColor:(UIColor*)textColor backgroundColor:(UIColor*)backgroundColor icon:(UIImage*)icon heightCell:(float)heightCell handler:(void (^)(UITableViewRowAction *action, NSIndexPath *indexPath))handler;

@end
