# Pillars of a great Azure architecture
## Security
- Defense in depth
  - Data
  - Application
  - VM/compute
  - Networking
  - Permiter
  - Policies & access
  - Physical Security
## Performance and scalability
- Scaling
  - Scale Up (1 small VM -> 1 big VM)
  - Scale Out (1 small VM -> many small VMs)
- Patterns
  - Data partioning
  - Caching
  - Auto Scaling
  - Decouple resrouce-intensive tasks to as background jobs
  - Use a messaging layer between services
  - Implement scale units
  - Performance monitoring
## Availability and recoverability
- RPO (Recovery Point Objective): The maximum duration of acceptable data loss
- RTO (Recovery Time Objective): The maximum duration of acceptable downtime
## Efficiency and operations
- Efficiency Best practices:
  - Cost optimization
  - move from IaaS to PaaS where possible
- Operation Best practices:
  - Automate
  - Monitoring, Logging, Instrumentation
  - design with DevOps in mind: infrastructure as code, automated testing and deployment
  - Eliminate waste
    
