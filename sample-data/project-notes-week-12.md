# harlow foods DP - wk12 notes (Aisha)

wk of 10/26. rough, cleaning up later

milestones from the kickoff deck for ref:
- bronze/silver layers done 10/16 (done)
- gold marts done 11/6
- UAT start 11/9
- go-live 12/7

**done**
- HFD-412 merged, CDC from the ERP finally stable after the DAG retries fix
- SCD2 on dim_customer + dim_product shipped to prod (Elena)
- HFD-398 closed, null store_ids traced to 2 legacy POS feeds
- 7 of 11 gold models through dbt tests. rest in PR
- demo'd sales mart to Greg on Weds, he liked the region drilldown

**wip / next**
- remaining 4 gold models, inventory ones are the ugly ones. Elena on it
- RLS in PBI for regional mgrs, HFD-431
- env refresh. waiting on Harlow IT to provision the UAT workspace, ticket's been sitting w/ them since 10/19, Greg chasing
- w/ the workspace delay + inventory rework prob looking at UAT 11/23 now, will sort the plan next wk
- start on runbook + handover docs

**blocked / risks**
- HFD-440 P1. net_sales in gold doesn't tie to finance's month-end number, about 1.5% off. think it's returns timing. need Harlow finance to say which def is right before we can sign off the mart
- Harlow's Black Friday code freeze, Greg mentioned it in passing, need the actual dates
- snowflake credits running hot from backfills, watch it
- Diego rolling off to Brightwell part time?? tbc w/ staffing

**misc**
- steerco moved to thurs next wk
- Greg asked if we can add a loyalty data source. out of scope, needs a CR
- Meera wants the update before steerco
