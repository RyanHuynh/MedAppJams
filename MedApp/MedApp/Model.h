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
-(NSString *) returnWeightSetting;
-(void) changeGender:(NSString*) _gender;
-(void) changeHeightSetting:(NSString*) _heightSetting;
-(void) changeWeightSetting:(NSString*) _weightSetting;
-(void) changeWeightModifier:(double) modifier;
-(void) changeHeightModifier:(double) modifier;
-(double) getWeightModifier;
-(double) getHeightModifier;
-(void) setLogin:(BOOL) signal;
-(BOOL) checkRecord:(NSString*) recordName;
-(void) createNewRecord:(NSString*) newName:(int) genderInput;
-(void) selectRecord:(NSString*) recordID;
-(void) bodyViewUpdate:(NSString*) height: (NSString*) weight: (NSString*) heightP: (NSString*) weightP:(int) month;
-(NSMutableDictionary*) getRecordForMonth:(int) month;
-(NSString*) getSelectedRecordName;

@end

