//
//  SAVacancy.h
//  Smart4AviationDemo
//
//  Created by Diana Evlakhova on 8/16/15.
//  Copyright (c) 2015 Diana Evlakhova. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class SACompany;

@interface SAVacancy : NSManagedObject

@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * vacancyDescription;
@property (nonatomic, retain) SACompany *company;

@end
