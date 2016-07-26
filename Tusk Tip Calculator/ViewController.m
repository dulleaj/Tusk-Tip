//
//  ViewController.m
//  Tusk Tip Calculator
//
//  Created by Andrew Dulle on 7/19/16.
//  Copyright © 2016 Andrew Dulle. All rights reserved.
//

#import "ViewController.h"
#import "Calculations.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIButton *button1;
@property (strong, nonatomic) IBOutlet UIButton *button2;
@property (strong, nonatomic) IBOutlet UIButton *button3;
@property (strong, nonatomic) IBOutlet UIButton *button4;
@property (strong, nonatomic) IBOutlet UIButton *button5;
@property (strong, nonatomic) IBOutlet UIButton *button6;
@property (strong, nonatomic) IBOutlet UIButton *button7;
@property (strong, nonatomic) IBOutlet UIButton *button8;
@property (strong, nonatomic) IBOutlet UIButton *button9;
@property (strong, nonatomic) IBOutlet UIButton *button0;
@property (strong, nonatomic) IBOutlet UIButton *decimalButton;
@property (strong, nonatomic) IBOutlet UIButton *deleteButton;
@property (strong, nonatomic) IBOutlet UITextView *userTextInput;
@property (strong, nonatomic) IBOutlet UIStepper *personCountStepper;
@property (strong, nonatomic) IBOutlet UISlider *tipSlider;
@property (strong, nonatomic) IBOutlet UILabel *tipSliderLabel;
@property (strong, nonatomic) IBOutlet UILabel *totalTipLabel;
@property (strong, nonatomic) IBOutlet UILabel *costPerPersonLabel;
@property int totalDigitsInTextInput;
@property Calculations* query;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.query = [[Calculations alloc] init];
    self.userTextInput.text = @"0";
    self.tipSliderLabel.text = [self.query tipPercentLabel:self.tipSlider.value];
    [self updateTipLabelAndCostPerPersonLabel];
}

- (IBAction)sliderValueChanged:(UISlider *)sender {

    self.tipSliderLabel.text = [self.query tipPercentLabel:self.tipSlider.value];
    [self updateTipLabelAndCostPerPersonLabel];
}

- (IBAction)stepperValueChanged:(id)sender {
    
    self.costPerPersonLabel.text = [self.query tipPerPersonLabelIs:[self.query tipCalculation:self.userTextInput.text multipliedBy:self.tipSlider.value] splitBetween:self.personCountStepper.value];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)button1WasPressed:(id)sender {
    
    [self removeZero];
    self.totalDigitsInTextInput += 1;
    self.userTextInput.text = [self.userTextInput.text stringByAppendingString: @"1"];
    [self updateTipLabelAndCostPerPersonLabel];}

- (IBAction)button2WasPressed:(id)sender {
    
    [self removeZero];
    self.totalDigitsInTextInput += 1;
    self.userTextInput.text = [self.userTextInput.text stringByAppendingString: @"2"];
    [self updateTipLabelAndCostPerPersonLabel];
}

- (IBAction)button3WasPressed:(id)sender {
    
    [self removeZero];
    self.totalDigitsInTextInput += 1;
    self.userTextInput.text = [self.userTextInput.text stringByAppendingString: @"3"];
    [self updateTipLabelAndCostPerPersonLabel];
}

- (IBAction)button4WasPressed:(id)sender {
    
    [self removeZero];
    self.totalDigitsInTextInput += 1;
    self.userTextInput.text = [self.userTextInput.text stringByAppendingString: @"4"];
    [self updateTipLabelAndCostPerPersonLabel];
}

- (IBAction)button5WasPressed:(id)sender {
    
    [self removeZero];
    self.totalDigitsInTextInput += 1;
    self.userTextInput.text = [self.userTextInput.text stringByAppendingString: @"5"];
    [self updateTipLabelAndCostPerPersonLabel];
}

- (IBAction)button6WasPressed:(id)sender {
    
    [self removeZero];
    self.totalDigitsInTextInput += 1;
    self.userTextInput.text = [self.userTextInput.text stringByAppendingString: @"6"];
    [self updateTipLabelAndCostPerPersonLabel];
}

- (IBAction)button7WasPressed:(id)sender {
    
    [self removeZero];
    self.totalDigitsInTextInput += 1;
    self.userTextInput.text = [self.userTextInput.text stringByAppendingString: @"7"];
    [self updateTipLabelAndCostPerPersonLabel];
}

- (IBAction)button8WasPressed:(id)sender {
    
    [self removeZero];
    self.totalDigitsInTextInput += 1;
    self.userTextInput.text = [self.userTextInput.text stringByAppendingString: @"8"];
    [self updateTipLabelAndCostPerPersonLabel];
}

- (IBAction)button9WasPressed:(id)sender {
    
    [self removeZero];
    self.totalDigitsInTextInput += 1;
    self.userTextInput.text = [self.userTextInput.text stringByAppendingString: @"9"];
    [self updateTipLabelAndCostPerPersonLabel];
}

- (IBAction)button0WasPressed:(id)sender {
    
    if ([self.userTextInput.text isEqualToString:@"0"]) {
        self.userTextInput.text = @"0";
    }else{
        self.totalDigitsInTextInput += 1;
        self.userTextInput.text = [self.userTextInput.text stringByAppendingString: @"0"];
    }
    
    [self updateTipLabelAndCostPerPersonLabel];
}

- (IBAction)decimalButtonWasPressed:(id)sender {
    
    if ([self.userTextInput.text containsString:@"."]){
        self.userTextInput.text = self.userTextInput.text;
    }else{
        self.totalDigitsInTextInput += 1;
        self.userTextInput.text = [self.userTextInput.text stringByAppendingString: @"."];
    }
    
    [self updateTipLabelAndCostPerPersonLabel];
}

- (IBAction)deleteButtonWasPressed:(id)sender {
    
    if (self.totalDigitsInTextInput >= 1) {
        self.userTextInput.text = [self deleteCharacterAtPosition:self.totalDigitsInTextInput inString:self.userTextInput.text];
        
        self.totalDigitsInTextInput -= 1;
    }
    
    [self updateTipLabelAndCostPerPersonLabel];
}

//Method for deleting
- (NSString*)deleteCharacterAtPosition:(int)position inString:(NSString*)myString {
    
    NSLog(@"digits: %d",self.totalDigitsInTextInput);
    
    if([self.userTextInput.text containsString:@"0."]){
        if (position > 1) {
            NSRange range;
            range.location = position;
            range.length = 1;
            return [self.userTextInput.text stringByReplacingCharactersInRange:range withString:@""];
        }
    }else{
        if (position > 1) {
            NSRange range;
            range.location = position - 1;
            range.length = 1;
            return [self.userTextInput.text stringByReplacingCharactersInRange:range withString:@""];
        }else if (position == 1){
            NSRange range;
            range.location = position - 1;
            range.length = 1;
            return [self.userTextInput.text stringByReplacingCharactersInRange:range withString:@"0"];
        }else{
            return @"Error";
        }
    }
    return @"0";
    
}

//Remove 0 at beginning of userText string if it's still there
- (void)removeZero{
    if ([self.userTextInput.text isEqualToString:@"0"]){
        self.userTextInput.text = nil;
    }
}

//Update the Tip Total label and the Cost Per Person label
- (void)updateTipLabelAndCostPerPersonLabel{

    self.totalTipLabel.text = [NSString stringWithFormat: @"Tip Total: %@",[self.query tipCalculation:self.userTextInput.text multipliedBy:self.tipSlider.value]];
    
    self.costPerPersonLabel.text = [self.query tipPerPersonLabelIs:[self.query tipCalculation:self.userTextInput.text multipliedBy:self.tipSlider.value] splitBetween:self.personCountStepper.value];

}

//*****Getting +infinity and NaN - something is wrong with formular for calculating cost per person

@end
