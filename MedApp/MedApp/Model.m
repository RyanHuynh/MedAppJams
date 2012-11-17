//
//  Model.m
//  MedApp
//
//  Created by Ryan Huynh on 11/15/12.
//  Copyright (c) 2012 Ryan Huynh. All rights reserved.
//

#import "Model.h"

@implementation Model
@synthesize weightSetting;
@synthesize heightSetting;
@synthesize gender;
@synthesize logIn;
@synthesize log;
@synthesize loginID;
@synthesize selectedRecord;

static Model* _uniqueModel = nil;
static int weightModifier;
static int heightModifier;
static int uniqueId;

+(Model *)uniqueModel
{
	@synchronized([Model class])
	{
		if (!_uniqueModel)
			//[[self alloc] init];
		return _uniqueModel;
	}
	return nil;
}

+(id)alloc
{
	@synchronized([Model class])
	{
		NSAssert(_uniqueModel == nil, @"Attempted to allocate a second instance of a singleton.");
		_uniqueModel = [super alloc];
		return _uniqueModel;
	}
	return nil;
}

-(id)init {
	self = [super init];
	if (self != nil) {
		// initialize stuff here
        gender =@"Boy";
        weightSetting =@"(Kilogram)";
        heightSetting=@"(Centimeter)";
        weightModifier = 1;
        heightModifier = 1;
        uniqueId = 1;
        log = [[NSMutableDictionary alloc]init];
        [self createNewRecord:@"Ryan Awesome": 0];
        [self createNewRecord:@"Fantastic Xtina": 1];
        logIn = NO;
    }
    
	return self;
}

-(void) changeGender:(NSString*) _gender
{
    gender = _gender;
}
-(void) changeHeightSetting:(NSString*) _heightSetting
{
    heightSetting = _heightSetting;
}
-(void) changeWeightSetting:(NSString*) _weightSetting
{
    weightSetting = _weightSetting;
}
-(void) changeWeightModifier:(int) modifier
{
    weightModifier = modifier;
}

-(void) changeHeightModifier:(int) modifier
{
    heightModifier = modifier;
}

-(int) getWeightModifier
{
    return weightModifier;
}
-(int) getHeightModifier
{
    return heightModifier;
}
-(void) setLogin:(BOOL) signal
{
    logIn = signal;
}
-(BOOL) checkRecord:(NSString*) recordName
{
    if([log objectForKey:recordName])
        return true;
    else
        return false;
}
-(void) createNewRecord:(NSString*) newName: (int)genderInput
{
    NSString *genderS;
    if (genderInput == 0) {
        genderS = @"Boy";
    }
    else
        genderS = @"Girl";
    NSMutableDictionary *monthRecord = [[NSMutableDictionary alloc]initWithObjectsAndKeys:
                                        newName,@"name",
                                        genderS,@"gender",
                                        @"",@"weight",
                                         @"",@"height",
                                        nil];
    NSMutableArray *newRecord = [NSMutableArray array];
    for(int i = 0; i < 12; i++)
    {
        [newRecord addObject:monthRecord];
    }
    [log setObject:newRecord forKey:[NSString stringWithFormat:@"%d", uniqueId]];
    uniqueId++;
}

-(void) selectRecord:(NSString *)recordID
{
    //selectedRecord = recordName;
    selectedRecord = recordID;
}

-(NSMutableDictionary*) getRecordForMonth:(int) month
{
    NSMutableDictionary *temp = [[self.log objectForKey:selectedRecord] objectAtIndex:month];
    return temp;
}

-(void) bodyViewUpdate:(NSString*) height: (NSString*) weight: (NSString*) heightP: (NSString*) weightP:(int) month
{
    if([weightSetting isEqualToString:@"Pound"]){
        double weightN = [weight doubleValue] * 0.453592;
        weight = [NSString stringWithFormat:@"%f", weightN];
    }
    
    
    if([heightSetting isEqualToString:@"Inch"]){
        double heightN = [weight doubleValue] * 2.54;
        height = [NSString stringWithFormat:@"%f", heightN];
    }
    [[[log objectForKey:selectedRecord] objectAtIndex:month] setObject:height forKey:@"height" ];
    [[[log objectForKey:selectedRecord] objectAtIndex:month] setObject:weight forKey:@"weight"];
    [[[log objectForKey:selectedRecord] objectAtIndex:month] setObject:heightP forKey:@"weightP"];
    [[[log objectForKey:selectedRecord] objectAtIndex:month] setObject:weightP forKey:@"heightP"];
}

-(NSString*) getSelectedRecordName
{
    return [[[log objectForKey:selectedRecord] objectAtIndex:0] objectForKey:@"name"];
}

@end
