//
//  LegView.h
//  MedApp
//
//  Created by Ryan Huynh on 11/16/12.
//  Copyright (c) 2012 Ryan Huynh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Model.h"
@interface LegView : UIViewController <UIAlertViewDelegate,
UIPickerViewDataSource, UIPickerViewDelegate>
{
    
    IBOutlet UIPickerView *agePicker;
    NSArray *ageData;
    
}
@property (strong, nonatomic) IBOutlet UIImageView *legImage;

@property(nonatomic, retain) UIPickerView *agePicker;
@property(nonatomic, retain) NSArray *ageData;
@property (weak, nonatomic) IBOutlet UILabel *ageTextField;
@property (weak, nonatomic) IBOutlet UIView *pickerViewContainer;
@property (strong, nonatomic) IBOutlet UINavigationBar *bar;

@property (strong, nonatomic) NSMutableDictionary *avgValue;
- (IBAction)showAge:(id)sender;
- (IBAction)pickerDone:(id)sender;
- (IBAction)updateRecord:(id)sender;
@end
