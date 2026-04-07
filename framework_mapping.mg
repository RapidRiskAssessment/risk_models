# Security Framework Comparison Mapping

This table compares Threat Categories criteria from the `endpoint_security_risk_model.md`, which serves as the primary source of these threats and objectives, to NIST SP 800-53 (Rev 5) and CIS Critical Security Controls (v8).

| Threat Categories | NIST 800-53 (Rev 5) | CIS Controls v8 |
| :--- | :--- | :--- |
| **1. Platform Foundation & Hardware Security** | | |
| Hardware-Backed Root of Trust (HRoT) (ID 1.1) | SC-34, IA-11, SC-28 | 1.1, 4.1 |
| Firmware Update Integrity & Management (ID 1.2) | SI-2, CM-6, SR-3 | 7.1, 7.4 |
| Secure Firmware Configuration & Defaults (ID 1.3) | CM-6, SC-34 | 4.1, 4.2 |
| Remote Management Interface Security (ID 1.4) | AC-17, IA-2 | 4.4, 12.2 |
| Hardware-Based Security Primitives (TPM/TEE) (ID 1.5) | SC-34, SA-8 | 1.1 |
| Secure & Trusted Boot Verification (ID 1.6) | SC-34, SI-7 | 1.1 |
| Platform Integrity Attestation (ID 1.7) | SI-7, SC-34 | 1.1, 4.1 |
| **2. Identity, Authentication & Access Control** | | |
| User Authentication & Login Policy (ID 2.1) | AC-2, AC-3 | 5.2, 6.1 |
| Cryptographic Device Identity (ID 2.2) | IA-3, IA-11 | 1.1, 5.1 |
| Risk-Based Device Posture Reporting (ID 2.3) | AC-4, CA-7 | 1.1, 5.1 |
| User-to-Device Authentication (Local) (ID 2.4) | IA-2, AC-2 | 5.2, 6.1 |
| User-to-Service Authentication (Remote) (ID 2.5) | IA-2, AC-17 | 6.1, 6.3 |
| Device-to-Service Authentication (Machine-to-Machine) (ID 2.6) | IA-3, AC-17 | 5.1, 12.2 |
| Session Lock & User Presence Verification (ID 2.7) | AC-11, IA-11 | 4.11 |
| **3. System Hardening & Software Integrity** | | |
| System Service & API Hardening (ID 3.1) | CM-6, SC-7 | 4.2, 4.3 |
| Vulnerability Management & Patching (ID 3.2) | SI-2 | 7.1, 7.2 |
| Process Sandboxing & Isolation (ID 3.3) | SC-39, AC-4 | 16.10 |
| Toolchain & Runtime Security Hardening (ID 3.4) | SI-16, SA-8 | 16.1 |
| Mandatory Access Control (MAC) (ID 3.5) | AC-3, AC-25 | 6.2 |
| Application Control & Execution Policy (ID 3.6) | CM-7, SI-7 | 2.1, 2.2 |
| Endpoint Detection & Malware Prevention (ID 3.7) | SI-3 | 10.1, 10.2 |
| Software Supply Chain Integrity (ID 3.8) | SR-6, SR-11 | 15.3 |
| Restricted & Low-Privilege API Access (ID 3.9) | SC-39, AC-4 | 16.10 |
| Browser Governance & Extension Security (ID 3.10) | CM-6, SC-18 | 2.1, 9.2 |
| Local Virtualization & Container Isolation (ID 3.11) | SC-39, AC-4 | 16.10 |
| Third-Party Application Supply Chain (SBOM) (ID 3.12) | SR-11, SR-12 | 15.3 |
| Autonomous AI Agent & Local LLM Security (ID 3.13) | SC-39, AC-4, AC-6 | 16.10, 5.4 |
| **4. Data Protection & Physical Security** | | |
| Full Disk Encryption (Data at Rest) (ID 4.1) | SC-28 | 3.11 |
| Encrypted Communication (Data in Transit) (ID 4.2) | SC-8, SC-13 | 3.10 |
| Physical Device Security & Asset Recovery (ID 4.3) | MP-6, SC-28 | 3.11, 4.11 |
| Data Loss Prevention (DLP) & Exfiltration Control (ID 4.4) | SC-7, AC-4 | 3.12, 13.1 |
| Peripheral & Removable Media Control (ID 4.5) | MP-7, IA-3 | 1.1, 13.5 |
| Remote Wipe & Cryptographic Erasure (ID 4.6) | MP-6, PE-16 | 3.11, 4.11 |
| Endpoint Backup & Resilience (Ransomware Recovery) (ID 4.7) | CP-9, CP-10 | 11.1, 11.2 |
| Visual Privacy & Physical Shoulder Surfing (ID 4.8) | PE-5 | 4.11 |
| Managed/Personal Data Partitioning (BYOD) (ID 4.9) | AC-4, AC-19 | 6.2, 13.1 |
| **5. Operational Visibility & Incident Response** | | |
| Managed Asset Inventory & Visibility (ID 5.1) | CA-7, CM-8 | 1.1, 2.1 |
| Centralized Fleet Management (UEM/MDM) (ID 5.2) | CM-1, CM-2 | 1.1, 2.1 |
| Endpoint Security Policy Enforcement (ID 5.3) | CM-1, CM-6 | 4.1, 4.2 |
| Network Interface & Protocol Security (ID 5.4) | SC-7 | 4.3, 12.1 |
| Multi-User & Intra-Session Isolation (ID 5.5) | AC-2, SC-39 | 6.2 |
| Security Event Logging & Auditing (ID 5.6) | AU-2, AU-6 | 8.2, 8.5 |
| Incident Detection & Response Capability (ID 5.7) | IR-4, IR-6 | 17.1, 17.3 |
