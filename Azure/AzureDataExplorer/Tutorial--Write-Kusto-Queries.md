
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

> [!TODO]  
> https://learn.microsoft.com/en-us/azure/data-explorer/kusto/query/tutorials/use-aggregation-functions#conditionally-count-rows


---

