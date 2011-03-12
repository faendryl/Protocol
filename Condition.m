#import <Condition.h>

@implementation Condition

-(BOOL) passes:(BioObject*)object
{
  BioProperty *property=[object extractProperty:propertyClass];
  return [property compare:propertyExemplar]==result;
}

-(id) initWithExemplar:(BioProperty*)exemplar comparisonResult:(NSComparisonResult*)result
{
  
}

@end
