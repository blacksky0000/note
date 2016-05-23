#reverse engerring

#socat usage;

socat tcp-listen:8080,reuseaddr,fork exec:"./xxx"
#nc localhost 8080
#for i in {0..10}; do nc localhost 8080 ; done;
while true; do nc localhost 8080; done;

gdb
ps -af | grep ./xxx
attach PID
