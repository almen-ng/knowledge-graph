// RHACM Comprehensive Architecture Graph - Neo4j Import Script
// Generated from Mermaid dependency graphs
// 
// This script creates a unified graph of RHACM components and their dependencies
// across all major subsystems: Governance, Application Lifecycle, Observability,
// Cluster Management, Search, and Console
//
// Usage: 
//   1. Clear existing data: MATCH (n) DETACH DELETE n;
//   2. Run this script in Neo4j Browser or cypher-shell
//   3. Verify with queries at the end of this script

// Clear existing RHACM data (uncomment if needed)
// MATCH (n:RHACMComponent) DETACH DELETE n;

// Schema Setup: Constraints and Indexes
CREATE CONSTRAINT rhacm_component_id IF NOT EXISTS
FOR (n:RHACMComponent) REQUIRE n.id IS UNIQUE;

CREATE INDEX rhacm_subsystem_index IF NOT EXISTS
FOR (n:RHACMComponent) ON (n.subsystem);

CREATE INDEX rhacm_type_index IF NOT EXISTS
FOR (n:RHACMComponent) ON (n.type);

CREATE INDEX rhacm_label_index IF NOT EXISTS
FOR (n:RHACMComponent) ON (n.label);

// Node Creation - RHACM Components
CREATE (:RHACMComponent:Overview:Component:Foundation {id: 'OCP', label: 'OpenShift Container Platform', subsystem: 'Overview', type: 'Component', description: 'Overview component: OpenShift Container Platform'});
CREATE (:RHACMComponent:Overview:API:Foundation {id: 'K8S', label: 'Kubernetes API Server', subsystem: 'Overview', type: 'API', description: 'Overview component: Kubernetes API Server'});
CREATE (:RHACMComponent:Overview:Cluster:Foundation {id: 'ETCD', label: 'etcd Cluster', subsystem: 'Overview', type: 'Cluster', description: 'Overview component: etcd Cluster'});
CREATE (:RHACMComponent:Overview:Cluster {id: 'ACM', label: 'Red Hat Advanced Cluster Management', subsystem: 'Overview', type: 'Cluster', description: 'Overview component: Red Hat Advanced Cluster Management'});
CREATE (:RHACMComponent:Overview:Cluster {id: 'OCM', label: 'Open Cluster Management', subsystem: 'Overview', type: 'Cluster', description: 'Overview component: Open Cluster Management'});
CREATE (:RHACMComponent:Overview:Cluster:Foundation {id: 'HUB', label: 'ACM Hub Cluster', subsystem: 'Overview', type: 'Cluster', description: 'Overview component: ACM Hub Cluster'});
CREATE (:RHACMComponent:Overview:Cluster {id: 'SPOKE', label: 'Managed Clusters', subsystem: 'Overview', type: 'Cluster', description: 'Overview component: Managed Clusters'});
CREATE (:RHACMComponent:Overview:API:Channels {id: 'OCM_API', label: 'Open Cluster Management API', subsystem: 'Overview', type: 'API', description: 'Overview component: Open Cluster Management API'});
CREATE (:RHACMComponent:Overview:API:Foundation {id: 'CLUSTER_LIFECYCLE_API', label: 'cluster-lifecycle-api', subsystem: 'Overview', type: 'API', description: 'Overview component: cluster-lifecycle-api'});
CREATE (:RHACMComponent:Overview:Cluster {id: 'MCE', label: 'Multicluster Engine', subsystem: 'Overview', type: 'Cluster', description: 'Overview component: Multicluster Engine'});
CREATE (:RHACMComponent:Overview:Operator:Foundation {id: 'BACKPLANE_OPERATOR', label: 'Backplane Operator', subsystem: 'Overview', type: 'Operator', description: 'Overview component: Backplane Operator'});
CREATE (:RHACMComponent:Overview:Cluster:Foundation {id: 'CLUSTER_MANAGER', label: 'Cluster Manager', subsystem: 'Overview', type: 'Cluster', description: 'Overview component: Cluster Manager'});
CREATE (:RHACMComponent:Overview:Component:Foundation {id: 'KLUSTERLET', label: 'Klusterlet', subsystem: 'Overview', type: 'Component', description: 'Overview component: Klusterlet'});
CREATE (:RHACMComponent:Overview:Component {id: 'REGISTRATION_WEBHOOK', label: 'Registration Webhook', subsystem: 'Overview', type: 'Component', description: 'Overview component: Registration Webhook'});
CREATE (:RHACMComponent:Overview:Component {id: 'GRC', label: 'Governance Risk & Compliance', subsystem: 'Overview', type: 'Component', description: 'Overview component: Governance Risk & Compliance'});
CREATE (:RHACMComponent:Overview:Application:Foundation {id: 'APP', label: 'Application Lifecycle', subsystem: 'Overview', type: 'Application', description: 'Overview component: Application Lifecycle'});
CREATE (:RHACMComponent:Overview:Component:Foundation {id: 'OBS', label: 'Observability', subsystem: 'Overview', type: 'Component', description: 'Overview component: Observability'});
CREATE (:RHACMComponent:Overview:Cluster:Foundation {id: 'CLUSTER', label: 'Cluster Lifecycle', subsystem: 'Overview', type: 'Cluster', description: 'Overview component: Cluster Lifecycle'});
CREATE (:RHACMComponent:Overview:Search:Foundation {id: 'SEARCH', label: 'Search & Discovery', subsystem: 'Overview', type: 'Search', description: 'Overview component: Search & Discovery'});
CREATE (:RHACMComponent:Overview:Component:Advanced {id: 'CONSOLE', label: 'Web Console', subsystem: 'Overview', type: 'Component', description: 'Overview component: Web Console'});
CREATE (:RHACMComponent:Overview:Component {id: 'SERVER_FOUNDATION', label: 'Server Foundation', subsystem: 'Overview', type: 'Component', description: 'Overview component: Server Foundation'});
CREATE (:RHACMComponent:Overview:Cluster {id: 'GLOBAL_HUB', label: 'Multicluster Global Hub', subsystem: 'Overview', type: 'Cluster', description: 'Overview component: Multicluster Global Hub'});
CREATE (:RHACMComponent:Overview:Component:Foundation {id: 'SUBMARINER', label: 'Submariner Network Connectivity', subsystem: 'Overview', type: 'Component', description: 'Overview component: Submariner Network Connectivity'});
CREATE (:RHACMComponent:Overview:Component {id: 'BACKUP_RESTORE', label: 'Backup & Disaster Recovery', subsystem: 'Overview', type: 'Component', description: 'Overview component: Backup & Disaster Recovery'});
CREATE (:RHACMComponent:Overview:Operator {id: 'FOUNDATION', label: 'multicloud-operators-foundation', subsystem: 'Overview', type: 'Operator', description: 'Overview component: multicloud-operators-foundation'});
CREATE (:RHACMComponent:Overview:Cluster:Controller {id: 'REGISTRATION', label: 'Cluster Registration', subsystem: 'Overview', type: 'Cluster', description: 'Overview component: Cluster Registration'});
CREATE (:RHACMComponent:Overview:Component:Controller {id: 'WORK', label: 'Work Management', subsystem: 'Overview', type: 'Component', description: 'Overview component: Work Management'});
CREATE (:RHACMComponent:Overview:Component:Controller {id: 'ADDON', label: 'Addon Framework', subsystem: 'Overview', type: 'Component', description: 'Overview component: Addon Framework'});
CREATE (:RHACMComponent:Overview:Controller:Controller {id: 'MANAGEDCLUSTER_IMPORT_CTRL', label: 'managedcluster-import-controller', subsystem: 'Overview', type: 'Controller', description: 'Overview component: managedcluster-import-controller'});
CREATE (:RHACMComponent:Overview:Controller {id: 'KLUSTERLET_ADDON_CTRL', label: 'klusterlet-addon-controller', subsystem: 'Overview', type: 'Controller', description: 'Overview component: klusterlet-addon-controller'});
CREATE (:RHACMComponent:Overview:Cluster {id: 'CLUSTERLIFECYCLE_STATE_METRICS', label: 'clusterlifecycle-state-metrics', subsystem: 'Overview', type: 'Cluster', description: 'Overview component: clusterlifecycle-state-metrics'});
CREATE (:RHACMComponent:Overview:Component:Hypershift {id: 'MANAGED_SERVICEACCOUNT', label: 'managed-serviceaccount', subsystem: 'Overview', type: 'Component', description: 'Overview component: managed-serviceaccount'});
CREATE (:RHACMComponent:Overview:Cluster:Hypershift {id: 'CLUSTER_PROXY', label: 'cluster-proxy', subsystem: 'Overview', type: 'Cluster', description: 'Overview component: cluster-proxy'});
CREATE (:RHACMComponent:Overview:Cluster:Hypershift {id: 'CLUSTER_PROXY_ADDON', label: 'cluster-proxy-addon', subsystem: 'Overview', type: 'Cluster', description: 'Overview component: cluster-proxy-addon'});
CREATE (:RHACMComponent:Overview:Operator {id: 'HIVE', label: 'Hive Operator', subsystem: 'Overview', type: 'Operator', description: 'Overview component: Hive Operator'});
CREATE (:RHACMComponent:Overview:Component:Foundation {id: 'ARGO', label: 'ArgoCD', subsystem: 'Overview', type: 'Component', description: 'Overview component: ArgoCD'});
CREATE (:RHACMComponent:Overview:Observability {id: 'PROMETHEUS', label: 'Prometheus Stack', subsystem: 'Overview', type: 'Observability', description: 'Overview component: Prometheus Stack'});
CREATE (:RHACMComponent:Overview:Operator:Foundation {id: 'AWX_OPERATOR', label: 'AWX Operator', subsystem: 'Overview', type: 'Operator', description: 'Overview component: AWX Operator'});
CREATE (:RHACMComponent:Overview:Operator {id: 'AWX_RESOURCE_OPERATOR', label: 'AWX Resource Operator', subsystem: 'Overview', type: 'Operator', description: 'Overview component: AWX Resource Operator'});
CREATE (:RHACMComponent:Overview:Controller {id: 'AWX_INSTANCE_CONTROLLER', label: 'AWX Instance Controller', subsystem: 'Overview', type: 'Controller', description: 'Overview component: AWX Instance Controller'});
CREATE (:RHACMComponent:Overview:Controller:Foundation {id: 'AWX_MESHINGRESS_CONTROLLER', label: 'AWXMeshIngress Controller', subsystem: 'Overview', type: 'Controller', description: 'Overview component: AWXMeshIngress Controller'});
CREATE (:RHACMComponent:Overview:Controller:Foundation {id: 'ANSIBLE_JOB_CONTROLLER', label: 'AnsibleJob Controller', subsystem: 'Overview', type: 'Controller', description: 'Overview component: AnsibleJob Controller'});
CREATE (:RHACMComponent:Overview:Controller {id: 'JOB_TEMPLATE_CONTROLLER', label: 'JobTemplate Controller', subsystem: 'Overview', type: 'Controller', description: 'Overview component: JobTemplate Controller'});
CREATE (:RHACMComponent:Overview:Component:Hypershift {id: 'ANSIBLE_JOB_CRD', label: 'AnsibleJob CRD', subsystem: 'Overview', type: 'Component', description: 'Overview component: AnsibleJob CRD'});
CREATE (:RHACMComponent:Overview:Component {id: 'JOB_TEMPLATE_CRD', label: 'JobTemplate CRD', subsystem: 'Overview', type: 'Component', description: 'Overview component: JobTemplate CRD'});
CREATE (:RHACMComponent:Overview:Operator {id: 'GLOBAL_HUB_OPERATOR', label: 'Global Hub Operator', subsystem: 'Overview', type: 'Operator', description: 'Overview component: Global Hub Operator'});
CREATE (:RHACMComponent:Overview:Component:Foundation {id: 'GLOBAL_HUB_MANAGER', label: 'Global Hub Manager', subsystem: 'Overview', type: 'Component', description: 'Overview component: Global Hub Manager'});
CREATE (:RHACMComponent:Overview:Component:Foundation {id: 'GLOBAL_HUB_AGENT', label: 'Global Hub Agent', subsystem: 'Overview', type: 'Component', description: 'Overview component: Global Hub Agent'});
CREATE (:RHACMComponent:Overview:Component:Foundation {id: 'TRANSPORT_BRIDGE', label: 'Transport Bridge', subsystem: 'Overview', type: 'Component', description: 'Overview component: Transport Bridge'});
CREATE (:RHACMComponent:Overview:Component:Foundation {id: 'KAFKA_TRANSPORT', label: 'Kafka Transport', subsystem: 'Overview', type: 'Component', description: 'Overview component: Kafka Transport'});
CREATE (:RHACMComponent:Overview:Component:Foundation {id: 'POSTGRES_STORAGE', label: 'PostgreSQL Storage Backend', subsystem: 'Overview', type: 'Component', description: 'Overview component: PostgreSQL Storage Backend'});
CREATE (:RHACMComponent:Overview:Observability {id: 'GLOBAL_HUB_GRAFANA', label: 'Global Hub Grafana', subsystem: 'Overview', type: 'Observability', description: 'Overview component: Global Hub Grafana'});
CREATE (:RHACMComponent:Overview:Operator {id: 'SUBMARINER_OPERATOR', label: 'Submariner Operator', subsystem: 'Overview', type: 'Operator', description: 'Overview component: Submariner Operator'});
CREATE (:RHACMComponent:Overview:Component:Foundation {id: 'SUBMARINER_GATEWAY', label: 'Submariner Gateway', subsystem: 'Overview', type: 'Component', description: 'Overview component: Submariner Gateway'});
CREATE (:RHACMComponent:Overview:Component:Foundation {id: 'SUBMARINER_ROUTE_AGENT', label: 'Submariner Route Agent', subsystem: 'Overview', type: 'Component', description: 'Overview component: Submariner Route Agent'});
CREATE (:RHACMComponent:Overview:Component:Foundation {id: 'LIGHTHOUSE_AGENT', label: 'Lighthouse Agent', subsystem: 'Overview', type: 'Component', description: 'Overview component: Lighthouse Agent'});
CREATE (:RHACMComponent:Overview:Component:Foundation {id: 'LIGHTHOUSE_COREDNS', label: 'Lighthouse CoreDNS', subsystem: 'Overview', type: 'Component', description: 'Overview component: Lighthouse CoreDNS'});
CREATE (:RHACMComponent:Overview:Controller:Foundation {id: 'GLOBALNET_CONTROLLER', label: 'Globalnet Controller', subsystem: 'Overview', type: 'Controller', description: 'Overview component: Globalnet Controller'});
CREATE (:RHACMComponent:Overview:Component {id: 'SUBCTL_CLI', label: 'Subctl CLI', subsystem: 'Overview', type: 'Component', description: 'Overview component: Subctl CLI'});
CREATE (:RHACMComponent:Overview:Operator {id: 'OADP_OPERATOR', label: 'OADP Operator', subsystem: 'Overview', type: 'Operator', description: 'Overview component: OADP Operator'});
CREATE (:RHACMComponent:Overview:Controller:Foundation {id: 'VELERO_BACKUP_CONTROLLER', label: 'Velero Backup Controller', subsystem: 'Overview', type: 'Controller', description: 'Overview component: Velero Backup Controller'});
CREATE (:RHACMComponent:Overview:Controller:Foundation {id: 'VOLUME_SNAPSHOT_CONTROLLER', label: 'Volume Snapshot Controller', subsystem: 'Overview', type: 'Controller', description: 'Overview component: Volume Snapshot Controller'});
CREATE (:RHACMComponent:Overview:Cluster:Foundation {id: 'CLUSTER_BACKUP_SCHEDULE', label: 'Cluster Backup Schedule', subsystem: 'Overview', type: 'Cluster', description: 'Overview component: Cluster Backup Schedule'});
CREATE (:RHACMComponent:Overview:Component {id: 'BACKUP_STORAGE_LOCATION', label: 'Backup Storage Location', subsystem: 'Overview', type: 'Component', description: 'Overview component: Backup Storage Location'});
CREATE (:RHACMComponent:Overview:API {id: 'CAPI_PROVIDER_INTEGRATION', label: 'Cluster API Provider Integration', subsystem: 'Overview', type: 'API', description: 'Overview component: Cluster API Provider Integration'});
CREATE (:RHACMComponent:Overview:Component:Foundation {id: 'INFRASTRUCTURE_PROVIDER_MANAGER', label: 'Infrastructure Provider Manager', subsystem: 'Overview', type: 'Component', description: 'Overview component: Infrastructure Provider Manager'});
CREATE (:RHACMComponent:Overview:Cluster:Foundation {id: 'CLUSTER_PROVISIONING_ENGINE', label: 'Cluster Provisioning Engine', subsystem: 'Overview', type: 'Cluster', description: 'Overview component: Cluster Provisioning Engine'});
CREATE (:RHACMComponent:Overview:Component:Foundation {id: 'BOOTSTRAP_CONFIG_MANAGER', label: 'Bootstrap Configuration Manager', subsystem: 'Overview', type: 'Component', description: 'Overview component: Bootstrap Configuration Manager'});
CREATE (:RHACMComponent:Overview:Component {id: 'CONTROL_PLANE_MANAGER', label: 'Control Plane Manager', subsystem: 'Overview', type: 'Component', description: 'Overview component: Control Plane Manager'});
CREATE (:RHACMComponent:Overview:Operator {id: 'INSIGHTS_OPERATOR_INTEGRATION', label: 'Insights Operator Integration', subsystem: 'Overview', type: 'Operator', description: 'Overview component: Insights Operator Integration'});
CREATE (:RHACMComponent:Overview:Cluster:Foundation {id: 'CLUSTER_HEALTH_COLLECTOR', label: 'Cluster Health Collector', subsystem: 'Overview', type: 'Cluster', description: 'Overview component: Cluster Health Collector'});
CREATE (:RHACMComponent:Overview:Component:Foundation {id: 'COMPLIANCE_INSIGHTS_ENGINE', label: 'Compliance Insights Engine', subsystem: 'Overview', type: 'Component', description: 'Overview component: Compliance Insights Engine'});
CREATE (:RHACMComponent:Overview:Cluster:Foundation {id: 'CLUSTER_ADVISOR_INTEGRATION', label: 'Cluster Advisor Integration', subsystem: 'Overview', type: 'Cluster', description: 'Overview component: Cluster Advisor Integration'});
CREATE (:RHACMComponent:Overview:Component {id: 'INSIGHTS_REMEDIATION_ENGINE', label: 'Insights Remediation Engine', subsystem: 'Overview', type: 'Component', description: 'Overview component: Insights Remediation Engine'});
CREATE (:RHACMComponent:Overview:Operator:Controller {id: 'MULTICLOUD_OPS_SUBSCRIPTION', label: 'multicloud-operators-subscription', subsystem: 'Overview', type: 'Operator', description: 'Overview component: multicloud-operators-subscription'});
CREATE (:RHACMComponent:Overview:Component:Crd {id: 'MULTICLOUD_INTEGRATIONS', label: 'multicloud-integrations', subsystem: 'Overview', type: 'Component', description: 'Overview component: multicloud-integrations'});
CREATE (:RHACMComponent:Overview:Component:Controller {id: 'ARGOCD_PULL_INTEGRATION', label: 'argocd-pull-integration', subsystem: 'Overview', type: 'Component', description: 'Overview component: argocd-pull-integration'});
CREATE (:RHACMComponent:Overview:Operator:Foundation {id: 'GITOPS_OPERATOR', label: 'OpenShift GitOps Operator', subsystem: 'Overview', type: 'Operator', description: 'Overview component: OpenShift GitOps Operator'});
CREATE (:RHACMComponent:Overview:Policy:Management {id: 'GOV_POLICY_PROP', label: 'governance-policy-propagator', subsystem: 'Overview', type: 'Policy', description: 'Overview component: governance-policy-propagator'});
CREATE (:RHACMComponent:Overview:Controller:Diagnostics {id: 'CONFIG_POLICY_CTRL', label: 'config-policy-controller', subsystem: 'Overview', type: 'Controller', description: 'Overview component: config-policy-controller'});
CREATE (:RHACMComponent:Overview:Operator:Gatekeeper {id: 'GATEKEEPER_OP', label: 'gatekeeper-operator', subsystem: 'Overview', type: 'Operator', description: 'Overview component: gatekeeper-operator'});
CREATE (:RHACMComponent:Overview:Policy:Management {id: 'GOV_POLICY_FRAMEWORK', label: 'governance-policy-framework', subsystem: 'Overview', type: 'Policy', description: 'Overview component: governance-policy-framework'});
CREATE (:RHACMComponent:Overview:Controller:Diagnostics {id: 'CERT_POLICY_CTRL', label: 'cert-policy-controller', subsystem: 'Overview', type: 'Controller', description: 'Overview component: cert-policy-controller'});
CREATE (:RHACMComponent:Overview:Controller:Diagnostics {id: 'IAM_POLICY_CTRL', label: 'iam-policy-controller', subsystem: 'Overview', type: 'Controller', description: 'Overview component: iam-policy-controller'});
CREATE (:RHACMComponent:Overview:Policy:Cli_Distribution {id: 'POLICY_GEN', label: 'policy-generator-plugin', subsystem: 'Overview', type: 'Policy', description: 'Overview component: policy-generator-plugin'});
CREATE (:RHACMComponent:Overview:Controller:Management {id: 'GOV_POLICY_ADDON_CTRL', label: 'governance-policy-addon-controller', subsystem: 'Overview', type: 'Controller', description: 'Overview component: governance-policy-addon-controller'});
CREATE (:RHACMComponent:Overview:Controller:Hypershift {id: 'CLUSTER_CURATOR_CTRL', label: 'cluster-curator-controller', subsystem: 'Overview', type: 'Controller', description: 'Overview component: cluster-curator-controller'});
CREATE (:RHACMComponent:Overview:Cluster:Controller {id: 'CLUSTER_PERMISSION', label: 'cluster-permission', subsystem: 'Overview', type: 'Cluster', description: 'Overview component: cluster-permission'});
CREATE (:RHACMComponent:Overview:Controller:Controller {id: 'PROVIDER_CREDENTIAL_CTRL', label: 'provider-credential-controller', subsystem: 'Overview', type: 'Controller', description: 'Overview component: provider-credential-controller'});
CREATE (:RHACMComponent:Overview:Controller:Hypershift {id: 'CLUSTER_IMAGESET_CTRL', label: 'cluster-image-set-controller', subsystem: 'Overview', type: 'Controller', description: 'Overview component: cluster-image-set-controller'});
CREATE (:RHACMComponent:Overview:Controller:Controller {id: 'CLUSTERCLAIMS_CTRL', label: 'clusterclaims-controller', subsystem: 'Overview', type: 'Controller', description: 'Overview component: clusterclaims-controller'});
CREATE (:RHACMComponent:Overview:Operator {id: 'HYPERSHIFT_ADDON_OP', label: 'hypershift-addon-operator', subsystem: 'Overview', type: 'Operator', description: 'Overview component: hypershift-addon-operator'});
CREATE (:RHACMComponent:Overview:Operator:Thanos {id: 'MCO_OPERATOR', label: 'multicluster-observability-operator', subsystem: 'Overview', type: 'Operator', description: 'Overview component: multicluster-observability-operator'});
CREATE (:RHACMComponent:Overview:Operator:Controller {id: 'PROMETHEUS_OP', label: 'prometheus-operator', subsystem: 'Overview', type: 'Operator', description: 'Overview component: prometheus-operator'});
CREATE (:RHACMComponent:Overview:Observability:Controller {id: 'GRAFANA', label: 'grafana', subsystem: 'Overview', type: 'Observability', description: 'Overview component: grafana'});
CREATE (:RHACMComponent:Overview:Operator {id: 'SEARCH_V2_OPERATOR', label: 'search-v2-operator', subsystem: 'Overview', type: 'Operator', description: 'Overview component: search-v2-operator'});
CREATE (:RHACMComponent:Overview:Search:Controller {id: 'SEARCH_INDEXER', label: 'search-indexer', subsystem: 'Overview', type: 'Search', description: 'Overview component: search-indexer'});
CREATE (:RHACMComponent:Overview:Search:Controller {id: 'SEARCH_COLLECTOR', label: 'search-collector', subsystem: 'Overview', type: 'Search', description: 'Overview component: search-collector'});
CREATE (:RHACMComponent:Overview:API {id: 'SEARCH_V2_API', label: 'search-v2-api', subsystem: 'Overview', type: 'API', description: 'Overview component: search-v2-api'});
CREATE (:RHACMComponent:Overview:Component {id: 'CONSOLE_COMPONENT', label: 'console', subsystem: 'Overview', type: 'Component', description: 'Overview component: console'});
CREATE (:RHACMComponent:Overview:API {id: 'CONSOLE_API', label: 'console-api', subsystem: 'Overview', type: 'API', description: 'Overview component: console-api'});
CREATE (:RHACMComponent:Overview:Operator:Thanos {id: 'OBSERVATORIUM_OP', label: 'observatorium-operator', subsystem: 'Overview', type: 'Operator', description: 'Overview component: observatorium-operator'});
CREATE (:RHACMComponent:Overview:Component:Thanos {id: 'OBSERVATORIUM', label: 'observatorium', subsystem: 'Overview', type: 'Component', description: 'Overview component: observatorium'});
CREATE (:RHACMComponent:Overview:Observability:Thanos {id: 'THANOS', label: 'thanos', subsystem: 'Overview', type: 'Observability', description: 'Overview component: thanos'});
CREATE (:RHACMComponent:Overview:Observability {id: 'KUBE_THANOS', label: 'kube-thanos', subsystem: 'Overview', type: 'Observability', description: 'Overview component: kube-thanos'});
CREATE (:RHACMComponent:Overview:Operator {id: 'REGISTRATION_OPERATOR', label: 'registration-operator', subsystem: 'Overview', type: 'Operator', description: 'Overview component: registration-operator'});
CREATE (:RHACMComponent:Overview:Component:Controller {id: 'PLACEMENT', label: 'placement', subsystem: 'Overview', type: 'Component', description: 'Overview component: placement'});
CREATE (:RHACMComponent:Overview:Component:Controller {id: 'WORK_FRAMEWORK', label: 'work', subsystem: 'Overview', type: 'Component', description: 'Overview component: work'});
CREATE (:RHACMComponent:Overview:Component:Controller {id: 'ADDON_FRAMEWORK', label: 'addon-framework', subsystem: 'Overview', type: 'Component', description: 'Overview component: addon-framework'});
CREATE (:RHACMComponent:Governance:Policy:Cli_Distribution {id: 'POLICY_CLI', label: 'policy-cli', subsystem: 'Governance', type: 'Policy', description: 'Governance component: policy-cli'});
CREATE (:RHACMComponent:Governance:Component:Cli_Distribution {id: 'ACM_CLI', label: 'acm-cli', subsystem: 'Governance', type: 'Component', description: 'Governance component: acm-cli'});
CREATE (:RHACMComponent:Governance:Policy:Management {id: 'POLICY_COLLECTION', label: 'policy-collection', subsystem: 'Governance', type: 'Policy', description: 'Governance component: policy-collection'});
CREATE (:RHACMComponent:Governance:Component {id: 'CLI_DISTRIBUTION_SERVER', label: 'ACM CLI Distribution Server', subsystem: 'Governance', type: 'Component', description: 'Governance component: ACM CLI Distribution Server'});
CREATE (:RHACMComponent:Governance:Component:Cli_Distribution {id: 'CLI_BINARY_AGGREGATOR', label: 'CLI Binary Aggregator', subsystem: 'Governance', type: 'Component', description: 'Governance component: CLI Binary Aggregator'});
CREATE (:RHACMComponent:Governance:Component:Cli_Distribution {id: 'CLI_PACKAGER', label: 'CLI Packager', subsystem: 'Governance', type: 'Component', description: 'Governance component: CLI Packager'});
CREATE (:RHACMComponent:Governance:Policy:Cli_Distribution {id: 'POLICY_GENERATOR_CLI', label: 'Policy Generator CLI', subsystem: 'Governance', type: 'Policy', description: 'Governance component: Policy Generator CLI'});
CREATE (:RHACMComponent:Governance:Component:Cli_Distribution {id: 'CONSOLE_CLI_DOWNLOAD', label: 'ConsoleCLIDownload Integration', subsystem: 'Governance', type: 'Component', description: 'Governance component: ConsoleCLIDownload Integration'});
CREATE (:RHACMComponent:Governance:Policy:Cli_Distribution {id: 'POLICY_GENERATOR_CR', label: 'PolicyGenerator Custom Resource', subsystem: 'Governance', type: 'Policy', description: 'Governance component: PolicyGenerator Custom Resource'});
CREATE (:RHACMComponent:Governance:Component:Cli_Distribution {id: 'PLUGIN_PROCESSING_ENGINE', label: 'Plugin Processing Engine', subsystem: 'Governance', type: 'Component', description: 'Governance component: Plugin Processing Engine'});
CREATE (:RHACMComponent:Governance:Policy {id: 'POLICY_EXPANDERS', label: 'Policy Expanders System', subsystem: 'Governance', type: 'Policy', description: 'Governance component: Policy Expanders System'});
CREATE (:RHACMComponent:Governance:Policy:Reconcilers {id: 'ROOT_POLICY_RECONCILER', label: 'RootPolicyReconciler', subsystem: 'Governance', type: 'Policy', description: 'Governance component: RootPolicyReconciler'});
CREATE (:RHACMComponent:Governance:Policy:Reconcilers {id: 'REPLICATED_POLICY_RECONCILER', label: 'ReplicatedPolicyReconciler', subsystem: 'Governance', type: 'Policy', description: 'Governance component: ReplicatedPolicyReconciler'});
CREATE (:RHACMComponent:Governance:Policy:Reconcilers {id: 'ROOT_POLICY_STATUS_RECONCILER', label: 'RootPolicyStatusReconciler', subsystem: 'Governance', type: 'Policy', description: 'Governance component: RootPolicyStatusReconciler'});
CREATE (:RHACMComponent:Governance:Policy:Reconcilers {id: 'POLICY_SET_RECONCILER', label: 'PolicySetReconciler', subsystem: 'Governance', type: 'Policy', description: 'Governance component: PolicySetReconciler'});
CREATE (:RHACMComponent:Governance:Policy:Reconcilers {id: 'POLICY_AUTOMATION_RECONCILER', label: 'PolicyAutomationReconciler', subsystem: 'Governance', type: 'Policy', description: 'Governance component: PolicyAutomationReconciler'});
CREATE (:RHACMComponent:Governance:Component:Reconcilers {id: 'ENCRYPTION_KEYS_RECONCILER', label: 'EncryptionKeysReconciler', subsystem: 'Governance', type: 'Component', description: 'Governance component: EncryptionKeysReconciler'});
CREATE (:RHACMComponent:Governance:Component:Management {id: 'ADDON_FACTORY', label: 'Addon Factory Pattern', subsystem: 'Governance', type: 'Component', description: 'Governance component: Addon Factory Pattern'});
CREATE (:RHACMComponent:Governance:Component:Management {id: 'ADDON_MANAGER', label: 'Addon Manager', subsystem: 'Governance', type: 'Component', description: 'Governance component: Addon Manager'});
CREATE (:RHACMComponent:Governance:Component:Addons {id: 'GOV_STANDALONE_HUB_TEMPLATING', label: 'governance-standalone-hub-templating', subsystem: 'Governance', type: 'Component', description: 'Governance component: governance-standalone-hub-templating'});
CREATE (:RHACMComponent:Governance:Controller:Controllers {id: 'SPEC_SYNC_CTRL', label: 'Spec Sync Controller', subsystem: 'Governance', type: 'Controller', description: 'Governance component: Spec Sync Controller'});
CREATE (:RHACMComponent:Governance:Controller:Controllers {id: 'STATUS_SYNC_CTRL', label: 'Status Sync Controller', subsystem: 'Governance', type: 'Controller', description: 'Governance component: Status Sync Controller'});
CREATE (:RHACMComponent:Governance:Controller:Controllers {id: 'TEMPLATE_SYNC_CTRL', label: 'Template Sync Controller', subsystem: 'Governance', type: 'Controller', description: 'Governance component: Template Sync Controller'});
CREATE (:RHACMComponent:Governance:Controller:Controllers {id: 'SECRET_SYNC_CTRL', label: 'Secret Sync Controller', subsystem: 'Governance', type: 'Controller', description: 'Governance component: Secret Sync Controller'});
CREATE (:RHACMComponent:Governance:Controller {id: 'GATEKEEPER_SYNC_CTRL', label: 'Gatekeeper Sync Controller', subsystem: 'Governance', type: 'Controller', description: 'Governance component: Gatekeeper Sync Controller'});
CREATE (:RHACMComponent:Governance:Policy {id: 'CONFIGURATION_POLICY_RECONCILER', label: 'ConfigurationPolicyReconciler', subsystem: 'Governance', type: 'Policy', description: 'Governance component: ConfigurationPolicyReconciler'});
CREATE (:RHACMComponent:Governance:Operator:Controllers {id: 'OPERATOR_POLICY_RECONCILER', label: 'OperatorPolicyReconciler', subsystem: 'Governance', type: 'Operator', description: 'Governance component: OperatorPolicyReconciler'});
CREATE (:RHACMComponent:Governance:Component:Diagnostics {id: 'DYNAMIC_WATCHER', label: 'Dynamic Watcher System', subsystem: 'Governance', type: 'Component', description: 'Governance component: Dynamic Watcher System'});
CREATE (:RHACMComponent:Governance:Component:Diagnostics {id: 'TEMPLATE_ENGINE', label: 'Template Engine', subsystem: 'Governance', type: 'Component', description: 'Governance component: Template Engine'});
CREATE (:RHACMComponent:Governance:Component {id: 'NAMESPACE_SELECTOR', label: 'Namespace Selector', subsystem: 'Governance', type: 'Component', description: 'Governance component: Namespace Selector'});
CREATE (:RHACMComponent:Governance:Component {id: 'TEMPLATE_PROCESSING_ENGINE', label: 'Template Processing Engine', subsystem: 'Governance', type: 'Component', description: 'Governance component: Template Processing Engine'});
CREATE (:RHACMComponent:Governance:Component:Diagnostics {id: 'HUB_DYNAMIC_WATCHER', label: 'Hub Dynamic Watcher', subsystem: 'Governance', type: 'Component', description: 'Governance component: Hub Dynamic Watcher'});
CREATE (:RHACMComponent:Governance:Component:Diagnostics {id: 'GOLANG_TEMPLATE_RESOLVER', label: 'Golang Template Resolver', subsystem: 'Governance', type: 'Component', description: 'Governance component: Golang Template Resolver'});
CREATE (:RHACMComponent:Governance:Component {id: 'TEMPLATE_ENCRYPTION_ENGINE', label: 'Template Encryption Engine', subsystem: 'Governance', type: 'Component', description: 'Governance component: Template Encryption Engine'});
CREATE (:RHACMComponent:Governance:Component {id: 'OBJECT_EVALUATOR', label: 'Object Evaluator', subsystem: 'Governance', type: 'Component', description: 'Governance component: Object Evaluator'});
CREATE (:RHACMComponent:Governance:Component:Diagnostics {id: 'NAMESPACE_SELECTOR_RECONCILER', label: 'Namespace Selector Reconciler', subsystem: 'Governance', type: 'Component', description: 'Governance component: Namespace Selector Reconciler'});
CREATE (:RHACMComponent:Governance:Component:Diagnostics {id: 'OLM_HANDLERS', label: 'OLM Resource Handlers', subsystem: 'Governance', type: 'Component', description: 'Governance component: OLM Resource Handlers'});
CREATE (:RHACMComponent:Governance:Component {id: 'FROM_SECRET_FUNC', label: 'fromSecret Template Function', subsystem: 'Governance', type: 'Component', description: 'Governance component: fromSecret Template Function'});
CREATE (:RHACMComponent:Governance:Component:Diagnostics {id: 'FROM_CONFIGMAP_FUNC', label: 'fromConfigMap Template Function', subsystem: 'Governance', type: 'Component', description: 'Governance component: fromConfigMap Template Function'});
CREATE (:RHACMComponent:Governance:Cluster:Diagnostics {id: 'FROM_CLUSTERCLAIM_FUNC', label: 'fromClusterClaim Template Function', subsystem: 'Governance', type: 'Cluster', description: 'Governance component: fromClusterClaim Template Function'});
CREATE (:RHACMComponent:Governance:Component:Diagnostics {id: 'LOOKUP_FUNC', label: 'Generic Lookup Template Function', subsystem: 'Governance', type: 'Component', description: 'Governance component: Generic Lookup Template Function'});
CREATE (:RHACMComponent:Governance:Component {id: 'SPRIG_FUNCTIONS', label: 'Sprig Template Functions', subsystem: 'Governance', type: 'Component', description: 'Governance component: Sprig Template Functions'});
CREATE (:RHACMComponent:Governance:Component {id: 'CERT_VALIDATION_ENGINE', label: 'Certificate Validation Engine', subsystem: 'Governance', type: 'Component', description: 'Governance component: Certificate Validation Engine'});
CREATE (:RHACMComponent:Governance:Component:Diagnostics {id: 'DURATION_VALIDATORS', label: 'Duration Validators', subsystem: 'Governance', type: 'Component', description: 'Governance component: Duration Validators'});
CREATE (:RHACMComponent:Governance:Component:Diagnostics {id: 'SAN_PATTERN_VALIDATORS', label: 'SAN Pattern Validators', subsystem: 'Governance', type: 'Component', description: 'Governance component: SAN Pattern Validators'});
CREATE (:RHACMComponent:Governance:Component:Diagnostics {id: 'CERT_DISCOVERY_ENGINE', label: 'Certificate Discovery Engine', subsystem: 'Governance', type: 'Component', description: 'Governance component: Certificate Discovery Engine'});
CREATE (:RHACMComponent:Governance:Component {id: 'CERT_COMPLIANCE_REPORTER', label: 'Certificate Compliance Reporter', subsystem: 'Governance', type: 'Component', description: 'Governance component: Certificate Compliance Reporter'});
CREATE (:RHACMComponent:Governance:Component:Diagnostics {id: 'COMPLIANCE_EVALUATOR', label: 'Multi-State Compliance Evaluator', subsystem: 'Governance', type: 'Component', description: 'Governance component: Multi-State Compliance Evaluator'});
CREATE (:RHACMComponent:Governance:Policy {id: 'REMEDIATION_ENGINE', label: 'Policy Remediation Engine', subsystem: 'Governance', type: 'Policy', description: 'Governance component: Policy Remediation Engine'});
CREATE (:RHACMComponent:Governance:Policy {id: 'EVENT_GENERATOR', label: 'Policy Event Generator', subsystem: 'Governance', type: 'Policy', description: 'Governance component: Policy Event Generator'});
CREATE (:RHACMComponent:Governance:Policy {id: 'METRICS_EXPORTER', label: 'Policy Metrics Exporter', subsystem: 'Governance', type: 'Policy', description: 'Governance component: Policy Metrics Exporter'});
CREATE (:RHACMComponent:Governance:Controller {id: 'POLICY_PROPAGATOR_CTRL', label: 'Policy Propagator Controller', subsystem: 'Governance', type: 'Controller', description: 'Governance component: Policy Propagator Controller'});
CREATE (:RHACMComponent:Governance:Component:Diagnostics {id: 'PLACEMENT_BINDING_HANDLER', label: 'PlacementBinding Event Handler', subsystem: 'Governance', type: 'Component', description: 'Governance component: PlacementBinding Event Handler'});
CREATE (:RHACMComponent:Governance:Component:Diagnostics {id: 'PLACEMENT_DECISION_HANDLER', label: 'Placement Decision Handler', subsystem: 'Governance', type: 'Component', description: 'Governance component: Placement Decision Handler'});
CREATE (:RHACMComponent:Governance:Component {id: 'PLACEMENT_RULE_HANDLER', label: 'PlacementRule Event Handler', subsystem: 'Governance', type: 'Component', description: 'Governance component: PlacementRule Event Handler'});
CREATE (:RHACMComponent:Governance:Component {id: 'TEMPLATE_RESOLVERS', label: 'Template Resolvers', subsystem: 'Governance', type: 'Component', description: 'Governance component: Template Resolvers'});
CREATE (:RHACMComponent:Governance:Component:Diagnostics {id: 'RESOURCE_VERSION_TRACKER', label: 'Resource Version Tracker', subsystem: 'Governance', type: 'Component', description: 'Governance component: Resource Version Tracker'});
CREATE (:RHACMComponent:Governance:Component:Diagnostics {id: 'STATUS_AGGREGATION_ENGINE', label: 'Status Aggregation Engine', subsystem: 'Governance', type: 'Component', description: 'Governance component: Status Aggregation Engine'});
CREATE (:RHACMComponent:Governance:Component:Diagnostics {id: 'ROOT_COMPLIANCE_CALCULATOR', label: 'Root Compliance Calculator', subsystem: 'Governance', type: 'Component', description: 'Governance component: Root Compliance Calculator'});
CREATE (:RHACMComponent:Governance:Component {id: 'ENCRYPTION_SYSTEM', label: 'Template Encryption System', subsystem: 'Governance', type: 'Component', description: 'Governance component: Template Encryption System'});
CREATE (:RHACMComponent:Governance:Policy {id: 'IAM_POLICY_RECONCILER', label: 'IAM Policy Reconciler', subsystem: 'Governance', type: 'Policy', description: 'Governance component: IAM Policy Reconciler'});
CREATE (:RHACMComponent:Governance:Cluster:Diagnostics {id: 'CLUSTER_ROLE_BINDING_VALIDATOR', label: 'Cluster Role Binding Validator', subsystem: 'Governance', type: 'Cluster', description: 'Governance component: Cluster Role Binding Validator'});
CREATE (:RHACMComponent:Governance:Component:Diagnostics {id: 'IAM_COMPLIANCE_REPORTER', label: 'IAM Compliance Reporter', subsystem: 'Governance', type: 'Component', description: 'Governance component: IAM Compliance Reporter'});
CREATE (:RHACMComponent:Governance:Component:Diagnostics {id: 'USER_THRESHOLD_VALIDATOR', label: 'User Threshold Validator', subsystem: 'Governance', type: 'Component', description: 'Governance component: User Threshold Validator'});
CREATE (:RHACMComponent:Governance:Cluster {id: 'CLUSTER_ADMIN_MONITOR', label: 'Cluster Admin Monitor', subsystem: 'Governance', type: 'Cluster', description: 'Governance component: Cluster Admin Monitor'});
CREATE (:RHACMComponent:Governance:Component {id: 'DEPENDENCY_WATCHER', label: 'Kubernetes Dependency Watcher', subsystem: 'Governance', type: 'Component', description: 'Governance component: Kubernetes Dependency Watcher'});
CREATE (:RHACMComponent:Governance:Controller:Diagnostics {id: 'CONTROLLER_RUNTIME_SOURCE', label: 'Controller Runtime Source', subsystem: 'Governance', type: 'Controller', description: 'Governance component: Controller Runtime Source'});
CREATE (:RHACMComponent:Governance:Component:Diagnostics {id: 'DEPENDENCY_TRACKER', label: 'Dependency Tracker', subsystem: 'Governance', type: 'Component', description: 'Governance component: Dependency Tracker'});
CREATE (:RHACMComponent:Governance:Component {id: 'EVENT_CHANNEL_BRIDGE', label: 'Event Channel Bridge', subsystem: 'Governance', type: 'Component', description: 'Governance component: Event Channel Bridge'});
CREATE (:RHACMComponent:Governance:Component {id: 'MUST_GATHER_ENGINE', label: 'Must-Gather Engine', subsystem: 'Governance', type: 'Component', description: 'Governance component: Must-Gather Engine'});
CREATE (:RHACMComponent:Governance:Component:Diagnostics {id: 'HUB_DATA_COLLECTOR', label: 'Hub Data Collector', subsystem: 'Governance', type: 'Component', description: 'Governance component: Hub Data Collector'});
CREATE (:RHACMComponent:Governance:Cluster:Diagnostics {id: 'MANAGED_CLUSTER_COLLECTOR', label: 'Managed Cluster Collector', subsystem: 'Governance', type: 'Cluster', description: 'Governance component: Managed Cluster Collector'});
CREATE (:RHACMComponent:Governance:Cluster:Diagnostics {id: 'HOSTED_CLUSTER_COLLECTOR', label: 'Hosted Cluster Collector', subsystem: 'Governance', type: 'Cluster', description: 'Governance component: Hosted Cluster Collector'});
CREATE (:RHACMComponent:Governance:Component:Diagnostics {id: 'POD_DATA_COLLECTOR', label: 'Pod Data Collector', subsystem: 'Governance', type: 'Component', description: 'Governance component: Pod Data Collector'});
CREATE (:RHACMComponent:Governance:Component:Diagnostics {id: 'RESOURCE_ORGANIZER', label: 'Resource Organizer', subsystem: 'Governance', type: 'Component', description: 'Governance component: Resource Organizer'});
CREATE (:RHACMComponent:Governance:Component:Diagnostics {id: 'DIAGNOSTIC_AGGREGATOR', label: 'Diagnostic Aggregator', subsystem: 'Governance', type: 'Component', description: 'Governance component: Diagnostic Aggregator'});
CREATE (:RHACMComponent:Governance:Component {id: 'GATEKEEPER', label: 'gatekeeper', subsystem: 'Governance', type: 'Component', description: 'Governance component: gatekeeper'});
CREATE (:RHACMComponent:Governance:Operator:Gatekeeper {id: 'GATEKEEPER_FBC', label: 'gatekeeper-operator-fbc', subsystem: 'Governance', type: 'Operator', description: 'Governance component: gatekeeper-operator-fbc'});
CREATE (:RHACMComponent:Governance:Policy:Addons {id: 'GOV_POLICY_FRAMEWORK_ADDON', label: 'governance-policy-framework-addon', subsystem: 'Governance', type: 'Policy', description: 'Governance component: governance-policy-framework-addon'});
CREATE (:RHACMComponent:Governance:Component {id: 'K8S_DEPENDENCY_WATCHES', label: 'kubernetes-dependency-watches', subsystem: 'Governance', type: 'Component', description: 'Governance component: kubernetes-dependency-watches'});
CREATE (:RHACMComponent:Governance:Component:Gatekeeper {id: 'MUST_GATHER', label: 'must-gather', subsystem: 'Governance', type: 'Component', description: 'Governance component: must-gather'});
CREATE (:RHACMComponent:Application:Operator:Channels {id: 'MULTICLOUD_OPS_CHANNEL', label: 'multicloud-operators-channel', subsystem: 'Application', type: 'Operator', description: 'Application component: multicloud-operators-channel'});
CREATE (:RHACMComponent:Application:Application {id: 'APPLICATION_MANAGER', label: 'Application Manager Addon', subsystem: 'Application', type: 'Application', description: 'Application component: Application Manager Addon'});
CREATE (:RHACMComponent:Application:Component {id: 'GIT_CHANNEL', label: 'Git Channel', subsystem: 'Application', type: 'Component', description: 'Application component: Git Channel'});
CREATE (:RHACMComponent:Application:Component:Channels {id: 'HELM_CHANNEL', label: 'Helm Channel', subsystem: 'Application', type: 'Component', description: 'Application component: Helm Channel'});
CREATE (:RHACMComponent:Application:Component:Channels {id: 'OBJECTSTORAGE_CHANNEL', label: 'Object Storage Channel', subsystem: 'Application', type: 'Component', description: 'Application component: Object Storage Channel'});
CREATE (:RHACMComponent:Application:Controller:Crd {id: 'GITOPS_CLUSTER_CTRL', label: 'GitOps Cluster Controller', subsystem: 'Application', type: 'Controller', description: 'Application component: GitOps Cluster Controller'});
CREATE (:RHACMComponent:Application:Controller:Crd {id: 'GITOPS_SYNC_RESOURCE_CTRL', label: 'GitOps Sync Resource Controller', subsystem: 'Application', type: 'Controller', description: 'Application component: GitOps Sync Resource Controller'});
CREATE (:RHACMComponent:Application:Controller:Crd {id: 'STATUS_AGGREGATION_CTRL', label: 'Status Aggregation Controller', subsystem: 'Application', type: 'Controller', description: 'Application component: Status Aggregation Controller'});
CREATE (:RHACMComponent:Application:Controller:Crd {id: 'PROPAGATION_CTRL', label: 'Propagation Controller', subsystem: 'Application', type: 'Controller', description: 'Application component: Propagation Controller'});
CREATE (:RHACMComponent:Application:Controller:Crd {id: 'GITOPS_ADDON_CTRL', label: 'GitOps Addon Controller', subsystem: 'Application', type: 'Controller', description: 'Application component: GitOps Addon Controller'});
CREATE (:RHACMComponent:Application:Cluster {id: 'GITOPS_CLUSTER_CRD', label: 'GitOpsCluster CRD', subsystem: 'Application', type: 'Cluster', description: 'Application component: GitOpsCluster CRD'});
CREATE (:RHACMComponent:Application:Cluster:Crd {id: 'MULTICLUSTER_APPSET_REPORT_CRD', label: 'MulticlusterApplicationSetReport CRD', subsystem: 'Application', type: 'Cluster', description: 'Application component: MulticlusterApplicationSetReport CRD'});
CREATE (:RHACMComponent:Application:Cluster:Crd {id: 'CLUSTER_PERMISSION_CRD', label: 'ClusterPermission CRD', subsystem: 'Application', type: 'Cluster', description: 'Application component: ClusterPermission CRD'});
CREATE (:RHACMComponent:Application:Controller:Crd {id: 'APPLICATION_CTRL', label: 'Application Controller', subsystem: 'Application', type: 'Controller', description: 'Application component: Application Controller'});
CREATE (:RHACMComponent:Application:Controller:Crd {id: 'APPLICATION_STATUS_CTRL', label: 'Application Status Controller', subsystem: 'Application', type: 'Controller', description: 'Application component: Application Status Controller'});
CREATE (:RHACMComponent:Application:Controller {id: 'CLUSTER_CTRL', label: 'Cluster Controller', subsystem: 'Application', type: 'Controller', description: 'Application component: Cluster Controller'});
CREATE (:RHACMComponent:Application:Application:Crd {id: 'ARGOCD_APPLICATION_CRD', label: 'Application CRD', subsystem: 'Application', type: 'Application', description: 'Application component: Application CRD'});
CREATE (:RHACMComponent:Application:Application:Crd {id: 'ARGOCD_APPLICATIONSET_CRD', label: 'ApplicationSet CRD', subsystem: 'Application', type: 'Application', description: 'Application component: ApplicationSet CRD'});
CREATE (:RHACMComponent:Application:Component:Crd {id: 'MANIFESTWORK_CRD', label: 'ManifestWork CRD', subsystem: 'Application', type: 'Component', description: 'Application component: ManifestWork CRD'});
CREATE (:RHACMComponent:Application:Cluster:Crd {id: 'MANAGEDCLUSTER_CRD', label: 'ManagedCluster CRD', subsystem: 'Application', type: 'Cluster', description: 'Application component: ManagedCluster CRD'});
CREATE (:RHACMComponent:Application:Component {id: 'APPLIFECYCLE_BACKEND_E2E', label: 'applifecycle-backend-e2e', subsystem: 'Application', type: 'Component', description: 'Application component: applifecycle-backend-e2e'});
CREATE (:RHACMComponent:Application:Application {id: 'APP_WEBHOOKS', label: 'Application Webhooks', subsystem: 'Application', type: 'Application', description: 'Application component: Application Webhooks'});
CREATE (:RHACMComponent:Application:Application {id: 'SUBSCRIPTION_WEBHOOKS', label: 'Subscription Webhooks', subsystem: 'Application', type: 'Application', description: 'Application component: Subscription Webhooks'});
CREATE (:RHACMComponent:Observability:Controller {id: 'OBSERVABILITY_CONTROLLER', label: 'Observability Controller', subsystem: 'Observability', type: 'Controller', description: 'Observability component: Observability Controller'});
CREATE (:RHACMComponent:Observability:Component:Thanos {id: 'METRICS_COLLECTION_MANAGER', label: 'Metrics Collection Manager', subsystem: 'Observability', type: 'Component', description: 'Observability component: Metrics Collection Manager'});
CREATE (:RHACMComponent:Observability:Controller:Thanos {id: 'ADDON_DEPLOYMENT_CONTROLLER', label: 'Addon Deployment Controller', subsystem: 'Observability', type: 'Controller', description: 'Observability component: Addon Deployment Controller'});
CREATE (:RHACMComponent:Observability:Component {id: 'CONFIGURATION_RECONCILER', label: 'Configuration Reconciler', subsystem: 'Observability', type: 'Component', description: 'Observability component: Configuration Reconciler'});
CREATE (:RHACMComponent:Observability:Controller {id: 'OBSERVATORIUM_DEPLOYMENT_CTRL', label: 'Observatorium Deployment Controller', subsystem: 'Observability', type: 'Controller', description: 'Observability component: Observatorium Deployment Controller'});
CREATE (:RHACMComponent:Observability:Observability:Thanos {id: 'THANOS_INTEGRATION_MANAGER', label: 'Thanos Integration Manager', subsystem: 'Observability', type: 'Observability', description: 'Observability component: Thanos Integration Manager'});
CREATE (:RHACMComponent:Observability:Controller {id: 'STORAGE_CONFIGURATION_CTRL', label: 'Storage Configuration Controller', subsystem: 'Observability', type: 'Controller', description: 'Observability component: Storage Configuration Controller'});
CREATE (:RHACMComponent:Observability:Component {id: 'QUERY_GATEWAY', label: 'Query Gateway', subsystem: 'Observability', type: 'Component', description: 'Observability component: Query Gateway'});
CREATE (:RHACMComponent:Observability:Component:Thanos {id: 'RULER_ENGINE', label: 'Ruler Engine', subsystem: 'Observability', type: 'Component', description: 'Observability component: Ruler Engine'});
CREATE (:RHACMComponent:Observability:Component:Thanos {id: 'COMPACTOR_SERVICE', label: 'Compactor Service', subsystem: 'Observability', type: 'Component', description: 'Observability component: Compactor Service'});
CREATE (:RHACMComponent:Observability:Component {id: 'STORE_GATEWAY', label: 'Store Gateway', subsystem: 'Observability', type: 'Component', description: 'Observability component: Store Gateway'});
CREATE (:RHACMComponent:Observability:Observability {id: 'PROMETHEUS_ALERTMANAGER', label: 'prometheus-alertmanager', subsystem: 'Observability', type: 'Observability', description: 'Observability component: prometheus-alertmanager'});
CREATE (:RHACMComponent:Observability:Component {id: 'METRICS_STORAGE', label: 'Metrics Storage', subsystem: 'Observability', type: 'Component', description: 'Observability component: Metrics Storage'});
CREATE (:RHACMComponent:Observability:Component {id: 'QUERY_ENGINE', label: 'Query Engine', subsystem: 'Observability', type: 'Component', description: 'Observability component: Query Engine'});
CREATE (:RHACMComponent:Observability:Controller:Thanos {id: 'DASHBOARD_CONTROLLER', label: 'Dashboard Controller', subsystem: 'Observability', type: 'Controller', description: 'Observability component: Dashboard Controller'});
CREATE (:RHACMComponent:Observability:Component {id: 'ALERT_MANAGER_INTEGRATION', label: 'Alert Manager Integration', subsystem: 'Observability', type: 'Component', description: 'Observability component: Alert Manager Integration'});
CREATE (:RHACMComponent:Observability:Component {id: 'NODE_EXPORTER', label: 'node-exporter', subsystem: 'Observability', type: 'Component', description: 'Observability component: node-exporter'});
CREATE (:RHACMComponent:Observability:Component:Thanos {id: 'KUBE_STATE_METRICS', label: 'kube-state-metrics', subsystem: 'Observability', type: 'Component', description: 'Observability component: kube-state-metrics'});
CREATE (:RHACMComponent:Observability:Component {id: 'KUBE_RBAC_PROXY', label: 'kube-rbac-proxy', subsystem: 'Observability', type: 'Component', description: 'Observability component: kube-rbac-proxy'});
CREATE (:RHACMComponent:Cluster:Component:Hypershift {id: 'MANIFESTWORK', label: 'ManifestWork', subsystem: 'Cluster', type: 'Component', description: 'Cluster component: ManifestWork'});
CREATE (:RHACMComponent:Cluster:Component {id: 'RBAC_RESOURCES', label: 'RBAC Resources', subsystem: 'Cluster', type: 'Component', description: 'Cluster component: RBAC Resources'});
CREATE (:RHACMComponent:Cluster:Component {id: 'CURATOR_JOBS', label: 'Curator Jobs', subsystem: 'Cluster', type: 'Component', description: 'Cluster component: Curator Jobs'});
CREATE (:RHACMComponent:Cluster:Component {id: 'IMAGESET_REPO', label: 'ImageSet Git Repository', subsystem: 'Cluster', type: 'Component', description: 'Cluster component: ImageSet Git Repository'});
CREATE (:RHACMComponent:Cluster:Component {id: 'CLOUD_CREDENTIALS', label: 'Cloud Provider Secrets', subsystem: 'Cluster', type: 'Component', description: 'Cluster component: Cloud Provider Secrets'});
CREATE (:RHACMComponent:Cluster:Cluster:Hypershift {id: 'CLUSTER_POOLS', label: 'Cluster Pools', subsystem: 'Cluster', type: 'Cluster', description: 'Cluster component: Cluster Pools'});
CREATE (:RHACMComponent:Cluster:Cluster {id: 'CLUSTER_CLAIMS', label: 'ClusterClaim Resources', subsystem: 'Cluster', type: 'Cluster', description: 'Cluster component: ClusterClaim Resources'});
CREATE (:RHACMComponent:Cluster:Component:Hypershift {id: 'HYPERSHIFT_ADDON_MANAGER', label: 'hypershift-addon-manager', subsystem: 'Cluster', type: 'Component', description: 'Cluster component: hypershift-addon-manager'});
CREATE (:RHACMComponent:Cluster:Component:Hypershift {id: 'HYPERSHIFT_ADDON_AGENT', label: 'hypershift-addon-agent', subsystem: 'Cluster', type: 'Component', description: 'Cluster component: hypershift-addon-agent'});
CREATE (:RHACMComponent:Cluster:Cluster:Hypershift {id: 'MANAGEDCLUSTER_ADDON', label: 'ManagedClusterAddOn', subsystem: 'Cluster', type: 'Cluster', description: 'Cluster component: ManagedClusterAddOn'});
CREATE (:RHACMComponent:Cluster:Operator:Hypershift {id: 'HYPERSHIFT_OIDC_CREDENTIALS', label: 'hypershift-operator-oidc-provider-s3-credentials', subsystem: 'Cluster', type: 'Operator', description: 'Cluster component: hypershift-operator-oidc-provider-s3-credentials'});
CREATE (:RHACMComponent:Cluster:Operator {id: 'MULTICLOUD_OPS_FOUNDATION', label: 'multicloud-operators-foundation', subsystem: 'Cluster', type: 'Operator', description: 'Cluster component: multicloud-operators-foundation'});
CREATE (:RHACMComponent:Search:Operator {id: 'SEARCH_OPERATOR_CTRL', label: 'Search Operator Controller', subsystem: 'Search', type: 'Operator', description: 'Search component: Search Operator Controller'});
CREATE (:RHACMComponent:Search:Component:Internal {id: 'INDEX_MANAGER', label: 'Index Manager', subsystem: 'Search', type: 'Component', description: 'Search component: Index Manager'});
CREATE (:RHACMComponent:Search:Component:Internal {id: 'COLLECTOR_MANAGER', label: 'Collector Manager', subsystem: 'Search', type: 'Component', description: 'Search component: Collector Manager'});
CREATE (:RHACMComponent:Search:Controller:Internal {id: 'API_GATEWAY_CTRL', label: 'API Gateway Controller', subsystem: 'Search', type: 'Controller', description: 'Search component: API Gateway Controller'});
CREATE (:RHACMComponent:Search:Component:Internal {id: 'RESOURCE_INDEXER', label: 'Resource Indexer', subsystem: 'Search', type: 'Component', description: 'Search component: Resource Indexer'});
CREATE (:RHACMComponent:Search:Component {id: 'SCHEMA_REGISTRY', label: 'Schema Registry', subsystem: 'Search', type: 'Component', description: 'Search component: Schema Registry'});
CREATE (:RHACMComponent:Search:Search:Internal {id: 'ELASTICSEARCH_INTEGRATION', label: 'ElasticSearch Integration', subsystem: 'Search', type: 'Search', description: 'Search component: ElasticSearch Integration'});
CREATE (:RHACMComponent:Search:Component {id: 'QUERY_PROCESSOR', label: 'Query Processor', subsystem: 'Search', type: 'Component', description: 'Search component: Query Processor'});
CREATE (:RHACMComponent:Search:Component:Internal {id: 'RESOURCE_MONITOR', label: 'Resource Monitor', subsystem: 'Search', type: 'Component', description: 'Search component: Resource Monitor'});
CREATE (:RHACMComponent:Search:Component:Internal {id: 'EVENT_COLLECTOR', label: 'Event Collector', subsystem: 'Search', type: 'Component', description: 'Search component: Event Collector'});
CREATE (:RHACMComponent:Search:Component:Internal {id: 'DATA_TRANSFORMER', label: 'Data Transformer', subsystem: 'Search', type: 'Component', description: 'Search component: Data Transformer'});
CREATE (:RHACMComponent:Search:Component {id: 'COLLECTION_AGENT', label: 'Collection Agent', subsystem: 'Search', type: 'Component', description: 'Search component: Collection Agent'});
CREATE (:RHACMComponent:Search:API:Internal {id: 'GRAPHQL_API_SERVER', label: 'GraphQL API Server', subsystem: 'Search', type: 'API', description: 'Search component: GraphQL API Server'});
CREATE (:RHACMComponent:Search:API {id: 'REST_API_GATEWAY', label: 'REST API Gateway', subsystem: 'Search', type: 'API', description: 'Search component: REST API Gateway'});
CREATE (:RHACMComponent:Search:Component:Internal {id: 'QUERY_OPTIMIZER', label: 'Query Optimizer', subsystem: 'Search', type: 'Component', description: 'Search component: Query Optimizer'});
CREATE (:RHACMComponent:Search:Component {id: 'RBAC_INTEGRATION', label: 'RBAC Integration', subsystem: 'Search', type: 'Component', description: 'Search component: RBAC Integration'});
CREATE (:RHACMComponent:Console:API {id: 'CONSOLE_BACKEND_API', label: 'Console Backend API', subsystem: 'Console', type: 'API', description: 'Console component: Console Backend API'});
CREATE (:RHACMComponent:Console:Component:Advanced {id: 'RBAC_MIDDLEWARE', label: 'RBAC Middleware', subsystem: 'Console', type: 'Component', description: 'Console component: RBAC Middleware'});
CREATE (:RHACMComponent:Console:Cluster {id: 'MULTI_CLUSTER_NAV', label: 'Multi-cluster Navigation', subsystem: 'Console', type: 'Cluster', description: 'Console component: Multi-cluster Navigation'});
CREATE (:RHACMComponent:Console:Component:Advanced {id: 'RESOURCE_PROXY', label: 'Resource Proxy', subsystem: 'Console', type: 'Component', description: 'Console component: Resource Proxy'});
CREATE (:RHACMComponent:Console:Controller {id: 'REST_API_CONTROLLERS', label: 'REST API Controllers', subsystem: 'Console', type: 'Controller', description: 'Console component: REST API Controllers'});
CREATE (:RHACMComponent:Console:Component {id: 'AUTHENTICATION_HANDLER', label: 'Authentication Handler', subsystem: 'Console', type: 'Component', description: 'Console component: Authentication Handler'});
CREATE (:RHACMComponent:Console:Component {id: 'WEBSOCKET_MANAGER', label: 'WebSocket Manager', subsystem: 'Console', type: 'Component', description: 'Console component: WebSocket Manager'});
CREATE (:RHACMComponent:Console:Component:Advanced {id: 'SESSION_MANAGER', label: 'Session Manager', subsystem: 'Console', type: 'Component', description: 'Console component: Session Manager'});
CREATE (:RHACMComponent:Console:Component {id: 'REACT_COMPONENTS', label: 'Frontend React Components', subsystem: 'Console', type: 'Component', description: 'Console component: Frontend React Components'});
CREATE (:RHACMComponent:Console:Component:Advanced {id: 'DASHBOARD_RENDERER', label: 'Dashboard Renderer', subsystem: 'Console', type: 'Component', description: 'Console component: Dashboard Renderer'});
CREATE (:RHACMComponent:Console:Cluster:Advanced {id: 'CLUSTER_OVERVIEW', label: 'Cluster Overview', subsystem: 'Console', type: 'Cluster', description: 'Console component: Cluster Overview'});
CREATE (:RHACMComponent:Console:Component {id: 'RESOURCE_BROWSER', label: 'Resource Browser', subsystem: 'Console', type: 'Component', description: 'Console component: Resource Browser'});
CREATE (:RHACMComponent:Console:Component {id: 'OAUTH_INTEGRATION', label: 'OAuth Integration', subsystem: 'Console', type: 'Component', description: 'Console component: OAuth Integration'});
CREATE (:RHACMComponent:Console:Cluster {id: 'CLUSTER_SELECTOR', label: 'Cluster Selector', subsystem: 'Console', type: 'Cluster', description: 'Console component: Cluster Selector'});
CREATE (:RHACMComponent:Console:Component:Advanced {id: 'PLUGIN_FRAMEWORK', label: 'Plugin Framework', subsystem: 'Console', type: 'Component', description: 'Console component: Plugin Framework'});
CREATE (:RHACMComponent:Console:Component {id: 'THEME_MANAGER', label: 'Theme Manager', subsystem: 'Console', type: 'Component', description: 'Console component: Theme Manager'});
CREATE (:RHACMComponent:Console:Component {id: 'MCE_PLUGIN', label: 'MCE Plugin', subsystem: 'Console', type: 'Component', description: 'Console component: MCE Plugin'});
CREATE (:RHACMComponent:Console:Component:Advanced {id: 'PLUGIN_REGISTRY', label: 'Plugin Registry', subsystem: 'Console', type: 'Component', description: 'Console component: Plugin Registry'});
CREATE (:RHACMComponent:Console:Component {id: 'PLUGIN_MANAGEMENT', label: 'Plugin Management System', subsystem: 'Console', type: 'Component', description: 'Console component: Plugin Management System'});
CREATE (:RHACMComponent:Console:Component {id: 'GITHUB_INTEGRATION', label: 'GitHub Integration', subsystem: 'Console', type: 'Component', description: 'Console component: GitHub Integration'});
CREATE (:RHACMComponent:Console:Component {id: 'INSIGHTS_INTEGRATION', label: 'Red Hat Insights Integration', subsystem: 'Console', type: 'Component', description: 'Console component: Red Hat Insights Integration'});
CREATE (:RHACMComponent:Console:Component {id: 'CONSOLE_ROUTE_HANDLER', label: 'Console Route Handler', subsystem: 'Console', type: 'Component', description: 'Console component: Console Route Handler'});
CREATE (:RHACMComponent:Console:Component:Advanced {id: 'OPENSHIFT_CONSOLE_BRIDGE', label: 'OpenShift Console Bridge', subsystem: 'Console', type: 'Component', description: 'Console component: OpenShift Console Bridge'});
CREATE (:RHACMComponent:Console:Component {id: 'GRC_RESOURCES', label: 'GRC Resources', subsystem: 'Console', type: 'Component', description: 'Console component: GRC Resources'});
CREATE (:RHACMComponent:Console:Application:Advanced {id: 'APP_RESOURCES', label: 'Application Resources', subsystem: 'Console', type: 'Application', description: 'Console component: Application Resources'});
CREATE (:RHACMComponent:Console:Component:Advanced {id: 'OBS_DASHBOARDS', label: 'Observability Dashboards', subsystem: 'Console', type: 'Component', description: 'Console component: Observability Dashboards'});
CREATE (:RHACMComponent:Console:Cluster:Advanced {id: 'CLUSTER_RESOURCES', label: 'Cluster Resources', subsystem: 'Console', type: 'Cluster', description: 'Console component: Cluster Resources'});
CREATE (:RHACMComponent:Console:Search {id: 'SEARCH_INTERFACE', label: 'Search Interface', subsystem: 'Console', type: 'Search', description: 'Console component: Search Interface'});

// Additional Missing Addon Components
CREATE (:RHACMComponent:Overview:Component:Addons {id: 'SUBMARINER_ADDON', label: 'Submariner Addon', subsystem: 'Overview', type: 'Component', description: 'Overview component: Submariner Addon'});
CREATE (:RHACMComponent:Cluster:CRD:Foundation {id: 'MANAGEDCLUSTER_ADDON_CRD', label: 'ManagedClusterAddOn CRD', subsystem: 'Cluster', type: 'CRD', description: 'Cluster component: ManagedClusterAddOn CRD'});
CREATE (:RHACMComponent:Observability:Component:Addons {id: 'OBSERVABILITY_ADDON', label: 'Observability Addon', subsystem: 'Observability', type: 'Component', description: 'Observability component: Observability Addon'});

// Relationship Creation - Component Dependencies

// DEPENDS_ON relationships
MATCH (source {id: 'ETCD'}), (target {id: 'K8S'}) CREATE (source)-[:DEPENDS_ON {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'K8S'}), (target {id: 'OCP'}) CREATE (source)-[:DEPENDS_ON {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'OCP'}), (target {id: 'HUB'}) CREATE (source)-[:DEPENDS_ON {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'OCP'}), (target {id: 'SPOKE'}) CREATE (source)-[:DEPENDS_ON {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'HUB'}), (target {id: 'ACM'}) CREATE (source)-[:DEPENDS_ON {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'ACM'}), (target {id: 'OCM'}) CREATE (source)-[:DEPENDS_ON {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'HUB'}), (target {id: 'MCE'}) CREATE (source)-[:DEPENDS_ON {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'MCE'}), (target {id: 'BACKPLANE_OPERATOR'}) CREATE (source)-[:DEPENDS_ON {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'MCE'}), (target {id: 'CLUSTER_MANAGER'}) CREATE (source)-[:DEPENDS_ON {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'MCE'}), (target {id: 'KLUSTERLET'}) CREATE (source)-[:DEPENDS_ON {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'MCE'}), (target {id: 'REGISTRATION_WEBHOOK'}) CREATE (source)-[:DEPENDS_ON {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'MCE'}), (target {id: 'ACM'}) CREATE (source)-[:DEPENDS_ON {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'ACM'}), (target {id: 'GRC'}) CREATE (source)-[:DEPENDS_ON {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'ACM'}), (target {id: 'APP'}) CREATE (source)-[:DEPENDS_ON {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'ACM'}), (target {id: 'OBS'}) CREATE (source)-[:DEPENDS_ON {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'ACM'}), (target {id: 'CLUSTER'}) CREATE (source)-[:DEPENDS_ON {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'ACM'}), (target {id: 'SEARCH'}) CREATE (source)-[:DEPENDS_ON {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'ACM'}), (target {id: 'CONSOLE'}) CREATE (source)-[:DEPENDS_ON {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'ACM'}), (target {id: 'SERVER_FOUNDATION'}) CREATE (source)-[:DEPENDS_ON {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'ACM'}), (target {id: 'GLOBAL_HUB'}) CREATE (source)-[:DEPENDS_ON {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'ACM'}), (target {id: 'SUBMARINER'}) CREATE (source)-[:DEPENDS_ON {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'ACM'}), (target {id: 'BACKUP_RESTORE'}) CREATE (source)-[:DEPENDS_ON {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'CLUSTER'}), (target {id: 'CAPI_PROVIDER_INTEGRATION'}) CREATE (source)-[:DEPENDS_ON {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'CLUSTER'}), (target {id: 'INSIGHTS_OPERATOR_INTEGRATION'}) CREATE (source)-[:DEPENDS_ON {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'OCM_API'}), (target {id: 'OCM'}) CREATE (source)-[:DEPENDS_ON {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'CLUSTER_LIFECYCLE_API'}), (target {id: 'OCM_API'}) CREATE (source)-[:DEPENDS_ON {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'OCM'}), (target {id: 'SEARCH_V2_OPERATOR'}) CREATE (source)-[:DEPENDS_ON {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'OCM'}), (target {id: 'MCO_OPERATOR'}) CREATE (source)-[:DEPENDS_ON {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'OCM'}), (target {id: 'CLUSTER_CURATOR_CTRL'}) CREATE (source)-[:DEPENDS_ON {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'SERVER_FOUNDATION'}), (target {id: 'FOUNDATION'}) CREATE (source)-[:DEPENDS_ON {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'SERVER_FOUNDATION'}), (target {id: 'REGISTRATION'}) CREATE (source)-[:DEPENDS_ON {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'SERVER_FOUNDATION'}), (target {id: 'WORK'}) CREATE (source)-[:DEPENDS_ON {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'SERVER_FOUNDATION'}), (target {id: 'ADDON'}) CREATE (source)-[:DEPENDS_ON {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'SERVER_FOUNDATION'}), (target {id: 'MANAGEDCLUSTER_IMPORT_CTRL'}) CREATE (source)-[:DEPENDS_ON {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'SERVER_FOUNDATION'}), (target {id: 'KLUSTERLET_ADDON_CTRL'}) CREATE (source)-[:DEPENDS_ON {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'SERVER_FOUNDATION'}), (target {id: 'CLUSTERLIFECYCLE_STATE_METRICS'}) CREATE (source)-[:DEPENDS_ON {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'SERVER_FOUNDATION'}), (target {id: 'MANAGED_SERVICEACCOUNT'}) CREATE (source)-[:DEPENDS_ON {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'SERVER_FOUNDATION'}), (target {id: 'CLUSTER_PROXY'}) CREATE (source)-[:DEPENDS_ON {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'SERVER_FOUNDATION'}), (target {id: 'CLUSTER_PROXY_ADDON'}) CREATE (source)-[:DEPENDS_ON {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'SERVER_FOUNDATION'}), (target {id: 'REGISTRATION_OPERATOR'}) CREATE (source)-[:DEPENDS_ON {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'SERVER_FOUNDATION'}), (target {id: 'PLACEMENT'}) CREATE (source)-[:DEPENDS_ON {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'SERVER_FOUNDATION'}), (target {id: 'WORK_FRAMEWORK'}) CREATE (source)-[:DEPENDS_ON {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'SERVER_FOUNDATION'}), (target {id: 'ADDON_FRAMEWORK'}) CREATE (source)-[:DEPENDS_ON {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'APP'}), (target {id: 'MULTICLOUD_OPS_SUBSCRIPTION'}) CREATE (source)-[:DEPENDS_ON {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'APP'}), (target {id: 'MULTICLOUD_INTEGRATIONS'}) CREATE (source)-[:DEPENDS_ON {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'APP'}), (target {id: 'ARGOCD_PULL_INTEGRATION'}) CREATE (source)-[:DEPENDS_ON {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'APP'}), (target {id: 'GITOPS_OPERATOR'}) CREATE (source)-[:DEPENDS_ON {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'GRC'}), (target {id: 'GOV_POLICY_PROP'}) CREATE (source)-[:DEPENDS_ON {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'GRC'}), (target {id: 'CONFIG_POLICY_CTRL'}) CREATE (source)-[:DEPENDS_ON {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'GRC'}), (target {id: 'GATEKEEPER_OP'}) CREATE (source)-[:DEPENDS_ON {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'GRC'}), (target {id: 'GOV_POLICY_FRAMEWORK'}) CREATE (source)-[:DEPENDS_ON {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'GRC'}), (target {id: 'CERT_POLICY_CTRL'}) CREATE (source)-[:DEPENDS_ON {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'GRC'}), (target {id: 'IAM_POLICY_CTRL'}) CREATE (source)-[:DEPENDS_ON {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'GRC'}), (target {id: 'POLICY_GEN'}) CREATE (source)-[:DEPENDS_ON {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'GRC'}), (target {id: 'GOV_POLICY_ADDON_CTRL'}) CREATE (source)-[:DEPENDS_ON {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'CLUSTER'}), (target {id: 'CLUSTER_CURATOR_CTRL'}) CREATE (source)-[:DEPENDS_ON {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'CLUSTER'}), (target {id: 'CLUSTER_PERMISSION'}) CREATE (source)-[:DEPENDS_ON {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'CLUSTER'}), (target {id: 'PROVIDER_CREDENTIAL_CTRL'}) CREATE (source)-[:DEPENDS_ON {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'CLUSTER'}), (target {id: 'CLUSTER_IMAGESET_CTRL'}) CREATE (source)-[:DEPENDS_ON {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'CLUSTER'}), (target {id: 'CLUSTERCLAIMS_CTRL'}) CREATE (source)-[:DEPENDS_ON {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'CLUSTER'}), (target {id: 'HYPERSHIFT_ADDON_OP'}) CREATE (source)-[:DEPENDS_ON {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'OBS'}), (target {id: 'MCO_OPERATOR'}) CREATE (source)-[:DEPENDS_ON {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'OBS'}), (target {id: 'OBSERVATORIUM_OP'}) CREATE (source)-[:DEPENDS_ON {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'OBS'}), (target {id: 'PROMETHEUS_OP'}) CREATE (source)-[:DEPENDS_ON {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'OBS'}), (target {id: 'GRAFANA'}) CREATE (source)-[:DEPENDS_ON {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'OBS'}), (target {id: 'THANOS'}) CREATE (source)-[:DEPENDS_ON {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'OBS'}), (target {id: 'KUBE_THANOS'}) CREATE (source)-[:DEPENDS_ON {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'SEARCH'}), (target {id: 'SEARCH_V2_OPERATOR'}) CREATE (source)-[:DEPENDS_ON {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'SEARCH'}), (target {id: 'SEARCH_INDEXER'}) CREATE (source)-[:DEPENDS_ON {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'SEARCH'}), (target {id: 'SEARCH_COLLECTOR'}) CREATE (source)-[:DEPENDS_ON {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'SEARCH'}), (target {id: 'SEARCH_V2_API'}) CREATE (source)-[:DEPENDS_ON {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'CONSOLE'}), (target {id: 'CONSOLE_COMPONENT'}) CREATE (source)-[:DEPENDS_ON {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'CONSOLE'}), (target {id: 'CONSOLE_API'}) CREATE (source)-[:DEPENDS_ON {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'CLUSTER'}), (target {id: 'HIVE'}) CREATE (source)-[:DEPENDS_ON {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'OBS'}), (target {id: 'PROMETHEUS'}) CREATE (source)-[:DEPENDS_ON {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'OBS'}), (target {id: 'GRC'}) CREATE (source)-[:DEPENDS_ON {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'OBS'}), (target {id: 'APP'}) CREATE (source)-[:DEPENDS_ON {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'OBS'}), (target {id: 'CLUSTER'}) CREATE (source)-[:DEPENDS_ON {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'OBS'}), (target {id: 'SEARCH'}) CREATE (source)-[:DEPENDS_ON {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'SEARCH'}), (target {id: 'GRC'}) CREATE (source)-[:DEPENDS_ON {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'SEARCH'}), (target {id: 'APP'}) CREATE (source)-[:DEPENDS_ON {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'SEARCH'}), (target {id: 'CLUSTER'}) CREATE (source)-[:DEPENDS_ON {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'CONSOLE'}), (target {id: 'GRC'}) CREATE (source)-[:DEPENDS_ON {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'CONSOLE'}), (target {id: 'APP'}) CREATE (source)-[:DEPENDS_ON {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'CONSOLE'}), (target {id: 'OBS'}) CREATE (source)-[:DEPENDS_ON {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'CONSOLE'}), (target {id: 'CLUSTER'}) CREATE (source)-[:DEPENDS_ON {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'CONSOLE'}), (target {id: 'SEARCH'}) CREATE (source)-[:DEPENDS_ON {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'HUB'}), (target {id: 'SPOKE'}) CREATE (source)-[:DEPENDS_ON {subsystem: 'Overview', cross_cluster: false}]->(target);

// PROVIDES_RUNTIME_FOR relationships
MATCH (source {id: 'ARGO'}), (target {id: 'GITOPS_OPERATOR'}) CREATE (source)-[:PROVIDES_RUNTIME_FOR {subsystem: 'Overview', cross_cluster: false}]->(target);

// PROVIDES_PLATFORM_FOR relationships
MATCH (source {id: 'OCP'}), (target {id: 'GATEKEEPER_OP'}) CREATE (source)-[:PROVIDES_PLATFORM_FOR {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'OCP'}), (target {id: 'GITOPS_OPERATOR'}) CREATE (source)-[:PROVIDES_PLATFORM_FOR {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'OCP'}), (target {id: 'AWX_OPERATOR'}) CREATE (source)-[:PROVIDES_PLATFORM_FOR {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'OCP'}), (target {id: 'AWX_RESOURCE_OPERATOR'}) CREATE (source)-[:PROVIDES_PLATFORM_FOR {subsystem: 'Overview', cross_cluster: false}]->(target);

// CONTAINS relationships
MATCH (source {id: 'AWX_OPERATOR'}), (target {id: 'AWX_INSTANCE_CONTROLLER'}) CREATE (source)-[:CONTAINS {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'AWX_OPERATOR'}), (target {id: 'AWX_MESHINGRESS_CONTROLLER'}) CREATE (source)-[:CONTAINS {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'AWX_RESOURCE_OPERATOR'}), (target {id: 'ANSIBLE_JOB_CONTROLLER'}) CREATE (source)-[:CONTAINS {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'AWX_RESOURCE_OPERATOR'}), (target {id: 'JOB_TEMPLATE_CONTROLLER'}) CREATE (source)-[:CONTAINS {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'GLOBAL_HUB'}), (target {id: 'GLOBAL_HUB_OPERATOR'}) CREATE (source)-[:CONTAINS {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'GLOBAL_HUB'}), (target {id: 'GLOBAL_HUB_MANAGER'}) CREATE (source)-[:CONTAINS {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'GLOBAL_HUB'}), (target {id: 'GLOBAL_HUB_AGENT'}) CREATE (source)-[:CONTAINS {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'SUBMARINER'}), (target {id: 'SUBMARINER_OPERATOR'}) CREATE (source)-[:CONTAINS {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'SUBMARINER'}), (target {id: 'SUBMARINER_GATEWAY'}) CREATE (source)-[:CONTAINS {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'SUBMARINER'}), (target {id: 'SUBMARINER_ROUTE_AGENT'}) CREATE (source)-[:CONTAINS {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'SUBMARINER'}), (target {id: 'LIGHTHOUSE_AGENT'}) CREATE (source)-[:CONTAINS {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'SUBMARINER'}), (target {id: 'LIGHTHOUSE_COREDNS'}) CREATE (source)-[:CONTAINS {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'SUBMARINER'}), (target {id: 'SUBMARINER_ADDON'}) CREATE (source)-[:CONTAINS {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'BACKUP_RESTORE'}), (target {id: 'OADP_OPERATOR'}) CREATE (source)-[:CONTAINS {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'BACKUP_RESTORE'}), (target {id: 'VELERO_BACKUP_CONTROLLER'}) CREATE (source)-[:CONTAINS {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'BACKUP_RESTORE'}), (target {id: 'VOLUME_SNAPSHOT_CONTROLLER'}) CREATE (source)-[:CONTAINS {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'CAPI_PROVIDER_INTEGRATION'}), (target {id: 'INFRASTRUCTURE_PROVIDER_MANAGER'}) CREATE (source)-[:CONTAINS {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'CAPI_PROVIDER_INTEGRATION'}), (target {id: 'CLUSTER_PROVISIONING_ENGINE'}) CREATE (source)-[:CONTAINS {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'CAPI_PROVIDER_INTEGRATION'}), (target {id: 'BOOTSTRAP_CONFIG_MANAGER'}) CREATE (source)-[:CONTAINS {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'CAPI_PROVIDER_INTEGRATION'}), (target {id: 'CONTROL_PLANE_MANAGER'}) CREATE (source)-[:CONTAINS {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'INSIGHTS_OPERATOR_INTEGRATION'}), (target {id: 'CLUSTER_HEALTH_COLLECTOR'}) CREATE (source)-[:CONTAINS {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'INSIGHTS_OPERATOR_INTEGRATION'}), (target {id: 'COMPLIANCE_INSIGHTS_ENGINE'}) CREATE (source)-[:CONTAINS {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'INSIGHTS_OPERATOR_INTEGRATION'}), (target {id: 'CLUSTER_ADVISOR_INTEGRATION'}) CREATE (source)-[:CONTAINS {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'INSIGHTS_OPERATOR_INTEGRATION'}), (target {id: 'INSIGHTS_REMEDIATION_ENGINE'}) CREATE (source)-[:CONTAINS {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'GOV_POLICY_PROP'}), (target {id: 'ROOT_POLICY_RECONCILER'}) CREATE (source)-[:CONTAINS {subsystem: 'Governance', cross_cluster: false}]->(target);
MATCH (source {id: 'GOV_POLICY_PROP'}), (target {id: 'REPLICATED_POLICY_RECONCILER'}) CREATE (source)-[:CONTAINS {subsystem: 'Governance', cross_cluster: false}]->(target);
MATCH (source {id: 'GOV_POLICY_PROP'}), (target {id: 'ROOT_POLICY_STATUS_RECONCILER'}) CREATE (source)-[:CONTAINS {subsystem: 'Governance', cross_cluster: false}]->(target);
MATCH (source {id: 'GOV_POLICY_PROP'}), (target {id: 'POLICY_SET_RECONCILER'}) CREATE (source)-[:CONTAINS {subsystem: 'Governance', cross_cluster: false}]->(target);
MATCH (source {id: 'GOV_POLICY_PROP'}), (target {id: 'POLICY_AUTOMATION_RECONCILER'}) CREATE (source)-[:CONTAINS {subsystem: 'Governance', cross_cluster: false}]->(target);
MATCH (source {id: 'GOV_POLICY_PROP'}), (target {id: 'ENCRYPTION_KEYS_RECONCILER'}) CREATE (source)-[:CONTAINS {subsystem: 'Governance', cross_cluster: false}]->(target);
MATCH (source {id: 'GOV_POLICY_FRAMEWORK_ADDON'}), (target {id: 'SPEC_SYNC_CTRL'}) CREATE (source)-[:CONTAINS {subsystem: 'Governance', cross_cluster: false}]->(target);
MATCH (source {id: 'GOV_POLICY_FRAMEWORK_ADDON'}), (target {id: 'STATUS_SYNC_CTRL'}) CREATE (source)-[:CONTAINS {subsystem: 'Governance', cross_cluster: false}]->(target);
MATCH (source {id: 'GOV_POLICY_FRAMEWORK_ADDON'}), (target {id: 'TEMPLATE_SYNC_CTRL'}) CREATE (source)-[:CONTAINS {subsystem: 'Governance', cross_cluster: false}]->(target);
MATCH (source {id: 'GOV_POLICY_FRAMEWORK_ADDON'}), (target {id: 'SECRET_SYNC_CTRL'}) CREATE (source)-[:CONTAINS {subsystem: 'Governance', cross_cluster: false}]->(target);
MATCH (source {id: 'GOV_POLICY_FRAMEWORK_ADDON'}), (target {id: 'GATEKEEPER_SYNC_CTRL'}) CREATE (source)-[:CONTAINS {subsystem: 'Governance', cross_cluster: false}]->(target);
MATCH (source {id: 'CONFIG_POLICY_CTRL'}), (target {id: 'CONFIGURATION_POLICY_RECONCILER'}) CREATE (source)-[:CONTAINS {subsystem: 'Governance', cross_cluster: false}]->(target);
MATCH (source {id: 'CONFIG_POLICY_CTRL'}), (target {id: 'OPERATOR_POLICY_RECONCILER'}) CREATE (source)-[:CONTAINS {subsystem: 'Governance', cross_cluster: false}]->(target);
MATCH (source {id: 'CONFIG_POLICY_CTRL'}), (target {id: 'TEMPLATE_PROCESSING_ENGINE'}) CREATE (source)-[:CONTAINS {subsystem: 'Governance', cross_cluster: false}]->(target);
MATCH (source {id: 'TEMPLATE_PROCESSING_ENGINE'}), (target {id: 'HUB_DYNAMIC_WATCHER'}) CREATE (source)-[:CONTAINS {subsystem: 'Governance', cross_cluster: false}]->(target);
MATCH (source {id: 'TEMPLATE_PROCESSING_ENGINE'}), (target {id: 'GOLANG_TEMPLATE_RESOLVER'}) CREATE (source)-[:CONTAINS {subsystem: 'Governance', cross_cluster: false}]->(target);
MATCH (source {id: 'TEMPLATE_PROCESSING_ENGINE'}), (target {id: 'TEMPLATE_ENCRYPTION_ENGINE'}) CREATE (source)-[:CONTAINS {subsystem: 'Governance', cross_cluster: false}]->(target);
MATCH (source {id: 'CERT_POLICY_CTRL'}), (target {id: 'CERT_VALIDATION_ENGINE'}) CREATE (source)-[:CONTAINS {subsystem: 'Governance', cross_cluster: false}]->(target);
MATCH (source {id: 'CERT_VALIDATION_ENGINE'}), (target {id: 'DURATION_VALIDATORS'}) CREATE (source)-[:CONTAINS {subsystem: 'Governance', cross_cluster: false}]->(target);
MATCH (source {id: 'CERT_VALIDATION_ENGINE'}), (target {id: 'SAN_PATTERN_VALIDATORS'}) CREATE (source)-[:CONTAINS {subsystem: 'Governance', cross_cluster: false}]->(target);
MATCH (source {id: 'CERT_POLICY_CTRL'}), (target {id: 'CERT_DISCOVERY_ENGINE'}) CREATE (source)-[:CONTAINS {subsystem: 'Governance', cross_cluster: false}]->(target);
MATCH (source {id: 'CERT_POLICY_CTRL'}), (target {id: 'CERT_COMPLIANCE_REPORTER'}) CREATE (source)-[:CONTAINS {subsystem: 'Governance', cross_cluster: false}]->(target);
MATCH (source {id: 'ACM_CLI'}), (target {id: 'CLI_DISTRIBUTION_SERVER'}) CREATE (source)-[:CONTAINS {subsystem: 'Governance', cross_cluster: false}]->(target);
MATCH (source {id: 'GOV_POLICY_PROP'}), (target {id: 'POLICY_PROPAGATOR_CTRL'}) CREATE (source)-[:CONTAINS {subsystem: 'Governance', cross_cluster: false}]->(target);
MATCH (source {id: 'POLICY_PROPAGATOR_CTRL'}), (target {id: 'STATUS_AGGREGATION_ENGINE'}) CREATE (source)-[:CONTAINS {subsystem: 'Governance', cross_cluster: false}]->(target);
MATCH (source {id: 'IAM_POLICY_CTRL'}), (target {id: 'IAM_POLICY_RECONCILER'}) CREATE (source)-[:CONTAINS {subsystem: 'Governance', cross_cluster: false}]->(target);
MATCH (source {id: 'CLUSTER_ROLE_BINDING_VALIDATOR'}), (target {id: 'USER_THRESHOLD_VALIDATOR'}) CREATE (source)-[:CONTAINS {subsystem: 'Governance', cross_cluster: false}]->(target);
MATCH (source {id: 'K8S_DEPENDENCY_WATCHES'}), (target {id: 'DEPENDENCY_WATCHER'}) CREATE (source)-[:CONTAINS {subsystem: 'Governance', cross_cluster: false}]->(target);
MATCH (source {id: 'MUST_GATHER'}), (target {id: 'MUST_GATHER_ENGINE'}) CREATE (source)-[:CONTAINS {subsystem: 'Governance', cross_cluster: false}]->(target);
MATCH (source {id: 'MULTICLOUD_INTEGRATIONS'}), (target {id: 'GITOPS_CLUSTER_CTRL'}) CREATE (source)-[:CONTAINS {subsystem: 'Application', cross_cluster: false}]->(target);
MATCH (source {id: 'MULTICLOUD_INTEGRATIONS'}), (target {id: 'GITOPS_SYNC_RESOURCE_CTRL'}) CREATE (source)-[:CONTAINS {subsystem: 'Application', cross_cluster: false}]->(target);
MATCH (source {id: 'MULTICLOUD_INTEGRATIONS'}), (target {id: 'STATUS_AGGREGATION_CTRL'}) CREATE (source)-[:CONTAINS {subsystem: 'Application', cross_cluster: false}]->(target);
MATCH (source {id: 'MULTICLOUD_INTEGRATIONS'}), (target {id: 'PROPAGATION_CTRL'}) CREATE (source)-[:CONTAINS {subsystem: 'Application', cross_cluster: false}]->(target);
MATCH (source {id: 'MULTICLOUD_INTEGRATIONS'}), (target {id: 'GITOPS_ADDON_CTRL'}) CREATE (source)-[:CONTAINS {subsystem: 'Application', cross_cluster: false}]->(target);
MATCH (source {id: 'ARGOCD_PULL_INTEGRATION'}), (target {id: 'APPLICATION_CTRL'}) CREATE (source)-[:CONTAINS {subsystem: 'Application', cross_cluster: false}]->(target);
MATCH (source {id: 'ARGOCD_PULL_INTEGRATION'}), (target {id: 'APPLICATION_STATUS_CTRL'}) CREATE (source)-[:CONTAINS {subsystem: 'Application', cross_cluster: false}]->(target);
MATCH (source {id: 'ARGOCD_PULL_INTEGRATION'}), (target {id: 'CLUSTER_CTRL'}) CREATE (source)-[:CONTAINS {subsystem: 'Application', cross_cluster: false}]->(target);
MATCH (source {id: 'MCO_OPERATOR'}), (target {id: 'OBSERVABILITY_CONTROLLER'}) CREATE (source)-[:CONTAINS {subsystem: 'Observability', cross_cluster: false}]->(target);
MATCH (source {id: 'MCO_OPERATOR'}), (target {id: 'METRICS_COLLECTION_MANAGER'}) CREATE (source)-[:CONTAINS {subsystem: 'Observability', cross_cluster: false}]->(target);
MATCH (source {id: 'MCO_OPERATOR'}), (target {id: 'ADDON_DEPLOYMENT_CONTROLLER'}) CREATE (source)-[:CONTAINS {subsystem: 'Observability', cross_cluster: false}]->(target);
MATCH (source {id: 'MCO_OPERATOR'}), (target {id: 'CONFIGURATION_RECONCILER'}) CREATE (source)-[:CONTAINS {subsystem: 'Observability', cross_cluster: false}]->(target);
MATCH (source {id: 'MCO_OPERATOR'}), (target {id: 'OBSERVABILITY_ADDON'}) CREATE (source)-[:CONTAINS {subsystem: 'Observability', cross_cluster: false}]->(target);
MATCH (source {id: 'OBSERVATORIUM_OP'}), (target {id: 'OBSERVATORIUM_DEPLOYMENT_CTRL'}) CREATE (source)-[:CONTAINS {subsystem: 'Observability', cross_cluster: false}]->(target);
MATCH (source {id: 'OBSERVATORIUM_OP'}), (target {id: 'THANOS_INTEGRATION_MANAGER'}) CREATE (source)-[:CONTAINS {subsystem: 'Observability', cross_cluster: false}]->(target);
MATCH (source {id: 'OBSERVATORIUM_OP'}), (target {id: 'STORAGE_CONFIGURATION_CTRL'}) CREATE (source)-[:CONTAINS {subsystem: 'Observability', cross_cluster: false}]->(target);
MATCH (source {id: 'OBSERVATORIUM'}), (target {id: 'QUERY_GATEWAY'}) CREATE (source)-[:CONTAINS {subsystem: 'Observability', cross_cluster: false}]->(target);
MATCH (source {id: 'OBSERVATORIUM'}), (target {id: 'RULER_ENGINE'}) CREATE (source)-[:CONTAINS {subsystem: 'Observability', cross_cluster: false}]->(target);
MATCH (source {id: 'OBSERVATORIUM'}), (target {id: 'COMPACTOR_SERVICE'}) CREATE (source)-[:CONTAINS {subsystem: 'Observability', cross_cluster: false}]->(target);
MATCH (source {id: 'OBSERVATORIUM'}), (target {id: 'STORE_GATEWAY'}) CREATE (source)-[:CONTAINS {subsystem: 'Observability', cross_cluster: false}]->(target);
MATCH (source {id: 'THANOS'}), (target {id: 'METRICS_STORAGE'}) CREATE (source)-[:CONTAINS {subsystem: 'Observability', cross_cluster: false}]->(target);
MATCH (source {id: 'THANOS'}), (target {id: 'QUERY_ENGINE'}) CREATE (source)-[:CONTAINS {subsystem: 'Observability', cross_cluster: false}]->(target);
MATCH (source {id: 'GRAFANA'}), (target {id: 'DASHBOARD_CONTROLLER'}) CREATE (source)-[:CONTAINS {subsystem: 'Observability', cross_cluster: false}]->(target);
MATCH (source {id: 'GRAFANA'}), (target {id: 'ALERT_MANAGER_INTEGRATION'}) CREATE (source)-[:CONTAINS {subsystem: 'Observability', cross_cluster: false}]->(target);
MATCH (source {id: 'SEARCH_V2_OPERATOR'}), (target {id: 'SEARCH_OPERATOR_CTRL'}) CREATE (source)-[:CONTAINS {subsystem: 'Search', cross_cluster: false}]->(target);
MATCH (source {id: 'SEARCH_V2_OPERATOR'}), (target {id: 'INDEX_MANAGER'}) CREATE (source)-[:CONTAINS {subsystem: 'Search', cross_cluster: false}]->(target);
MATCH (source {id: 'SEARCH_V2_OPERATOR'}), (target {id: 'COLLECTOR_MANAGER'}) CREATE (source)-[:CONTAINS {subsystem: 'Search', cross_cluster: false}]->(target);
MATCH (source {id: 'SEARCH_V2_OPERATOR'}), (target {id: 'API_GATEWAY_CTRL'}) CREATE (source)-[:CONTAINS {subsystem: 'Search', cross_cluster: false}]->(target);
MATCH (source {id: 'SEARCH_INDEXER'}), (target {id: 'RESOURCE_INDEXER'}) CREATE (source)-[:CONTAINS {subsystem: 'Search', cross_cluster: false}]->(target);
MATCH (source {id: 'SEARCH_INDEXER'}), (target {id: 'SCHEMA_REGISTRY'}) CREATE (source)-[:CONTAINS {subsystem: 'Search', cross_cluster: false}]->(target);
MATCH (source {id: 'SEARCH_INDEXER'}), (target {id: 'ELASTICSEARCH_INTEGRATION'}) CREATE (source)-[:CONTAINS {subsystem: 'Search', cross_cluster: false}]->(target);
MATCH (source {id: 'SEARCH_INDEXER'}), (target {id: 'QUERY_PROCESSOR'}) CREATE (source)-[:CONTAINS {subsystem: 'Search', cross_cluster: false}]->(target);
MATCH (source {id: 'SEARCH_COLLECTOR'}), (target {id: 'RESOURCE_MONITOR'}) CREATE (source)-[:CONTAINS {subsystem: 'Search', cross_cluster: false}]->(target);
MATCH (source {id: 'SEARCH_COLLECTOR'}), (target {id: 'EVENT_COLLECTOR'}) CREATE (source)-[:CONTAINS {subsystem: 'Search', cross_cluster: false}]->(target);
MATCH (source {id: 'SEARCH_COLLECTOR'}), (target {id: 'DATA_TRANSFORMER'}) CREATE (source)-[:CONTAINS {subsystem: 'Search', cross_cluster: false}]->(target);
MATCH (source {id: 'SEARCH_COLLECTOR'}), (target {id: 'COLLECTION_AGENT'}) CREATE (source)-[:CONTAINS {subsystem: 'Search', cross_cluster: false}]->(target);
MATCH (source {id: 'SEARCH_V2_API'}), (target {id: 'GRAPHQL_API_SERVER'}) CREATE (source)-[:CONTAINS {subsystem: 'Search', cross_cluster: false}]->(target);
MATCH (source {id: 'SEARCH_V2_API'}), (target {id: 'REST_API_GATEWAY'}) CREATE (source)-[:CONTAINS {subsystem: 'Search', cross_cluster: false}]->(target);
MATCH (source {id: 'SEARCH_V2_API'}), (target {id: 'QUERY_OPTIMIZER'}) CREATE (source)-[:CONTAINS {subsystem: 'Search', cross_cluster: false}]->(target);
MATCH (source {id: 'SEARCH_V2_API'}), (target {id: 'RBAC_INTEGRATION'}) CREATE (source)-[:CONTAINS {subsystem: 'Search', cross_cluster: false}]->(target);
MATCH (source {id: 'CONSOLE'}), (target {id: 'CONSOLE_BACKEND_API'}) CREATE (source)-[:CONTAINS {subsystem: 'Console', cross_cluster: false}]->(target);
MATCH (source {id: 'CONSOLE'}), (target {id: 'RBAC_MIDDLEWARE'}) CREATE (source)-[:CONTAINS {subsystem: 'Console', cross_cluster: false}]->(target);
MATCH (source {id: 'CONSOLE'}), (target {id: 'MULTI_CLUSTER_NAV'}) CREATE (source)-[:CONTAINS {subsystem: 'Console', cross_cluster: false}]->(target);
MATCH (source {id: 'CONSOLE'}), (target {id: 'REACT_COMPONENTS'}) CREATE (source)-[:CONTAINS {subsystem: 'Console', cross_cluster: false}]->(target);
MATCH (source {id: 'CONSOLE'}), (target {id: 'DASHBOARD_RENDERER'}) CREATE (source)-[:CONTAINS {subsystem: 'Console', cross_cluster: false}]->(target);
MATCH (source {id: 'CONSOLE'}), (target {id: 'CLUSTER_OVERVIEW'}) CREATE (source)-[:CONTAINS {subsystem: 'Console', cross_cluster: false}]->(target);
MATCH (source {id: 'CONSOLE_API'}), (target {id: 'REST_API_CONTROLLERS'}) CREATE (source)-[:CONTAINS {subsystem: 'Console', cross_cluster: false}]->(target);
MATCH (source {id: 'CONSOLE_API'}), (target {id: 'RESOURCE_PROXY'}) CREATE (source)-[:CONTAINS {subsystem: 'Console', cross_cluster: false}]->(target);
MATCH (source {id: 'CONSOLE_API'}), (target {id: 'AUTHENTICATION_HANDLER'}) CREATE (source)-[:CONTAINS {subsystem: 'Console', cross_cluster: false}]->(target);
MATCH (source {id: 'CONSOLE_API'}), (target {id: 'WEBSOCKET_MANAGER'}) CREATE (source)-[:CONTAINS {subsystem: 'Console', cross_cluster: false}]->(target);
MATCH (source {id: 'CONSOLE_API'}), (target {id: 'SESSION_MANAGER'}) CREATE (source)-[:CONTAINS {subsystem: 'Console', cross_cluster: false}]->(target);
MATCH (source {id: 'CONSOLE'}), (target {id: 'PLUGIN_REGISTRY'}) CREATE (source)-[:CONTAINS {subsystem: 'Console', cross_cluster: false}]->(target);
MATCH (source {id: 'CONSOLE'}), (target {id: 'PLUGIN_MANAGEMENT'}) CREATE (source)-[:CONTAINS {subsystem: 'Console', cross_cluster: false}]->(target);
MATCH (source {id: 'CONSOLE'}), (target {id: 'CONSOLE_ROUTE_HANDLER'}) CREATE (source)-[:CONTAINS {subsystem: 'Console', cross_cluster: false}]->(target);
MATCH (source {id: 'CONSOLE'}), (target {id: 'OPENSHIFT_CONSOLE_BRIDGE'}) CREATE (source)-[:CONTAINS {subsystem: 'Console', cross_cluster: false}]->(target);

// MANAGES relationships
MATCH (source {id: 'ANSIBLE_JOB_CONTROLLER'}), (target {id: 'ANSIBLE_JOB_CRD'}) CREATE (source)-[:MANAGES {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'JOB_TEMPLATE_CONTROLLER'}), (target {id: 'JOB_TEMPLATE_CRD'}) CREATE (source)-[:MANAGES {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'GLOBAL_HUB_MANAGER'}), (target {id: 'GLOBAL_HUB_GRAFANA'}) CREATE (source)-[:MANAGES {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'SUBMARINER_OPERATOR'}), (target {id: 'GLOBALNET_CONTROLLER'}) CREATE (source)-[:MANAGES {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'OADP_OPERATOR'}), (target {id: 'CLUSTER_BACKUP_SCHEDULE'}) CREATE (source)-[:MANAGES {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'ADDON_MANAGER'}), (target {id: 'GOV_POLICY_FRAMEWORK_ADDON'}) CREATE (source)-[:MANAGES {subsystem: 'Governance', cross_cluster: false}]->(target);
MATCH (source {id: 'ADDON_MANAGER'}), (target {id: 'CONFIG_POLICY_CTRL'}) CREATE (source)-[:MANAGES {subsystem: 'Governance', cross_cluster: false}]->(target);
MATCH (source {id: 'ADDON_MANAGER'}), (target {id: 'GOV_STANDALONE_HUB_TEMPLATING'}) CREATE (source)-[:MANAGES {subsystem: 'Governance', cross_cluster: false}]->(target);
MATCH (source {id: 'ADDON_MANAGER'}), (target {id: 'CERT_POLICY_CTRL'}) CREATE (source)-[:MANAGES {subsystem: 'Governance', cross_cluster: false}]->(target);
MATCH (source {id: 'ADDON_MANAGER'}), (target {id: 'IAM_POLICY_CTRL'}) CREATE (source)-[:MANAGES {subsystem: 'Governance', cross_cluster: false}]->(target);
MATCH (source {id: 'GITOPS_ADDON_CTRL'}), (target {id: 'GITOPS_OPERATOR'}) CREATE (source)-[:MANAGES {subsystem: 'Application', cross_cluster: false}]->(target);
MATCH (source {id: 'CLUSTER_CTRL'}), (target {id: 'MANAGEDCLUSTER_CRD'}) CREATE (source)-[:MANAGES {subsystem: 'Application', cross_cluster: false}]->(target);
MATCH (source {id: 'MULTICLOUD_OPS_FOUNDATION'}), (target {id: 'MANAGEDCLUSTER_IMPORT_CTRL'}) CREATE (source)-[:MANAGES {subsystem: 'Cluster', cross_cluster: false}]->(target);
MATCH (source {id: 'MULTICLOUD_OPS_FOUNDATION'}), (target {id: 'KLUSTERLET_ADDON_CTRL'}) CREATE (source)-[:MANAGES {subsystem: 'Cluster', cross_cluster: false}]->(target);
MATCH (source {id: 'PROVIDER_CREDENTIAL_CTRL'}), (target {id: 'CLOUD_CREDENTIALS'}) CREATE (source)-[:MANAGES {subsystem: 'Cluster', cross_cluster: false}]->(target);
MATCH (source {id: 'HYPERSHIFT_ADDON_OP'}), (target {id: 'HYPERSHIFT_ADDON_MANAGER'}) CREATE (source)-[:MANAGES {subsystem: 'Cluster', cross_cluster: false}]->(target);
MATCH (source {id: 'ADDON_FRAMEWORK'}), (target {id: 'MANAGEDCLUSTER_ADDON_CRD'}) CREATE (source)-[:MANAGES {subsystem: 'Cluster', cross_cluster: false}]->(target);
MATCH (source {id: 'SEARCH_V2_OPERATOR'}), (target {id: 'SEARCH_V2_API'}) CREATE (source)-[:MANAGES {subsystem: 'Search', cross_cluster: false}]->(target);
MATCH (source {id: 'SEARCH_V2_OPERATOR'}), (target {id: 'SEARCH_INDEXER'}) CREATE (source)-[:MANAGES {subsystem: 'Search', cross_cluster: false}]->(target);
MATCH (source {id: 'SEARCH_V2_OPERATOR'}), (target {id: 'SEARCH_COLLECTOR'}) CREATE (source)-[:MANAGES {subsystem: 'Search', cross_cluster: false}]->(target);
MATCH (source {id: 'PLUGIN_MANAGEMENT'}), (target {id: 'MCE_PLUGIN'}) CREATE (source)-[:MANAGES {subsystem: 'Console', cross_cluster: false}]->(target);

// DEPLOYS relationships
MATCH (source {id: 'GLOBAL_HUB_OPERATOR'}), (target {id: 'KAFKA_TRANSPORT'}) CREATE (source)-[:DEPLOYS {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'GLOBAL_HUB_OPERATOR'}), (target {id: 'POSTGRES_STORAGE'}) CREATE (source)-[:DEPLOYS {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'OBSERVATORIUM_OP'}), (target {id: 'OBSERVATORIUM'}) CREATE (source)-[:DEPLOYS {subsystem: 'Observability', cross_cluster: false}]->(target);
MATCH (source {id: 'PROMETHEUS_OP'}), (target {id: 'PROMETHEUS'}) CREATE (source)-[:DEPLOYS {subsystem: 'Observability', cross_cluster: false}]->(target);
MATCH (source {id: 'PROMETHEUS_OP'}), (target {id: 'PROMETHEUS_ALERTMANAGER'}) CREATE (source)-[:DEPLOYS {subsystem: 'Observability', cross_cluster: false}]->(target);

// USES relationships
MATCH (source {id: 'GLOBAL_HUB_MANAGER'}), (target {id: 'KAFKA_TRANSPORT'}) CREATE (source)-[:USES {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'VELERO_BACKUP_CONTROLLER'}), (target {id: 'BACKUP_STORAGE_LOCATION'}) CREATE (source)-[:USES {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'POLICY_GEN'}), (target {id: 'POLICY_GENERATOR_CR'}) CREATE (source)-[:USES {subsystem: 'Governance', cross_cluster: false}]->(target);
MATCH (source {id: 'PLUGIN_PROCESSING_ENGINE'}), (target {id: 'POLICY_EXPANDERS'}) CREATE (source)-[:USES {subsystem: 'Governance', cross_cluster: false}]->(target);
MATCH (source {id: 'GOV_POLICY_ADDON_CTRL'}), (target {id: 'ADDON_FACTORY'}) CREATE (source)-[:USES {subsystem: 'Governance', cross_cluster: false}]->(target);
MATCH (source {id: 'CONFIG_POLICY_CTRL'}), (target {id: 'DYNAMIC_WATCHER'}) CREATE (source)-[:USES {subsystem: 'Governance', cross_cluster: false}]->(target);
MATCH (source {id: 'CONFIG_POLICY_CTRL'}), (target {id: 'TEMPLATE_ENGINE'}) CREATE (source)-[:USES {subsystem: 'Governance', cross_cluster: false}]->(target);
MATCH (source {id: 'CONFIG_POLICY_CTRL'}), (target {id: 'NAMESPACE_SELECTOR'}) CREATE (source)-[:USES {subsystem: 'Governance', cross_cluster: false}]->(target);
MATCH (source {id: 'CONFIGURATION_POLICY_RECONCILER'}), (target {id: 'OBJECT_EVALUATOR'}) CREATE (source)-[:USES {subsystem: 'Governance', cross_cluster: false}]->(target);
MATCH (source {id: 'CONFIGURATION_POLICY_RECONCILER'}), (target {id: 'NAMESPACE_SELECTOR_RECONCILER'}) CREATE (source)-[:USES {subsystem: 'Governance', cross_cluster: false}]->(target);
MATCH (source {id: 'OPERATOR_POLICY_RECONCILER'}), (target {id: 'OLM_HANDLERS'}) CREATE (source)-[:USES {subsystem: 'Governance', cross_cluster: false}]->(target);
MATCH (source {id: 'CONFIG_POLICY_CTRL'}), (target {id: 'COMPLIANCE_EVALUATOR'}) CREATE (source)-[:USES {subsystem: 'Governance', cross_cluster: false}]->(target);
MATCH (source {id: 'CONFIG_POLICY_CTRL'}), (target {id: 'REMEDIATION_ENGINE'}) CREATE (source)-[:USES {subsystem: 'Governance', cross_cluster: false}]->(target);
MATCH (source {id: 'CONFIG_POLICY_CTRL'}), (target {id: 'EVENT_GENERATOR'}) CREATE (source)-[:USES {subsystem: 'Governance', cross_cluster: false}]->(target);
MATCH (source {id: 'CERT_POLICY_CTRL'}), (target {id: 'COMPLIANCE_EVALUATOR'}) CREATE (source)-[:USES {subsystem: 'Governance', cross_cluster: false}]->(target);
MATCH (source {id: 'CERT_POLICY_CTRL'}), (target {id: 'EVENT_GENERATOR'}) CREATE (source)-[:USES {subsystem: 'Governance', cross_cluster: false}]->(target);
MATCH (source {id: 'CLI_DISTRIBUTION_SERVER'}), (target {id: 'CLI_BINARY_AGGREGATOR'}) CREATE (source)-[:USES {subsystem: 'Governance', cross_cluster: false}]->(target);
MATCH (source {id: 'CLI_DISTRIBUTION_SERVER'}), (target {id: 'CLI_PACKAGER'}) CREATE (source)-[:USES {subsystem: 'Governance', cross_cluster: false}]->(target);
MATCH (source {id: 'POLICY_PROPAGATOR_CTRL'}), (target {id: 'PLACEMENT_BINDING_HANDLER'}) CREATE (source)-[:USES {subsystem: 'Governance', cross_cluster: false}]->(target);
MATCH (source {id: 'POLICY_PROPAGATOR_CTRL'}), (target {id: 'PLACEMENT_DECISION_HANDLER'}) CREATE (source)-[:USES {subsystem: 'Governance', cross_cluster: false}]->(target);
MATCH (source {id: 'POLICY_PROPAGATOR_CTRL'}), (target {id: 'PLACEMENT_RULE_HANDLER'}) CREATE (source)-[:USES {subsystem: 'Governance', cross_cluster: false}]->(target);
MATCH (source {id: 'POLICY_PROPAGATOR_CTRL'}), (target {id: 'TEMPLATE_RESOLVERS'}) CREATE (source)-[:USES {subsystem: 'Governance', cross_cluster: false}]->(target);
MATCH (source {id: 'POLICY_PROPAGATOR_CTRL'}), (target {id: 'RESOURCE_VERSION_TRACKER'}) CREATE (source)-[:USES {subsystem: 'Governance', cross_cluster: false}]->(target);
MATCH (source {id: 'STATUS_AGGREGATION_ENGINE'}), (target {id: 'ROOT_COMPLIANCE_CALCULATOR'}) CREATE (source)-[:USES {subsystem: 'Governance', cross_cluster: false}]->(target);
MATCH (source {id: 'TEMPLATE_RESOLVERS'}), (target {id: 'ENCRYPTION_SYSTEM'}) CREATE (source)-[:USES {subsystem: 'Governance', cross_cluster: false}]->(target);
MATCH (source {id: 'IAM_POLICY_RECONCILER'}), (target {id: 'CLUSTER_ROLE_BINDING_VALIDATOR'}) CREATE (source)-[:USES {subsystem: 'Governance', cross_cluster: false}]->(target);
MATCH (source {id: 'IAM_POLICY_RECONCILER'}), (target {id: 'IAM_COMPLIANCE_REPORTER'}) CREATE (source)-[:USES {subsystem: 'Governance', cross_cluster: false}]->(target);
MATCH (source {id: 'DEPENDENCY_WATCHER'}), (target {id: 'DEPENDENCY_TRACKER'}) CREATE (source)-[:USES {subsystem: 'Governance', cross_cluster: false}]->(target);
MATCH (source {id: 'HUB_DATA_COLLECTOR'}), (target {id: 'POD_DATA_COLLECTOR'}) CREATE (source)-[:USES {subsystem: 'Governance', cross_cluster: false}]->(target);
MATCH (source {id: 'MUST_GATHER_ENGINE'}), (target {id: 'RESOURCE_ORGANIZER'}) CREATE (source)-[:USES {subsystem: 'Governance', cross_cluster: false}]->(target);
MATCH (source {id: 'GITOPS_ADDON_CTRL'}), (target {id: 'CLUSTER_PERMISSION_CRD'}) CREATE (source)-[:USES {subsystem: 'Application', cross_cluster: false}]->(target);
MATCH (source {id: 'CURATOR_JOBS'}), (target {id: 'JOB_TEMPLATE_CRD'}) CREATE (source)-[:USES {subsystem: 'Cluster', cross_cluster: false}]->(target);
MATCH (source {id: 'MULTI_CLUSTER_NAV'}), (target {id: 'CLUSTER_SELECTOR'}) CREATE (source)-[:USES {subsystem: 'Console', cross_cluster: false}]->(target);

// PERSISTS_TO relationships
MATCH (source {id: 'GLOBAL_HUB_MANAGER'}), (target {id: 'POSTGRES_STORAGE'}) CREATE (source)-[:PERSISTS_TO {subsystem: 'Overview', cross_cluster: false}]->(target);

// COMMUNICATES_VIA relationships
MATCH (source {id: 'GLOBAL_HUB_AGENT'}), (target {id: 'TRANSPORT_BRIDGE'}) CREATE (source)-[:COMMUNICATES_VIA {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'REACT_COMPONENTS'}), (target {id: 'REST_API_CONTROLLERS'}) CREATE (source)-[:COMMUNICATES_VIA {subsystem: 'Console', cross_cluster: false}]->(target);

// PROVIDES relationships
MATCH (source {id: 'SUBMARINER_OPERATOR'}), (target {id: 'SUBCTL_CLI'}) CREATE (source)-[:PROVIDES {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'GOLANG_TEMPLATE_RESOLVER'}), (target {id: 'FROM_SECRET_FUNC'}) CREATE (source)-[:PROVIDES {subsystem: 'Governance', cross_cluster: false}]->(target);
MATCH (source {id: 'GOLANG_TEMPLATE_RESOLVER'}), (target {id: 'FROM_CONFIGMAP_FUNC'}) CREATE (source)-[:PROVIDES {subsystem: 'Governance', cross_cluster: false}]->(target);
MATCH (source {id: 'GOLANG_TEMPLATE_RESOLVER'}), (target {id: 'FROM_CLUSTERCLAIM_FUNC'}) CREATE (source)-[:PROVIDES {subsystem: 'Governance', cross_cluster: false}]->(target);
MATCH (source {id: 'GOLANG_TEMPLATE_RESOLVER'}), (target {id: 'LOOKUP_FUNC'}) CREATE (source)-[:PROVIDES {subsystem: 'Governance', cross_cluster: false}]->(target);

// INTEGRATES_WITH relationships
MATCH (source {id: 'LIGHTHOUSE_AGENT'}), (target {id: 'LIGHTHOUSE_COREDNS'}) CREATE (source)-[:INTEGRATES_WITH {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'CLUSTER_PROVISIONING_ENGINE'}), (target {id: 'CLUSTER_CURATOR_CTRL'}) CREATE (source)-[:INTEGRATES_WITH {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'CLI_DISTRIBUTION_SERVER'}), (target {id: 'CONSOLE_CLI_DOWNLOAD'}) CREATE (source)-[:INTEGRATES_WITH {subsystem: 'Governance', cross_cluster: false}]->(target);
MATCH (source {id: 'DEPENDENCY_WATCHER'}), (target {id: 'CONTROLLER_RUNTIME_SOURCE'}) CREATE (source)-[:INTEGRATES_WITH {subsystem: 'Governance', cross_cluster: false}]->(target);
MATCH (source {id: 'GOV_POLICY_FRAMEWORK'}), (target {id: 'GATEKEEPER_OP'}) CREATE (source)-[:INTEGRATES_WITH {subsystem: 'Governance', cross_cluster: false}]->(target);
MATCH (source {id: 'APPLIFECYCLE_BACKEND_E2E'}), (target {id: 'MULTICLOUD_INTEGRATIONS'}) CREATE (source)-[:INTEGRATES_WITH {subsystem: 'Application', cross_cluster: false}]->(target);
MATCH (source {id: 'HYPERSHIFT_ADDON_OP'}), (target {id: 'HIVE'}) CREATE (source)-[:INTEGRATES_WITH {subsystem: 'Cluster', cross_cluster: false}]->(target);
MATCH (source {id: 'CONSOLE'}), (target {id: 'GITHUB_INTEGRATION'}) CREATE (source)-[:INTEGRATES_WITH {subsystem: 'Console', cross_cluster: false}]->(target);
MATCH (source {id: 'CONSOLE'}), (target {id: 'INSIGHTS_INTEGRATION'}) CREATE (source)-[:INTEGRATES_WITH {subsystem: 'Console', cross_cluster: false}]->(target);
MATCH (source {id: 'CONSOLE'}), (target {id: 'CONSOLE_CLI_DOWNLOAD'}) CREATE (source)-[:INTEGRATES_WITH {subsystem: 'Console', cross_cluster: false}]->(target);

// CONFIGURES relationships
MATCH (source {id: 'OADP_OPERATOR'}), (target {id: 'BACKUP_STORAGE_LOCATION'}) CREATE (source)-[:CONFIGURES {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'GATEKEEPER_FBC'}), (target {id: 'GATEKEEPER_OP'}) CREATE (source)-[:CONFIGURES {subsystem: 'Governance', cross_cluster: false}]->(target);
MATCH (source {id: 'METRICS_COLLECTION_MANAGER'}), (target {id: 'PROMETHEUS'}) CREATE (source)-[:CONFIGURES {subsystem: 'Observability', cross_cluster: false}]->(target);
MATCH (source {id: 'MANAGEDCLUSTER_ADDON'}), (target {id: 'HYPERSHIFT_ADDON_AGENT'}) CREATE (source)-[:CONFIGURES {subsystem: 'Cluster', cross_cluster: false}]->(target);

// PROVISIONS_CLUSTERS_VIA relationships
MATCH (source {id: 'INFRASTRUCTURE_PROVIDER_MANAGER'}), (target {id: 'HIVE'}) CREATE (source)-[:PROVISIONS_CLUSTERS_VIA {subsystem: 'Overview', cross_cluster: false}]->(target);

// CONFIGURES_CLUSTERS_FOR relationships
MATCH (source {id: 'BOOTSTRAP_CONFIG_MANAGER'}), (target {id: 'MCE'}) CREATE (source)-[:CONFIGURES_CLUSTERS_FOR {subsystem: 'Overview', cross_cluster: false}]->(target);

// FEEDS_DATA_TO relationships
MATCH (source {id: 'CLUSTER_HEALTH_COLLECTOR'}), (target {id: 'OBS'}) CREATE (source)-[:FEEDS_DATA_TO {subsystem: 'Overview', cross_cluster: false}]->(target);

// PROVIDES_INSIGHTS_TO relationships
MATCH (source {id: 'COMPLIANCE_INSIGHTS_ENGINE'}), (target {id: 'GRC'}) CREATE (source)-[:PROVIDES_INSIGHTS_TO {subsystem: 'Overview', cross_cluster: false}]->(target);

// RECOMMENDS_ACTIONS_TO relationships
MATCH (source {id: 'CLUSTER_ADVISOR_INTEGRATION'}), (target {id: 'CLUSTER'}) CREATE (source)-[:RECOMMENDS_ACTIONS_TO {subsystem: 'Overview', cross_cluster: false}]->(target);

// TRIGGERS_REMEDIATION_VIA relationships
MATCH (source {id: 'INSIGHTS_REMEDIATION_ENGINE'}), (target {id: 'GOV_POLICY_PROP'}) CREATE (source)-[:TRIGGERS_REMEDIATION_VIA {subsystem: 'Overview', cross_cluster: false}]->(target);

// CONNECTS_TO relationships
MATCH (source {id: 'INSIGHTS_INTEGRATION'}), (target {id: 'INSIGHTS_OPERATOR_INTEGRATION'}) CREATE (source)-[:CONNECTS_TO {subsystem: 'Overview', cross_cluster: false}]->(target);
MATCH (source {id: 'CONSOLE'}), (target {id: 'AWX_OPERATOR'}) CREATE (source)-[:CONNECTS_TO {subsystem: 'Console', cross_cluster: false}]->(target);
MATCH (source {id: 'CONSOLE'}), (target {id: 'JOB_TEMPLATE_CONTROLLER'}) CREATE (source)-[:CONNECTS_TO {subsystem: 'Console', cross_cluster: false}]->(target);

// COMMUNICATES_WITH relationships
MATCH (source {id: 'SERVER_FOUNDATION'}), (target {id: 'SPOKE'}) CREATE (source)-[:COMMUNICATES_WITH {subsystem: 'Overview', cross_cluster: true}]->(target);
MATCH (source {id: 'GRC'}), (target {id: 'SPOKE'}) CREATE (source)-[:COMMUNICATES_WITH {subsystem: 'Overview', cross_cluster: true}]->(target);
MATCH (source {id: 'OBS'}), (target {id: 'SPOKE'}) CREATE (source)-[:COMMUNICATES_WITH {subsystem: 'Overview', cross_cluster: true}]->(target);
MATCH (source {id: 'SEARCH'}), (target {id: 'SPOKE'}) CREATE (source)-[:COMMUNICATES_WITH {subsystem: 'Overview', cross_cluster: true}]->(target);

// CREATES_POLICIES relationships
MATCH (source {id: 'POLICY_CLI'}), (target {id: 'GOV_POLICY_PROP'}) CREATE (source)-[:CREATES_POLICIES {subsystem: 'Governance', cross_cluster: false}]->(target);
MATCH (source {id: 'ACM_CLI'}), (target {id: 'GOV_POLICY_PROP'}) CREATE (source)-[:CREATES_POLICIES {subsystem: 'Governance', cross_cluster: false}]->(target);

// PROCESSED_BY relationships
MATCH (source {id: 'POLICY_GENERATOR_CR'}), (target {id: 'PLUGIN_PROCESSING_ENGINE'}) CREATE (source)-[:PROCESSED_BY {subsystem: 'Governance', cross_cluster: false}]->(target);
MATCH (source {id: 'CLUSTER_CLAIMS'}), (target {id: 'CLUSTERCLAIMS_CTRL'}) CREATE (source)-[:PROCESSED_BY {subsystem: 'Cluster', cross_cluster: false}]->(target);

// GENERATES_POLICIES relationships
MATCH (source {id: 'POLICY_GEN'}), (target {id: 'POLICY_COLLECTION'}) CREATE (source)-[:GENERATES_POLICIES {subsystem: 'Governance', cross_cluster: false}]->(target);

// FEEDS_POLICIES relationships
MATCH (source {id: 'POLICY_COLLECTION'}), (target {id: 'GOV_POLICY_PROP'}) CREATE (source)-[:FEEDS_POLICIES {subsystem: 'Governance', cross_cluster: false}]->(target);

// PROPAGATES_TO relationships
MATCH (source {id: 'GOV_POLICY_PROP'}), (target {id: 'GOV_POLICY_FRAMEWORK'}) CREATE (source)-[:PROPAGATES_TO {subsystem: 'Governance', cross_cluster: false}]->(target);

// ORCHESTRATES relationships
MATCH (source {id: 'GOV_POLICY_FRAMEWORK'}), (target {id: 'GOV_POLICY_ADDON_CTRL'}) CREATE (source)-[:ORCHESTRATES {subsystem: 'Governance', cross_cluster: false}]->(target);
MATCH (source {id: 'MUST_GATHER_ENGINE'}), (target {id: 'HUB_DATA_COLLECTOR'}) CREATE (source)-[:ORCHESTRATES {subsystem: 'Governance', cross_cluster: false}]->(target);
MATCH (source {id: 'MUST_GATHER_ENGINE'}), (target {id: 'MANAGED_CLUSTER_COLLECTOR'}) CREATE (source)-[:ORCHESTRATES {subsystem: 'Governance', cross_cluster: false}]->(target);
MATCH (source {id: 'MUST_GATHER_ENGINE'}), (target {id: 'HOSTED_CLUSTER_COLLECTOR'}) CREATE (source)-[:ORCHESTRATES {subsystem: 'Governance', cross_cluster: false}]->(target);
MATCH (source {id: 'MCO_OPERATOR'}), (target {id: 'OBSERVATORIUM_OP'}) CREATE (source)-[:ORCHESTRATES {subsystem: 'Observability', cross_cluster: false}]->(target);
MATCH (source {id: 'MCO_OPERATOR'}), (target {id: 'PROMETHEUS_OP'}) CREATE (source)-[:ORCHESTRATES {subsystem: 'Observability', cross_cluster: false}]->(target);

// CREATES relationships
MATCH (source {id: 'ADDON_FACTORY'}), (target {id: 'ADDON_MANAGER'}) CREATE (source)-[:CREATES {subsystem: 'Governance', cross_cluster: false}]->(target);
MATCH (source {id: 'STATUS_AGGREGATION_CTRL'}), (target {id: 'MULTICLUSTER_APPSET_REPORT_CRD'}) CREATE (source)-[:CREATES {subsystem: 'Application', cross_cluster: false}]->(target);
MATCH (source {id: 'APPLICATION_CTRL'}), (target {id: 'MANIFESTWORK_CRD'}) CREATE (source)-[:CREATES {subsystem: 'Application', cross_cluster: false}]->(target);
MATCH (source {id: 'CURATOR_JOBS'}), (target {id: 'ANSIBLE_JOB_CRD'}) CREATE (source)-[:CREATES {subsystem: 'Cluster', cross_cluster: false}]->(target);

// INTEGRATES relationships
MATCH (source {id: 'GOLANG_TEMPLATE_RESOLVER'}), (target {id: 'SPRIG_FUNCTIONS'}) CREATE (source)-[:INTEGRATES {subsystem: 'Governance', cross_cluster: false}]->(target);

// EXPOSES relationships
MATCH (source {id: 'CONFIG_POLICY_CTRL'}), (target {id: 'METRICS_EXPORTER'}) CREATE (source)-[:EXPOSES {subsystem: 'Governance', cross_cluster: false}]->(target);
MATCH (source {id: 'CERT_POLICY_CTRL'}), (target {id: 'METRICS_EXPORTER'}) CREATE (source)-[:EXPOSES {subsystem: 'Governance', cross_cluster: false}]->(target);

// AGGREGATES relationships
MATCH (source {id: 'CLI_BINARY_AGGREGATOR'}), (target {id: 'POLICY_CLI'}) CREATE (source)-[:AGGREGATES {subsystem: 'Governance', cross_cluster: false}]->(target);
MATCH (source {id: 'CLI_BINARY_AGGREGATOR'}), (target {id: 'POLICY_GENERATOR_CLI'}) CREATE (source)-[:AGGREGATES {subsystem: 'Governance', cross_cluster: false}]->(target);

// MONITORS relationships
MATCH (source {id: 'CLUSTER_ROLE_BINDING_VALIDATOR'}), (target {id: 'CLUSTER_ADMIN_MONITOR'}) CREATE (source)-[:MONITORS {subsystem: 'Governance', cross_cluster: false}]->(target);
MATCH (source {id: 'HYPERSHIFT_ADDON_MANAGER'}), (target {id: 'MANAGEDCLUSTER_ADDON'}) CREATE (source)-[:MONITORS {subsystem: 'Cluster', cross_cluster: false}]->(target);

// BRIDGES_VIA relationships
MATCH (source {id: 'CONTROLLER_RUNTIME_SOURCE'}), (target {id: 'EVENT_CHANNEL_BRIDGE'}) CREATE (source)-[:BRIDGES_VIA {subsystem: 'Governance', cross_cluster: false}]->(target);

// AGGREGATES_VIA relationships
MATCH (source {id: 'RESOURCE_ORGANIZER'}), (target {id: 'DIAGNOSTIC_AGGREGATOR'}) CREATE (source)-[:AGGREGATES_VIA {subsystem: 'Governance', cross_cluster: false}]->(target);
MATCH (source {id: 'OBSERVATORIUM'}), (target {id: 'THANOS'}) CREATE (source)-[:AGGREGATES_VIA {subsystem: 'Observability', cross_cluster: false}]->(target);

// OPERATES relationships
MATCH (source {id: 'GATEKEEPER_OP'}), (target {id: 'GATEKEEPER'}) CREATE (source)-[:OPERATES {subsystem: 'Governance', cross_cluster: false}]->(target);

// DISTRIBUTES_TO relationships
MATCH (source {id: 'GOV_POLICY_ADDON_CTRL'}), (target {id: 'KLUSTERLET_ADDON_CTRL'}) CREATE (source)-[:DISTRIBUTES_TO {subsystem: 'Governance', cross_cluster: true}]->(target);

// DEPLOYS_ADDON relationships
MATCH (source {id: 'GOV_POLICY_FRAMEWORK'}), (target {id: 'GOV_POLICY_FRAMEWORK_ADDON'}) CREATE (source)-[:DEPLOYS_ADDON {subsystem: 'Governance', cross_cluster: true}]->(target);
MATCH (source {id: 'SUBMARINER_OPERATOR'}), (target {id: 'SUBMARINER_ADDON'}) CREATE (source)-[:DEPLOYS_ADDON {subsystem: 'Overview', cross_cluster: true}]->(target);
MATCH (source {id: 'MCO_OPERATOR'}), (target {id: 'OBSERVABILITY_ADDON'}) CREATE (source)-[:DEPLOYS_ADDON {subsystem: 'Observability', cross_cluster: true}]->(target);

// ENFORCES_VIA relationships
MATCH (source {id: 'CONFIG_POLICY_CTRL'}), (target {id: 'GOV_POLICY_FRAMEWORK_ADDON'}) CREATE (source)-[:ENFORCES_VIA {subsystem: 'Governance', cross_cluster: true}]->(target);
MATCH (source {id: 'CERT_POLICY_CTRL'}), (target {id: 'GOV_POLICY_FRAMEWORK_ADDON'}) CREATE (source)-[:ENFORCES_VIA {subsystem: 'Governance', cross_cluster: true}]->(target);
MATCH (source {id: 'IAM_POLICY_CTRL'}), (target {id: 'GOV_POLICY_FRAMEWORK_ADDON'}) CREATE (source)-[:ENFORCES_VIA {subsystem: 'Governance', cross_cluster: true}]->(target);

// INSTALLS relationships
MATCH (source {id: 'KLUSTERLET_ADDON_CTRL'}), (target {id: 'GOV_POLICY_FRAMEWORK_ADDON'}) CREATE (source)-[:INSTALLS {subsystem: 'Governance', cross_cluster: false}]->(target);

// MONITORS_VIA relationships
MATCH (source {id: 'GOV_POLICY_FRAMEWORK_ADDON'}), (target {id: 'K8S_DEPENDENCY_WATCHES'}) CREATE (source)-[:MONITORS_VIA {subsystem: 'Governance', cross_cluster: false}]->(target);

// COLLECTS_DATA_FROM relationships
MATCH (source {id: 'MUST_GATHER'}), (target {id: 'CONFIG_POLICY_CTRL'}) CREATE (source)-[:COLLECTS_DATA_FROM {subsystem: 'Governance', cross_cluster: false}]->(target);
MATCH (source {id: 'MUST_GATHER'}), (target {id: 'GOV_POLICY_FRAMEWORK'}) CREATE (source)-[:COLLECTS_DATA_FROM {subsystem: 'Governance', cross_cluster: false}]->(target);

// PROVIDES_API relationships
MATCH (source {id: 'OCM_API'}), (target {id: 'OCM'}) CREATE (source)-[:PROVIDES_API {subsystem: 'Application', cross_cluster: false}]->(target);
MATCH (source {id: 'CLUSTER_LIFECYCLE_API'}), (target {id: 'MANAGEDCLUSTER_IMPORT_CTRL'}) CREATE (source)-[:PROVIDES_API {subsystem: 'Cluster', cross_cluster: false}]->(target);

// ENABLES relationships
MATCH (source {id: 'OCM'}), (target {id: 'MULTICLOUD_OPS_SUBSCRIPTION'}) CREATE (source)-[:ENABLES {subsystem: 'Application', cross_cluster: false}]->(target);
MATCH (source {id: 'OCM'}), (target {id: 'MULTICLOUD_OPS_CHANNEL'}) CREATE (source)-[:ENABLES {subsystem: 'Application', cross_cluster: false}]->(target);
MATCH (source {id: 'OCM'}), (target {id: 'MULTICLOUD_INTEGRATIONS'}) CREATE (source)-[:ENABLES {subsystem: 'Application', cross_cluster: false}]->(target);
MATCH (source {id: 'OCM'}), (target {id: 'ARGOCD_PULL_INTEGRATION'}) CREATE (source)-[:ENABLES {subsystem: 'Application', cross_cluster: false}]->(target);
MATCH (source {id: 'OCM'}), (target {id: 'SEARCH_V2_OPERATOR'}) CREATE (source)-[:ENABLES {subsystem: 'Search', cross_cluster: false}]->(target);

// PROVIDES_CHANNELS relationships
MATCH (source {id: 'MULTICLOUD_OPS_CHANNEL'}), (target {id: 'GIT_CHANNEL'}) CREATE (source)-[:PROVIDES_CHANNELS {subsystem: 'Application', cross_cluster: false}]->(target);
MATCH (source {id: 'MULTICLOUD_OPS_CHANNEL'}), (target {id: 'HELM_CHANNEL'}) CREATE (source)-[:PROVIDES_CHANNELS {subsystem: 'Application', cross_cluster: false}]->(target);
MATCH (source {id: 'MULTICLOUD_OPS_CHANNEL'}), (target {id: 'OBJECTSTORAGE_CHANNEL'}) CREATE (source)-[:PROVIDES_CHANNELS {subsystem: 'Application', cross_cluster: false}]->(target);

// FEEDS_CONTENT relationships
MATCH (source {id: 'GIT_CHANNEL'}), (target {id: 'MULTICLOUD_OPS_SUBSCRIPTION'}) CREATE (source)-[:FEEDS_CONTENT {subsystem: 'Application', cross_cluster: false}]->(target);
MATCH (source {id: 'HELM_CHANNEL'}), (target {id: 'MULTICLOUD_OPS_SUBSCRIPTION'}) CREATE (source)-[:FEEDS_CONTENT {subsystem: 'Application', cross_cluster: false}]->(target);
MATCH (source {id: 'OBJECTSTORAGE_CHANNEL'}), (target {id: 'MULTICLOUD_OPS_SUBSCRIPTION'}) CREATE (source)-[:FEEDS_CONTENT {subsystem: 'Application', cross_cluster: false}]->(target);

// DEPLOYS_VIA relationships
MATCH (source {id: 'MULTICLOUD_OPS_SUBSCRIPTION'}), (target {id: 'APPLICATION_MANAGER'}) CREATE (source)-[:DEPLOYS_VIA {subsystem: 'Application', cross_cluster: false}]->(target);
MATCH (source {id: 'PROPAGATION_CTRL'}), (target {id: 'GITOPS_OPERATOR'}) CREATE (source)-[:DEPLOYS_VIA {subsystem: 'Application', cross_cluster: true}]->(target);

// RECONCILES relationships
MATCH (source {id: 'GITOPS_CLUSTER_CTRL'}), (target {id: 'GITOPS_CLUSTER_CRD'}) CREATE (source)-[:RECONCILES {subsystem: 'Application', cross_cluster: false}]->(target);

// IMPORTS_CLUSTERS_TO relationships
MATCH (source {id: 'GITOPS_CLUSTER_CRD'}), (target {id: 'GITOPS_OPERATOR'}) CREATE (source)-[:IMPORTS_CLUSTERS_TO {subsystem: 'Application', cross_cluster: false}]->(target);

// COLLECTS_FROM relationships
MATCH (source {id: 'STATUS_AGGREGATION_CTRL'}), (target {id: 'GITOPS_OPERATOR'}) CREATE (source)-[:COLLECTS_FROM {subsystem: 'Application', cross_cluster: true}]->(target);

// WATCHES relationships
MATCH (source {id: 'APPLICATION_CTRL'}), (target {id: 'ARGOCD_APPLICATION_CRD'}) CREATE (source)-[:WATCHES {subsystem: 'Application', cross_cluster: false}]->(target);

// SYNCS_STATUS_TO relationships
MATCH (source {id: 'APPLICATION_STATUS_CTRL'}), (target {id: 'ARGOCD_APPLICATION_CRD'}) CREATE (source)-[:SYNCS_STATUS_TO {subsystem: 'Application', cross_cluster: false}]->(target);

// PROCESSES relationships
MATCH (source {id: 'GITOPS_SYNC_RESOURCE_CTRL'}), (target {id: 'ARGOCD_APPLICATIONSET_CRD'}) CREATE (source)-[:PROCESSES {subsystem: 'Application', cross_cluster: false}]->(target);

// DISTRIBUTES relationships
MATCH (source {id: 'MANIFESTWORK_CRD'}), (target {id: 'ARGOCD_APPLICATION_CRD'}) CREATE (source)-[:DISTRIBUTES {subsystem: 'Application', cross_cluster: true}]->(target);

// DEPLOYED_BY relationships
MATCH (source {id: 'ARGOCD_APPLICATION_CRD'}), (target {id: 'GITOPS_OPERATOR'}) CREATE (source)-[:DEPLOYED_BY {subsystem: 'Application', cross_cluster: true}]->(target);

// VALIDATES_VIA relationships
MATCH (source {id: 'MULTICLOUD_OPS_SUBSCRIPTION'}), (target {id: 'SUBSCRIPTION_WEBHOOKS'}) CREATE (source)-[:VALIDATES_VIA {subsystem: 'Application', cross_cluster: false}]->(target);
MATCH (source {id: 'APPLICATION_MANAGER'}), (target {id: 'APP_WEBHOOKS'}) CREATE (source)-[:VALIDATES_VIA {subsystem: 'Application', cross_cluster: false}]->(target);
MATCH (source {id: 'SESSION_MANAGER'}), (target {id: 'OAUTH_INTEGRATION'}) CREATE (source)-[:VALIDATES_VIA {subsystem: 'Console', cross_cluster: false}]->(target);

// PROVIDES_STORAGE relationships
MATCH (source {id: 'KUBE_THANOS'}), (target {id: 'THANOS'}) CREATE (source)-[:PROVIDES_STORAGE {subsystem: 'Observability', cross_cluster: false}]->(target);

// SIDECARS_WITH relationships
MATCH (source {id: 'KUBE_THANOS'}), (target {id: 'PROMETHEUS'}) CREATE (source)-[:SIDECARS_WITH {subsystem: 'Observability', cross_cluster: false}]->(target);

// FEEDS_METRICS relationships
MATCH (source {id: 'PROMETHEUS'}), (target {id: 'GRAFANA'}) CREATE (source)-[:FEEDS_METRICS {subsystem: 'Observability', cross_cluster: false}]->(target);

// PROVIDES_LONGTERM_DATA relationships
MATCH (source {id: 'THANOS'}), (target {id: 'GRAFANA'}) CREATE (source)-[:PROVIDES_LONGTERM_DATA {subsystem: 'Observability', cross_cluster: false}]->(target);

// SCRAPES_METRICS relationships
MATCH (source {id: 'PROMETHEUS'}), (target {id: 'NODE_EXPORTER'}) CREATE (source)-[:SCRAPES_METRICS {subsystem: 'Observability', cross_cluster: false}]->(target);
MATCH (source {id: 'PROMETHEUS'}), (target {id: 'KUBE_STATE_METRICS'}) CREATE (source)-[:SCRAPES_METRICS {subsystem: 'Observability', cross_cluster: false}]->(target);

// PROXIES_VIA relationships
MATCH (source {id: 'PROMETHEUS'}), (target {id: 'KUBE_RBAC_PROXY'}) CREATE (source)-[:PROXIES_VIA {subsystem: 'Observability', cross_cluster: false}]->(target);
MATCH (source {id: 'RESOURCE_BROWSER'}), (target {id: 'RESOURCE_PROXY'}) CREATE (source)-[:PROXIES_VIA {subsystem: 'Console', cross_cluster: false}]->(target);

// TRIGGERS_ALERTS relationships
MATCH (source {id: 'PROMETHEUS'}), (target {id: 'PROMETHEUS_ALERTMANAGER'}) CREATE (source)-[:TRIGGERS_ALERTS {subsystem: 'Observability', cross_cluster: false}]->(target);

// QUERIES relationships
MATCH (source {id: 'QUERY_GATEWAY'}), (target {id: 'QUERY_ENGINE'}) CREATE (source)-[:QUERIES {subsystem: 'Observability', cross_cluster: false}]->(target);

// TRIGGERS relationships
MATCH (source {id: 'RULER_ENGINE'}), (target {id: 'ALERT_MANAGER_INTEGRATION'}) CREATE (source)-[:TRIGGERS {subsystem: 'Observability', cross_cluster: false}]->(target);

// COMPACTS relationships
MATCH (source {id: 'COMPACTOR_SERVICE'}), (target {id: 'METRICS_STORAGE'}) CREATE (source)-[:COMPACTS {subsystem: 'Observability', cross_cluster: false}]->(target);

// PROVISIONS_CLUSTERS relationships
MATCH (source {id: 'HIVE'}), (target {id: 'CLUSTER_CURATOR_CTRL'}) CREATE (source)-[:PROVISIONS_CLUSTERS {subsystem: 'Cluster', cross_cluster: false}]->(target);

// CREATES_JOBS relationships
MATCH (source {id: 'CLUSTER_CURATOR_CTRL'}), (target {id: 'CURATOR_JOBS'}) CREATE (source)-[:CREATES_JOBS {subsystem: 'Cluster', cross_cluster: false}]->(target);

// SYNCS_FROM relationships
MATCH (source {id: 'CLUSTER_IMAGESET_CTRL'}), (target {id: 'IMAGESET_REPO'}) CREATE (source)-[:SYNCS_FROM {subsystem: 'Cluster', cross_cluster: false}]->(target);

// PROVIDES_IMAGES_TO relationships
MATCH (source {id: 'CLUSTER_IMAGESET_CTRL'}), (target {id: 'HIVE'}) CREATE (source)-[:PROVIDES_IMAGES_TO {subsystem: 'Cluster', cross_cluster: false}]->(target);

// AUTHENTICATES relationships
MATCH (source {id: 'CLOUD_CREDENTIALS'}), (target {id: 'HIVE'}) CREATE (source)-[:AUTHENTICATES {subsystem: 'Cluster', cross_cluster: false}]->(target);
MATCH (source {id: 'HYPERSHIFT_OIDC_CREDENTIALS'}), (target {id: 'HYPERSHIFT_ADDON_MANAGER'}) CREATE (source)-[:AUTHENTICATES {subsystem: 'Cluster', cross_cluster: false}]->(target);

// ASSIGNS_FROM relationships
MATCH (source {id: 'CLUSTERCLAIMS_CTRL'}), (target {id: 'CLUSTER_POOLS'}) CREATE (source)-[:ASSIGNS_FROM {subsystem: 'Cluster', cross_cluster: false}]->(target);

// PROVIDES_CLUSTERS_TO relationships
MATCH (source {id: 'CLUSTER_POOLS'}), (target {id: 'HIVE'}) CREATE (source)-[:PROVIDES_CLUSTERS_TO {subsystem: 'Cluster', cross_cluster: false}]->(target);

// GENERATES relationships
MATCH (source {id: 'CLUSTER_PERMISSION'}), (target {id: 'RBAC_RESOURCES'}) CREATE (source)-[:GENERATES {subsystem: 'Cluster', cross_cluster: false}]->(target);

// DISTRIBUTED_VIA relationships
MATCH (source {id: 'RBAC_RESOURCES'}), (target {id: 'MANIFESTWORK'}) CREATE (source)-[:DISTRIBUTED_VIA {subsystem: 'Cluster', cross_cluster: false}]->(target);

// DEPLOYS_TO relationships
MATCH (source {id: 'MANIFESTWORK'}), (target {id: 'MANAGED_SERVICEACCOUNT'}) CREATE (source)-[:DEPLOYS_TO {subsystem: 'Cluster', cross_cluster: false}]->(target);

// AUTHENTICATES_VIA relationships
MATCH (source {id: 'MANAGED_SERVICEACCOUNT'}), (target {id: 'CLUSTER_PROXY'}) CREATE (source)-[:AUTHENTICATES_VIA {subsystem: 'Cluster', cross_cluster: false}]->(target);
MATCH (source {id: 'CONSOLE_BACKEND_API'}), (target {id: 'OAUTH_INTEGRATION'}) CREATE (source)-[:AUTHENTICATES_VIA {subsystem: 'Console', cross_cluster: false}]->(target);

// EXTENDS_VIA relationships
MATCH (source {id: 'CLUSTER_PROXY'}), (target {id: 'CLUSTER_PROXY_ADDON'}) CREATE (source)-[:EXTENDS_VIA {subsystem: 'Cluster', cross_cluster: false}]->(target);

// REPORTS_TO relationships
MATCH (source {id: 'MANAGEDCLUSTER_IMPORT_CTRL'}), (target {id: 'CLUSTERLIFECYCLE_STATE_METRICS'}) CREATE (source)-[:REPORTS_TO {subsystem: 'Cluster', cross_cluster: false}]->(target);
MATCH (source {id: 'KLUSTERLET_ADDON_CTRL'}), (target {id: 'CLUSTERLIFECYCLE_STATE_METRICS'}) CREATE (source)-[:REPORTS_TO {subsystem: 'Cluster', cross_cluster: false}]->(target);

// DEPLOYS_AGENT relationships
MATCH (source {id: 'HYPERSHIFT_ADDON_MANAGER'}), (target {id: 'HYPERSHIFT_ADDON_AGENT'}) CREATE (source)-[:DEPLOYS_AGENT {subsystem: 'Cluster', cross_cluster: true}]->(target);

// ENABLES_HYPERSHIFT relationships
MATCH (source {id: 'HYPERSHIFT_ADDON_MANAGER'}), (target {id: 'HIVE'}) CREATE (source)-[:ENABLES_HYPERSHIFT {subsystem: 'Cluster', cross_cluster: false}]->(target);

// FEEDS_RAW_DATA relationships
MATCH (source {id: 'COLLECTION_AGENT'}), (target {id: 'DATA_TRANSFORMER'}) CREATE (source)-[:FEEDS_RAW_DATA {subsystem: 'Search', cross_cluster: true}]->(target);

// PROCESSES_DATA relationships
MATCH (source {id: 'DATA_TRANSFORMER'}), (target {id: 'RESOURCE_INDEXER'}) CREATE (source)-[:PROCESSES_DATA {subsystem: 'Search', cross_cluster: false}]->(target);

// INDEXES_VIA relationships
MATCH (source {id: 'RESOURCE_INDEXER'}), (target {id: 'ELASTICSEARCH_INTEGRATION'}) CREATE (source)-[:INDEXES_VIA {subsystem: 'Search', cross_cluster: false}]->(target);

// SERVES_VIA relationships
MATCH (source {id: 'QUERY_PROCESSOR'}), (target {id: 'GRAPHQL_API_SERVER'}) CREATE (source)-[:SERVES_VIA {subsystem: 'Search', cross_cluster: false}]->(target);
MATCH (source {id: 'QUERY_PROCESSOR'}), (target {id: 'REST_API_GATEWAY'}) CREATE (source)-[:SERVES_VIA {subsystem: 'Search', cross_cluster: false}]->(target);

// PROVIDES_UI_FOR relationships
MATCH (source {id: 'CONSOLE'}), (target {id: 'CONSOLE_API'}) CREATE (source)-[:PROVIDES_UI_FOR {subsystem: 'Console', cross_cluster: false}]->(target);
MATCH (source {id: 'CONSOLE'}), (target {id: 'GRC_RESOURCES'}) CREATE (source)-[:PROVIDES_UI_FOR {subsystem: 'Console', cross_cluster: false}]->(target);
MATCH (source {id: 'CONSOLE'}), (target {id: 'APP_RESOURCES'}) CREATE (source)-[:PROVIDES_UI_FOR {subsystem: 'Console', cross_cluster: false}]->(target);
MATCH (source {id: 'CONSOLE'}), (target {id: 'OBS_DASHBOARDS'}) CREATE (source)-[:PROVIDES_UI_FOR {subsystem: 'Console', cross_cluster: false}]->(target);
MATCH (source {id: 'CONSOLE'}), (target {id: 'CLUSTER_RESOURCES'}) CREATE (source)-[:PROVIDES_UI_FOR {subsystem: 'Console', cross_cluster: false}]->(target);
MATCH (source {id: 'CONSOLE'}), (target {id: 'SEARCH_INTERFACE'}) CREATE (source)-[:PROVIDES_UI_FOR {subsystem: 'Console', cross_cluster: false}]->(target);

// AUTHORIZES relationships
MATCH (source {id: 'RBAC_MIDDLEWARE'}), (target {id: 'REST_API_CONTROLLERS'}) CREATE (source)-[:AUTHORIZES {subsystem: 'Console', cross_cluster: false}]->(target);

// STREAMS_VIA relationships
MATCH (source {id: 'DASHBOARD_RENDERER'}), (target {id: 'WEBSOCKET_MANAGER'}) CREATE (source)-[:STREAMS_VIA {subsystem: 'Console', cross_cluster: false}]->(target);

// MANAGES_SESSIONS relationships
MATCH (source {id: 'AUTHENTICATION_HANDLER'}), (target {id: 'SESSION_MANAGER'}) CREATE (source)-[:MANAGES_SESSIONS {subsystem: 'Console', cross_cluster: false}]->(target);

// FETCHES_CONFIG relationships
MATCH (source {id: 'MCE_PLUGIN'}), (target {id: 'CONSOLE_API'}) CREATE (source)-[:FETCHES_CONFIG {subsystem: 'Console', cross_cluster: false}]->(target);

// DISPLAYS_DATA_FROM relationships
MATCH (source {id: 'CONSOLE'}), (target {id: 'ANSIBLE_JOB_CRD'}) CREATE (source)-[:DISPLAYS_DATA_FROM {subsystem: 'Console', cross_cluster: false}]->(target);

// HOSTS_DOWNLOAD_FOR relationships
MATCH (source {id: 'CONSOLE'}), (target {id: 'ACM_CLI'}) CREATE (source)-[:HOSTS_DOWNLOAD_FOR {subsystem: 'Console', cross_cluster: false}]->(target);

// FETCHES_BRANCHES relationships
MATCH (source {id: 'GITHUB_INTEGRATION'}), (target {id: 'GITHUB_INTEGRATION'}) CREATE (source)-[:FETCHES_BRANCHES {subsystem: 'Console', cross_cluster: false}]->(target);

// QUERIES_JOB_TEMPLATES relationships
MATCH (source {id: 'CONSOLE'}), (target {id: 'JOB_TEMPLATE_CONTROLLER'}) CREATE (source)-[:QUERIES_JOB_TEMPLATES {subsystem: 'Console', cross_cluster: false}]->(target);

// QUERIES_CLUSTER_INSIGHTS relationships
MATCH (source {id: 'INSIGHTS_INTEGRATION'}), (target {id: 'CLUSTER_OVERVIEW'}) CREATE (source)-[:QUERIES_CLUSTER_INSIGHTS {subsystem: 'Console', cross_cluster: false}]->(target);

// PROXIES_REQUESTS relationships
MATCH (source {id: 'RESOURCE_PROXY'}), (target {id: 'GRC_RESOURCES'}) CREATE (source)-[:PROXIES_REQUESTS {subsystem: 'Console', cross_cluster: false}]->(target);
MATCH (source {id: 'RESOURCE_PROXY'}), (target {id: 'APP_RESOURCES'}) CREATE (source)-[:PROXIES_REQUESTS {subsystem: 'Console', cross_cluster: false}]->(target);
MATCH (source {id: 'RESOURCE_PROXY'}), (target {id: 'OBS_DASHBOARDS'}) CREATE (source)-[:PROXIES_REQUESTS {subsystem: 'Console', cross_cluster: false}]->(target);
MATCH (source {id: 'RESOURCE_PROXY'}), (target {id: 'CLUSTER_RESOURCES'}) CREATE (source)-[:PROXIES_REQUESTS {subsystem: 'Console', cross_cluster: false}]->(target);
MATCH (source {id: 'RESOURCE_PROXY'}), (target {id: 'SEARCH_INTERFACE'}) CREATE (source)-[:PROXIES_REQUESTS {subsystem: 'Console', cross_cluster: false}]->(target);

// SELECTS_TARGET relationships
MATCH (source {id: 'CLUSTER_SELECTOR'}), (target {id: 'CLUSTER_RESOURCES'}) CREATE (source)-[:SELECTS_TARGET {subsystem: 'Console', cross_cluster: false}]->(target);

// NAVIGATES_BETWEEN relationships
MATCH (source {id: 'MULTI_CLUSTER_NAV'}), (target {id: 'CLUSTER_RESOURCES'}) CREATE (source)-[:NAVIGATES_BETWEEN {subsystem: 'Console', cross_cluster: false}]->(target);

// EXTENDS relationships
MATCH (source {id: 'PLUGIN_FRAMEWORK'}), (target {id: 'REACT_COMPONENTS'}) CREATE (source)-[:EXTENDS {subsystem: 'Console', cross_cluster: false}]->(target);

// STYLES relationships
MATCH (source {id: 'THEME_MANAGER'}), (target {id: 'DASHBOARD_RENDERER'}) CREATE (source)-[:STYLES {subsystem: 'Console', cross_cluster: false}]->(target);

// Verification and Analysis Queries
// 
// 1. Component Count by Subsystem
// MATCH (n:RHACMComponent) 
// RETURN n.subsystem as Subsystem, count(n) as ComponentCount 
// ORDER BY ComponentCount DESC;
//
// 2. Dependency Analysis - Most Connected Components
// MATCH (n:RHACMComponent)
// OPTIONAL MATCH (n)-[r_out]->()
// OPTIONAL MATCH ()-[r_in]->(n)
// RETURN n.label as Component, n.subsystem as Subsystem,
//        count(DISTINCT r_out) as OutgoingDeps,
//        count(DISTINCT r_in) as IncomingDeps,
//        count(DISTINCT r_out) + count(DISTINCT r_in) as TotalConnections
// ORDER BY TotalConnections DESC LIMIT 20;
//
// 3. Cross-Subsystem Dependencies
// MATCH (source:RHACMComponent)-[r]->(target:RHACMComponent)
// WHERE source.subsystem <> target.subsystem
// RETURN source.subsystem as SourceSubsystem, 
//        target.subsystem as TargetSubsystem,
//        count(r) as Dependencies
// ORDER BY Dependencies DESC;
//
// 4. Hub-Spoke Communication Patterns
// MATCH (hub:RHACMComponent)-[r {cross_cluster: true}]->(spoke:RHACMComponent)
// RETURN hub.label as HubComponent, 
//        collect(DISTINCT spoke.label)[0..5] as SpokeComponents,
//        count(spoke) as SpokeCount
// ORDER BY SpokeCount DESC;
//
// 5. Critical Path Analysis - Find components with no incoming dependencies
// MATCH (n:RHACMComponent)
// WHERE NOT ()-[:DEPENDS_ON]->(n)
// RETURN n.subsystem as Subsystem, n.label as RootComponent, n.type as Type
// ORDER BY Subsystem, RootComponent;

// Script Summary
// Total Components: 291
// Total Dependencies: 419
// Subsystems: Application, Cluster, Console, Governance, Observability, Overview, Search
// 
// Generated from Mermaid files:
// - rhacm-overview.mmd (High-level architecture)
// - rhacm-governance.mmd (GRC policies and compliance)
// - rhacm-application.mmd (Application lifecycle)
// - rhacm-observability.mmd (Monitoring and metrics)
// - rhacm-cluster.mmd (Cluster management)
// - rhacm-search.mmd (Resource discovery)