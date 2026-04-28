# Secret Injection

This project retrieves a secret from macOS Keychain using Python.

To store a secret:
security add-generic-password -s my_app_service -a my_username -w "your_secret"

To run:
python3 secure_check.py

.env files are not secure because they store secrets in plain text.

extra line for PR
