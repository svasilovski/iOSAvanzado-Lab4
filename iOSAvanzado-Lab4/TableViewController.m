//
//  TableViewController.m
//  iOSAvanzado-Lab4
//
//  Created by Samuel Vasilovski on 18/11/18.
//  Copyright © 2018 SAMUEL VASILOVSKI. All rights reserved.
//

#import "TableViewController.h"
#import "TableViewCell.h"
#import "Servicios/ProductServices.h"
#import "Servicios/model/Product.h"
#import "Servicios/WebImageOperations.h"
#import "TableViewController.h"

@interface TableViewController ()
@property (strong, nonatomic) IBOutlet UITableView *tableViwe;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (weak, nonatomic) TableViewController* tableViewController;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.activityIndicator setHidden:YES];
}

- (IBAction)recargarTapped:(id)sender {
    [self.tableViewController.products removeAllObjects];
    [self.tableViewController reloadTable];
    
    [self reloadFromService];
}

- (void)reloadFromService {
    [self.activityIndicator setHidden:NO];
    
    [ProductServices getProductsOnCompletion:^(id response, ServiceError *error)
     {
         if (response) {
             [self.tableViewController reloadTable];
             self.tableViewController.products = (NSMutableArray<Product*>*) response;
             [self.activityIndicator setHidden:YES];
         }
         if (error){
             NSLog(@"%@", error.reason);
         }
     }];
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
