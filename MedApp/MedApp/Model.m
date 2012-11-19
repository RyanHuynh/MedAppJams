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
    NSString *genderS, *idU;
    idU = [NSString stringWithFormat:@"%d", uniqueId];
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
                                            idU,@"id",
                                            @" ",@"weight",
                                            @" ",@"height",
                                            @" ",@"weightP",
                                            @" ",@"heightP",
                                            @" ",@"headP",
                                            @" ",@"head",
                                            @" ",@"icd",
                                            @" ",@"icdAvg",
                                            @" ",@"earLR",
                                            @" ",@"earLRAvg",
                                            @" ",@"earLL",
                                        
                                            @" ",@"pflL",
                                            @" ",@"pflAvg",
                                            @" ",@"pflR",
                                        
                                            @" ",@"neck",
                                            @" ",@"neckAvg",
                                            @" ",@"mouth",
                                            @" ",@"mouthAvg",
                                            @" ",@"philtrum",
                                            @" ",@"philtrumAvg",
                                            @" ",@"ipd",
                                            @" ",@"ipdAvg",
                                            @" ",@"ocd",
                                            @" ",@"ocdAvg",
                                            @" ",@"weightA",
                                            @" ",@"heightA",
                                            @" ",@"headA",
                                             @" ",@"fingerR",
                                            
                                            
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

-(void) bodyViewUpdate:(NSString*) height: (NSString*) weight: (NSString*) head: (NSString*) heightP: (NSString*) weightP: (NSString*) headP: (NSString*) heightA: (NSString*) weightA: (NSString*) headA: (int) month{
    
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
    [[[log objectForKey:loginID] objectAtIndex:month] setObject:heightA forKey:@"heightA"];
    [[[log objectForKey:loginID] objectAtIndex:month] setObject:headA forKey:@"headA" ];
    [[[log objectForKey:loginID] objectAtIndex:month] setObject:weightA forKey:@"weightA"];

   
}

-(NSString*) getSelectedRecordName
{
    return [[[log objectForKey:selectedRecord] objectAtIndex:0] objectForKey:@"name"];
}

-(void) headViewUpdate:(NSString*) icd: (NSString*) icdAvg: (NSString*) earLR: (NSString*) earLL: (NSString*) earLRAvg: (NSString*) pflR:(NSString*) pflL : (NSString*) pflAvg: (NSString*) neck: (NSString*) neckAvg: (NSString*) mouth: (NSString*) mouthAvg: (NSString*) philtrum: (NSString*)philtrumAvg: (NSString*) ipd: (NSString*) ipdAvg: (NSString*) ocd: (NSString*) ocdAvg: (int) month
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
            
            double pflRN = [pflR doubleValue] * 2.54;
            pflR = [NSString stringWithFormat:@"%f", pflRN];
            
            double pflLN = [pflL doubleValue] * 2.54;
            pflL = [NSString stringWithFormat:@"%f", pflLN];
            
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
            
            double mouthN = [mouth doubleValue] * 2.54;
            mouth = [NSString stringWithFormat:@"%f", mouthN];
            double mouthAvgN = [mouthAvg doubleValue] * 2.54;
            mouthAvg = [NSString stringWithFormat:@"%f", mouthAvgN];
            
            
            double neckN = [neck doubleValue] * 2.54;
            neck = [NSString stringWithFormat:@"%f", neckN];
            double neckAvgN = [neckAvg doubleValue] * 2.54;
            neckAvg = [NSString stringWithFormat:@"%f", neckAvgN];
        }
    [[[log objectForKey:loginID] objectAtIndex:month] setObject:icd forKey:@"icd" ];
    [[[log objectForKey:loginID] objectAtIndex:month] setObject:icdAvg forKey:@"icdAvg"];
    [[[log objectForKey:loginID] objectAtIndex:month] setObject:earLR forKey:@"earLR"];
    [[[log objectForKey:loginID] objectAtIndex:month] setObject:earLRAvg forKey:@"earLRAvg"];
    [[[log objectForKey:loginID] objectAtIndex:month] setObject:earLL forKey:@"earLL" ];

    [[[log objectForKey:loginID] objectAtIndex:month] setObject:pflR forKey:@"pflR" ];
    [[[log objectForKey:loginID] objectAtIndex:month] setObject:pflL forKey:@"pflL" ];
    [[[log objectForKey:loginID] objectAtIndex:month] setObject:pflAvg forKey:@"pflAvg"];
    [[[log objectForKey:loginID] objectAtIndex:month] setObject:philtrum forKey:@"philtrum"];
    [[[log objectForKey:loginID] objectAtIndex:month] setObject:philtrumAvg forKey:@"philtrumAvg"];
    [[[log objectForKey:loginID] objectAtIndex:month] setObject:ipd forKey:@"ipd" ];
    [[[log objectForKey:loginID] objectAtIndex:month] setObject:ipdAvg forKey:@"ipdAvg"];
    [[[log objectForKey:loginID] objectAtIndex:month] setObject:ocd forKey:@"ocd" ];
    [[[log objectForKey:loginID] objectAtIndex:month] setObject:ocdAvg forKey:@"ocdAvg"];
    
    [[[log objectForKey:loginID] objectAtIndex:month] setObject:mouth forKey:@"mouth" ];
        [[[log objectForKey:loginID] objectAtIndex:month] setObject:mouthAvg forKey:@"mouthAvg" ];
    [[[log objectForKey:loginID] objectAtIndex:month] setObject:neck forKey:@"neck"];
       [[[log objectForKey:loginID] objectAtIndex:month] setObject:neckAvg forKey:@"neckAvg"];

    
}

-(void) torsoViewUpdate:(NSString*) armR:(NSString*) armL:(NSString*) armAvg:(NSString*) upArmR:(NSString*) upArmL:(NSString*) upArmAvg:(NSString*) handR:(NSString*) handL:(NSString*) handAvg:(NSString*) fArmR:(NSString*) fArmL:(NSString*) fArmAvg:(NSString*) palmR:(NSString*) palmL:(NSString*) palmAvg:(NSString*) fingerR:(NSString*) fingerL:(NSString*) fingerAvg:(NSString*) ind:(NSString*) indAvg:(NSString*) chest:(NSString*) chestAvg:(NSString*) armSpan:(NSString*) armSpanAvg:(int) month
{
    if([heightSetting isEqualToString:@"Inch"]){
        
        double armRN = [armR doubleValue] * 2.54;
        armR = [NSString stringWithFormat:@"%f", armRN];
        
        double armLN = [armL doubleValue] * 2.54;
        armL = [NSString stringWithFormat:@"%f", armLN];
        
        double armAvgN = [armAvg doubleValue] * 2.54;
        armAvg = [NSString stringWithFormat:@"%f", armAvgN];
        
        
        double upArmRN = [upArmR doubleValue] * 2.54;
        upArmR = [NSString stringWithFormat:@"%f", upArmRN];
        
        double upArmLN = [upArmL doubleValue] * 2.54;
        upArmL = [NSString stringWithFormat:@"%f", upArmLN];
        
        double upArmAvgN = [upArmAvg doubleValue] * 2.54;
        upArmAvg = [NSString stringWithFormat:@"%f", upArmAvgN];
        
        
        double handRN = [handR doubleValue] * 2.54;
        handR = [NSString stringWithFormat:@"%f", handRN];
        
        double handLN = [handL doubleValue] * 2.54;
        handL = [NSString stringWithFormat:@"%f", handLN];
        
        double handAvgN = [handAvg doubleValue] * 2.54;
        handAvg = [NSString stringWithFormat:@"%f", handAvgN];
        
        
        double fArmRN = [fArmR doubleValue] * 2.54;
        fArmR = [NSString stringWithFormat:@"%f", fArmRN];
        
        double fArmLN = [fArmL doubleValue] * 2.54;
        fArmL = [NSString stringWithFormat:@"%f", fArmLN];
        
        double fArmAvgN = [fArmAvg doubleValue] * 2.54;
        fArmAvg = [NSString stringWithFormat:@"%f", fArmAvgN];
        
        
        double palmRN = [palmR doubleValue] * 2.54;
        palmR = [NSString stringWithFormat:@"%f", palmRN];
        
        double palmLN = [palmL doubleValue] * 2.54;
        palmL = [NSString stringWithFormat:@"%f", palmLN];
        
        double palmAvgN = [palmAvg doubleValue] * 2.54;
        palmAvg = [NSString stringWithFormat:@"%f", palmAvgN];
        
        
        double fingerRN = [fingerR doubleValue] * 2.54;
        fingerR = [NSString stringWithFormat:@"%f", fingerRN];
        
        double fingerLN = [fingerL doubleValue] * 2.54;
        fingerL = [NSString stringWithFormat:@"%f", fingerLN];
        
        double fingerAvgN = [fingerAvg doubleValue] * 2.54;
        fingerAvg = [NSString stringWithFormat:@"%f", fingerAvgN];
        
        
        double indN = [ind doubleValue] * 2.54;
        ind = [NSString stringWithFormat:@"%f", indN];
        
        double indAvgN = [indAvg doubleValue] * 2.54;
        indAvg = [NSString stringWithFormat:@"%f", indAvgN];
        
        
        double chestN = [chest doubleValue] * 2.54;
        chest = [NSString stringWithFormat:@"%f", chestN];
        
        double chestAvgN = [chestAvg doubleValue] * 2.54;
        chestAvg = [NSString stringWithFormat:@"%f", chestAvgN];
        
        
        double armSpanN = [armSpan doubleValue] * 2.54;
        armSpan = [NSString stringWithFormat:@"%f", armSpanN];
        
        double armSpanAvgN = [armSpanAvg doubleValue] * 2.54;
        armSpanAvg = [NSString stringWithFormat:@"%f", armSpanAvgN];
        
        
        
    }
    [[[log objectForKey:loginID] objectAtIndex:month] setObject:armR forKey:@"armR" ];
    [[[log objectForKey:loginID] objectAtIndex:month] setObject:armL forKey:@"armL" ];
    [[[log objectForKey:loginID] objectAtIndex:month] setObject:armAvg forKey:@"armAvg"];
    
    [[[log objectForKey:loginID] objectAtIndex:month] setObject:upArmR forKey:@"upArmR" ];
    [[[log objectForKey:loginID] objectAtIndex:month] setObject:upArmL forKey:@"upArmL" ];
    [[[log objectForKey:loginID] objectAtIndex:month] setObject:upArmAvg forKey:@"upArmAvg"];
    
    [[[log objectForKey:loginID] objectAtIndex:month] setObject:handR forKey:@"handR" ];
    [[[log objectForKey:loginID] objectAtIndex:month] setObject:handL forKey:@"handL" ];
    [[[log objectForKey:loginID] objectAtIndex:month] setObject:handAvg forKey:@"handAvg"];
    
    [[[log objectForKey:loginID] objectAtIndex:month] setObject:fArmR forKey:@"fArmR" ];
    [[[log objectForKey:loginID] objectAtIndex:month] setObject:fArmL forKey:@"fArmL" ];
    [[[log objectForKey:loginID] objectAtIndex:month] setObject:fArmAvg forKey:@"fArmAvg"];
    
    [[[log objectForKey:loginID] objectAtIndex:month] setObject:palmR forKey:@"palmR" ];
    [[[log objectForKey:loginID] objectAtIndex:month] setObject:palmL forKey:@"palmL" ];
    [[[log objectForKey:loginID] objectAtIndex:month] setObject:palmAvg forKey:@"palmAvg"];
    
    [[[log objectForKey:loginID] objectAtIndex:month] setObject:fingerR forKey:@"fingerR"];
    [[[log objectForKey:loginID] objectAtIndex:month] setObject:fingerL forKey:@"fingerL"];
    [[[log objectForKey:loginID] objectAtIndex:month] setObject:fingerAvg forKey:@"fingerAvg"];
    
    [[[log objectForKey:loginID] objectAtIndex:month] setObject:ind forKey:@"ind" ];
    [[[log objectForKey:loginID] objectAtIndex:month] setObject:indAvg forKey:@"indAvg"];
    
    [[[log objectForKey:loginID] objectAtIndex:month] setObject:chest forKey:@"chest" ];
    [[[log objectForKey:loginID] objectAtIndex:month] setObject:chestAvg forKey:@"chestAvg"];
    
    [[[log objectForKey:loginID] objectAtIndex:month] setObject:armSpan forKey:@"armSpan" ];
    [[[log objectForKey:loginID] objectAtIndex:month] setObject:armSpanAvg forKey:@"armSpanAvg"];
   

}

@end
