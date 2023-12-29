import argparse
import subprocess
import json


def run_command(host, user, password, command):
    cmd = f'chmod +x run.sh && ./run.sh {host} {user} {password} "{command}"'
    subprocess.call(cmd, shell=True)
    return True


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument("--cmd", help="Please Enter Your Command")
    args = parser.parse_args()
    with open('servers.json', 'r') as json_file:
        servers_data = json.loads(json_file.read())
    for server in servers_data:
        run_command(server['ip'], server['user'], server['password'], args.cmd)
