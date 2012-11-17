//
//  Setting.h
//  MedApp
//
//  Created by Ryan Huynh on 11/15/12.
//  Copyright (c) 2012 Ryan Huynh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Model.h"
@interface Setting : UIViewController
@property (strong, nonatomic) IBOutlet UISegmentedControl *weightSetting;
@property (strong, nonatomic) IBOutlet UISegmentedControl *heightSetting;
@property (strong, nonatomic) IBOutlet UISegmentedControl *genderSC;
-(IBAction)changeHeightSetting:(id)sender;
-(IBAction)changeWeightSetting:(id)sender;
-(IBAction)changeGender:(id)sender;

@end

