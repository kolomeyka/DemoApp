//
//  SACompany.h
//  Smart4AviationDemo
//
//  Created by Diana Evlakhova on 8/16/15.
//  Copyright (c) 2015 Diana Evlakhova. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class SAVacancy;

@interface SACompany : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) SAVacancy *careers;

@end
