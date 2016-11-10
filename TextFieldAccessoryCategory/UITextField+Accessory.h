//
//  UITextField+Accessory.h
//  TextFieldAccessoryCategory
//
//  Created by Thiago Orniz Martin on 10/11/16.
//  Copyright © 2016 Thiago Orniz Martin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (Accessory)
@property (strong, nonatomic) UITextField *nextTextField;


/*! brief Creates a toolbar that goes above keyboard
 *  @param textField : the current UITextField
 *  @param nextTextField : the next UITextField. 
 *  the nextTextField param must be nil to represent the last view on the screen
 *  @return a toolbar view if a title and a next/done button
 */

- (UIView *)setAccessoryViewForTextField:(UITextField*)textField andNextTextField:(UITextField *)nextTextField;

@end
