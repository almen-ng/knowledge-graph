// RHACM Architecture Graph - Sample Analytics Queries
// 
// Prerequisites: Import rhacm_architecture_comprehensive_final.cypher first
// Usage: Copy and paste these queries into Neo4j Browser or cypher-shell
//
// These queries help analyze the RHACM dependency graph to understand:
// - Component distribution and connectivity patterns
// - Cross-subsystem dependencies and integration points
// - Hub-spoke communication flows
// - Critical components and architectural bottlenecks

// =============================================================================
// BASIC ANALYSIS QUERIES
// =============================================================================

// 1. Component Count by Subsystem
// Shows the distribution of components across RHACM subsystems
MATCH (n:RHACMComponent) 
RETURN n.subsystem as Subsystem, count(n) as ComponentCount 
ORDER BY ComponentCount DESC;

// 2. Total Graph Statistics
// Overall metrics for the complete architecture
MATCH (n:RHACMComponent)
OPTIONAL MATCH ()-[r]->()
RETURN count(DISTINCT n) as TotalComponents,
       count(DISTINCT r) as TotalRelationships,
       count(DISTINCT n.subsystem) as TotalSubsystems;

// 3. Component Types Distribution
// Breakdown by component types (Operator, Controller, etc.)
MATCH (n:RHACMComponent)
RETURN n.type as ComponentType, count(n) as Count
ORDER BY Count DESC;

// =============================================================================
// CONNECTIVITY ANALYSIS
// =============================================================================

// 4. Most Connected Components (Hub Analysis)
// Identifies the most critical components by connection count
MATCH (n:RHACMComponent)
OPTIONAL MATCH (n)-[r_out]->()
OPTIONAL MATCH ()-[r_in]->(n)
RETURN n.label as Component, 
       n.subsystem as Subsystem,
       count(DISTINCT r_out) as OutgoingDependencies,
       count(DISTINCT r_in) as IncomingDependencies,
       count(DISTINCT r_out) + count(DISTINCT r_in) as TotalConnections
ORDER BY TotalConnections DESC LIMIT 20;

// 5. Least Connected Components
// Potential orphaned or peripheral components
MATCH (n:RHACMComponent)
OPTIONAL MATCH (n)-[r_out]->()
OPTIONAL MATCH ()-[r_in]->(n)
WITH n, count(DISTINCT r_out) + count(DISTINCT r_in) as connections
WHERE connections <= 2
RETURN n.label as Component, n.subsystem as Subsystem, connections
ORDER BY connections ASC, n.subsystem;

// 6. Relationship Types Analysis
// Understanding different types of component relationships
MATCH ()-[r]->()
RETURN type(r) as RelationshipType, count(r) as Count
ORDER BY Count DESC;

// =============================================================================
// CROSS-SUBSYSTEM ANALYSIS
// =============================================================================

// 7. Cross-Subsystem Dependencies
// Shows integration patterns between major subsystems
MATCH (source:RHACMComponent)-[r]->(target:RHACMComponent)
WHERE source.subsystem <> target.subsystem
RETURN source.subsystem as SourceSubsystem, 
       target.subsystem as TargetSubsystem,
       type(r) as RelationshipType,
       count(r) as Dependencies
ORDER BY Dependencies DESC;

// 8. Subsystem Integration Matrix
// Complete view of how subsystems interact
MATCH (source:RHACMComponent)-[r]->(target:RHACMComponent)
WHERE source.subsystem <> target.subsystem
WITH source.subsystem as Source, target.subsystem as Target, count(r) as Deps
RETURN Source, 
       collect(Target + ": " + toString(Deps)) as IntegratesWithSubsystems
ORDER BY Source;

// 9. Most Integrated Subsystems
// Which subsystems have the most external connections
MATCH (source:RHACMComponent)-[r]->(target:RHACMComponent)
WHERE source.subsystem <> target.subsystem
RETURN source.subsystem as Subsystem,
       count(DISTINCT target.subsystem) as ConnectedSubsystems,
       count(r) as TotalCrossConnections
ORDER BY TotalCrossConnections DESC;

// =============================================================================
// HUB-SPOKE ARCHITECTURE ANALYSIS
// =============================================================================

// 10. Hub-Spoke Communication Patterns
// Cross-cluster deployment and communication flows
MATCH (hub:RHACMComponent)-[r {cross_cluster: true}]->(spoke:RHACMComponent)
RETURN hub.label as HubComponent, 
       hub.subsystem as HubSubsystem,
       type(r) as CommunicationType,
       collect(DISTINCT spoke.label)[0..5] as SpokeComponents,
       count(spoke) as SpokeCount
ORDER BY SpokeCount DESC;

// 11. Cross-Cluster Relationship Analysis
// Understanding hub-spoke deployment patterns
MATCH ()-[r {cross_cluster: true}]->()
RETURN type(r) as CrossClusterRelationType, count(r) as Count
ORDER BY Count DESC;

// 12. Hub Cluster Components
// Components that manage spoke clusters
MATCH (hub:RHACMComponent)-[r {cross_cluster: true}]->()
RETURN DISTINCT hub.label as HubComponent, 
       hub.subsystem as Subsystem,
       hub.type as ComponentType
ORDER BY hub.subsystem, hub.label;

// =============================================================================
// CRITICAL PATH ANALYSIS
// =============================================================================

// 13. Root Components (No Dependencies)
// Foundation components that other components depend on
MATCH (n:RHACMComponent)
WHERE NOT ()-[:DEPENDS_ON]->(n)
RETURN n.subsystem as Subsystem, 
       n.label as RootComponent, 
       n.type as Type
ORDER BY Subsystem, RootComponent;

// 14. Leaf Components (No Dependents)
// End-point components that nothing depends on
MATCH (n:RHACMComponent)
WHERE NOT (n)-[:DEPENDS_ON]->()
RETURN n.subsystem as Subsystem,
       n.label as LeafComponent,
       n.type as Type
ORDER BY Subsystem, LeafComponent;

// 15. Dependency Chain Length
// Longest dependency paths in the architecture
MATCH path = (start:RHACMComponent)-[:DEPENDS_ON*]->(end:RHACMComponent)
WHERE NOT ()-[:DEPENDS_ON]->(start) AND NOT (end)-[:DEPENDS_ON]->()
RETURN start.label as StartComponent,
       end.label as EndComponent,
       length(path) as ChainLength,
       [node in nodes(path) | node.label] as DependencyChain
ORDER BY ChainLength DESC LIMIT 10;

// =============================================================================
// SUBSYSTEM-SPECIFIC ANALYSIS
// =============================================================================

// 16. Governance Subsystem Deep Dive
// Internal structure of the largest subsystem
MATCH (n:RHACMComponent {subsystem: 'Governance'})
OPTIONAL MATCH (n)-[r]->(m:RHACMComponent {subsystem: 'Governance'})
RETURN n.label as Component,
       n.type as Type,
       count(r) as InternalConnections,
       collect(DISTINCT type(r)) as RelationshipTypes
ORDER BY InternalConnections DESC;

// 17. Application Lifecycle Models
// Understanding the three application deployment patterns
MATCH (n:RHACMComponent {subsystem: 'Application'})
RETURN n.label as Component,
       n.type as Type,
       n.description as Description
ORDER BY n.label;

// 18. Observability Data Flow
// How metrics and monitoring data flows through the system
MATCH (obs:RHACMComponent {subsystem: 'Observability'})-[r]->(target)
RETURN obs.label as ObservabilityComponent,
       type(r) as FlowType,
       target.label as Target,
       target.subsystem as TargetSubsystem
ORDER BY obs.label;

// =============================================================================
// ENTERPRISE FEATURES ANALYSIS
// =============================================================================

// 19. Addon Components
// All RHACM addons and their deployment patterns
MATCH (n:RHACMComponent)
WHERE n.label CONTAINS "Addon" OR n.label CONTAINS "addon"
RETURN n.label as AddonComponent,
       n.subsystem as Subsystem,
       n.type as Type
ORDER BY n.subsystem, n.label;

// 20. Global Hub Federation
// Multi-hub management components
MATCH (n:RHACMComponent)
WHERE n.label CONTAINS "Global Hub" OR n.label CONTAINS "global-hub"
OPTIONAL MATCH (n)-[r]->(m)
RETURN n.label as GlobalHubComponent,
       count(r) as Connections,
       collect(DISTINCT m.label)[0..5] as ConnectedComponents
ORDER BY n.label;

// 21. Submariner Network Components
// Cross-cluster networking architecture
MATCH (n:RHACMComponent)
WHERE n.label CONTAINS "Submariner" OR n.label CONTAINS "submariner"
RETURN n.label as SubmarinerComponent,
       n.type as Type,
       n.description as Description
ORDER BY n.label;

// =============================================================================
// OPERATIONAL QUERIES
// =============================================================================

// 22. Operator Components
// All operators in the RHACM ecosystem
MATCH (n:RHACMComponent)
WHERE n.type = "Operator" OR n.label CONTAINS "operator"
RETURN n.label as OperatorName,
       n.subsystem as Subsystem,
       n.description as Description
ORDER BY n.subsystem, n.label;

// 23. Controller Components
// All controllers and their management responsibilities
MATCH (n:RHACMComponent)
WHERE n.type = "Controller" OR n.label CONTAINS "controller"
RETURN n.label as ControllerName,
       n.subsystem as Subsystem,
       n.type as Type
ORDER BY n.subsystem, n.label;

// 24. API Components
// All API endpoints and services
MATCH (n:RHACMComponent)
WHERE n.type = "API" OR n.label CONTAINS "API" OR n.label CONTAINS "api"
RETURN n.label as APIComponent,
       n.subsystem as Subsystem,
       n.description as Description
ORDER BY n.subsystem, n.label;

// =============================================================================
// TROUBLESHOOTING QUERIES
// =============================================================================

// 25. Find Component by Name Pattern
// Useful for locating specific components
// Usage: Replace 'search_pattern' with your search term
MATCH (n:RHACMComponent)
WHERE n.label CONTAINS 'policy' // Change 'policy' to your search term
RETURN n.label as Component,
       n.subsystem as Subsystem,
       n.type as Type,
       n.description as Description
ORDER BY n.subsystem, n.label;

// 26. Component Neighborhood
// Find all directly connected components to a specific component
// Usage: Replace 'Component Name' with the actual component you want to explore
MATCH (center:RHACMComponent {label: 'Red Hat Advanced Cluster Management'})
OPTIONAL MATCH (center)-[r_out]->(connected_out)
OPTIONAL MATCH (connected_in)-[r_in]->(center)
RETURN center.label as CenterComponent,
       'OUTGOING' as Direction,
       type(r_out) as RelationType,
       connected_out.label as ConnectedComponent,
       connected_out.subsystem as ConnectedSubsystem
UNION
MATCH (center:RHACMComponent {label: 'Red Hat Advanced Cluster Management'})
OPTIONAL MATCH (connected_in)-[r_in]->(center)
RETURN center.label as CenterComponent,
       'INCOMING' as Direction,
       type(r_in) as RelationType,
       connected_in.label as ConnectedComponent,
       connected_in.subsystem as ConnectedSubsystem
ORDER BY Direction, RelationType;

// 27. Subsystem Component List
// List all components in a specific subsystem
// Usage: Replace 'Governance' with desired subsystem
MATCH (n:RHACMComponent {subsystem: 'Governance'})
RETURN n.label as Component,
       n.type as Type,
       n.description as Description
ORDER BY n.type, n.label;

// =============================================================================
// PERFORMANCE QUERIES
// =============================================================================

// 28. Verify Import Completeness
// Ensure all components were imported successfully
MATCH (n:RHACMComponent)
RETURN count(n) as TotalComponents,
       count(DISTINCT n.subsystem) as UniqueSubsystems,
       collect(DISTINCT n.subsystem) as SubsystemList;

// 29. Relationship Completeness Check
// Verify relationships were created properly
MATCH ()-[r]->()
RETURN count(r) as TotalRelationships,
       count(DISTINCT type(r)) as UniqueRelationshipTypes,
       collect(DISTINCT type(r)) as RelationshipTypes;

// 30. Data Quality Check
// Find any components with missing properties
MATCH (n:RHACMComponent)
WHERE n.label IS NULL OR n.subsystem IS NULL OR n.type IS NULL
RETURN count(n) as ComponentsWithMissingProperties,
       collect(n) as ProblematicComponents;

// =============================================================================
// END OF SAMPLE QUERIES
// =============================================================================

// Note: These queries provide comprehensive analysis capabilities for the RHACM
// architecture graph. Modify the WHERE clauses and component names as needed
// to explore specific aspects of your RHACM deployment.
//
// For best performance with large result sets, consider adding LIMIT clauses
// to queries that might return many results.
// =============================================================================
// APPLICATION LIFECYCLE MODEL ANALYSIS
// =============================================================================


// =============================================================================
// APPLICATION LIFECYCLE MODEL DISCOVERY
// =============================================================================

// 1. Overview of All Three Application Models
// Shows the complete breakdown of deployment models
MATCH (n:RHACMComponent)
WHERE n.deployment_model IS NOT NULL AND n.deployment_model <> ''
RETURN n.deployment_model as DeploymentModel, 
       collect(DISTINCT n.model_role) as Roles,
       collect(DISTINCT n.deployment_pattern) as Patterns,
       count(n) as ComponentCount
ORDER BY ComponentCount DESC;

// 2. Subscription Model Complete Architecture
// Shows the stream-based content delivery pattern
MATCH (n:RHACMComponent)
WHERE n.deployment_model = 'subscription'
RETURN n.label as Component,
       n.model_role as Role,
       n.deployment_pattern as Pattern,
       n.subsystem as Subsystem
ORDER BY n.model_role, n.label;

// 3. Subscription Model Data Flow
// Traces the complete content streaming flow
MATCH path = (channel)-[:FEEDS_CONTENT]->(subscription)-[:DEPLOYS_VIA]->(manager)
WHERE channel.deployment_model = 'subscription' 
  AND subscription.deployment_model = 'subscription'
  AND manager.deployment_model = 'subscription'
RETURN [node in nodes(path) | node.label] as SubscriptionFlow,
       [node in nodes(path) | node.model_role] as ComponentRoles,
       [rel in relationships(path) | type(rel)] as RelationshipTypes;

// =============================================================================
// ARGOCD PUSH MODEL ANALYSIS
// =============================================================================

// 4. ArgoCD Push Model Architecture
// Shows hub-orchestrated deployment pattern
MATCH (n:RHACMComponent)
WHERE n.deployment_model = 'argocd_push'
RETURN n.label as Component,
       n.model_role as Role,
       n.deployment_pattern as Pattern,
       n.subsystem as Subsystem
ORDER BY n.model_role, n.label;

// 5. ArgoCD Push Model Integration Flow
// Shows how hub controllers orchestrate deployments
MATCH (integrations)-[:CONTAINS]->(controller)
WHERE integrations.deployment_model = 'argocd_push' 
  AND controller.deployment_model = 'argocd_push'
RETURN integrations.label as Orchestrator,
       collect(controller.label) as Controllers,
       collect(controller.model_role) as ControllerRoles;

// 6. Push Model to GitOps Operator Flow
// Shows how push model connects to deployment execution
MATCH (push_component)-[r]->(gitops)
WHERE push_component.deployment_model = 'argocd_push'
  AND gitops.label CONTAINS 'GitOps'
RETURN push_component.label as PushComponent,
       push_component.model_role as PushRole,
       type(r) as Relationship,
       gitops.label as GitOpsComponent,
       gitops.deployment_model as GitOpsModels;

// =============================================================================
// ARGOCD PULL MODEL ANALYSIS
// =============================================================================

// 7. ArgoCD Pull Model Architecture  
// Shows spoke-autonomous deployment pattern
MATCH (n:RHACMComponent)
WHERE n.deployment_model = 'argocd_pull'
RETURN n.label as Component,
       n.model_role as Role,
       n.deployment_pattern as Pattern,
       n.subsystem as Subsystem
ORDER BY n.model_role, n.label;

// 8. Pull Model ManifestWork Distribution
// Shows how applications are distributed to managed clusters
MATCH (pull_component)-[:CREATES]->(manifestwork)
WHERE pull_component.deployment_model = 'argocd_pull'
  AND manifestwork.label CONTAINS 'ManifestWork'
RETURN pull_component.label as PullController,
       pull_component.model_role as Role,
       manifestwork.label as DistributionMechanism;

// 9. Pull Model Status Synchronization
// Shows how status flows back from managed clusters
MATCH (status_controller)-[r]->(target)
WHERE status_controller.model_role = 'status_syncer'
  AND status_controller.deployment_model = 'argocd_pull'
RETURN status_controller.label as StatusController,
       type(r) as SyncMechanism,
       target.label as SyncTarget;

// =============================================================================
// GITOPS OPERATOR DUAL MODEL SUPPORT
// =============================================================================

// 10. GitOps Operator Multi-Model Analysis
// Shows how GitOps Operator supports both ArgoCD models
MATCH (component)-[r]->(gitops)
WHERE gitops.deployment_model CONTAINS 'argocd_push'
  AND gitops.deployment_model CONTAINS 'argocd_pull'
  AND gitops.model_role = 'application_deployer'
RETURN component.deployment_model as SourceModel,
       component.model_role as SourceRole,
       type(r) as ConnectionType,
       gitops.label as UnifiedDeployer,
       gitops.deployment_pattern as DeploymentPattern;

// 11. Cross-Model GitOps Integration
// Compares how different models connect to GitOps
MATCH (source)-[r]->(gitops)
WHERE source.deployment_model IN ['argocd_push', 'argocd_pull']
  AND gitops.label CONTAINS 'GitOps'
RETURN source.deployment_model as Model,
       count(source) as ComponentsConnected,
       collect(DISTINCT type(r)) as ConnectionTypes,
       collect(DISTINCT source.model_role) as SourceRoles;

// =============================================================================
// MODEL COMPARISON QUERIES  
// =============================================================================

// 12. Deployment Pattern Comparison
// Shows the fundamental differences between models
MATCH (n:RHACMComponent)
WHERE n.deployment_model IN ['subscription', 'argocd_push', 'argocd_pull']
RETURN n.deployment_model as Model,
       n.deployment_pattern as Pattern,
       collect(DISTINCT n.model_role) as Roles,
       count(n) as Components
ORDER BY Model;

// 13. Hub vs Spoke Component Distribution by Model
// Shows which models operate primarily on hub vs spoke
MATCH (n:RHACMComponent)
WHERE n.deployment_model IN ['subscription', 'argocd_push', 'argocd_pull']
RETURN n.deployment_model as Model,
       CASE 
         WHEN n.deployment_pattern CONTAINS 'hub' THEN 'Hub-Centric'
         WHEN n.deployment_pattern CONTAINS 'spoke' THEN 'Spoke-Centric'
         WHEN n.deployment_pattern CONTAINS 'cross' THEN 'Cross-Cluster'
         ELSE 'Other'
       END as Location,
       count(n) as ComponentCount;

// 14. Model Role Distribution
// Shows the variety of roles within each deployment model
MATCH (n:RHACMComponent)
WHERE n.deployment_model IN ['subscription', 'argocd_push', 'argocd_pull']
  AND n.model_role IS NOT NULL AND n.model_role <> ''
RETURN n.deployment_model as Model,
       n.model_role as Role,
       count(n) as ComponentCount
ORDER BY Model, ComponentCount DESC;

// =============================================================================
// TROUBLESHOOTING BY MODEL
// =============================================================================

// 15. Subscription Model Failure Impact
// Shows what breaks if subscription components fail
MATCH (sub_component)-[r*1..3]-(affected)
WHERE sub_component.deployment_model = 'subscription'
  AND sub_component.model_role IN ['content_consumer', 'content_router', 'deployment_executor']
RETURN sub_component.label as CriticalComponent,
       sub_component.model_role as Role,
       count(DISTINCT affected) as PotentiallyAffectedComponents,
       collect(DISTINCT affected.subsystem) as AffectedSubsystems;

// 16. ArgoCD Push Model Dependencies
// Shows the dependency chain for push model components
MATCH path = (start)-[:DEPENDS_ON|CONTAINS*1..3]->(end)
WHERE start.deployment_model = 'argocd_push'
  AND start.model_role = 'integration_orchestrator'
RETURN [node in nodes(path) | node.label] as DependencyChain,
       [node in nodes(path) | node.model_role] as RoleChain,
       length(path) as ChainLength
ORDER BY ChainLength DESC;

// 17. Pull Model Managed Cluster Components
// Shows what gets deployed to managed clusters in pull model
MATCH (pull_component)-[:CREATES|DISTRIBUTES*1..2]->(spoke_component)
WHERE pull_component.deployment_model = 'argocd_pull'
RETURN pull_component.label as HubController,
       pull_component.model_role as HubRole,
       collect(spoke_component.label) as SpokeComponents,
       count(spoke_component) as SpokeComponentCount;

// =============================================================================
// MODEL EVOLUTION AND ARCHITECTURE INSIGHTS
// =============================================================================

// 18. Model Transition Compatibility
// Shows which components bridge different models
MATCH (bridge)-[r]-(target)
WHERE bridge.deployment_model CONTAINS ','  // Multi-model components
   OR target.deployment_model <> bridge.deployment_model
RETURN bridge.label as BridgeComponent,
       bridge.deployment_model as BridgeModels,
       collect(DISTINCT target.deployment_model) as ConnectedModels,
       count(DISTINCT target) as Connections;

// 19. Content Flow Patterns by Model
// Shows how content/applications flow through each model
MATCH path = (source)-[:FEEDS_CONTENT|DEPLOYS_VIA|CREATES*1..3]->(target)
WHERE source.deployment_model IN ['subscription', 'argocd_push', 'argocd_pull']
RETURN source.deployment_model as Model,
       [node in nodes(path) | node.model_role] as FlowRoles,
       [rel in relationships(path) | type(rel)] as FlowTypes,
       target.label as FinalTarget
ORDER BY Model, length(path);

// 20. Model-Specific Relationship Patterns
// Shows the different relationship patterns each model uses
MATCH (source)-[r]->(target)
WHERE source.deployment_model IN ['subscription', 'argocd_push', 'argocd_pull']
  AND target.deployment_model IN ['subscription', 'argocd_push', 'argocd_pull']
RETURN source.deployment_model as SourceModel,
       target.deployment_model as TargetModel,
       type(r) as RelationshipType,
       count(r) as Frequency
ORDER BY SourceModel, Frequency DESC;

// =============================================================================
// DEMONSTRATION QUERIES FOR AI/MCP
// =============================================================================

// 21. Complete Model Comparison Summary
// Perfect for AI to explain the three models
MATCH (n:RHACMComponent)
WHERE n.deployment_model IN ['subscription', 'argocd_push', 'argocd_pull']
WITH n.deployment_model as Model,
     collect(DISTINCT n.deployment_pattern)[0] as PrimaryPattern,
     collect(DISTINCT n.model_role) as Roles,
     count(n) as ComponentCount
RETURN Model,
       PrimaryPattern,
       ComponentCount,
       Roles,
       CASE Model
         WHEN 'subscription' THEN 'Stream-based content delivery from channels to managed clusters'
         WHEN 'argocd_push' THEN 'Hub-orchestrated GitOps deployment pushed to managed clusters'  
         WHEN 'argocd_pull' THEN 'Spoke-autonomous GitOps with managed clusters pulling applications'
       END as Description;

// 22. Model Decision Matrix
// Helps AI recommend which model to use when
MATCH (n:RHACMComponent)
WHERE n.deployment_model IN ['subscription', 'argocd_push', 'argocd_pull']
RETURN n.deployment_model as Model,
       CASE 
         WHEN n.deployment_pattern CONTAINS 'hub' THEN 'Centralized Control'
         WHEN n.deployment_pattern CONTAINS 'spoke' THEN 'Distributed Control'
         ELSE 'Hybrid Control'
       END as ControlPattern,
       CASE
         WHEN n.deployment_model = 'subscription' THEN 'Simple, streaming, legacy'
         WHEN n.deployment_model = 'argocd_push' THEN 'GitOps, hub-managed, orchestrated'
         WHEN n.deployment_model = 'argocd_pull' THEN 'GitOps, autonomous, resilient'
       END as Characteristics,
       count(n) as ComponentComplexity
GROUP BY n.deployment_model, ControlPattern, Characteristics
ORDER BY Model;