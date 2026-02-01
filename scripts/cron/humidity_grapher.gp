
DATE = system("date +%Y-%m-%d")

# Build output paths
graphdir = "/projects/musical-plants/graphs/" . DATE
outfile = graphdir . "/humidity_graph_" . DATE . ".png"

# CSV path
csvdir = "/projects/musical-plants/data/" . DATE

# Tell gnuplot the data is CSV
set datafile separator ","

# Time handling
set xdata time
set timefmt "%Y-%m-%d_%H:%M"
set format x "%H:%M"

# Labels and title
set title "Humidity Over Time"
set xlabel "Time"
set ylabel "Relative Humidity(%)"

# Improve readability
set grid
set key top left

# Output settings
set terminal pngcairo size 1000,600
set output outfile

# Plot
plot csvdir . "/humidity_" . DATE . ".csv" using 1:2 with linespoints lw 2 title "Humidity"
