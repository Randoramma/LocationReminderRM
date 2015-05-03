//
//  Stack.m
//  RM LocationReminder
//
//  Created by Randy McLain on 4/27/15.
//  Copyright (c) 2015 Randy McLain. All rights reserved.
//  borrowed format from codeproject.com (Cloud Hsu)

#import "Stack.h"

@implementation Stack

-(id)init {
  if (self = [super init]) {
    theStack = [[NSMutableArray alloc] init];
    
  }
  return self;
}

-(void) push:(id)theObject {

  [self addObject:theObject];
}

- (id)pop {

  id lastObject = [self lastObject];
  
  if (lastObject) {
    [self removeLastObject];
    return lastObject;
  } else {
    return nil;
  }
}

-(void)clear {
  
  [theStack removeAllObjects];
  
}

@end
