# ENDPOINT API

A beginner-friendly REST API portfolio project built with Python, FastAPI, SQLAlchemy, and SQLite.

## Features

- User registration and login
- Bcrypt password hashing
- JWT bearer authentication
- User-specific records (CRUD: create, read, update, delete)
- SQLite persistence
- Request validation
- Interactive Swagger documentation
- Health endpoint
- Basic automated tests

## Requirements

- Windows 10/11, macOS, or Linux
- Python 3.10 or newer
- Internet connection for the first dependency installation

Check Python:

```powershell
python --version
```

## Windows quick start

1. Extract the ZIP.
2. Open the extracted `ENDPOINT` folder.
3. Double-click `run.bat`.

The script creates a virtual environment, installs dependencies, generates a local `.env` secret if needed, and starts the server.

If Windows blocks the script, open PowerShell in this folder and run:

```powershell
powershell -ExecutionPolicy Bypass -File .\run.ps1
```

## Manual setup

Open PowerShell in the project folder:

```powershell
python -m venv .venv
.\.venv\Scripts\Activate.ps1
python -m pip install --upgrade pip
pip install -r requirements.txt
```

Create `.env` by copying `.env.example`, then generate a secret:

```powershell
python -c "import secrets; print(secrets.token_urlsafe(48))"
```

Paste the generated value after `JWT_SECRET_KEY=` in `.env`.

Start the API:

```powershell
uvicorn app.main:app --reload
```

## Open the API

- API root: http://127.0.0.1:8000/
- Health check: http://127.0.0.1:8000/health
- Swagger UI: http://127.0.0.1:8000/docs
- ReDoc: http://127.0.0.1:8000/redoc

Keep the terminal window open while using the API. Press `Ctrl+C` to stop it.

## Try it in Swagger

1. Open http://127.0.0.1:8000/docs.
2. Expand `POST /auth/register`, choose **Try it out**, and create an account.
3. Expand `POST /auth/login`. Enter your username and password. This endpoint uses form fields.
4. Copy the returned `access_token`.
5. Click **Authorize** near the top of Swagger and enter the token. Swagger's OAuth2 dialog accepts the username and password directly as well.
6. Try `POST /records` to create a record.
7. Try `GET /records` to list your records.
8. Try `PUT` and `DELETE` to update and remove a record.

The API only returns records belonging to the authenticated user.

## Run tests

Stop the server if it is running, then run:

```powershell
pytest -q
```

The tests use a local SQLite database. For a clean test run, stop the app and delete `endpoint.db` before running tests. Do not delete the database if you need its data.

## Project layout

```text
ENDPOINT/
├── app/
│   ├── __init__.py
│   ├── database.py
│   ├── main.py
│   ├── models.py
│   ├── routes.py
│   ├── schemas.py
│   └── security.py
├── tests/
│   └── test_api.py
├── .env.example
├── .gitignore
├── README.md
├── requirements.txt
├── run.bat
└── run.ps1
```

## Security and deployment notes

This is an educational starter project, not a production-ready service. Before exposing it to the public internet, add HTTPS, login rate limiting, token revocation/refresh strategy, database migrations, stronger operational logging, backups, and production server configuration. Keep `.env` private and never commit it to GitHub.

The default JWT access token expires after 30 minutes. SQLite is used for easy local development.
