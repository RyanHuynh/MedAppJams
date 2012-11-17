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
@property (strong, nonatomic) NSString *selectedRecord;


+(Model *) uniqueModel;
-(NSString *) returnWeightSetting;
-(void) changeGender:(NSString*) _gender;
-(void) changeHeightSetting:(NSString*) _heightSetting;
-(void) changeWeightSetting:(NSString*) _weightSetting;
-(void) changeWeightModifier:(int) modifier;
-(void) changeHeightModifier:(int) modifier;
-(int) getWeightModifier;
-(int) getHeightModifier;
-(void) setLogin:(BOOL) signal;
-(BOOL) checkRecord:(NSString*) recordName;
-(void) createNewRecord:(NSString*) newName;
-(void) selectRecord:(NSString*) recordName;
-(NSMutableArray*) getRecordForMonth:(int) month;
@end

