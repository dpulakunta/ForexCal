//
//  CalciBrain.h
//  ForexCal
//
//  Created by Dharmendhar Pulakunta on 9/18/12.
//  Copyright (c) 2012 Dharmendhar Pulakunta. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalciBrain : NSObject
- (void) pushOperation:(double) operand;
- (double) performOperation:(NSString *) operation;

@end
