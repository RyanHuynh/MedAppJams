//
//  Model.h
//  MedApp
//
//  Created by Ryan Huynh on 11/15/12.
//  Copyright (c) 2012 Ryan Huynh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject
@property (strong, nonatomic) NSString *weightSetting;
@property (strong, nonatomic) NSString *heightSetting;
@property (strong, nonatomic) NSString *gender;
@property (strong, nonatomic) NSMutableDictionary *log;

@property BOOL logIn;
@property (strong, nonatomic) NSString *loginID;
@property (strong, nonatomic) NSString *selectedRecord;


+(Model *) uniqueModel;

-(void) changeGender:(NSString*) _gender;
-(void) changeHeightSetting:(NSString*) _heightSetting;
-(void) changeWeightSetting:(NSString*) _weightSetting;
-(void) changeWeightModifier:(double) modifier;
-(void) changeHeightModifier:(double) modifier;
-(double) getWeightModifier;
-(double) getHeightModifier;
-(void) setLogin:(NSString*) logInID;
-(void) setLogout;
-(BOOL) checkRecord:(NSString*) recordName;
-(void) createNewRecord:(NSString*) newName:(int) genderInput;
-(void) selectRecord:(NSString*) recordID;
-(NSMutableDictionary*) getRecordForMonth:(int) month;
-(NSString*) getSelectedRecordName;

-(void) bodyViewUpdate:(NSString*) height: (NSString*) weight: (NSString*) head: (NSString*) heightP: (NSString*) weightP: (NSString*) headP:(int) month;
-(void) headViewUpdate:(NSString*) icd: (NSString*) icdAvg: (NSString*) earLR: (NSString*) earLRAvg: (NSString*) earLL: (NSString*) earLLAvg:(NSString*) pfl: (NSString*) pflAvg: (NSString*) neck: (NSString*) neackAvg: (NSString*) mouth: (NSString*) mouthAvg: (NSString*) philtrum: (NSString*)philtrumAvg: (NSString*) ipd: (NSString*) ipdAvg: (NSString*) ocd: (NSString*) ocdAvg:(int) month;


@end

