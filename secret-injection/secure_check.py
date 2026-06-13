import subprocess

result = subprocess.run(
    ["/usr/bin/security", "find-generic-password", "-s", "my_app_service", "-a", "my_username", "-w"],
    capture_output=True,
    text=True
)

print(result.stdout)
