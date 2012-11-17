//
//  Milestones.h
//  MedApp
//
//  Created by Eiling Fernandez on 11/15/12.
//  Copyright (c) 2012 Ryan Huynh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Milestones : UIViewController

<UIPickerViewDataSource, UIPickerViewDelegate>
{
    
    IBOutlet UIPickerView *agePicker;
    NSArray *ageData;
    
}

@property(nonatomic, retain) UIPickerView *agePicker;

@property(nonatomic, retain) NSArray *ageData;

@property (weak, nonatomic) IBOutlet UITextField *ageTextField;

@property (weak, nonatomic) IBOutlet UIView *pickerViewContainer;

- (IBAction)tap:(id)sender;
- (IBAction)showAge:(id)sender;
- (IBAction)pickerDone:(id)sender;


@end
