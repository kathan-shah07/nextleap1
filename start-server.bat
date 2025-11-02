@echo off
echo Starting local server on http://localhost:8000
echo.
echo Open http://localhost:8000/login.html in your browser
echo Press Ctrl+C to stop the server
echo.
python -m http.server 8000
pause

