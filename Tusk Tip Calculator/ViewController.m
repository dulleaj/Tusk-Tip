//
//  ViewController.m
//  Tusk Tip Calculator
//
//  Created by Andrew Dulle on 7/19/16.
//  Copyright © 2016 Andrew Dulle. All rights reserved.
//

#import "ViewController.h"

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
@property (strong, nonatomic) IBOutlet UILabel *totalTipLabel;
@property (strong, nonatomic) IBOutlet UILabel *costPerPersonLabel;
@property (strong, nonatomic) IBOutlet UILabel *tipPercentageLabel;
@property int totalDigitsInTextInput;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.userTextInput.text = @"0";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)button1WasPressed:(id)sender {
    
    [self removeZero];
    self.totalDigitsInTextInput += 1;
    self.userTextInput.text = [self.userTextInput.text stringByAppendingString: @"1"];
}

- (IBAction)button2WasPressed:(id)sender {
    
    [self removeZero];
    self.totalDigitsInTextInput += 1;
    self.userTextInput.text = [self.userTextInput.text stringByAppendingString: @"2"];
}

- (IBAction)button3WasPressed:(id)sender {
    
    [self removeZero];
    self.totalDigitsInTextInput += 1;
    self.userTextInput.text = [self.userTextInput.text stringByAppendingString: @"3"];
}

- (IBAction)button4WasPressed:(id)sender {
    
    [self removeZero];
    self.totalDigitsInTextInput += 1;
    self.userTextInput.text = [self.userTextInput.text stringByAppendingString: @"4"];
}

- (IBAction)button5WasPressed:(id)sender {
    
    [self removeZero];
    self.totalDigitsInTextInput += 1;
    self.userTextInput.text = [self.userTextInput.text stringByAppendingString: @"5"];
}

- (IBAction)button6WasPressed:(id)sender {
    
    [self removeZero];
    self.totalDigitsInTextInput += 1;
    self.userTextInput.text = [self.userTextInput.text stringByAppendingString: @"6"];
}

- (IBAction)button7WasPressed:(id)sender {
    
    [self removeZero];
    self.totalDigitsInTextInput += 1;
    self.userTextInput.text = [self.userTextInput.text stringByAppendingString: @"7"];
}

- (IBAction)button8WasPressed:(id)sender {
    
    [self removeZero];
    self.totalDigitsInTextInput += 1;
    self.userTextInput.text = [self.userTextInput.text stringByAppendingString: @"8"];
}

- (IBAction)button9WasPressed:(id)sender {
    
    [self removeZero];
    self.totalDigitsInTextInput += 1;
    self.userTextInput.text = [self.userTextInput.text stringByAppendingString: @"9"];
}

- (IBAction)button0WasPressed:(id)sender {
    
    if ([self.userTextInput.text isEqualToString:@"0"]) {
        self.userTextInput.text = @"0";
    }else{
        self.totalDigitsInTextInput += 1;
        self.userTextInput.text = [self.userTextInput.text stringByAppendingString: @"0"];
    }
}

- (IBAction)decimalButtonWasPressed:(id)sender {
    
    if ([self.userTextInput.text containsString:@"."]){
        self.userTextInput.text = self.userTextInput.text;
    }else{
        self.totalDigitsInTextInput += 1;
        self.userTextInput.text = [self.userTextInput.text stringByAppendingString: @"."];
    }
}

- (IBAction)deleteButtonWasPressed:(id)sender {
    
    if (self.totalDigitsInTextInput >= 1) {
        self.userTextInput.text = [self deleteCharacterAtPosition:self.totalDigitsInTextInput inString:self.userTextInput.text];
        
        self.totalDigitsInTextInput -= 1;
    }
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
            return @"No decimal, digits <= 0";
        }
    }
    NSLog(@"YOU REACHED END OF METHOD");
    return @"0";
    
}

- (void)removeZero{
    if ([self.userTextInput.text isEqualToString:@"0"]){
        self.userTextInput.text = nil;
    }
}



@end
