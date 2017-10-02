//
//  GFTableViewRowAction.m
//  CustomTableViewRowAction
//
//  Created by Guido Fanfani on 02/10/17.
//  Copyright © 2017 Guido Fanfani. All rights reserved.
//

#import "GFTableViewRowAction.h"

@implementation GFTableViewRowAction

+ (instancetype)rowActionWithStyle:(UITableViewRowActionStyle)style title:(NSString *)title textColor:(UIColor*)textColor backgroundColor:(UIColor*)backgroundColor icon:(UIImage*)icon heightCell:(float)heightCell handler:(void (^)(UITableViewRowAction *action, NSIndexPath *indexPath))handler {
    if (@available(iOS 11.0, *)) {
    } else {
        // < iOS 11
        if (title.length) {
            title = [@"\n" stringByAppendingString:title]; // move title under centerline; icon will go above
        }
    }
    
    GFTableViewRowAction *action = [super rowActionWithStyle:style title:title handler:handler];
    
    if (@available(iOS 11.0, *)) {
        // >= iOS 11
        action.title = @"";
        action.backgroundColor = [UIColor colorWithPatternImage:[action imageForUITableViewRowActionWithHeight:heightCell title:title textColor:textColor backgroundColor:backgroundColor icon:icon]];
    } else {
        // < iOS 11
        action.icon = icon;
        action.textColor = textColor;
        action.backgroundColor = backgroundColor;
    }

    return action;
}

/**
 iOS < 11: in iOS >= 11 this method not called
 */
- (void)_setButton:(UIButton*)button {
    if (self.textColor) {
        [button setTitleColor:self.textColor forState:UIControlStateNormal];
    }
    
    if (self.icon) {
        [button setImage:self.icon forState:UIControlStateNormal];
        CGSize titleSize = [button.titleLabel.text sizeWithAttributes:@{NSFontAttributeName:button.titleLabel.font}];
        int margin = 25; //  gap under icon
        button.imageEdgeInsets = UIEdgeInsetsMake(-(titleSize.height/2 + margin), 0, 0, -titleSize.width);
    }
}

/**
 Return image with label and icon. Only for >= iOS 11
 */
- (UIImage*)imageForUITableViewRowActionWithHeight:(CGFloat)height title:(NSString*)title textColor:(UIColor*)textColor backgroundColor:(UIColor*)backgroundColor icon:(UIImage*)icon {
    float widthContainer = 70;
    float factor = 2.0;
    float alignmentYSpace = height*0.2;

    //image
    float widthContainerStretch = widthContainer*factor;
    CGRect frame = CGRectMake(0, 0, widthContainerStretch, height);
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(widthContainerStretch, height), NO, [UIScreen mainScreen].scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, backgroundColor.CGColor);
    CGContextFillRect(context, frame);
    UIImage *image = icon;
    float imageSize = height*0.5;
    [image drawInRect:CGRectMake(frame.size.width/2.0/factor - imageSize/2.0, frame.size.height/2.0 - imageSize/2.0 - alignmentYSpace, imageSize, imageSize)];

    //label
    float labelHeight = height*0.5;
    float labelWidth = widthContainer;
    CGRect drawingRect = CGRectMake(frame.size.width/2.0/factor - labelWidth/2.0, frame.size.height/2.0 - labelHeight/2.0 + alignmentYSpace, labelWidth, labelHeight);
    UILabel *label = [[UILabel alloc] initWithFrame:drawingRect];
    label.textAlignment = NSTextAlignmentCenter;
    NSDictionary *attributesLabel = @{NSFontAttributeName: [UIFont systemFontOfSize:16]};
    label.attributedText = [[NSAttributedString alloc] initWithString:title attributes:attributesLabel];
    label.textColor = textColor;
    [label drawTextInRect:drawingRect];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}



@end
