//
//  SADatabaseManager.m
//  Smart4AviationDemo
//
//  Created by Diana Evlakhova on 8/16/15.
//  Copyright (c) 2015 Diana Evlakhova. All rights reserved.
//

#import "SADatabaseManager.h"
#import <CoreData/CoreData.h>

@interface SADatabaseManager ()

@property (strong, nonatomic) NSManagedObjectModel         *managedObjectModel;
@property (strong, nonatomic) NSManagedObjectContext       *managedObjectContext;
@property (strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;


- (void)initManagedObjectModel;
- (void)initPersistentStoreCoordinator;
- (void)initManagedObjectContext;
- (void)saveContext;



@end

@implementation SADatabaseManager

- (id)init {
    if ((self = [super init]) != nil) {
        [self initManagedObjectModel];
        [self initPersistentStoreCoordinator];
        [self initManagedObjectContext];
    }
    
    return self;
}


#pragma mark - 
#pragma mark public

- (NSMutableArray *)getAllEntitiesWithPredicate:(NSPredicate *)predicate fromTable:(NSString *)table error:(NSError *__autoreleasing *)error {
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    
    [request setEntity:[NSEntityDescription entityForName:table inManagedObjectContext:_managedObjectContext]];
    [request setPredicate:predicate];
    
    NSMutableArray *entities = [[NSMutableArray alloc] initWithArray:[_managedObjectContext executeFetchRequest:request error:error]];
    
    if (*error != nil) {
        NSLog(@"Fetch request error: %@", [*error localizedDescription]);
    }
    
    return entities;
}

#pragma mark - 
#pragma mark private

- (void)saveContext {
    NSError *error = nil;
    
    if ([_managedObjectContext hasChanges] && ![_managedObjectContext save:&error]) {
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
}

- (void)initManagedObjectModel {
    NSURL *modelURL = [[NSBundle bundleForClass:[self class]] URLForResource:@"Smart4AviationDemo" withExtension:@"momd"] ;
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
}

- (void)initPersistentStoreCoordinator {
    NSString *storePath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"SADatabase.sqlite"];
    /*
     Set up the store.
     For the sake of illustration, provide a pre-populated default store.
     */
    NSFileManager *fileManager = [NSFileManager defaultManager];
    // If the expected store doesn't exist, copy the default store.
    
    if (![fileManager fileExistsAtPath:storePath]) {
        NSString *defaultStorePath = [[NSBundle mainBundle] pathForResource:@"SADatabase" ofType:@"sqlite"];
        if (defaultStorePath) {
            [fileManager copyItemAtPath:defaultStorePath toPath:storePath error:NULL];
        }
    }
    
    NSURL *storeUrl = [NSURL fileURLWithPath:storePath];
    
    NSError *error;
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel: _managedObjectModel];
    
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType
                                                   configuration:nil
                                                             URL:storeUrl
                                                         options:nil
                                                           error:&error]) {
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
    }
}

- (void)initManagedObjectContext {
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) {
        _managedObjectContext = [NSManagedObjectContext new];
        [_managedObjectContext setPersistentStoreCoordinator: coordinator];
    }
}

@end
