import subprocess, locale
from datetime import datetime

timestamp = datetime.now().isoformat()[:19]
print(timestamp)

proc_obj = subprocess.run(['ls', '-al'], stdout=subprocess.PIPE)
output_str = proc_obj.stdout.decode(locale.getdefaultlocale()[1])
print(output_str)