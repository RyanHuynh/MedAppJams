//
//  Record.h
//  MedApp
//
//  Created by Ryan Huynh on 11/16/12.
//  Copyright (c) 2012 Ryan Huynh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Model.h"
@interface Record : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *weightLabel;
@property (strong, nonatomic) IBOutlet UILabel *monthLabel;
@property (strong, nonatomic) IBOutlet UILabel *heightLabel;
@property (strong, nonatomic) IBOutlet UILabel *heightPLabel;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *weightPLabel;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *prevButton;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *nextButton;
- (IBAction)prevMonth:(id)sender;

- (IBAction)nextMonth:(id)sender;

//something
@end
