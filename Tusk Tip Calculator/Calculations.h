//
//  Calculations.h
//  Tusk Tip Calculator
//
//  Created by Andrew Dulle on 7/23/16.
//  Copyright © 2016 Andrew Dulle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Calculations : NSObject

@property float convertedTextInput;

- (NSString*)tipCalculation: (NSString*)textInput multipliedBy:(float)tipPercent;
- (NSString*)tipPercentLabel: (float) percentage;
- (NSString*)tipPerPersonLabelIs: (NSString*)dollars splitBetween: (float)people;
- (NSString*)adjustedDecimalFor: (float)number with: (int)digits;

@end
