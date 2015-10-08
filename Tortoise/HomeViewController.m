//
//  ViewController.m
//  Tortoise
//
//  Created by Namit Nayak on 10/6/15.
//  Copyright © 2015 Namit Nayak. All rights reserved.
//

#import "HomeViewController.h"
#import "GoogleMaps.h"


@interface HomeViewController ()
{
    

}
@property (nonatomic,strong) NSMutableArray *dataArra;
@property (nonatomic,strong) IBOutlet UIView *mapContainerView;
@property (nonatomic,strong) IBOutlet UITableView * tableView;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    GoogleMaps * mapView =[[GoogleMaps alloc] initWithLatitude:0.0 longitude:0.0 zoom:6.0 frame:self.mapContainerView.frame];
    [self.mapContainerView addSubview:mapView];
    
    [self dummyData];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView;                                               // any offset changes
{
    
    
}



#pragma mark - UITableViewDataSource protocol methods
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArra.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *ident = @"cell";
    // re-use or create a cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ident forIndexPath:indexPath];
    // find the to-do item for this index
    NSDictionary *duck = [_dataArra objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [duck objectForKey:@"title"];
    cell.detailTextLabel.text = [duck objectForKey:@"description"];
    
    
    return cell;
}

#pragma mark - UITableViewDataDelegate protocol methods
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50.0f;
}


- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
    NSLog(@"%f",velocity.y);
    if(velocity.y>2){
     self.tableView.frame = CGRectMake(0,0,self.view.bounds.size.width, self.view.bounds.size.width);
        
    [UIView animateWithDuration:0.5 delay:0.4 options:UIViewAnimationOptionAllowAnimatedContent animations:^{

        
        self.topConstraint.constant = -20 + (self.view.frame.size.height/2);
        
        self.heightConstraint.constant = self.view.frame.size.height/2;

        [self.tableView layoutSubviews];

    } completion:^(BOOL finished) {
        
    }];
        
    }
    
}
#pragma Mark #

-(void)dummyData{
    
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:@"Paris",@"title",@"Paris has Effil Tower",@"description", nil];
    NSDictionary *dict1 = [[NSDictionary alloc] initWithObjectsAndKeys:@"Paris",@"title",@"Paris has Effil Tower",@"description", nil];
    NSDictionary *dict2 = [[NSDictionary alloc] initWithObjectsAndKeys:@"Paris",@"title",@"Paris has Effil Tower",@"description", nil];
    NSDictionary *dict3 = [[NSDictionary alloc] initWithObjectsAndKeys:@"Paris",@"title",@"Paris has Effil Tower",@"description", nil];
    NSDictionary *dict4 = [[NSDictionary alloc] initWithObjectsAndKeys:@"Paris",@"title",@"Paris has Effil Tower",@"description", nil];
    NSDictionary *dict33 = [[NSDictionary alloc] initWithObjectsAndKeys:@"Paris",@"title",@"Paris has Effil Tower",@"description", nil];
    NSDictionary *dict44 = [[NSDictionary alloc] initWithObjectsAndKeys:@"Paris",@"title",@"Paris has Effil Tower",@"description", nil];
    NSDictionary *dict333 = [[NSDictionary alloc] initWithObjectsAndKeys:@"Paris",@"title",@"Paris has Effil Tower",@"description", nil];
    NSDictionary *dict444 = [[NSDictionary alloc] initWithObjectsAndKeys:@"Paris",@"title",@"Paris has Effil Tower",@"description", nil];
    _dataArra = [NSMutableArray arrayWithObjects:dict,dict1,dict2,dict3,dict4,dict33,dict44,dict333,dict444, nil];
    
}
@end
