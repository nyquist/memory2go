# Autonomous Database

## Autonomous DB vs Automated DB Services

| Autonmous DB | Automated DB Services |
| --- | ---|
| All DB operations are fully automated | DB lifecycle automation provided |
| User runs SQL, no access to OS or CDB | User operates, has DBA and OS root access |
| Exadata Performance and Availability  | Runs older DB versions |
| Customizable for DW or TP Workload.   | All database features |
| Serverless or Dedicated               | ExaCS or DBCS |

- Oracle manages end-to-end the Autonomous DB.
  - Provisioining, Patching, Upgrades, Backup, recovery, Growing/Shrining storage and compute
- Can be managed using service console, CLI or REST API
- Fully elastic
  - supoprts auto-scaling
  - independent storage and CPU scaling
- Supports Oracle Cloud Services: Analytics Cloud Services, Golden Gate Cloud Service, Integration Cloud Service, etc.
- Connectiviy via SQL *Net, JDBC, ODBC
## Autonomous Data Warehouse vs Autonomous Transaction Processing

| Autonomous Data Warehouse (DW) | Autonomous Transaction Processing (TP) |
| --- | --- |
| Columnar Format | Row Format |
| Creates Data Summaries | Creates indexes |
| Memory Speeds Joins, Aggs | Memory for Caching to Avoid IO |
| Statistics updated in real-time while preventing plan regression | Statistics updated in real-time while preventing plan regression |

## Choice of Cloud Deployments
Autonomous Database Deployments:
- Dedicated: provisions Autonomous DB in its own Exadata
- Serverless: provisions Autonomous DB on a Shared Exadata

| DBaaS on VM or BM | Exadata | Autonomous Serverless | Autonomous Dedicated |
| --- | --- | --- | --- |
| Management | Customer | Customer | Oracle | Oracle |
| Private Network | Yes | Yes | No | Yes |
| Tenant Model | Single/Multi | Single/Multi | Single | Single/Multi
| Software Updates| Customer initiated | Customer initiated | Automatic | Customer Policy Control |
| Private Cloud | No | Yes | No | Yes |
| Availability SLA | No | 99.95% | SLO | SLO |
| DR | Yes, Accross ADs and Regions | Yes, Accross ADs and Regions | No | No |
| Hybrid DR | Yes | Yes | No | No |
| Consolidation | Yes | Yes | No | Yes |

