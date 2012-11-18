//
//  TorsoView.h
//  MedApp
//
//  Created by Ryan Huynh on 11/16/12.
//  Copyright (c) 2012 Ryan Huynh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Model.h"
@interface TorsoView : UIViewController <UIAlertViewDelegate,
UIPickerViewDataSource, UIPickerViewDelegate>

@property (strong, nonatomic) IBOutlet UIImageView *torsoImage;

@property(nonatomic, retain) UIPickerView *agePicker;
@property(nonatomic, retain) NSArray *ageData;
@property (weak, nonatomic) IBOutlet UILabel *ageTextField;
@property (weak, nonatomic) IBOutlet UIView *pickerViewContainer;

@property (strong, nonatomic) NSMutableDictionary *avgValue;
- (IBAction)showAge:(id)sender;
- (IBAction)pickerDone:(id)sender;
- (IBAction)updateRecord:(id)sender;

@property (strong, nonatomic) IBOutlet UITextField *armL;
@property (strong, nonatomic) IBOutlet UILabel *armLAvg;
@property (strong, nonatomic) IBOutlet UITextField *upArmL;
@property (strong, nonatomic) IBOutlet UILabel *upArmLAvg;
@property (strong, nonatomic) IBOutlet UITextField *handL;
@property (strong, nonatomic) IBOutlet UILabel *handLAvg;
@property (strong, nonatomic) IBOutlet UITextField *fArmL;
@property (strong, nonatomic) IBOutlet UILabel *fArmLAvg;
@property (strong, nonatomic) IBOutlet UITextField *palmL;
@property (strong, nonatomic) IBOutlet UILabel *palmLAvg;
@property (strong, nonatomic) IBOutlet UITextField *fingerL;
@property (strong, nonatomic) IBOutlet UILabel *fingerLAvg;
@property (strong, nonatomic) IBOutlet UITextField *ind;
@property (strong, nonatomic) IBOutlet UILabel *indAvg;
@property (strong, nonatomic) IBOutlet UITextField *chest;
@property (strong, nonatomic) IBOutlet UILabel *chestAvg;
@property (strong, nonatomic) IBOutlet UITextField *armSpan;
@property (strong, nonatomic) IBOutlet UITextField *armSpanAvg;

@property (strong, nonatomic) IBOutlet UITextField *armR;
@property (strong, nonatomic) IBOutlet UITextField *upArmR;
@property (strong, nonatomic) IBOutlet UITextField *handR;
@property (strong, nonatomic) IBOutlet UITextField *fArmR;
@property (strong, nonatomic) IBOutlet UITextField *palmR;
@property (strong, nonatomic) IBOutlet UITextField *fingerR;


@end
