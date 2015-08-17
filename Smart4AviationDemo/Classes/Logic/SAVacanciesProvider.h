//
//  VacanciesProvider.h
//  Smart4AviationDemo
//
//  Created by Diana Evlakhova on 8/16/15.
//  Copyright (c) 2015 Diana Evlakhova. All rights reserved.
//


typedef void(^SACompletionListBlock)(NSArray * list);
typedef void(^SAErrorBlock)(NSError *error);

@protocol SAVacanciesProvider <NSObject>

- (void)vacancies:(SACompletionListBlock)completionBlock
       errorBlock:(SAErrorBlock)errorBlock;



@end

