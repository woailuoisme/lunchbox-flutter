#!/bin/bash

# ==================== Path Anchoring ====================
# Ensure the script runs in the project root directory
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
cd "$PROJECT_ROOT" || exit 1

# ==================== Color Definitions ====================
C_R="\033[31m" C_G="\033[32m" C_Y="\033[33m" C_B="\033[34m" C_C="\033[36m" C_1="\033[1m" C_0="\033[0m"
RED=$C_R GREEN=$C_G YELLOW=$C_Y BLUE=$C_B CYAN=$C_C BOLD=$C_1 NC=$C_0

# ==================== Logging Functions ====================
# Default log file, uses this if the script doesn't specify one
LOG_FILE="${LOG_FILE:-logs/script.log}"
mkdir -p "$(dirname "$LOG_FILE")"

# Internal function: Write to file only (strip colors)
_log_to_file() {
    local level="$1"
    local msg="$2"
    printf "[$(date '+%Y-%m-%d %H:%M:%S %z')] [%s] %s\n" "$level" "$msg" >> "$LOG_FILE"
}

log_info()    { printf "${C_C}[$(date '+%Y-%m-%d %H:%M:%S %z')]${C_0} ${C_B}[INFO]${C_0} %s\n" "$1"; _log_to_file "INFO" "$1"; }
log_success() { printf "${C_C}[$(date '+%Y-%m-%d %H:%M:%S %z')]${C_0} ${C_G}[SUCCESS]${C_0} %s\n" "$1"; _log_to_file "SUCCESS" "$1"; }
log_warning() { printf "${C_C}[$(date '+%Y-%m-%d %H:%M:%S %z')]${C_0} ${C_Y}[WARNING]${C_0} %s\n" "$1"; _log_to_file "WARNING" "$1"; }
log_error()   { printf "${C_C}[$(date '+%Y-%m-%d %H:%M:%S %z')]${C_0} ${C_R}[ERROR]${C_0} %s\n" "$1"; _log_to_file "ERROR" "$1"; }

ensure_dir() {
    mkdir -p "$1"
}

require_cmd() {
    command -v "$1" &>/dev/null || { log_error "Command not found: $1"; exit 1; }
}

# Export functions for use in sub-processes (if needed)
export -f log_info log_success log_warning log_error ensure_dir require_cmd
