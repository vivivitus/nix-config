import subprocess
import argparse

parser = argparse.ArgumentParser()
parser.add_argument('--ips', type=str, required=True, help='List of IPs to send to seperatet by ","')
parser.add_argument('--port', type=str, required=True, help='Origin Port to us')
args = parser.parse_args()

def gst_command(ip):
    command = "gst-launch-1.0", "autoaudiosrc", "!", "audioconvert", "!", "opusenc", "!", "rtpopuspay", "!", "udpsink", "host="+ip, "port="+args.port
    return command

commands = []
for ip in args.ips.split(','):
    commands.append(subprocess.Popen(gst_command(ip)))

for cmd in commands:
        cmd.wait()