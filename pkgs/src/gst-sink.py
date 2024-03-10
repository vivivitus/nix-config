import subprocess
import argparse

parser = argparse.ArgumentParser()
parser.add_argument('--ports', type=str, required=False, help='Origin Port to us')
args = parser.parse_args()

audio_caps = "application/x-rtp,media=(string)audio,clock-rate=(int)48000,encoding-name=(string)X-GST-OPUS-DRAFT-SPITTKA-00"
latency=200

def gst_command(port):
    command = "gst-launch-1.0", "udpsrc", "caps="+audio_caps, "port="+port, "!", "rtpjitterbuffer", "latency="+str(latency), "do-lost=True", "!", "rtpopusdepay", "!", "opusdec", "!", "alsasink"
    return command

commands = []
for port in args.ports.split(','):
    commands.append(subprocess.Popen(gst_command(port)))

for cmd in commands:
        cmd.wait()