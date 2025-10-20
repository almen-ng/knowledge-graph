# RHACM Architecture Dependency Graph

A comprehensive Neo4j dependency graph of Red Hat Advanced Cluster Management (RHACM) architecture across all major subsystems.

## 🏗️ Architecture Overview

This repository contains the most complete dependency graph of RHACM architecture, verified against official GitHub repositories and enhanced with internal component analysis.

### Key Features
- **Complete Component Coverage** across 7 subsystems with 323 components and 499 relationships (Overview, Governance, Application, Observability, Cluster, Search, Console)
- **Semantic Relationships** (DEPENDS_ON, CONTAINS, MANAGES, etc.)
- **Full Addon Coverage** - All RHACM addons included
- **Hub-Spoke Architecture** with cross-cluster deployment patterns
- **Kubernetes Core Integration** - Full API Server and etcd connectivity to RHACM components
- **Enterprise Components** - MCE, Global Hub, Submariner, Backup/Recovery, CAPI, Red Hat Insights

## 🚀 Quick Start

### 1. Import to Neo4j
```bash
# Clear existing data (optional)
MATCH (n) DETACH DELETE n;

# Import the complete architecture
# Copy and run knowledge-graph/rhacm_architecture_comprehensive_final.cypher in Neo4j Browser
```

### 2. Verify Import
```cypher
// Component count by subsystem
MATCH (n:RHACMComponent) 
RETURN n.subsystem as Subsystem, count(n) as ComponentCount 
ORDER BY ComponentCount DESC;

// Verify all components imported successfully
```

### 3. Explore with Sample Queries
```cypher
// Copy and run queries from knowledge-graph/sample_queries.cypher
// 30+ analytics queries for comprehensive graph exploration
```

## 📁 Repository Structure

```
├── knowledge-graph/
│   ├── rhacm_architecture_comprehensive_final.cypher    # 🎯 Main Neo4j import script (enhanced with model classification)
│   └── sample_queries.cypher                            # 📊 50+ analytics queries including deployment model analysis
├── mermaid/
│   └── rhacm-*.mmd                                      # 📊 Source Mermaid diagrams (7 files, enhanced observability with detailed diagrams)
├── diagrams/                                           # 🖼️ Architectural reference images including observability workflow diagrams
├── rhacm_architecture_implementation_guide.md          # 📖 Step-by-step implementation
├── rhacm_architecture_research_methodology.md          # 🔬 Research-based discovery approach
├── rhacm_architecture_comprehensive_reference.md       # 📚 Complete unformatted reference
├── mcp_sample_questions.md                             # 🤖 MCP server sample questions
└── mermaid_to_cypher.py                                # 🔧 Conversion tool
```

## 🎯 Core Files

### Production Ready
- **`knowledge-graph/rhacm_architecture_comprehensive_final.cypher`** - **PRIMARY PRODUCTION FILE** - Complete Neo4j import script with 323 components, 499 relationships, and full Kubernetes core integration
- **`knowledge-graph/sample_queries.cypher`** - 50+ ready-to-use analytics queries including Application Lifecycle model analysis

### Documentation
- **`rhacm_architecture_implementation_guide.md`** - Ready-to-use Mermaid code with step-by-step instructions
- **`rhacm_architecture_research_methodology.md`** - Alternative discovery approach via systematic repository analysis
- **`rhacm_architecture_comprehensive_reference.md`** - Complete chronological reference
- **`mcp_sample_questions.md`** - Sample questions for MCP server integration with Claude

### Development Tools
- **`mermaid_to_cypher.py`** - Python tool for converting Mermaid diagrams to Neo4j Cypher

## 🏛️ Architecture Hierarchy

```
Red Hat Advanced Cluster Management (ACM)
├── Multicluster Engine (MCE) - Foundation Layer
├── Overview Subsystem
├── Governance Subsystem (Largest)
├── Application Lifecycle
├── Observability
├── Cluster Management
├── Search & Discovery
└── Console
```

## 🔍 Key Subsystems

### Governance
- Policy propagation, enforcement, and compliance
- Template processing and encryption
- Gatekeeper OPA integration
- Must-gather diagnostics

### Application Lifecycle
- Three deployment models: Subscription, ArgoCD Push, ArgoCD Pull
- GitOps integration with OpenShift GitOps
- Multi-cluster application management

### Observability
- Enhanced with detailed observability diagrams including bootstrap sequences, metrics collection flows, and status propagation
- Thanos/Prometheus metrics pipeline with complete component separation (metrics collector vs uwl metrics collector)
- Multi-cluster monitoring and alerting with hub-spoke data flows
- Grafana dashboards and visualization with RBAC query proxy integration

### Cluster Management
- Cluster provisioning via Hive and CAPI
- Hypershift hosted control planes
- Backup and disaster recovery with OADP

## 📊 Sample Analytics Queries

The repository includes 50+ ready-to-use queries in `knowledge-graph/sample_queries.cypher` for comprehensive graph analysis including Application Lifecycle model intelligence:

### Key Query Categories
- **Basic Analysis**: Component distribution, graph statistics, connectivity patterns
- **Cross-Subsystem Analysis**: Integration patterns, dependency flows
- **Hub-Spoke Architecture**: Cross-cluster communication and deployment patterns  
- **Critical Path Analysis**: Root components, dependency chains, bottlenecks
- **Enterprise Features**: Addons, Global Hub, Submariner networking
- **Operational Queries**: Operators, controllers, APIs
- **Troubleshooting**: Component search, neighborhood analysis
- **Application Lifecycle Models**: Subscription, ArgoCD Push, and ArgoCD Pull deployment patterns

### Example Queries
```cypher
// Most Connected Components (Hub Analysis)
MATCH (n:RHACMComponent)
OPTIONAL MATCH (n)-[r_out]->()
OPTIONAL MATCH ()-[r_in]->(n)
RETURN n.label as Component, n.subsystem as Subsystem,
       count(DISTINCT r_out) + count(DISTINCT r_in) as TotalConnections
ORDER BY TotalConnections DESC LIMIT 10;

// Cross-Subsystem Integration Matrix
MATCH (source:RHACMComponent)-[r]->(target:RHACMComponent)
WHERE source.subsystem <> target.subsystem
RETURN source.subsystem as SourceSubsystem, 
       target.subsystem as TargetSubsystem,
       count(r) as Dependencies
ORDER BY Dependencies DESC;
```

> 💡 **Tip**: Use `knowledge-graph/sample_queries.cypher` for complete analytics suite with 30+ queries

## 🏭 Enterprise Features

- **Multicluster Global Hub** - Multi-hub federation and management
- **Submariner** - Cross-cluster networking and service discovery
- **OADP Backup** - Velero-based cluster backup and disaster recovery
- **Red Hat Insights** - Cluster health monitoring and recommendations
- **CAPI Integration** - Cluster API provider support
- **AWX Automation** - Ansible automation platform integration

## 🔗 Component Verification

All components are verified against official repositories:
- [stolostron organization](https://github.com/stolostron) - 100+ repositories analyzed
- [open-cluster-management-io](https://github.com/open-cluster-management-io) - OCM foundation
- [Red Hat official documentation](https://access.redhat.com/documentation/en-us/red_hat_advanced_cluster_management_for_kubernetes)

## 🛠️ Development

### Generate New Architecture
```bash
# Convert Mermaid files to Cypher
python mermaid_to_cypher.py

# Import to Neo4j
cat knowledge-graph/rhacm_architecture_comprehensive_final.cypher | cypher-shell

# Run sample analytics queries
cat knowledge-graph/sample_queries.cypher | cypher-shell
```

### Add New Components
1. Update relevant `mermaid/rhacm-*.mmd` file with semantic relationships
2. Run conversion tool to generate updated Cypher
3. Update documentation with new metrics

### Enhanced Observability Implementation
For reproducing the enhanced observability architecture:

#### 1. Source Diagrams Required
Ensure you have these observability diagrams in `diagrams/` folder:
- `rhacm_observability_components_architecture.png`
- `rhacm_observability_bootstrapping_hub.png` 
- `rhacm_observability_bootstrapping_managed.png`
- `rhacm_observability_metrics_collection_alert_forwarding.png`
- `rhacm_observability_status_propagation.png`

#### 2. Key Enhancement Areas
- **Component Separation**: Separate combined components (e.g., "metrics collector/uwl metrics collector" → separate components)
- **Bootstrap Sequences**: Map exact hub and managed cluster bootstrap flows from diagrams
- **Metrics Collection**: Detailed data flows from exporters through Prometheus to Thanos
- **Status Propagation**: Cross-cluster status synchronization patterns
- **External Integrations**: Victoria Metrics, Kafka, and third-party tool export paths

#### 3. Critical Implementation Notes
- **No Combined Components**: Each component from diagrams must be separate (avoid "component1/component2" naming)
- **Exact Component Names**: Match casing and spacing from PNG diagrams exactly (e.g., "MultiCluster Observability Operator")
- **Bootstrap Flow Accuracy**: Follow precise creation sequences shown in bootstrap diagrams
- **Duplicate Removal**: Ensure no duplicate components (e.g., multiple THANOS entries)

#### 4. Validation Process
1. Cross-reference each PNG diagram component-by-component against mermaid file
2. Verify all relationship flows match diagram arrows
3. Confirm no missing components from any diagram
4. Test that component names match exactly (including casing)
5. **Resolve duplicate labels** by adding disambiguating suffixes (e.g., "Component (Context)")
6. **Validate Neo4j syntax** by ensuring relationship labels don't contain parentheses or problematic spaces
   - Transform `create (loop for all...)` → `create_for_managed_clusters`
   - Transform `send metrics (remote write API)` → `send_metrics_remote_write`
   - Transform `forward metrics (if configured)` → `forward_metrics_if_configured`
   - Transform `scrape metrics` → `scrape_metrics`
   - Transform `forward alerts` → `forward_alerts`
   - Transform `update status` → `update_status`

## 📈 Coverage

- **Subsystems**: 7 major areas
- **Addon Coverage**: Complete (100%)
- **Cross-cluster Relationships**: Full hub-spoke patterns
- **Verified Repositories**: 100+ official repositories analyzed

## 🤝 Contributing

This architecture graph is based on systematic analysis of official RHACM repositories. To contribute:

1. Verify new components against official GitHub repositories
2. Use semantic relationship labels (avoid generic arrows)
3. Maintain ACM-centric hierarchical architecture
4. Update documentation with new component metrics

## 📄 License

This project documents the architecture of Red Hat Advanced Cluster Management, which is Red Hat's commercial product. The dependency graph and documentation are provided for architectural analysis and educational purposes.

## 🤖 MCP Server Integration

This knowledge graph is designed for use with Claude via MCP (Model Context Protocol) servers. The `mcp_sample_questions.md` file contains comprehensive sample questions to showcase the graph capabilities:

- **Architecture Discovery**: Component relationships and dependencies
- **Integration Analysis**: Cross-subsystem communication patterns  
- **Troubleshooting**: Impact analysis and failure scenarios
- **Enterprise Features**: Global Hub, Submariner, backup/recovery
- **Operational Insights**: Performance, security, and scalability analysis

## 🔍 Related Projects

- [Open Cluster Management](https://open-cluster-management.io/) - Upstream community project
- [stolostron](https://github.com/stolostron) - Official RHACM repositories
- [RHACM Documentation](https://access.redhat.com/documentation/en-us/red_hat_advanced_cluster_management_for_kubernetes)