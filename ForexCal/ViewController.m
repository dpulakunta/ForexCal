//
//  ViewController.m
//  ForexCal
//
//  Created by Dharmendhar Pulakunta on 9/14/12.
//  Copyright (c) 2012 Dharmendhar Pulakunta. All rights reserved.
//

#import "ViewController.h"
#import "CalciBrain.h"
@interface ViewController ()
@property (nonatomic) BOOL userInTheMiddleofEnteringDigit;
@property (nonatomic,strong) CalciBrain *brain;
@end

@implementation ViewController

@synthesize display = _display;
@synthesize brain = _brain;
@synthesize userInTheMiddleofEnteringDigit = _userInTheMiddleofEnteringDigit;

-(CalciBrain *)brain {
    if (!_brain) _brain=[[CalciBrain alloc]init];
    return _brain;
}
- (IBAction)digitPressed:(UIButton *)sender {
    NSString *digit = [sender currentTitle];
   /* NSLog (@"Key Pressed is:%@",digit);
    UILabel *myDisplay = self.display;
    NSString *currentDigit = myDisplay.text;
    myDisplay.text = [currentDigit stringByAppendingString:digit];
    */
if(self.userInTheMiddleofEnteringDigit) {
    self.display.text = [self.display.text stringByAppendingString:digit];
} else{
    self.display.text = digit;
    self.userInTheMiddleofEnteringDigit = YES;
}
}
- (IBAction)operationPressed:(UIButton *)sender {
    double result=[self.brain performOperation:sender.currentTitle];
    NSString* resultString = [NSString stringWithFormat:@"%g",result];
    self.display.text = resultString;
}

- (IBAction)currencySelected:(id)sender {
}
- (IBAction)enterPressed {
    
    [self.brain pushOperation:[self.display.text doubleValue]];
    self.userInTheMiddleofEnteringDigit = NO;
}

@end
