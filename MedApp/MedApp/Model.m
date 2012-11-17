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
			[[self alloc] init];
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
                                        nil];
    NSMutableArray *newRecord = [NSMutableArray array];
    for(int i = 0; i < 12; i++)
    {
        [newRecord addObject:monthRecord];
    }
    [log setObject:newRecord forKey:[NSString stringWithFormat:@"%d", uniqueId]];
    uniqueId++;
}

-(void) selectRecord:(NSString *)recordName
{
    selectedRecord = recordName;
}

-(NSMutableArray*) getRecordForMonth:(int) month
{
   
    return [[self.log objectForKey:selectedRecord] objectForKey:[NSString stringWithFormat:@"%d", month]];
}
@end
