//
//  CalciBrain.m
//  ForexCal
//
//  Created by Dharmendhar Pulakunta on 9/18/12.
//  Copyright (c) 2012 Dharmendhar Pulakunta. All rights reserved.
//

#import "CalciBrain.h"
@interface CalciBrain()
@property (nonatomic,strong) NSMutableArray *operandStack;
@end

@implementation CalciBrain
@synthesize operandStack=_operandStack;

-(NSMutableArray *)operandStack
{
    if (_operandStack == nil) _operandStack=[[NSMutableArray alloc] init ];
    return _operandStack;
}
-(double) popOperand{
    NSNumber *number = [self.operandStack lastObject ];
    if(number != nil) [self.operandStack removeLastObject];
    return [number doubleValue];
    
}
- (void) pushOperation:(double) operand{
    [self.operandStack addObject:[NSNumber numberWithDouble:operand]];
}

- (double) performOperation:(NSString *) operation{
    double result =0;
    if ([operation isEqualToString: @"+"])
        result = self.popOperand + self.popOperand;
    else if ([operation isEqualToString: @"*"])
        result = self.popOperand * self.popOperand;
    else if ([operation isEqualToString: @"/"])
        result = self.popOperand / self.popOperand;
    else if ([operation isEqualToString: @"-"])
        result = self.popOperand - self.popOperand;
    [self pushOperation:result];
    return result;
}
@end
