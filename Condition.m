#import <stdio.h>
#import <Condition.h>
#import <Sequence.h>
#import <Foundation/NSValue.h>

@implementation Condition

-(BOOL) passes:(BioObject*)object
{
  return NO;
  //BioProperty *property=[object extractProperty:propertyClass];
  //return [property compare:propertyExemplar]==result;
}
@end

@implementation dnaSizeCondition

-(BOOL) passes:(BioObject*)object
{
  Sequence *property=(Sequence*)[object extractProperty:[Sequence class]];
  NSComparisonResult result=[size compare:[[NSNumber alloc] initWithInt:[[property sequence] length]]];
  //printf("Left size is %d, right is %d\n",[size intValue],[[property sequence] length]);
  //printf("Result is %d, target is %d\n",result,targetResult);
  return targetResult==result;
}

-(id) initWithSize:(NSNumber*)boundSize andComparison:(NSComparisonResult)result
{
  if((self=[super init])){
    size=boundSize;
    targetResult=result;
  }
  return self;
}
@end
