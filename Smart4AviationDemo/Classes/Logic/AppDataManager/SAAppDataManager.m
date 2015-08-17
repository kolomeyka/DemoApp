//
//  SAAppDataManager.m
//  Smart4AviationDemo
//
//  Created by Diana Evlakhova on 8/16/15.
//  Copyright (c) 2015 Diana Evlakhova. All rights reserved.
//

#import "SAAppDataManager.h"
#import "SADatabaseManager.h"

@interface SAAppDataManager ()

@property (nonatomic, strong) SADatabaseManager *databaseManager;

@end

@implementation SAAppDataManager

- (id)init {
    self = [super self];
    if (self) {
        _databaseManager = [SADatabaseManager new];
    }
    return self;
}

#pragma mark - 
#pragma mark SAVacanciesProvider

- (void)vacancies:(SACompletionListBlock)completionBlock errorBlock:(SAErrorBlock)errorBlock {
    NSError *error;
    NSArray *array = [self.databaseManager getAllEntitiesWithPredicate:nil fromTable:@"Vacancy" error:&error];
    if (error != nil) {
        errorBlock(error);
    } else {
        completionBlock(array);
    }
}

@end
