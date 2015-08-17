//
//  ViewController.m
//  Smart4AviationDemo
//
//  Created by Diana Evlakhova on 8/16/15.
//  Copyright (c) 2015 Diana Evlakhova. All rights reserved.
//

#import "SAMainViewController.h"
#import "SAMainTableViewCell.h"
#import "SAVacanciesProvider.h"
#import "SAVacancy.h"
#import "SACompany.h"
#import "SAAppDataManager.h"
#import "SADetailsViewController.h"

@interface SAMainViewController () <UITableViewDelegate>

@property (nonatomic, strong) id<SAVacanciesProvider> vacanciesProvider;

@property (nonatomic, strong) NSMutableArray *vacancies;

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation SAMainViewController

- (void)awakeFromNib {
    _vacanciesProvider = [SAAppDataManager new];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.vacancies = [NSMutableArray new];
    
    [self.vacanciesProvider vacancies:^(NSArray *list) {
        [_vacancies addObjectsFromArray:list];
        NSMutableArray *indexPaths = [NSMutableArray new];
        for (int i = 0; i < list.count; i++) {
            [indexPaths addObject:[NSIndexPath indexPathForRow:i inSection:0]];
        }
        [self.tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationAutomatic];
        indexPaths = nil;
    } errorBlock:^(NSError *error) {
        NSLog(@"Error during loading vacancies");
    }];
}


#pragma mark - 
#pragma mark UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.vacancies.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SAMainTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([SAMainTableViewCell class])];
    SAVacancy *vacancy = [self.vacancies objectAtIndex:indexPath.row];
    cell.titleLabel.text = vacancy.title;
    cell.subTitleLabel.text = vacancy.company.name;
    cell.imageView.image = [UIImage imageNamed:@"default_thumbnail"];
    return cell;
}


#pragma mark - 
#pragma mark Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier  isEqual: @"ShowVacancyDetails"]) {
        SAVacancy *vacancy = self.vacancies[[self.tableView indexPathForCell:sender].row];
        [(SADetailsViewController *)segue.destinationViewController setVacancy:vacancy];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
