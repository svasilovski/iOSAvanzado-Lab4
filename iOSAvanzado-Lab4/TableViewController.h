//
//  TableViewController.h
//  iOSAvanzado-Lab4
//
//  Created by Samuel Vasilovski on 18/11/18.
//  Copyright © 2018 SAMUEL VASILOVSKI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Servicios/model/Product.h"

NS_ASSUME_NONNULL_BEGIN

@interface TableViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) NSMutableArray<Product*>* products;

-(void)reloadTable;

@end

NS_ASSUME_NONNULL_END
