# Verwende ein Python-Basisimage. Wähle eine Version, die mit Coqui TTS kompatibel ist.
# Python 3.9 oder höher wird oft empfohlen.
FROM python:3.9-slim-bullseye

# Setze das Arbeitsverzeichnis im Container
WORKDIR /app

# Installiere Systemabhängigkeiten, die für Coqui TTS und Audioverarbeitung benötigt werden
# Dazu gehören ffmpeg für Audio, git für das Klonen des Coqui TTS Repositories
# und build-essential für Kompilierungen, falls nötig.
RUN apt-get update && apt-get install -y \
    ffmpeg \
    git \
    build-essential \
    libsndfile1 \
    && rm -rf /var/lib/apt/lists/*

# Klone das Coqui TTS Repository. Es ist oft besser, eine spezifische Version zu verwenden
# oder einen Commit-Hash, um Reproduzierbarkeit zu gewährleisten.
# Hier klonen wir die Hauptversion.
RUN git clone https://github.com/coqui-ai/TTS.git /app/TTS

# Installiere Coqui TTS und seine Abhängigkeiten
# Navigiere in das TTS-Verzeichnis und installiere es im "editable" Modus
# mit den zusätzlichen Abhängigkeiten für das Training.
WORKDIR /app/TTS
RUN pip install --no-cache-dir -e ".[train,de]"

# Setze das Arbeitsverzeichnis zurück auf /app oder ein anderes geeignetes Verzeichnis
# für die Ausführung von Trainingsskripten.
WORKDIR /app

# Optional: Kopiere ein Startskript oder Konfigurationsdateien, falls du spezifische
# Skripte im Image haben möchtest. Für das Training ist es oft besser, diese
# über Volumes zu mounten.
# Beispiel: COPY train_script.py /app/train_script.py

# Definiere den Standardbefehl, der ausgeführt wird, wenn der Container startet.
# Dies ist ein Platzhalter. Du wirst den eigentlichen Trainingsbefehl
# beim Starten des Containers über `docker run` überschreiben müssen.
CMD ["python", "--version"]