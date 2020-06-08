# Azure Monitor
Key capabilities:
- Monitor and visualize metrics
- Query and analyze logs
- Setup alerts and actions


all data collected fits into 2 fundamental data types: metrics, logs

Sources: 
- Application monitoring data (requires an instrumentation package to be integrated into the app)
- Guest OS data (requieres a agent to run on guest OS)
- Azure Resources data
- Azure subscription data
- Azure tenant data
- Custom data (any REST client using Data Collector API)

Log analytics includes supports [Kusto Query Language](https://docs.microsoft.com/en-us/azure/data-explorer/kusto/query/)

Insights: Application Insights, Container Insights
Activity Logs -  Activity Logs provide data about the operations on a resource from the outside (the “control plane”). what who and when for any write operation (PUT, POST, DELETE) taken on the resources in your subscription.
Diagnostic Logs - Diagnostics Logs are emitted by a resource and provide information about the operation of that resource (the “data plane”).
Application Logs

Activity Logs are kept for 90 days.
You can retrive events from Activity Logs using Azure portal, CLI, PowerShell cmdlets and Azure Monitor REST API

Advisor is a personalized cloud consultant that helps you follow best practices to optimize your deployments.

Monitor Alerts
- Alert Rule
  - Target Resource: any azure resource. A Signal is emitted by the target resource (Metric, Activity Log, Application Insight, Log)
  - Criteria : A combination of Signal and logic test. E.g CPU% > 70%
- Action Group: a collection of notification preferences defined by the owner of an Azure subscription
- Alert Name, Alert Description
- Severity: 0-4
- Action: A specific action taken when the alert is fired.
  - Email, ITSM, LogicApp, Runbook, SMS, Voice, Webhook.
- Monitor Condition
- Alert staes: New, Acknowledged, Closed
