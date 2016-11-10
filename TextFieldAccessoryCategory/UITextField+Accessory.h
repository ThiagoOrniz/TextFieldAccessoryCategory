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


- (UIView *)setAccessoryViewForTextField:(UITextField*)textField andNextTextField:(UITextField *)nextTextField;

@end
