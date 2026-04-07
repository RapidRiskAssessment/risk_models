# Endpoint Security Risk Model

This document identifies the strategic pillars of endpoint security, detailing threat scenarios and their corresponding security objectives to ensure a robust and resilient device posture.

**Definitions**
In computer security, an endpoint is any physical or virtual device that connects to a corporate network and serves as a critical termination point for data exchange, including laptops, servers, mobile phones, tablets, and Internet of Things (IoT) devices like smart cameras and printers.

This Endpoint Security Risk Model focuses on user controled endpoints (laptops, mobile phones, etc.). 

**Usage**

This risk model is hierarchical - the 5 top-level categories can be used for reporting consolidated risk per area. The discrete items can be used to match prevention and detection controls in terms of efficacy, maturity and deployment coverage.

# Risk Model

## 1. Platform Foundation & Hardware Security
This pillar focuses on the immutable security properties of the hardware and firmware that form the foundational trust model of the device. By securing the root of trust and ensuring firmware integrity, we prevent low-level compromises that could bypass higher-level security controls.

### Hardware-Backed Root of Trust (HRoT)
- **ID**: 1.1 | **Impact**: HIGH
- **Scenario**: Platform malware breaches software boundaries to extract key material used for device attestation and hardware authentication. This allows an attacker to spoof the device state to gain elevated trust and privileged access.
- **Objective**: Machine credentials must only be used for authentication by processes executing directly on the local device.

### Firmware Update Integrity & Management
- **ID**: 1.2 | **Impact**: MAXIMUM
- **Scenario**: Firmware operates below the operating system level and serves as a security foundation. An attacker capable of executing code in this context can gain full control of the device.
- **Objective**: Endpoints must not be exploitable through misconfiguration or software vulnerabilities older than 72 hours.

### Secure Firmware Configuration & Defaults
- **ID**: 1.3 | **Impact**: HIGH
- **Scenario**: An attacker with physical access or a high-privilege vulnerability modifies the device to persist across factory resets or alter system partitions.
- **Objective**: Endpoints must continuously verify and enforce local policy configurations.

### Remote Management Interface Security
- **ID**: 1.4 | **Impact**: HIGH
- **Scenario**: An attacker compromising an update server delivers malicious firmware, or applies "trusted" firmware via direct physical connection, to gain full device control.
- **Objective**: Endpoints must continuously verify and enforce local policy configurations.

### Hardware-Based Security Primitives (TPM/TEE)
- **ID**: 1.5 | **Impact**: HIGH
- **Scenario**: An advanced attacker exploits hardware flaws to move laterally within the device from a compromised application.
- **Objective**: Endpoints must prevent unauthorized changes to local policies and configurations.

### Secure & Trusted Boot Verification
- **ID**: 1.6 | **Impact**: HIGH
- **Scenario**: An attacker subverts the boot process to gain full control of the device.
- **Objective**: Attackers must be prevented from executing code remotely on endpoints.

### Platform Integrity Attestation
- **ID**: 1.7 | **Impact**: HIGH
- **Scenario**: A device compromised by boot-level malware incorrectly reports a trusted state, or an unauthorized device spoofs a genuine corporate identity.
- **Objective**: Attackers must be prevented from executing code remotely on endpoints.

## 2. Identity, Authentication & Access Control
This pillar covers the mechanisms for verifying device and user identities and ensuring that access is granted based on proven trust. It emphasizes strong authentication and the verification of device posture before granting access to sensitive resources.

### User Authentication & Login Policy
- **ID**: 2.1 | **Impact**: HIGH
- **Scenario**: An attacker leverages an insecurely managed or poorly authenticated user account created by an employee to compromise the device.
- **Objective**: Endpoints must continuously verify and enforce local policy configurations.

### Cryptographic Device Identity
- **ID**: 2.2 | **Impact**: HIGH
- **Scenario**: An attacker spoofs a device's identity to introduce an unauthorized device into the network, often by exploiting easily exportable identities from compromised hardware.
- **Objective**: Machine credentials must only be used for authentication by processes executing directly on the local device.

### Risk-Based Device Posture Reporting
- **ID**: 2.3 | **Impact**: HIGH
- **Scenario**: An attacker spoofs device-state reporting to deceive access control systems into trusting a compromised or unauthorized device, though valid credentials may still be required.
- **Objective**: Endpoints must continuously verify and enforce local policy configurations.

### User-to-Device Authentication (Local)
- **ID**: 2.4 | **Impact**: MEDIUM
- **Scenario**: An attacker gains access to data on a lost or stolen device that was left unlocked or lacked required authentication.
- **Objective**: Endpoints must be secured against unauthorized access when left unattended.

### User-to-Service Authentication (Remote)
- **ID**: 2.5 | **Impact**: HIGH
- **Scenario**: An attacker with physical or remote device access leverages stored or active user credentials to access remote services that lack secondary authentication.
- **Objective**: Service authentication from an endpoint must require proof of human presence and both machine and user authentication.

### Device-to-Service Authentication (Machine-to-Machine)
- **ID**: 2.6 | **Impact**: HIGH
- **Scenario**: An attacker with physical or remote device access leverages machine-level credentials to access remote services without further authentication.
- **Objective**: Service authentication from an endpoint must require proof of human presence and both machine and user authentication.

### Session Lock & User Presence Verification
- **ID**: 2.7 | **Impact**: HIGH
- **Scenario**: An attacker maintains access to device data and resources during periods of user inactivity.
- **Objective**: Endpoints must be secured against unauthorized access when left unattended.

## 3. System Hardening & Software Integrity
This pillar addresses the reduction of the attack surface through rigorous software management, process isolation, and the application of modern hardening techniques. It ensures that only authorized software runs and that compromises are contained.

### System Service & API Hardening
- **ID**: 3.1 | **Impact**: MEDIUM
- **Scenario**: Non-essential services running on the device increase the attack surface, potentially exposing vulnerabilities for exploitation.
- **Objective**: Endpoints must not expose additional attack surface through complex APIs or network services.

### Vulnerability Management & Patching
- **ID**: 3.2 | **Impact**: HIGH
- **Scenario**: An attacker exploits a known vulnerability that remains unpatched on the device.
- **Objective**: Endpoints must not be exploitable through misconfiguration or software vulnerabilities older than 72 hours.

### Process Sandboxing & Isolation
- **ID**: 3.3 | **Impact**: MEDIUM
- **Scenario**: An attacker exploits vulnerabilities in running services or processes that lack sandbox protections to gain unauthorized device access.
- **Objective**: Attackers must be prevented from executing code remotely on endpoints.

### Toolchain & Runtime Security Hardening
- **ID**: 3.4 | **Impact**: MEDIUM
- **Scenario**: An attacker exploits a vulnerability that should have been mitigated by toolchain protections such as ASLR, DEP, SSP, PIE, or CFI.
- **Objective**: Attackers must be prevented from executing code remotely on endpoints.

### Mandatory Access Control (MAC)
- **ID**: 3.5 | **Impact**: MEDIUM
- **Scenario**: An attacker with physical access bypasses weak controls to modify local permissions or exploits software vulnerabilities to elevate privileges.
- **Objective**: Attackers must be prevented from executing code remotely on endpoints.

### Application Control & Execution Policy
- **ID**: 3.6 | **Impact**: HIGH
- **Scenario**: An attacker tricking a user into installing malware or modifying software prior to installation gains the same privileges as the installed application.
- **Objective**: Attackers must be prevented from executing code remotely on endpoints.

### Endpoint Detection & Malware Prevention
- **ID**: 3.7 | **Impact**: HIGH
- **Scenario**: An attacker tricks a user into installing malware or modifies software prior to installation to gain the application's execution privileges.
- **Objective**: Attackers must be prevented from executing code remotely on endpoints.

### Software Supply Chain Integrity
- **ID**: 3.8 | **Impact**: HIGH
- **Scenario**: An attacker compromises the software supply chain to inject malware that is subsequently deployed to the operating system without verification.
- **Objective**: Attackers must be prevented from executing code remotely on endpoints.

### Restricted & Low-Privilege API Access
- **ID**: 3.9 | **Impact**: MEDIUM
- **Scenario**: An attacker compromises a device and uses privileged libraries or APIs to exfiltrate stored credentials to an external host, maintaining access to enterprise data.
- **Objective**: Endpoints must not export sensitive data to unmanaged devices.

### Browser Governance & Extension Security
- **ID**: 3.10 | **Impact**: HIGH
- **Scenario**: A user installs a malicious or over-privileged browser extension that steals session cookies, intercepts keystrokes, or exfiltrates enterprise data.
- **Objective**: Only vetted and authorized browser extensions may be installed, and browser security policies must be centrally enforced.

### Local Virtualization & Container Isolation
- **ID**: 3.11 | **Impact**: MEDIUM
- **Scenario**: An attacker compromises a guest OS (e.g., WSL, Docker, VM) and performs a breakout attack to access the host system's kernel or sensitive data.
- **Objective**: Virtualized environments and containers on endpoints must be isolated from the host OS with restricted resource access.

### Third-Party Application Supply Chain (SBOM)
- **ID**: 3.12 | **Impact**: HIGH
- **Scenario**: A legitimate third-party application is compromised at the source, and the organization lacks visibility into its components (SBOM), leading to an unmanaged risk.
- **Objective**: All third-party software must be vetted, and its Software Bill of Materials (SBOM) must be analyzed for known vulnerabilities before deployment.

### Autonomous AI Agent & Local LLM Security
- **ID**: 3.13 | **Impact**: HIGH
- **Scenario**: A malicious prompt or compromised model weight allows an autonomous AI agent to execute unauthorized system commands, access sensitive files, or exfiltrate data through integrated tools and APIs.
- **Objective**: AI agents must operate in a restricted, low-privilege environment with explicit user consent for tool execution and strict isolation from sensitive system resources.

## 4. Data Protection & Physical Security
This pillar focuses on protecting sensitive data whether it is stored on the device or in transit across networks. It also addresses the physical risks associated with mobile endpoints, such as theft, loss, and unauthorized peripheral connections.

### Full Disk Encryption (Data at Rest)
- **ID**: 4.1 | **Impact**: HIGH
- **Scenario**: An attacker captures a storage image from a device and extracts confidential data, source code, or credentials, typically following physical theft.
- **Objective**: Endpoints must be secured against unauthorized access when left unattended.

### Encrypted Communication (Data in Transit)
- **ID**: 4.2 | **Impact**: HIGH
- **Scenario**: An attacker performs a man-in-the-middle attack to intercept, read, or modify data transmitted between a device and its communication endpoint.
- **Objective**: All communication between endpoints must be encrypted and authenticated.

### Physical Device Security & Asset Recovery
- **ID**: 4.3 | **Impact**: MEDIUM
- **Scenario**: An attacker who acquires a lost or stolen device attempts to decrypt storage or bypass security controls over an extended period.
- **Objective**: Endpoints must be secured against unauthorized access when left unattended.

### Data Loss Prevention (DLP) & Exfiltration Control
- **ID**: 4.4 | **Impact**: HIGH
- **Scenario**: An attacker exfiltrates sensitive data to an external location to use against the organization or its users.
- **Objective**: Unauthorized data exfiltration from secured environments must be prevented.

### Peripheral & Removable Media Control
- **ID**: 4.5 | **Impact**: MEDIUM
- **Scenario**: An attacker uses a malicious USB or Thunderbolt device (e.g., Rubber Ducky, DMA attack) to execute code or exfiltrate data from a locked or unlocked endpoint.
- **Objective**: Unauthorized peripheral devices must be blocked, and data transfers to removable media must be logged and restricted.

### Remote Wipe & Cryptographic Erasure
- **ID**: 4.6 | **Impact**: HIGH
- **Scenario**: An organization is unable to verify the destruction of data on a lost, stolen, or decommissioned device, leading to potential data exposure.
- **Objective**: Administrators must have the capability to remotely trigger a full device wipe or cryptographic erasure of all sensitive data.

### Endpoint Backup & Resilience (Ransomware Recovery)
- **ID**: 4.7 | **Impact**: MAXIMUM
- **Scenario**: A ransomware attack encrypts local data, and the lack of a secure, off-device backup prevents recovery, leading to permanent data loss and downtime.
- **Objective**: Critical endpoint data must be continuously backed up to a secure, immutable, and off-device location for rapid recovery.

### Visual Privacy & Physical Shoulder Surfing
- **ID**: 4.8 | **Impact**: LOW
- **Scenario**: An attacker in a public space (e.g., airport, cafe) views sensitive information on an employee's screen, leading to a loss of confidentiality.
- **Objective**: Endpoints used in public areas must employ physical privacy filters or software-based gaze detection to prevent unauthorized viewing.

### Managed/Personal Data Partitioning (BYOD)
- **ID**: 4.9 | **Impact**: MEDIUM
- **Scenario**: On a personal device used for work, enterprise data leaks into personal applications or cloud storage due to a lack of logical partitioning.
- **Objective**: Enterprise data on personal devices must be logically isolated in a managed container that prevents data transfer to personal apps.

## 5. Operational Visibility & Incident Response
This pillar ensures that endpoints are consistently managed and monitored. By maintaining visibility into the asset inventory and enforcing security policies, the organization can detect and respond to incidents in a timely and effective manner.

### Managed Asset Inventory & Visibility
- **ID**: 5.1 | **Impact**: MEDIUM
- **Scenario**: An attacker introduces an untrusted, malware-infected device into the fleet or spoofs a device's identity to appear as an authorized employee device.
- **Objective**: Attackers must not be able to maintain a hidden presence on endpoints.

### Centralized Fleet Management (UEM/MDM)
- **ID**: 5.2 | **Impact**: HIGH
- **Scenario**: A device deviates from secure configurations due to a lack of policy enforcement or management oversight, creating opportunities for compromise.
- **Objective**: Endpoints must continuously verify and enforce local policy configurations.

### Endpoint Security Policy Enforcement
- **ID**: 5.3 | **Impact**: MEDIUM
- **Scenario**: Configuration drift or the absence of defined policies allows users or systems to deviate from secure states, leading to potential compromise.
- **Objective**: Endpoints must continuously verify and enforce local policy configurations.

### Network Interface & Protocol Security
- **ID**: 5.4 | **Impact**: MEDIUM
- **Scenario**: Services listening for external connections increase the attack surface. An attacker exploits flaws in connection handling or authentication to gain remote access.
- **Objective**: Endpoints must not expose additional attack surface through complex APIs or network services.

### Multi-User & Intra-Session Isolation
- **ID**: 5.5 | **Impact**: MEDIUM
- **Scenario**: An attacker gains access to one user account and leverages it to access data or credentials belonging to another user on the same device.
- **Objective**: A compromise of one endpoint must not facilitate access to another managed endpoint.

### Security Event Logging & Auditing
- **ID**: 5.6 | **Impact**: HIGH
- **Scenario**: An attacker compromises a device and remains undetected, preventing forensic analysis of data exposure or confirmed eviction.
- **Objective**: Attackers must not be able to maintain a hidden presence on endpoints.

### Incident Detection & Response Capability
- **ID**: 5.7 | **Impact**: HIGH
- **Scenario**: An attacker compromises a device, and the organization lacks the capability to detect the intrusion or terminate the attacker's access.
- **Objective**: Unauthorized data exfiltration from secured environments must be prevented.
