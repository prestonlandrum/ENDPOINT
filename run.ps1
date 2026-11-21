$ErrorActionPreference = "Stop"

if (-not (Test-Path ".venv")) {
    python -m venv .venv
}

& ".\.venv\Scripts\python.exe" -m pip install --upgrade pip
& ".\.venv\Scripts\python.exe" -m pip install -r requirements.txt

if (-not (Test-Path ".env")) {
    Copy-Item ".env.example" ".env"
    $secret = & ".\.venv\Scripts\python.exe" -c "import secrets; print(secrets.token_urlsafe(48))"
    (Get-Content ".env") -replace "replace_this_with_a_long_random_secret", $secret | Set-Content ".env"
}

& ".\.venv\Scripts\python.exe" -m uvicorn app.main:app --reload
