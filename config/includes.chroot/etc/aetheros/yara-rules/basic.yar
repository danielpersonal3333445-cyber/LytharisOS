rule suspicious_script {
  meta:
    description = "Detects suspicious shell scripts"
  strings:
    $a = "rm -rf /" nocase
    $b = "wget" nocase
    $c = "curl" nocase
    $d = "chmod 777" nocase
    $e = "/etc/passwd" nocase
    $f = "base64 -d" nocase
  condition:
    3 of them
}

rule reverse_shell {
  meta:
    description = "Detects common reverse shell patterns"
  strings:
    $a = "bash -i >& /dev/tcp"
    $b = "python -c 'import socket"
    $c = "nc -e /bin/bash"
    $d = "ncat -e /bin/bash"
    $e = "/bin/sh -i"
  condition:
    any of them
}

rule crypto_miner {
  meta:
    description = "Detects crypto mining software"
  strings:
    $a = "stratum+tcp" nocase
    $b = "mining.pool" nocase
    $c = "xmrig" nocase
    $d = "monero" nocase
    $e = "cryptonight" nocase
  condition:
    2 of them
}
