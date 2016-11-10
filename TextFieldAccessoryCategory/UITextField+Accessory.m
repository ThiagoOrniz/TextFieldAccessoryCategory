//
//  UITextField+Accessory.m
//  TextFieldAccessoryCategory
//
//  Created by Thiago Orniz Martin on 10/11/16.
//  Copyright © 2016 Thiago Orniz Martin. All rights reserved.
//

#import "UITextField+Accessory.h"
#import <objc/runtime.h>

#define TOOLBAR_HEIGHT      44

@implementation UITextField (Accessory)
@dynamic nextTextField;

- (void)setNextTextField:(UITextField *)tf
{
    objc_setAssociatedObject(self, @selector(nextTextField), tf, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UITextField *)nextTextField
{
    return objc_getAssociatedObject(self, @selector(nextTextField));
}

- (UIView *)setAccessoryViewForTextField:(UITextField*)textField andNextTextField:(UITextField *)nextTextField
{
    
    [self setNextTextField:nextTextField];
    
    UIToolbar *toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(textField.frame.origin.x,
                                                                     textField.frame.origin.y,
                                                                     [[UIScreen mainScreen] bounds].size.width,
                                                                     TOOLBAR_HEIGHT)];
    toolBar.backgroundColor = [UIColor whiteColor];
    
    
    UILabel *titleLabel = [self setLabelWithTitle:textField.placeholder];
    
    UIBarButtonItem *doneBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@""
                                                                          style:UIBarButtonItemStylePlain
                                                                         target:self
                                                                         action:@selector(doneBarButtonItemTouched:)];
    
    [doneBarButtonItem setTitle: nextTextField? @"Next":@"Done"];
    
    UIBarButtonItem *flexible = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                                              target:self
                                                                              action:nil];
    
    [toolBar setItems:[NSArray arrayWithObjects:flexible, doneBarButtonItem, nil]];
    [toolBar addSubview:titleLabel];
    [toolBar sizeToFit];
    
    return toolBar;
}

- (void)doneBarButtonItemTouched:(id)sender
{
    if(self.nextTextField == nil){
        [self resignFirstResponder];
    }
    else{
        [self.nextTextField becomeFirstResponder];
    }
}

-(UILabel *)setLabelWithTitle:(NSString *)title
{
    UILabel * titleLabel = [UILabel new];
    titleLabel.frame = CGRectMake(16, 0, 200, 40);
    titleLabel.text = title;
    titleLabel.textAlignment = NSTextAlignmentLeft;
    titleLabel.textColor = [UIColor darkGrayColor];
    
    return titleLabel;
}
@end
