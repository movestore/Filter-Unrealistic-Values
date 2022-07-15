# Filter Unrealistic Values

MoveApps

Github repository: *github.com/movestore/Filter-Unrealistic-Values*

## Description
Filters your data according to a selected attribute and unrealistic value threshold and sets the attribute to NA (not available) or deletes the complete events (localisations) for not being included in further analyses.

## Documentation
For some calculations, unrealistic values of attributes make results less meaningfull. This App is meant to clean the data before, either (1) allowing to set attributes with unrealistic values to NA (thus being excuded from average/duration etc. calcualtions or (2) deleting complete events with unrealistic attribute values (set with parameter `delete`).

This Apps was developed to take biologically unsensibly large timelags from being used in e.g. cumulative durations of flight per day. Timelags were calculated with the Time Lag Between Locations App before this App in the workflow.

### Input data
moveStack in Movebank format

### Output data
moveStack in Movebank format

### Artefacts
none.

### Parameters 
`variab`: Name of the required data attribute. Take care that this parameter also exists in the Track Attributes of the input data set.

`rel`: By this parameter the relation in the required property has to be selected. The possible values differ by parameter data type, only numeric and timestamps variables can relate by '==', '>' or '<'.

`valu`: Unrealistic threshold value of the relation that the data set has to fullfill. In case of `rel` = 'is one of the following' commas have to be used to separate the possible values. In case of a timestamp parameter please use the timestamp format with year, month, day, hour, minute and second as in the example: '2021-06-23 09:34:00"

`time`: Please tick this parameter if your selected variable is a timestamp type, so that the App can properly work with it.

`delete`: Select this option if, instead of unrealistic attribute values being set to NA, you want the complete event (localisation) deleted from the data set. Default FALSE (set to NA).

### Null or error handling:
**Parameter `variab`:** If there is no individual variable with the name given here, an error will be returned.

**Parameter `rel`:** If none of the relation options are selected, an error will be returned. It has to be carefully considered that the selected relation fits with the data type of the selected variable. Only numeric and timestamps variables can relate by '==', '>' or '<'.

**Parameter `valu`:** If there is no value entered, an error will be returned. The data type of the entered value has to fit with the selected variable.

**Parameter `time`:** If the selected variable is a timestamp and it was not indicated here, the variable will be treated as a string of text and possibly not handled correctly, leading to errors. Similarly if your variable is not a timestamp and it is indicated here. Default is 'false'.

**Data:** The full data set is returned.