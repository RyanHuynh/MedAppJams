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
static double weightModifier;
static double heightModifier;
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
        weightSetting = @"(Kilogram)";
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
-(void) changeWeightModifier:(double) modifier
{
    weightModifier = modifier;
}

-(void) changeHeightModifier:(double) modifier
{
    heightModifier = modifier;
}

-(double) getWeightModifier
{
    return weightModifier;
}
-(double) getHeightModifier
{
    return heightModifier;
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
       NSMutableArray *newRecord = [NSMutableArray array];
    for(int i = 0; i < 13; i++)
    {
        NSMutableDictionary *monthRecord = [[NSMutableDictionary alloc]initWithObjectsAndKeys:
                                            newName,@"name",
                                            genderS,@"gender",
                                            @"",@"weight",
                                            @"",@"height",
                                            @"",@"weightP",
                                            @"",@"heightP",
                                            @"",@"headP",
                                            @"",@"head",
                                            @"",@"icd",
                                            @"",@"icdAvg",
                                            @"",@"earLR",
                                            @"",@"earLRAvg",
                                            @"",@"earLL",
                                            @"",@"earLLAvg",
                                            @"",@"pfl",
                                            @"",@"pflAvg",
                                            @"",@"neck",
                                            @"",@"neckAvg",
                                            @"",@"mouth",
                                            @"",@"mouthAvg",
                                            @"",@"philtrum",
                                            @"",@"philtrumAvg",
                                            @"",@"ipd",
                                            @"",@"ipdAvg",
                                            @"",@"ocd",
                                            @"",@"ocdAvg",
                                            nil];

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
-(void) setLogin:(NSString *)logInID
{
    logIn = YES;
    loginID = logInID;
}
-(void) setLogout
{
    logIn = NO;
    loginID = nil;
}

-(NSMutableDictionary*) getRecordForMonth:(int) month
{
    NSMutableDictionary *temp = [[self.log objectForKey:selectedRecord] objectAtIndex:month];
    return temp;
}

-(void) bodyViewUpdate:(NSString*) height: (NSString*) weight: (NSString*) head: (NSString*) heightP: (NSString*) weightP: (NSString*) headP:(int) month{
    
    if([weightSetting isEqualToString:@"Pound"]){
        double weightN = [weight doubleValue] * 0.453592;
        weight = [NSString stringWithFormat:@"%f", weightN];
    }
    if([heightSetting isEqualToString:@"Inch"]){
        double heightN = [weight doubleValue] * 2.54;
        height = [NSString stringWithFormat:@"%f", heightN];
        double headN = [head doubleValue] * 2.54;
        head = [NSString stringWithFormat:@"%f", headN];
    }
    [[[log objectForKey:loginID] objectAtIndex:month] setObject:height forKey:@"height" ];
    [[[log objectForKey:loginID] objectAtIndex:month] setObject:weight forKey:@"weight"];
    [[[log objectForKey:loginID] objectAtIndex:month] setObject:heightP forKey:@"weightP"];
    [[[log objectForKey:loginID] objectAtIndex:month] setObject:weightP forKey:@"heightP"];
    [[[log objectForKey:loginID] objectAtIndex:month] setObject:head forKey:@"head" ];
    [[[log objectForKey:loginID] objectAtIndex:month] setObject:headP forKey:@"headP"];

   
}

-(NSString*) getSelectedRecordName
{
    return [[[log objectForKey:selectedRecord] objectAtIndex:0] objectForKey:@"name"];
}

-(void) headViewUpdate:(NSString*) icd: (NSString*) icdAvg: (NSString*) earLR: (NSString*) earLRAvg: (NSString*) earLL: (NSString*) earLLAvg:(NSString*) pfl: (NSString*) pflAvg: (NSString*) neck: (NSString*) neackAvg: (NSString*) mouth: (NSString*) mouthAvg: (NSString*) philtrum: (NSString*)philtrumAvg: (NSString*) ipd: (NSString*) ipdAvg: (NSString*) ocd: (NSString*) ocdAvg: (int) month
{
        if([heightSetting isEqualToString:@"Inch"]){
        
            double icdN = [icd doubleValue] * 2.54;
            icd = [NSString stringWithFormat:@"%f", icdN];
            double icdAvgN = [icdAvg doubleValue] * 2.54;
            icdAvg = [NSString stringWithFormat:@"%f", icdAvgN];
            double earLRN = [earLR doubleValue] * 2.54;
            earLR = [NSString stringWithFormat:@"%f", earLRN];
            double earLRAvgN = [earLRAvg doubleValue] * 2.54;
            earLRAvg = [NSString stringWithFormat:@"%f", earLRAvgN];
            double earLLN = [earLL doubleValue] * 2.54;
            earLL = [NSString stringWithFormat:@"%f", earLLN];
            double earLLAvgN = [earLLAvg doubleValue] * 2.54;
            earLLAvg = [NSString stringWithFormat:@"%f", earLLAvgN];
            double pflN = [pfl doubleValue] * 2.54;
            pfl = [NSString stringWithFormat:@"%f", pflN];
            double pflAvgN = [pflAvg doubleValue] * 2.54;
            pflAvg = [NSString stringWithFormat:@"%f", pflAvgN];
            double philtrumN = [philtrum doubleValue] * 2.54;
            philtrum = [NSString stringWithFormat:@"%f", philtrumN];
            double philtrumAvgN = [philtrumAvg doubleValue] * 2.54;
            philtrumAvg = [NSString stringWithFormat:@"%f", philtrumAvgN];
            double ipdN = [ipd doubleValue] * 2.54;
            ipd = [NSString stringWithFormat:@"%f", ipdN];
            double ipdAvgN = [ipdAvg doubleValue] * 2.54;
            ipdAvg = [NSString stringWithFormat:@"%f", ipdAvgN];
            double ocdN = [ocd doubleValue] * 2.54;
            ocd = [NSString stringWithFormat:@"%f", ocdN];
            double ocdAvgN = [ocdAvg doubleValue] * 2.54;
            ocdAvg = [NSString stringWithFormat:@"%f", ocdAvgN];
        }
    [[[log objectForKey:loginID] objectAtIndex:month] setObject:icd forKey:@"icd" ];
    [[[log objectForKey:loginID] objectAtIndex:month] setObject:icdAvg forKey:@"icdAvg"];
    [[[log objectForKey:loginID] objectAtIndex:month] setObject:earLR forKey:@"earLR"];
    [[[log objectForKey:loginID] objectAtIndex:month] setObject:earLRAvg forKey:@"earLR"];
    [[[log objectForKey:loginID] objectAtIndex:month] setObject:earLL forKey:@"earLL" ];
    [[[log objectForKey:loginID] objectAtIndex:month] setObject:earLLAvg forKey:@"earLLAvg"];
    
    [[[log objectForKey:loginID] objectAtIndex:month] setObject:pfl forKey:@"pfl" ];
    [[[log objectForKey:loginID] objectAtIndex:month] setObject:pflAvg forKey:@"pflAvg"];
    [[[log objectForKey:loginID] objectAtIndex:month] setObject:philtrum forKey:@"philtrum"];
    [[[log objectForKey:loginID] objectAtIndex:month] setObject:philtrumAvg forKey:@"philtrumAvg"];
    [[[log objectForKey:loginID] objectAtIndex:month] setObject:ipd forKey:@"ipd" ];
    [[[log objectForKey:loginID] objectAtIndex:month] setObject:ipdAvg forKey:@"ipdAvg"];
    [[[log objectForKey:loginID] objectAtIndex:month] setObject:ocd forKey:@"ocd" ];
    [[[log objectForKey:loginID] objectAtIndex:month] setObject:ocdAvg forKey:@"ocdAvg"];

}

@end
