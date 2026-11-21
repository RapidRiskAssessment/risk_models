# SaaS Security Risk Model

This document identifies the strategic pillars of third-party SaaS security, detailing threat scenarios and their corresponding security objectives to ensure that data and systems reachable through SaaS applications remain protected.

**Definitions**
Software as a Service (SaaS) is any application operated by a third party and consumed over the internet, where the organization controls a tenant's configuration, identities and data but not the underlying infrastructure. This includes collaboration and productivity suites, developer platforms, identity providers, and infrastructure services consumed by production systems (e.g., workflow engines, secret managers, observability platforms).

A non-human identity is any credential a system uses to reach a SaaS application, such as an API key, service account, certificate, personal access token, or OAuth integration.

This SaaS Security Risk Model focuses on the risks the customer can control or must account for in its tenant. Risks fully owned by the vendor are covered only where the customer needs a compensating control.

**Usage**

This risk model is hierarchical - the 6 top-level categories can be used for reporting consolidated risk per area. The discrete items can be used to match prevention and detection controls in terms of efficacy, maturity and deployment coverage, and to assess each SaaS application against the same baseline.

# Risk Model

## 1. Identity, Authentication & Session Security
SaaS applications are reachable directly from the internet, so identity is the primary perimeter. This pillar covers how people authenticate to an application and how their sessions are protected once established.

### Federated Single Sign-On Enforcement
- **ID**: 1.1 | **Impact**: MAXIMUM
- **Scenario**: An attacker uses a local username and password, an auxiliary login portal, or a forgotten test tenant that is not bound to the organization's identity provider, bypassing MFA, device checks and centralized offboarding.
- **Objective**: All human access to SaaS applications must authenticate through the organization's identity provider.

### Phishing-Resistant Authentication
- **ID**: 1.2 | **Impact**: HIGH
- **Scenario**: An attacker uses an adversary-in-the-middle reverse proxy to relay a user's credentials and one-time code, capturing the resulting session without needing the user's second factor again.
- **Objective**: Human authentication must use phishing-resistant, origin-bound factors.

### Credential Stuffing & Password Spraying
- **ID**: 1.3 | **Impact**: HIGH
- **Scenario**: An attacker replays credentials leaked from other breaches, or sprays common passwords, against SaaS login endpoints where MFA or SSO is not enforced.
- **Objective**: All human access to SaaS applications must authenticate through the organization's identity provider.

### Session Token Theft & Replay
- **ID**: 1.4 | **Impact**: HIGH
- **Scenario**: Infostealer malware or a malicious browser extension harvests session cookies and tokens from a user's browser, which the attacker replays from their own infrastructure without triggering authentication.
- **Objective**: Sessions must be bound to the managed device they were issued to and must be revocable.

### Session Revocation
- **ID**: 1.5 | **Impact**: HIGH
- **Scenario**: A user is offboarded or a compromise is detected, but existing sessions and tokens in the SaaS application remain valid because deprovisioning at the identity provider does not terminate them.
- **Objective**: Sessions must be bound to the managed device they were issued to and must be revocable.

### Managed Device Access
- **ID**: 1.6 | **Impact**: HIGH
- **Scenario**: A user accesses the application from a personal or compromised device that lacks endpoint security controls, exposing data and session material to malware on that device.
- **Objective**: SaaS applications must only be accessible from managed devices that meet the organization's posture requirements.

### Break-Glass Account Security
- **ID**: 1.7 | **Impact**: HIGH
- **Scenario**: An emergency local administrator account, kept for identity provider outages, has a weak or shared password, no MFA, or no alerting, and is used by an attacker as a persistent backdoor.
- **Objective**: Accounts that bypass the identity provider must be minimal in number, strongly protected, and alert on every use.

## 2. Access Governance & Privilege Management
This pillar covers who holds access to an application, at what privilege level, and for how long. It emphasizes automated lifecycle management and eliminating standing privileged access.

### Automated Provisioning & Deprovisioning
- **ID**: 2.1 | **Impact**: HIGH
- **Scenario**: A departed employee or contractor retains access because accounts in the application are created and removed by hand, and the removal is missed.
- **Objective**: Access must be granted, changed and removed automatically from an authoritative source.

### Dormant & Orphaned Accounts
- **ID**: 2.2 | **Impact**: MEDIUM
- **Scenario**: An attacker takes over an unused account, or one whose owner has left, which retains privileges and is not monitored by anyone.
- **Objective**: Access must be granted, changed and removed automatically from an authoritative source.

### Guest & External Accounts
- **ID**: 2.3 | **Impact**: MEDIUM
- **Scenario**: A vendor, partner or former contractor account invited into the tenant never expires, has no internal sponsor, and accumulates privileged roles.
- **Objective**: External accounts must have an accountable internal sponsor, an expiry date, and no privileged roles.

### Least Privilege & Role Design
- **ID**: 2.4 | **Impact**: HIGH
- **Scenario**: Users are granted broad or administrative roles by default because the application's roles are not mapped to job functions, increasing the impact of any single account compromise.
- **Objective**: Access must be limited to the minimum role required for the user's function.

### Standing Privileged Access
- **ID**: 2.5 | **Impact**: MAXIMUM
- **Scenario**: An attacker compromises an account with permanent tenant-administrator rights and uses it to disable logging, create backdoor credentials, or export all tenant data.
- **Objective**: Privileged access must be granted just-in-time, for a limited duration, and with approval proportional to its impact.

### Privileged Insider Misuse
- **ID**: 2.6 | **Impact**: HIGH
- **Scenario**: An administrator with legitimate access exports data or changes security configuration outside of change control, with no second person involved.
- **Objective**: Privileged access must be granted just-in-time, for a limited duration, and with approval proportional to its impact.

## 3. Non-Human Identities & Integrations
This pillar addresses the credentials systems use to reach SaaS applications and the trust relationships between applications. Non-human identities typically bypass MFA and device checks, making their scope, lifetime and storage critical.

### Long-Lived Static Credentials
- **ID**: 3.1 | **Impact**: HIGH
- **Scenario**: An attacker obtains a static API key that never expires, or that renews each time it is used, from source code, logs, a CI system or a workstation, and uses it indefinitely.
- **Objective**: Non-human credentials must be owned, registered, time bound and short-lived.

### Personal Access Tokens
- **ID**: 3.2 | **Impact**: HIGH
- **Scenario**: A user creates a personal access token tied to their account, which keeps working outside of SSO, MFA and device checks, and survives the user's offboarding.
- **Objective**: Non-human credentials must be owned, registered, time bound and short-lived.

### Service Account Misuse
- **ID**: 3.3 | **Impact**: HIGH
- **Scenario**: A service account allows interactive sign-in and is used by people as a shared login, or its credentials are not rotated when the person who created them leaves.
- **Objective**: Service accounts must not allow interactive sign-in and must have an accountable owner.

### Credential Scope & Blast Radius
- **ID**: 3.4 | **Impact**: MAXIMUM
- **Scenario**: A single credential is shared across services, environments or physical locations, or is scoped to the entire tenant. Compromising one workload or one location gives the attacker access to every other one that uses the same credential.
- **Objective**: Each non-human credential must be scoped to a single service and location, and must not grant access beyond it.

### Workload Identity & Token Binding
- **ID**: 3.5 | **Impact**: HIGH
- **Scenario**: A bearer token stolen from a workload is replayed from an attacker's host because nothing binds it to the workload or key it was issued to.
- **Objective**: Workloads must authenticate with federated, short-lived, and where supported, sender-constrained tokens rather than stored secrets.

### Secret Storage & Delivery
- **ID**: 3.6 | **Impact**: HIGH
- **Scenario**: A credential is shared over chat or email, stored in plaintext configuration, or written into infrastructure-as-code state, where it is later exposed.
- **Objective**: Non-human credentials must be issued, stored and delivered only through an approved secrets manager.

### Illicit OAuth Consent Grants
- **ID**: 3.7 | **Impact**: HIGH
- **Scenario**: An attacker tricks a user into authorizing a malicious third-party application with broad scopes (e.g., read all mail, read all files), gaining persistent access that does not depend on the user's password.
- **Objective**: Third-party integrations must be reviewed and approved by an administrator before users can connect them.

### Compromised Third-Party Integration
- **ID**: 3.8 | **Impact**: HIGH
- **Scenario**: A legitimate, approved integration (e.g., a marketplace app or connector) is compromised at the vendor, and its stored OAuth tokens are used to access every customer tenant it is connected to.
- **Objective**: Third-party integrations must be inventoried, minimally scoped, and monitored for anomalous activity.

### AI Agent & LLM Integrations
- **ID**: 3.9 | **Impact**: HIGH
- **Scenario**: An AI agent, copilot or tool server connected to a SaaS application holds a broad, long-lived token, and prompt injection in content it reads (a document, ticket or email) steers it into exfiltrating data or making changes.
- **Objective**: AI integrations must use least-privilege, short-lived credentials and require explicit approval for sensitive actions.

## 4. Configuration & Data Exposure
This pillar focuses on the tenant's security configuration and on how data stored in the application can be shared or extracted. SaaS applications expose distinct, complex configuration surfaces that change over time.

### Security Configuration Drift
- **ID**: 4.1 | **Impact**: HIGH
- **Scenario**: Security settings revert to insecure defaults after vendor product updates or ad-hoc administrative changes (e.g., SSO enforcement disabled, public API access enabled), and the change goes unnoticed.
- **Objective**: Tenant security configuration must be defined as code, continuously measured, and drift must be remediated.

### Permissive Sharing & External Access
- **ID**: 4.2 | **Impact**: HIGH
- **Scenario**: Documents, dashboards or channels are shared with "anyone with the link" or with unrestricted external domains, exposing internal data to unintended parties.
- **Objective**: External sharing must be restricted by default and limited to approved domains.

### Bulk Data Export via Legitimate Features
- **ID**: 4.3 | **Impact**: HIGH
- **Scenario**: An attacker with a valid account uses built-in export, reporting or API features to extract large volumes of data, which looks like normal use.
- **Objective**: Unauthorized data exfiltration from SaaS applications must be detected and prevented.

### Production & Non-Production Separation
- **ID**: 4.4 | **Impact**: MEDIUM
- **Scenario**: Development or test work runs in the production tenant, or a weakly protected non-production tenant holds real data or trusted integrations, giving attackers an easier way in.
- **Objective**: Production and non-production use must be separated, and every tenant must meet the same baseline.

### Entity & Subsidiary Segregation
- **ID**: 4.5 | **Impact**: MEDIUM
- **Scenario**: Multiple business units or subsidiaries share a tenant without segregation, so a compromise of one unit's account reaches another unit's data.
- **Objective**: Entities that must be isolated must not share credentials or data access within a tenant.

### Data Classification & Inventory
- **ID**: 4.6 | **Impact**: MEDIUM
- **Scenario**: The organization does not know what data an application holds or which systems it can reach, so it cannot size the impact of a compromise or prioritize controls.
- **Objective**: Each application's data classification and connected systems must be recorded and kept current.

## 5. Vendor & Supply Chain
This pillar covers threats originating from the SaaS provider itself. The customer cannot prevent most of them, so objectives focus on vendor assurance, limiting exposure, and resilience.

### Vendor Infrastructure Breach
- **ID**: 5.1 | **Impact**: MAXIMUM
- **Scenario**: An attacker breaches the vendor's internal network, support tooling or build pipeline and uses that access to read or modify customer tenant data, or to steal customer session material held by vendor support.
- **Objective**: SaaS vendors must be assessed before adoption and periodically, and must notify the customer of security incidents.

### Vendor Support Access
- **ID**: 5.2 | **Impact**: HIGH
- **Scenario**: Vendor support staff hold standing access to the customer's tenant, which is used without the customer's knowledge or abused by a compromised support account.
- **Objective**: Vendor access to the tenant must be explicitly granted by the customer, time bound, and logged.

### Cross-Tenant Isolation Failure
- **ID**: 5.3 | **Impact**: HIGH
- **Scenario**: A flaw in the vendor's multi-tenant architecture (e.g., an insecure direct object reference or a shared-infrastructure leak) lets another customer access the organization's data.
- **Objective**: SaaS vendors must be assessed before adoption and periodically, and must notify the customer of security incidents.

### Business Continuity & Data Portability
- **ID**: 5.4 | **Impact**: HIGH
- **Scenario**: The vendor suffers a prolonged outage, ransomware or insolvency, and the organization cannot operate or recover its data because no export or recovery path exists.
- **Objective**: Critical data held in SaaS applications must be recoverable independently of the vendor.

### Unsanctioned SaaS (Shadow IT)
- **ID**: 5.5 | **Impact**: MEDIUM
- **Scenario**: Employees adopt SaaS applications outside of procurement and security review, placing organizational data in tenants with no owner, no SSO, and no monitoring.
- **Objective**: All SaaS applications must be approved, inventoried and owned before they hold organizational data.

## 6. Operational Visibility & Incident Response
This pillar ensures that activity in each application can be traced and that the organization can detect, contain and investigate a compromise.

### Audit Log Availability & Quality
- **ID**: 6.1 | **Impact**: HIGH
- **Scenario**: The application does not log administrative or user actions, or its logs lack the identity, action, result, source and affected resource, preventing investigation of a compromise.
- **Objective**: Attackers must not be able to act in a SaaS application without leaving a traceable record.

### Centralized Logging & Detection
- **ID**: 6.2 | **Impact**: HIGH
- **Scenario**: Audit logs exist but are only kept in the application with short retention, so high-risk events (privilege grants, new credentials, bulk exports) are never alerted on and are gone before an investigation starts.
- **Objective**: Attackers must not be able to act in a SaaS application without leaving a traceable record.

### Ownership & Accountability
- **ID**: 6.3 | **Impact**: MEDIUM
- **Scenario**: An application, tenant or credential has no identified owner, so findings go unremediated and nobody can be contacted during an incident.
- **Objective**: All SaaS applications must be approved, inventoried and owned before they hold organizational data.

### Incident Containment & Vendor Escalation
- **ID**: 6.4 | **Impact**: HIGH
- **Scenario**: During an incident the organization cannot quickly revoke credentials, terminate sessions, preserve evidence, or reach the vendor's security team, extending the attacker's access.
- **Objective**: Owners must maintain and test procedures to contain a compromise, preserve evidence and escalate to the vendor.
