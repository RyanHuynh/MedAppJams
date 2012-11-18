//
//  HeadView.h
//  MedApp
//
//  Created by Ryan Huynh on 11/16/12.
//  Copyright (c) 2012 Ryan Huynh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Model.h"
@interface HeadView : UIViewController <UIAlertViewDelegate,
UIPickerViewDataSource, UIPickerViewDelegate>
{
    
    IBOutlet UIPickerView *agePicker;
    NSArray *ageData;
    
}
@property (strong, nonatomic) IBOutlet UIImageView *headImage;

@property(nonatomic, retain) UIPickerView *agePicker;
@property(nonatomic, retain) NSArray *ageData;
@property (weak, nonatomic) IBOutlet UILabel *ageTextField;
@property (weak, nonatomic) IBOutlet UIView *pickerViewContainer;

@property (strong, nonatomic) IBOutlet UITextField *icd;
@property (strong, nonatomic) IBOutlet UILabel *icdAvg;
@property (strong, nonatomic) IBOutlet UITextField *earLR;
@property (strong, nonatomic) IBOutlet UILabel *earLRAvg;
@property (strong, nonatomic) IBOutlet UITextField *earLL;
@property (strong, nonatomic) IBOutlet UILabel *earLLAvg;
@property (strong, nonatomic) IBOutlet UITextField *pfl;
@property (strong, nonatomic) IBOutlet UILabel *pflAvg;
@property (strong, nonatomic) IBOutlet UITextField *neck;
@property (strong, nonatomic) IBOutlet UILabel *neckAvg;
@property (strong, nonatomic) IBOutlet UITextField *mouth;
@property (strong, nonatomic) IBOutlet UILabel *mouthAvg;
@property (strong, nonatomic) IBOutlet UITextField *philtrum;
@property (strong, nonatomic) IBOutlet UILabel *philtrumAvg;
@property (strong, nonatomic) IBOutlet UITextField *ipd;
@property (strong, nonatomic) IBOutlet UILabel *ipdAvg;
@property (strong, nonatomic) IBOutlet UITextField *ocd;
@property (strong, nonatomic) IBOutlet UITextField *ocdAvg;

@property (strong, nonatomic) NSMutableDictionary *avgValue;
//- (IBAction)tap:(id)sender;
- (IBAction)showAge:(id)sender;
- (IBAction)pickerDone:(id)sender;
- (IBAction)updateRecord:(id)sender;

@end
