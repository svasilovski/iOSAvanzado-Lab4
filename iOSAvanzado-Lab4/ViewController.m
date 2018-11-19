//
//  ViewController.m
//  iOSAvanzado-Lab4
//
//  Created by Samuel Vasilovski on 18/11/18.
//  Copyright © 2018 SAMUEL VASILOVSKI. All rights reserved.
//

#import "ViewController.h"
#import "Servicios/ProductServices.h"
#import "Servicios/model/Product.h"
#import "Servicios/WebImageOperations.h"
#import "TableViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (weak, nonatomic) TableViewController* tableViewController;
@end

@implementation ViewController

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

@end
