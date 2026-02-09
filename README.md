# Environmental Plant Monitoring Data Generation, Visualization & Timelapse Creation

A cron-driven, shell-scripted pipeline that logs environmental sensor data to CSV files, generates visualizations with Gnuplot, and produces daily timelapse videos.  
The project explores whether environmental conditions and music playback may influence plant growth.

This system collects environmental data from connected sensors, logs readings into CSV files, and generates visualizations using Gnuplot. Images are captured throughout the day and rendered into timelapse videos using a Dockerized rendering service.  
The entire workflow is orchestrated primarily through cron jobs to simulate a continuously running, production-style data generation pipeline.

This project serves as a practical exploration of Linux shell scripting, cron scheduling, filesystem-based data logging, and lightweight container usage. Application code, gnuplot scripts and advanced shell scripts were 
generated with AI assistance, allowing the focus to remain on infrastructure design, operational behavior, and real-world troubleshooting rather than application-level complexity while still learning scripting fundamentals. 

## Project Purpose

This project was built to simulate a compact, production-style data generation and processing pipeline using simple, reliable tools.

The focus is **not** on application logic, but on:

- Periodic data generation using cron jobs
- Logging time-series data to CSV files
- Separating data collection, visualization, and media rendering workloads
- Debugging shell scripts, cron behavior, and long-running Linux systems
- Using Docker selectively for isolated, one-off workloads

## Key Engineering Decisions

**Filesystem-based data logging (CSV):**  
Sensor readings are written directly to CSV files, avoiding databases in favor of portability, and ease of inspection.

**Cron-driven execution:**  
Data collection, image capture, and graph generation are scheduled via cron, mirroring real-world unattended systems.

**Gnuplot for visualization:**  
Chosen for its scriptability, low overhead, and suitability for headless environments.

**One-shot Docker containers:**  
Docker is used only where isolation is beneficial (HTTP file serving and timelapse rendering), with containers running to completion and exiting.

## Scope & Limitations

- This is **not** a high-availability system
- No retry, alerting, or failure recovery mechanisms
- Data retention and rotation are manual
- Designed for a single-node, local environment

## Architecture

The system is composed of several loosely coupled components:

### Data Loggers

- Shell and Python scripts triggered by cron
- Read environmental sensors via I²C and the 1 wire interface
- Append timestamped readings to CSV files
- Days on which music is played are recorded in a text file for reference.

### Grapher

- Gnuplot scripts process CSV files
- Generates daily graphs of environmental data
- Runs headlessly on a schedule

### Timelapse Renderer

- Images captured periodically throughout the day and annotations of sensor data is overlayed on images. 
- Dockerized rendering service converts image sequences into videos
- Container runs once per render and exits

### HTTP File Server

- Serves generated graphs and timelapse videos
- Provides simple access without additional application logic

## Future improvements and considerations

- Music may not have had a significant effect on the plant as initially expected. The volume was kept low during the experiment to avoid disturbing neighbors; higher volumes would require their permission.
- Further troubleshooting is needed for the soil moisture sensor due to occasional inconsistent or stalled readings.
- Lighting setup has been adjusted: direct light was replaced with indirect light bounced off the wall, which helped to avoid scorching the plant and drying it out.
- Replace music playback with ambient forest sounds to evaluate their effect on the plant.

## Example Output

The system generates outputs such as:

- Time-series graphs of environmental sensor data
- Daily timelapse videos of plant growth and conditions

<img width="1000" height="600" alt="humidity_graph_2026-02-05" src="https://github.com/user-attachments/assets/ec5934e1-d249-4bb5-bd00-2c285682567f" />

https://github.com/user-attachments/assets/bd812824-9c31-4123-9d75-176fadbe69f6

### Workflow Diagram

```
[Cron Jobs]
     |
     v
[Sensor Scripts] --> [CSV Files]
                         |
                         v
                    [Gnuplot]
                         |
                         v
                    [Graphs]

[Image Capture Cron]
        |
        v
[Image Capture Script]
        |
        +--> [Sensor Readings]
        |         |
        |         v
        |   [Text Annotations]
        |         |
        v         v
   [Annotated Image Files]
              |
              v
   [Timelapse Renderer (Docker)]
              |
              v
        [Video Output]

[Graphs + Videos] --> [HTTP File Server (Docker)]
```

### Directory Structure

```
.
├── .gitignore
├── data/
│   ├── 2026-02-03/
│   │   ├── carbondioxide_2026-02-03.csv
│   │   ├── humidity_2026-02-03.csv
│   │   └── ... (temperature, moisture)
│   ├── 2026-02-04/...
│   └── musicdays_log.txt
├── docker/
│   ├── httpfileserver/
│   │   ├── Dockerfile
│   │   └── httpfileserver.py
│   └── timelapserenderer/
│       ├── Dockerfile
│       └── timelapse_render.sh
├── graphs/
│   ├── 2026-02-03/
│   │   ├── carbondioxide_graph_2026-02-03.png
│   │   └── ... (humidity, moisture, soiltemperature)
│   └── 2026-02-04/...
├── images/
│   └── 2026-02-07/
│       ├── plant_02-07_0000.jpg
│       └── plant_02-07_0095.jpg
├── music/
│   └── classicalmusic_compilation.mp3
├── scripts/
│   ├── cron/
│   │   ├── dailydatafiles.sh
│   │   ├── image_capture.sh
│   │   ├── carbdioxide_logger.sh
│   │   └── ... (all other cron scripts & Gnuplot scripts)
│   └── python/
│       ├── carbondioxide_ingest.py
│       └── ... (humidity, soilmoisture)
└── videos/
    └── 2026-02-07/
        └── plant_timelapse_02-07.mp4
```

### Physical setup

![image_01](https://github.com/user-attachments/assets/b7b84314-4315-4580-85a5-63ccd66b0fcc)

![image_02](https://github.com/user-attachments/assets/404fd10c-e8bd-472e-ac86-6f0951f5bc3b)

![image_03](https://github.com/user-attachments/assets/9d4d48a9-b7eb-44b7-9c25-9c135b62edda)

![image_04](https://github.com/user-attachments/assets/702005d6-b0be-48f1-8568-98aca93b8239)

![image_05](https://github.com/user-attachments/assets/91cc19b3-89ae-4ace-b8db-9c2843c64f1c)

![image_06](https://github.com/user-attachments/assets/72940b13-7dd6-43c2-92e2-986fb6470284)

![image_07](https://github.com/user-attachments/assets/f48eaae2-6d01-431c-aaa1-f0024a283a4e)

![image_08](https://github.com/user-attachments/assets/fd80187a-4c15-4c73-9bce-7daf927b2f01)

![image_09](https://github.com/user-attachments/assets/b0ce0890-7b3a-4535-a8a8-0eebcc3a4eb1)

![image_10](https://github.com/user-attachments/assets/be1145d7-e131-46ee-a387-88a4e0cdacc0)

![image_11](https://github.com/user-attachments/assets/7e80c374-595a-4f9a-af6c-9d993dcdbc2c)

