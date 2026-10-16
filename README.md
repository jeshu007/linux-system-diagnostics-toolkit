# Linux-Based Network and System Monitoring

## Project Overview

A Bash-based monitoring project developed in Ubuntu on WSL to inspect Linux system health, network connectivity, listening sockets, and basic troubleshooting conditions. It also supports timestamped report logging.

## Objectives

- Monitor basic Linux system resources.
- Inspect listening network sockets and TCP connections.
- Check disk usage against configurable warning thresholds.
- Test routing, external IP connectivity, and DNS resolution.
- Save monitoring results in timestamped log files.

## Tools and Technologies

- Ubuntu on Windows Subsystem for Linux (WSL)
- Bash scripting
- Linux networking utilities: `ip`, `ss`, `ping`, `getent`
- System utilities: `df`, `free`, `ps`, `awk`
- Logging utilities: `tee`, `date`

## Project Features

1. **System Monitoring:** Displays system information, uptime, memory, disk usage, CPU processes, interfaces, and routing.
2. **Socket Monitoring:** Inspects listening sockets and TCP connections using `ss`.
3. **Health Checks:** Reports root filesystem usage as OK, WARNING, or CRITICAL using configurable thresholds.
4. **Network Troubleshooting:** Checks for a default route, tests loopback and external ICMP connectivity, and verifies hostname resolution.
5. **Report Logging:** Saves timestamped reports for later review.
6. **Syntax Testing:** Uses Bash syntax checks to identify scripting errors.

## Project Structure

```text
linux-network-project/
├── scripts/
│   ├── system_check.sh
│   ├── port_check.sh
│   ├── health_check.sh
│   └── network_check.sh
├── logs/
└── README.md
```

The script filenames above reflect the intended structure. Adjust them if your actual filenames differ.

## How to Run

From the project directory:

```bash
chmod +x scripts/*.sh
./scripts/health_check.sh
./scripts/port_check.sh
./scripts/network_check.sh
```

Run the system monitoring script with:

```bash
./scripts/system_check.sh
```

Save a timestamped health report:

```bash
./scripts/health_check.sh 2>&1 | tee logs/health_check_$(date +%Y%m%d_%H%M%S).log
```

## Health Thresholds

- **OK:** Disk usage below 80%
- **WARNING:** Disk usage from 80% to 89%
- **CRITICAL:** Disk usage at least 90%

These are example project thresholds and can be adjusted for other environments.

## Testing

- Checked Bash syntax using `bash -n`.
- Executed the monitoring scripts.
- Reviewed socket and process information.
- Tested routing, loopback connectivity, external ICMP connectivity, and DNS resolution.
- Verified timestamped log generation.

## Limitations

- Developed and tested in Ubuntu on WSL; behavior can differ from a production Linux server.
- ICMP ping failure alone does not prove internet failure because firewalls may block ICMP.
- DNS success does not guarantee that a website or application is reachable.
- The project performs basic checks and is not a replacement for a production monitoring platform.

## Learning Outcomes

Practiced Linux commands, Bash scripting, network troubleshooting, resource monitoring, conditional logic, and report logging.
