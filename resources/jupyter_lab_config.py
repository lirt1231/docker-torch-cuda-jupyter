import os


c.ExtensionApp.open_browser = False
c.LabServerApp.open_browser = False
c.LabApp.open_browser = False
c.ServerApp.open_browser = False

c.ServerApp.ip = '*'
c.ServerApp.port = 8888

if "JUPYTER_ROOT_DIR" in os.environ:
    c.ServerApp.root_dir = os.environ["JUPYTER_ROOT_DIR"]
else:
    c.ServerApp.root_dir = "/root/project"
