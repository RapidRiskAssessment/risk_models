# MITRE ATT&CK Mapping: Endpoint Security Risk Model

This document maps the security objectives and threat categories defined in the `endpoint_security_risk_model.md` to the **MITRE ATT&CK Enterprise Matrix**. This mapping provides a threat-informed perspective on how each security control mitigates specific adversary tactics and techniques.

## 1. Reconnaissance & Resource Development
Adversaries search for information and develop the infrastructure needed to support their operations.

| Threat Category | ID | MITRE Technique(s) |
| :--- | :--- | :--- |
| Managed Asset Inventory & Visibility | 5.1 | T1592 (Gather Victim Host Information) |
| Cryptographic Device Identity | 2.2 | T1583 (Acquire Infrastructure) |
| Third-Party Application Supply Chain (SBOM) | 3.12 | T1587 (Develop Capabilities: Software) |

## 2. Initial Access
Adversaries use various entry vectors to gain an initial foothold within a network.

| Threat Category | ID | MITRE Technique(s) |
| :--- | :--- | :--- |
| Remote Management Interface Security | 1.4 | T1133 (External Remote Services) |
| Network Interface & Protocol Security | 5.4 | T1190 (Exploit Public-Facing Application) |
| Application Control & Execution Policy | 3.6 | T1204 (User Execution) |
| Endpoint Detection & Malware Prevention | 3.7 | T1204 (User Execution) |
| User-to-Device Authentication (Local) | 2.4 | T1534 (Internal Spearphishing) |
| Peripheral & Removable Media Control | 4.5 | T1091 (Replication Through Removable Media) |
| Browser Governance & Extension Security | 3.10 | T1189 (Drive-by Compromise) |
| Managed/Personal Data Partitioning (BYOD) | 4.9 | T1078 (Valid Accounts) |
| Autonomous AI Agent & Local LLM Security | 3.13 | T1059 (Command and Scripting Interpreter) |

## 3. Execution
Adversaries attempt to run malicious code on a local or remote system.

| Threat Category | ID | MITRE Technique(s) |
| :--- | :--- | :--- |
| Firmware Update Integrity & Management | 1.2 | T1203 (Exploitation for Client Execution) |
| Secure & Trusted Boot Verification | 1.6 | T1542.003 (Pre-OS Boot: Bootkit) |
| Process Sandboxing & Isolation | 3.3 | T1059 (Command and Scripting Interpreter) |
| Application Control & Execution Policy | 3.6 | T1059 (Command and Scripting Interpreter) |
| Endpoint Detection & Malware Prevention | 3.7 | T1204 (User Execution) |
| Peripheral & Removable Media Control | 4.5 | T1200 (Hardware Additions) |
| Local Virtualization & Container Isolation | 3.11 | T1611 (Escape to Host) |
| Autonomous AI Agent & Local LLM Security | 3.13 | T1059 (Command and Scripting Interpreter) |

## 4. Persistence
Adversaries try to maintain their foothold within the system.

| Threat Category | ID | MITRE Technique(s) |
| :--- | :--- | :--- |
| Hardware-Backed Root of Trust (HRoT) | 1.1 | T1542 (Pre-OS Boot) |
| Firmware Update Integrity & Management | 1.2 | T1542.001 (Pre-OS Boot: ROMmon) |
| Secure Firmware Configuration & Defaults | 1.3 | T1542.002 (Pre-OS Boot: Component Firmware) |
| Secure & Trusted Boot Verification | 1.6 | T1542.003 (Pre-OS Boot: Bootkit) |
| Toolchain & Runtime Security Hardening | 3.4 | T1574 (Hijack Execution Flow) |
| Platform Integrity Attestation | 1.7 | T1542 (Pre-OS Boot) |
| Security Event Logging & Auditing | 5.6 | T1562 (Impair Defenses) |

## 5. Privilege Escalation
Adversaries attempt to gain higher-level permissions on a system or network.

| Threat Category | ID | MITRE Technique(s) |
| :--- | :--- | :--- |
| Hardware-Backed Root of Trust (HRoT) | 1.1 | T1542 (Pre-OS Boot) |
| Secure Firmware Configuration & Defaults | 1.3 | T1068 (Exploitation for Privilege Escalation) |
| Hardware-Based Security Primitives (TPM/TEE) | 1.5 | T1068 (Exploitation for Privilege Escalation) |
| Multi-User & Intra-Session Isolation | 5.5 | T1078 (Valid Accounts) |
| Mandatory Access Control (MAC) | 3.5 | T1548 (Abuse Elevation Control Mechanism) |
| Data Loss Prevention (DLP) & Exfiltration Control | 4.4 | T1534 (Internal Spearphishing) |
| Local Virtualization & Container Isolation | 3.11 | T1611 (Escape to Host) |

## 6. Defense Evasion
Adversaries try to avoid detection throughout their compromise.

| Threat Category | ID | MITRE Technique(s) |
| :--- | :--- | :--- |
| Hardware-Based Security Primitives (TPM/TEE) | 1.5 | T1562 (Impair Defenses) |
| System Service & API Hardening | 3.1 | T1562 (Impair Defenses) |
| Endpoint Security Policy Enforcement | 5.3 | T1562.001 (Impair Defenses: Disable or Modify Tools) |
| Process Sandboxing & Isolation | 3.3 | T1562 (Impair Defenses) |
| Toolchain & Runtime Security Hardening | 3.4 | T1562 (Impair Defenses) |
| Mandatory Access Control (MAC) | 3.5 | T1562 (Impair Defenses) |
| Endpoint Detection & Malware Prevention | 3.7 | T1562.001 (Impair Defenses: Disable or Modify Tools) |
| Security Event Logging & Auditing | 5.6 | T1562.002 (Impair Defenses: Disable or Modify Cloud Logs) |
| Incident Detection & Response Capability | 5.7 | T1562 (Impair Defenses) |
| Remote Wipe & Cryptographic Erasure | 4.6 | T1070 (Indicator Removal) |

## 7. Credential Access
Adversaries search for and steal credentials like names and passwords.

| Threat Category | ID | MITRE Technique(s) |
| :--- | :--- | :--- |
| Hardware-Backed Root of Trust (HRoT) | 1.1 | T1555 (Credentials from Password Stores) |
| User Authentication & Login Policy | 2.1 | T1110 (Brute Force) |
| Restricted & Low-Privilege API Access | 3.9 | T1003 (OS Credential Dumping) |
| Cryptographic Device Identity | 2.2 | T1555 (Credentials from Password Stores) |
| User-to-Service Authentication (Remote) | 2.5 | T1539 (Steal Web Session Cookie) |
| Device-to-Service Authentication (Machine-to-Machine) | 2.6 | T1528 (Steal Application Access Token) |

## 8. Discovery
Adversaries try to figure out your environment.

| Threat Category | ID | MITRE Technique(s) |
| :--- | :--- | :--- |
| Managed Asset Inventory & Visibility | 5.1 | T1082 (System Information Discovery) |
| Centralized Fleet Management (UEM/MDM) | 5.2 | T1082 (System Information Discovery) |
| Platform Integrity Attestation | 1.7 | T1082 (System Information Discovery) |
| Endpoint Security Policy Enforcement | 5.3 | T1518 (Software Discovery) |

## 9. Lateral Movement
Adversaries try to move through your environment.

| Threat Category | ID | MITRE Technique(s) |
| :--- | :--- | :--- |
| Hardware-Based Security Primitives (TPM/TEE) | 1.5 | T1570 (Lateral Tool Transfer) |
| Multi-User & Intra-Session Isolation | 5.5 | T1021 (Remote Services) |
| Encrypted Communication (Data in Transit) | 4.2 | T1557 (Adversary-in-the-Middle) |
| Autonomous AI Agent & Local LLM Security | 3.13 | T1021 (Remote Services) |

## 10. Collection & Exfiltration
Adversaries try to gather data and steal it from your environment.

| Threat Category | ID | MITRE Technique(s) |
| :--- | :--- | :--- |
| Restricted & Low-Privilege API Access | 3.9 | T1005 (Data from Local System) |
| Full Disk Encryption (Data at Rest) | 4.1 | T1005 (Data from Local System) |
| Encrypted Communication (Data in Transit) | 4.2 | T1020 (Automated Exfiltration) |
| Physical Device Security & Asset Recovery | 4.3 | T1005 (Data from Local System) |
| Data Loss Prevention (DLP) & Exfiltration Control | 4.4 | T1048 (Exfiltration Over Alternative Protocol) |
| Peripheral & Removable Media Control | 4.5 | T1020 (Automated Exfiltration) |
| Visual Privacy & Physical Shoulder Surfing | 4.8 | T1113 (Screen Capture) |
| Autonomous AI Agent & Local LLM Security | 3.13 | T1020 (Automated Exfiltration) |

## 11. Impact
Adversaries try to manipulate, interrupt, or destroy your systems and data.

| Threat Category | ID | MITRE Technique(s) |
| :--- | :--- | :--- |
| Vulnerability Management & Patching | 3.2 | T1499 (Endpoint Denial of Service) |
| Endpoint Backup & Resilience (Ransomware Recovery) | 4.7 | T1486 (Data Encrypted for Impact) |
