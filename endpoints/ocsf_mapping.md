# OCSF Mapping: Endpoint Security Risk Model

This document maps the threat categories and security objectives defined in the `endpoint_security_risk_model.md` to the **Open Cybersecurity Schema Framework (OCSF) v1.1.0/1.2.0**. This mapping facilitates the standardization of security telemetry for monitoring, auditing, and detection across heterogeneous security systems.

## 1. Platform Foundation & Hardware Security
Monitoring low-level hardware and firmware events to ensure the integrity of the computing platform.

| Threat Category | ID | OCSF Category | OCSF Class Name (ID) |
| :--- | :--- | :--- | :--- |
| Hardware-Backed Root of Trust (HRoT) | 1.1 | Audit/Inventory | Security Control Activity (6003) |
| Firmware Update Integrity & Management | 1.2 | System Activity | Operating System Activity (1006) |
| Secure Firmware Configuration & Defaults | 1.3 | Audit/Inventory | Security Control Activity (6003) |
| Remote Management Interface Security | 1.4 | Network Activity | Network Connection (4001) |
| Hardware-Based Security Primitives (TPM/TEE) | 1.5 | Audit/Inventory | Device Inventory (6001) |
| Secure & Trusted Boot Verification | 1.6 | Audit/Inventory | Security Control Activity (6003) |
| Platform Integrity Attestation | 1.7 | Audit/Inventory | Device Inventory (6001) |

## 2. Identity, Authentication & Access Control
Tracking user and device identity lifecycle events, authentication attempts, and access control decisions.

| Threat Category | ID | OCSF Category | OCSF Class Name (ID) |
| :--- | :--- | :--- | :--- |
| User Authentication & Login Policy | 2.1 | IAM | Authentication (3002) |
| Cryptographic Device Identity | 2.2 | IAM | User Management (3001) |
| Risk-Based Device Posture Reporting | 2.3 | Audit/Inventory | Device Inventory (6001) |
| User-to-Device Authentication (Local) | 2.4 | IAM | Authentication (3002) |
| User-to-Service Authentication (Remote) | 2.5 | IAM | Authentication (3002) |
| Device-to-Service Authentication (Machine-to-Machine) | 2.6 | IAM | Authentication (3002) |
| Session Lock & User Presence Verification | 2.7 | IAM | Authentication (3002) |

## 3. System Hardening & Software Integrity
Observing software execution, process behavior, and system configuration changes.

| Threat Category | ID | OCSF Category | OCSF Class Name (ID) |
| :--- | :--- | :--- | :--- |
| System Service & API Hardening | 3.1 | System Activity | Process Activity (1001) |
| Vulnerability Management & Patching | 3.2 | Finding | Vulnerability Finding (2002) |
| Process Sandboxing & Isolation | 3.3 | System Activity | Process Activity (1001) |
| Toolchain & Runtime Security Hardening | 3.4 | System Activity | Process Activity (1001) |
| Mandatory Access Control (MAC) | 3.5 | IAM | Entity Management (3004) |
| Application Control & Execution Policy | 3.6 | System Activity | Process Activity (1001) |
| Endpoint Detection & Malware Prevention | 3.7 | Finding | Detection Finding (2001) |
| Software Supply Chain Integrity | 3.8 | Audit/Inventory | Software Inventory (6002) |
| Restricted & Low-Privilege API Access | 3.9 | Application Activity | API Activity (5003) |
| Browser Governance & Extension Security | 3.10 | Application Activity | Web Resources Activity (5004) |
| Local Virtualization & Container Isolation | 3.11 | System Activity | Process Activity (1001) |
| Third-Party Application Supply Chain (SBOM) | 3.12 | Audit/Inventory | Software Inventory (6002) |
| Autonomous AI Agent & Local LLM Security | 3.13 | Application Activity | Application Activity (5002) |

## 4. Data Protection & Physical Security
Monitoring data access, encryption events, and physical device status.

| Threat Category | ID | OCSF Category | OCSF Class Name (ID) |
| :--- | :--- | :--- | :--- |
| Full Disk Encryption (Data at Rest) | 4.1 | System Activity | File System Activity (1002) |
| Encrypted Communication (Data in Transit) | 4.2 | Network Activity | Network Connection (4001) |
| Physical Device Security & Asset Recovery | 4.3 | Audit/Inventory | Device Inventory (6001) |
| Data Loss Prevention (DLP) & Exfiltration Control | 4.4 | Data Security | Data Security Activity (1007) |
| Peripheral & Removable Media Control | 4.5 | System Activity | Peripheral Device Activity (1003) |
| Remote Wipe & Cryptographic Erasure | 4.6 | Audit/Inventory | Security Control Activity (6003) |
| Endpoint Backup & Resilience (Ransomware Recovery) | 4.7 | Audit/Inventory | Security Control Activity (6003) |
| Visual Privacy & Physical Shoulder Surfing | 4.8 | System Activity | Operating System Activity (1006) |
| Managed/Personal Data Partitioning (BYOD) | 4.9 | IAM | Entity Management (3004) |

## 5. Operational Visibility & Incident Response
Standardizing management, logging, and response telemetry.

| Threat Category | ID | OCSF Category | OCSF Class Name (ID) |
| :--- | :--- | :--- | :--- |
| Managed Asset Inventory & Visibility | 5.1 | Audit/Inventory | Device Inventory (6001) |
| Centralized Fleet Management (UEM/MDM) | 5.2 | Audit/Inventory | Device Inventory (6001) |
| Endpoint Security Policy Enforcement | 5.3 | Audit/Inventory | Security Control Activity (6003) |
| Network Interface & Protocol Security | 5.4 | Network Activity | Network Connection (4001) |
| Multi-User & Intra-Session Isolation | 5.5 | IAM | Authentication (3002) |
| Security Event Logging & Auditing | 5.6 | Audit/Inventory | Security Control Activity (6003) |
| Incident Detection & Response Capability | 5.7 | Finding | Incident Finding (2005) |
