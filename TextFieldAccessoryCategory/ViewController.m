//
//  ViewController.m
//  TextFieldAccessoryCategory
//
//  Created by Thiago Orniz Martin on 10/11/16.
//  Copyright © 2016 Thiago Orniz Martin. All rights reserved.
//


#import "ViewController.h"
#import "UITextField+Accessory.h"

#define TEXT_FIELD1_TAG    1
#define TEXT_FIELD2_TAG    2

@interface ViewController ()

@property (strong, nonatomic) UITextField *currentTextField;
@property int currentIndex;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.textField1.tag = TEXT_FIELD1_TAG;
    self.textField2.tag = TEXT_FIELD2_TAG;
    
    [self.textField1 setInputAccessoryView:[self.textField1 setAccessoryViewForTextField:self.textField1 andNextTextField:self.textField2]];
    
    [self.textField2 setInputAccessoryView:[self.textField2 setAccessoryViewForTextField:self.textField2 andNextTextField:nil]];
}

@end
