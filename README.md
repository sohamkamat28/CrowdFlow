# CrowdFlow AI

Campus crowd prediction and pedestrian routing with Random Forest, Dijkstra, and adaptive route allocation. Includes an interactive dashboard and five simulation scenarios. Campus and data are synthetic.

## Requirements

Install **Python 3.12 (64-bit)** from [python.org](https://www.python.org/downloads/). On Windows, enable **Add Python to PATH** and install the Python launcher.

Download this repository using **Code → Download ZIP** and extract it, or clone it:

```bash
git clone https://github.com/sohamkamat28/CrowdFlow.git
cd CrowdFlow
```

## macOS

Open Terminal in the extracted project folder. Install dependencies once:

```bash
bash setup.sh
```

Start the app:

```bash
bash run.sh
```

## Windows

Open the extracted project folder. Double-click **setup.bat** once, then **run.bat** to start. These commands also work in PowerShell:

```powershell
.\setup.bat
.\run.bat
```

Open **http://127.0.0.1:8000**. Keep the terminal open; press **Ctrl+C** to stop. If the port is busy, use `bash run.sh --port 8001` on macOS or `.\run.bat --port 8001` on Windows, then open port 8001.

The trained model and built dashboard are included. **Node.js, API keys, and retraining are not needed to run it.** Internet is needed for the initial dependency installation.

## Try it

- **Overview:** calculate Main Entrance → Cafeteria for 500 people; compare distance-only and adaptive routing. Scroll down to start a simulation.
- **ML intelligence:** inspect prediction error and feature importance.
- **Experiments:** run the same scenario across all three routing strategies.

## Development (optional)

Install test dependencies with `.venv/bin/python -m pip install -r requirements-dev.txt`, then run `.venv/bin/python -m pytest`. On Windows, use `.venv\Scripts\python.exe` instead.

To edit the dashboard, install Node.js 22+, then run `npm ci` and `npm run build` inside `frontend/`. Run the full UI checks from the root with `.venv/bin/python tests/run_ui_checks.py` while the app server is stopped.

To regenerate the data, train the model, or refresh benchmarks, use `python -m data.generate`, `python -m ml.train`, and `python -m simulation.compare` with the project environment.
