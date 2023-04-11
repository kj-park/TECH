
# Tutorial: Write Kusto Queries

Kusto Query Language (KQL)은 [Azure Data Explorer](https://dataexplorer.azure.com/) 및 [Azure Monitor Log Analytics](https://azure.microsoft.com/products/monitor/#overview), [Azure Sentinel](https://azure.microsoft.com/products/microsoft-sentinel/)에서 queries를 write할 때 사용되어집니다.

이 Tutorial에서 사용되는 StormEvents table은 [**Help** Cluster](https://help.kusto.windows.net/Samples)에서 public하게 사용 가능합니다.

## Learn common operators

이 Tutorial은 기본적인 KQL operators를 사용하여 data를 분석하고 access하는 것에 대하여 소개합니다.

### Count rows (**`count`**)

```kusto
StormEvents
| count
```

### See a sample of data (**`take`**)

```kusto
StormEvents
| take 5
```

### Select a subset of columns (**`project`**)

```kusto
StormEvents
| take 5
| project State, EventType, DamageProperty
```

### List unique values (**`distinct`**)

```kusto
StormEvents 
| distinct EventType
```

### Filter by condition (**`where`**)

```kusto
StormEvents
| where State == 'TEXAS' and EventType == 'Flood'
| project StartTime, EndTime, State, EventType, DamageProperty
```

### Sort results (**`sort`**)

```kusto
StormEvents
| where State == 'TEXAS' and EventType == 'Flood'
| sort by DamageProperty
| project StartTime, EndTime, State, EventType, DamageProperty
```

### Get the top n rows (**`top`**)

```kusto
StormEvents
| where State == 'TEXAS' and EventType == 'Flood'
| top 5 by DamageProperty
| project StartTime, EndTime, State, EventType, DamageProperty
```

### Create calculated columns (**`extend`**)

```kusto
StormEvents
| where State == 'TEXAS' and EventType == 'Flood'
| top 5 by DamageProperty desc
| extend Duration = EndTime - StartTime
```

### Map values from one set to another (**`let`** & **`dynamic`**)

```kusto
let sourceMapping = dynamic(
  {
    "Emergency Manager" : "Public",
    "Utility Company" : "Private"
  });
StormEvents
| where Source == "Emergency Manager" or Source == "Utility Company"
| project EventId, Source, FriendlyName = sourceMapping[Source]
```

---

## Use aggregation functions

[Aggregation functions](https://learn.microsoft.com/en-us/azure/data-explorer/kusto/query/aggregation-functions)은 data를 grouping하거나 combine하여 요약된 값을 나타낼 수 있습니다.

## Use the summarize operator (**`summarize`** & **`count() by`**)

```kusto
StormEvents
| summarize TotalStorms = count() by State
```

## Visualize query results (**`rendar`**)

```kusto
StormEvents
| summarize TotalStorms = count() by State
| render barchart
```

## Conditionally count rows ([**`countif()`**](https://learn.microsoft.com/en-us/azure/data-explorer/kusto/query/countif-aggfunction))

```kusto
StormEvents
| summarize StormsWithCropDamage = countif(DamageCrops > 0) by State
| top 5 by StormsWithCropDamage
```

## Group data into bins

숫자 또는 시간 값으로 집계하려면 먼저 bin() 함수를 사용하여 데이터를 bin으로 그룹화합니다.

bin() 사용하면 값이 특정 범위 내에서 분산되는 방식을 이해하고 서로 다른 기간을 비교하는 데 도움이 될 수 있습니다.

다음 쿼리는 2007년에 매주 작물 손상을 일으킨 폭풍의 수를 계산합니다. 함수에 유효한 시간 범위 값이 필요하므로 인수는 7d 1주일을 나타냅니다.

```kusto
StormEvents
| where StartTime between (datetime(2007-01-01) .. datetime(2007-12-31)) 
    and DamageCrops > 0
| summarize EventCount = count() by bin(StartTime, 7d)
| render timechart
```

## Calculate the min, max, avg, and sum

```kusto
StormEvents
| where DamageCrops > 0
| summarize
    MaxCropDamage=max(DamageCrops), 
    MinCropDamage=min(DamageCrops), 
    AvgCropDamage=avg(DamageCrops)
    by EventType
| sort by AvgCropDamage
```

```kusto
StormEvents
| where StartTime between (datetime(2007-01-01) .. datetime(2007-12-31)) 
    and DamageCrops > 0
| summarize CropDamage = sum(DamageCrops) by bin(StartTime, 7d)
| render timechart
```

## Calculate percentages




> [!TODO]  
> https://learn.microsoft.com/en-us/azure/data-explorer/kusto/query/tutorials/use-aggregation-functions#conditionally-count-rows


---

