# Adapt/Filter Unrealistic Values

MoveApps

Github repository: *github.com/movestore/Filter-Unrealistic-Values*

## Description
Filters your data according to a selected attribute and unrealistic value threshold and sets the attribute to a value that you set (or NULL) or deletes the complete events (localisations) for not being included in further analyses.

## Documentation
For some calculations, unrealistic values of attributes make results less meaningfull. This App is meant to clean the data before, either (1) allowing to set attributes with unrealistic values to a user specified value, a mean or median value or NULL (= NA (not available), thus being excuded from average/duration etc. calcualtions) or (2) deleting complete events with unrealistic attribute values (set with parameter `delete`).

This Apps was developed to take biologically unsensibly large timelags from being used in e.g. cumulative durations of flight per day. Timelags were calculated with the Time Lag Between Locations App before this App in the workflow. However, the App can also be used for any other data attributes. Take care that data types fit.

### Input data
moveStack in Movebank format

### Output data
moveStack in Movebank format

### Artefacts
none.

### Settings
**Data Attribute (`variab`):** Name of the required data attribute. Take care that this parameter also exists in the Track Attributes of the input data set.

**Selection Relation (`rel`):** By this parameter the relation in the required property has to be selected. The possible values differ by parameter data type, only numeric and timestamps variables can relate by '==', '>' or '<'.

**Selection Value (`valu`):** Unrealistic threshold value of the relation that the data set has to fullfill. In case of `rel` = 'is one of the following' commas have to be used to separate the possible values. In case of a timestamp parameter please use the timestamp format with year, month, day, hour, minute and second as in the example: '2021-06-23 09:34:00"

**Time variable? (`time`):** Please tick this parameter if your selected variable is a timestamp type, so that the App can properly work with it.

**Delete event? (`delete`):** Select this option if, instead of unrealistic attribute values being set to a value (below), you want the complete event (localisation) deleted from the data set. Default FALSE.

**Adapt value to (`setto`):** Insert here a value to which unrealistic attribute values shall be set. This can be any value (the data type must fit) or one of three generic options: NULL (NA = not available, then this value will not be used for future analysis steps in other Apps), 'mean' (mean value of all realistic attribute values) or 'median' (median value of all realistic attribute values).

### Null or error handling:
**Setting 'Data Attribute:** If there is no individual variable with the name given here, an error will be returned.

**Setting `Selection Relation`:** If none of the relation options are selected, an error will be returned. It has to be carefully considered that the selected relation fits with the data type of the selected variable. Only numeric and timestamps variables can relate by '==', '>' or '<'.

**Setting `Selection Value`:** If there is no value entered, an error will be returned. The data type of the entered value has to fit with the selected variable.

**Setting `Time variable?`:** If the selected variable is a timestamp and it was not indicated here, the variable will be treated as a string of text and possibly not handled correctly, leading to errors. Similarly if your variable is not a timestamp and it is indicated here. Default is 'false'.

**Setting `Delete event?`:** if all values are deleted, NULL output can be generated and lead to errors in the next App of the workflow.

**Setting `Adapt value to`:** If the data types do not fit, an error will occur. Unsensible values might lead to unexpected results in further Apps.

**Data:** The full data set is returned.
