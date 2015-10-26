//
//  PageContentViewController.m
//  SAiMM_lab1
//
//  Created by Valeryia Breshko on 9/6/15.
//  Copyright (c) 2015 Valeria Breshko. All rights reserved.
//

#import "PageContentViewController.h"

@implementation PageContentViewController

NSMutableArray* numbers;

-(id)init{
    //self.titleLabel.text = @"Lemer";
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    if ([_distributionName isEqualToString:@"Uniform"] ) {
        self.title = @"Uniform distribution";
        _label1.text = @"a:";
        _label2.text = @"b:";
    } else if ([_distributionName isEqualToString:@"Gauss"] ){
        self.title = @"Gauss distribution";
        _label1.text = @"Mx:";
        _label2.text = @"Sigm:";
    } else if ([_distributionName isEqualToString:@"Exponential"]){
        self.title = @"Exponential distribution";
        _label1.hidden = YES;
        _text1.hidden = YES;
        _label2.text = @"lambda:";
    } else if ([_distributionName isEqualToString:@"Gamma"]){
        self.title = @"Gamma distribution";
        _label1.text = @"nu:";
        _label2.text = @"lambda:";
    }
    else if ([_distributionName isEqualToString:@"Triangular"]){
        self.title = @"Triangular distribution";
        _label1.text = @"a:";
        _label2.text = @"b:";
    }else if ([_distributionName isEqualToString:@"Simpson"]){
        self.title = @"Simpson distribution";
        _label1.text = @"a:";
        _label2.text = @"b:";
    }


//   numbers = [LemerProducer generateSequenceA:CONST_A m:CONST_M Rp:CONST_Rp];

//    NSLog(@"expected: %f",[Estimations calculateExpectedValue:numbers]);
//    NSLog(@"dispersion: %f",[Estimations calculateDispersion:numbers]);
//    NSLog(@"standard deviation: %f",[Estimations calculateStandardDeviation:numbers]);
//    NSLog(@"uniformity: %f pi/4: %f",[Estimations checkUniformity:numbers], M_PI_4);

//    [self prepareBarChartWithName: @"Lemer random"];
//    [self buildHistogram:numbers :20 from:0 to:1];

}

- (IBAction)buttonBuildGraphc:(UIButton *)sender
{
    if ([_distributionName isEqualToString:@"Uniform"] ) {
        if (![_text1.text isEqualToString:@""] && ![_text2.text isEqualToString:@""]){
            double a = [_text1.text doubleValue];
            double b = [_text2.text doubleValue];
            numbers = [UniformDistribution generateSequenceWithRandomNumbers:_randomNumbers :a  :b];
            [self prepareBarChartWithName: @"Uniform distribution"];
            [self buildHistogram:numbers :INTERVAL_NUMBER from:(int)a  to:(int)b];
        }
    } else if ([_distributionName isEqualToString:@"Gauss"] ){
        if (![_text1.text isEqualToString:@""] && ![_text2.text isEqualToString:@""]){
            numbers = [GaussDistribution generateSequenceWithRandomNumbers:_randomNumbers :[_text1.text doubleValue]  :[_text2.text doubleValue]];
            [self prepareBarChartWithName: @"Gauss distribution"];
            [self buildHistogram:numbers :INTERVAL_NUMBER from:[[numbers valueForKeyPath:@"@min.intValue"] doubleValue]  to:[[numbers valueForKeyPath:@"@max.intValue"] doubleValue]];
        }
    } else if ([_distributionName isEqualToString:@"Exponential"]){
        if (![_text2.text isEqualToString:@""]){
            numbers = [ExponentialDistribution generateSequenceWithRandomNumbers:_randomNumbers :[_text2.text doubleValue]];
            [self prepareBarChartWithName: @"Exponential distribution"];
            [self buildHistogram:numbers :INTERVAL_NUMBER from:0  to:1];
        }
    } else if ([_distributionName isEqualToString:@"Gamma"]){
        if (![_text1.text isEqualToString:@""] && ![_text2.text isEqualToString:@""]){
            numbers = [GammaDistribution generateSequenceWithRandomNumbers:_randomNumbers :[_text1.text doubleValue]  :[_text2.text doubleValue]];
            [self prepareBarChartWithName: @"Gamma distribution"];
            [self buildHistogram:numbers :INTERVAL_NUMBER from:[[numbers valueForKeyPath:@"@min.intValue"] doubleValue]  to:[[numbers valueForKeyPath:@"@max.intValue"] doubleValue]];
        }
    } else if ([_distributionName isEqualToString:@"Triangular"]){
        if (![_text1.text isEqualToString:@""] && ![_text2.text isEqualToString:@""]){
            numbers = [TriangularDistribution generateSequenceWithRandomNumbers:_randomNumbers :[_text1.text doubleValue]  :[_text2.text doubleValue]];
            [self prepareBarChartWithName: @"Triangular distribution"];
            [self buildHistogram:numbers :INTERVAL_NUMBER from:[_text1.text doubleValue]  to:[_text2.text doubleValue]];
        }
    }
    else if ([_distributionName isEqualToString:@"Simpson"]){
        if (![_text1.text isEqualToString:@""] && ![_text2.text isEqualToString:@""]){
            numbers = [SimpsonDistribution generateSequenceWithRandomNumbers:_randomNumbers :[_text1.text doubleValue]  :[_text2.text doubleValue]];
            [self prepareBarChartWithName: @"Simpson distribution"];
            [self buildHistogram:numbers :INTERVAL_NUMBER from:[_text1.text doubleValue]  to:[_text2.text doubleValue]];
        }
    }

    _estimations.text = @"";

    _estimations.text = [NSString stringWithFormat:
                          @" expected: %f \n dispersion: %f \n standard deviation: %f ",
                         [Estimations calculateExpectedValue:numbers],
                         [Estimations calculateDispersion:numbers],
                         [Estimations calculateStandardDeviation:numbers]];

}

- (void)buildHistogram: (NSMutableArray*) numbers : (int)intervalsNumber from: (double)begin to: (double)end{
    double intervalEnds[intervalsNumber];
    int frequencies[intervalsNumber];
    memset(frequencies, 0, intervalsNumber*sizeof(int));

    double intervalSize = (end - begin) / intervalsNumber;
    for (int i = 0; i < intervalsNumber; i++)
    {
        intervalEnds[i] = begin + intervalSize;
        begin = intervalEnds[i];
    }

    for (NSNumber* number in numbers)
    {
        for (int i = 0; i < intervalsNumber; i++)
        {
            if (i == 0)
            {
                if (number.doubleValue <= intervalEnds[i]) {
                    frequencies[i]++;
                }
            } else {
                if (number.doubleValue <= intervalEnds[i] &&
                        number.doubleValue > intervalEnds[i - 1]) {
                    frequencies[i]++;
                }
            }
        }
    }

    NSMutableArray *xVals = [[NSMutableArray alloc] init];
    for (int i = 0; i < intervalsNumber; i++)
    {
        [xVals addObject:[NSNumber numberWithInt:i]];
    }

    NSMutableArray *yVals = [[NSMutableArray alloc] init];
    for (int i = 0; i < intervalsNumber; i++)
    {
        [yVals addObject:[[BarChartDataEntry alloc] initWithValue:(double)frequencies[i]/(double)numbers.count xIndex:i]];
    }

    NSLog(@"%@", yVals);

    BarChartDataSet *set1 = [[BarChartDataSet alloc] initWithYVals:yVals label:@"DataSet"];
    set1.barSpace = 0.1;

    NSMutableArray *dataSets = [[NSMutableArray alloc] init];
    [dataSets addObject:set1];

    BarChartData *data = [[BarChartData alloc] initWithXVals:xVals dataSets:dataSets];
    [data setValueFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:15.f]];

    _chartView.data = data;

}

- (void)prepareBarChartWithName: (NSString*) name{
    self.title = @"Bar Chart";

    _chartView.delegate = self;

    _chartView.descriptionText = name;
    _chartView.noDataTextDescription = @"You need to provide data for the chart.";
    _chartView.descriptionTextColor = [UIColor blackColor];
    _chartView.drawBarShadowEnabled = NO;
    _chartView.drawValueAboveBarEnabled = YES;
    _chartView.valueFormatter.maximumSignificantDigits = 3;

    _chartView.maxVisibleValueCount = 60;
    _chartView.pinchZoomEnabled = NO;
    _chartView.drawGridBackgroundEnabled = NO;

    ChartXAxis *xAxis = _chartView.xAxis;
    xAxis.labelPosition = XAxisLabelPositionBottom;
    xAxis.labelFont = [UIFont systemFontOfSize:0.f];
    xAxis.drawGridLinesEnabled = NO;
    xAxis.spaceBetweenLabels = 0.1;


    ChartYAxis *leftAxis = _chartView.leftAxis;
    leftAxis.labelFont = [UIFont systemFontOfSize:15.f];
    leftAxis.drawGridLinesEnabled = NO;
    leftAxis.labelCount = 0;
    leftAxis.valueFormatter = [[NSNumberFormatter alloc] init];
    leftAxis.valueFormatter.maximumSignificantDigits = 3;
    leftAxis.labelPosition = YAxisLabelPositionOutsideChart;
    leftAxis.spaceTop = 0.15;

    ChartYAxis *rightAxis = _chartView.rightAxis;
    rightAxis.drawGridLinesEnabled = NO;
    rightAxis.labelFont = [UIFont systemFontOfSize:15.f];
    rightAxis.labelCount = 0;
    rightAxis.valueFormatter = leftAxis.valueFormatter;
    rightAxis.spaceTop = 0.15;

    _chartView.legend.position = ChartLegendPositionBelowChartLeft;
    _chartView.legend.form = ChartLegendFormCircle;
    _chartView.legend.formSize = 9.0;
    _chartView.legend.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:15.f];
    _chartView.legend.xEntrySpace = 4.0;
}


@end
