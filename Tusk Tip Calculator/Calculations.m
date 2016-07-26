//
//  Calculations.m
//  Tusk Tip Calculator
//
//  Created by Andrew Dulle on 7/23/16.
//  Copyright © 2016 Andrew Dulle. All rights reserved.
//

#import "Calculations.h"

@implementation Calculations

//Calculates tip
- (NSString*)tipCalculation:(NSString *)textInput multipliedBy:(float)tipPercent {
    
    self.convertedTextInput = [textInput floatValue];
    
    self.convertedTextInput = self.convertedTextInput * (tipPercent/100);
    
    return [self adjustedDecimalFor:self.convertedTextInput with:2];
}

//Sets label that displays what the tip percentage itself is
- (NSString*)tipPercentLabel: (float)percentage{

    NSString* tipPercentString = [NSString stringWithFormat:@"%@%% Tip",[self adjustedDecimalFor:percentage with:2]];
    return tipPercentString;
}

//Calculates what the tip cost per person is
- (NSString*)tipPerPersonLabelIs:(NSString*)dollars splitBetween:(float)people {
    
    float dollarValue = [dollars floatValue];
    float costPerPerson = dollarValue/people;

    int headCount = (int)ceil(people);
    
    return [NSString stringWithFormat:@"For %d people: $%@ each.",headCount,[self adjustedDecimalFor:costPerPerson with:2]];
    
}

//Reduces floats to X decimals
- (NSString*)adjustedDecimalFor:(float)number with:(int)digits {
    
    NSNumberFormatter* decimalAdjuster = [[NSNumberFormatter alloc] init];
    decimalAdjuster.numberStyle = NSNumberFormatterDecimalStyle;
    decimalAdjuster.maximumFractionDigits = digits;
    
    NSNumber* revisedNumber = [NSNumber numberWithFloat:number];
    
    return [decimalAdjuster stringFromNumber:revisedNumber];
}

@end
