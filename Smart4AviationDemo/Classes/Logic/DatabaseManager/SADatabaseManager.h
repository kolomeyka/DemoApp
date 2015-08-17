//
//  SADatabaseManager.h
//  Smart4AviationDemo
//
//  Created by Diana Evlakhova on 8/16/15.
//  Copyright (c) 2015 Diana Evlakhova. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SADatabaseManager : NSObject

- (NSMutableArray *)getAllEntitiesWithPredicate:(NSPredicate *)predicate fromTable:(NSString *)table error:(NSError **)error;

@end
