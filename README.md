Miscellaneous experiments with Pharo and Glamorous Toolkit.

To load the repo:

```
Metacello new
	repository: 'github://tangentstorm/ts-pharo:main/src';
	baseline: 'TsPharo';
	load.
```
	
	Then to load the lepiter pages:
	
```
#BaselineOfTsPharo asClass loadLepiter
```
