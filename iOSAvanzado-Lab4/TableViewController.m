//
//  TableViewController.m
//  iOSAvanzado-Lab4
//
//  Created by Samuel Vasilovski on 18/11/18.
//  Copyright © 2018 SAMUEL VASILOVSKI. All rights reserved.
//

#import "TableViewController.h"
#import "TableViewCell.h"

@interface TableViewController ()
@property (strong, nonatomic) IBOutlet UITableView *tableViwe;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.products count];
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    TableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"ProductCell" forIndexPath:indexPath];
    
    if (!cell)
        cell = [TableViewCell new];
    Product* product = self.products[indexPath.row];
    cell.productNameLabel.text = product.name.capitalizedString;
    cell.productCountLabel.text = product.price.stringValue;
    [cell setProductImage:product.image];
    return cell;
}

-(void)reloadTable{
    [self.tableViwe reloadData];
}

@end
