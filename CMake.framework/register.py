#!/usr/bin/python
# coding=utf-8
import os, sys

class EnvValue(object):
	def __init__(self):
		self.platforms = type("Enum", (), dict(unknow=1, windows=2, linux=3, mac=4))
		self.platform  = self.platforms.unknow
		if sys.platform == "win32":            self.platform = self.platforms.windows
		elif sys.platform.startswith("linux"): self.platform = self.platforms.linux
		elif sys.platform == "darwin":         self.platform = self.platforms.mac
		if not self.platform == self.platforms.windows:
			home = os.path.expanduser("~")
			if self.platform == self.platforms.linux: self.file = os.path.join(home, ".bashrc")
			elif self.platform == self.platforms.mac: self.file = os.path.join(home, ".bash_profile")

	def get_env(self, key):
		value = None
		try: value = os.environ[key]
		except Exception:
			if self.platform == self.platforms.windows:
				import _winreg
				try:
					env = None
					env = _winreg.OpenKeyEx(_winreg.HKEY_CURRENT_USER, "Environment", 0, _winreg.KEY_SET_VALUE|_winreg.KEY_READ)
					value = _winreg.QueryValueEx(env, key)[0]
				except Exception: pass
				finally:
					if env is not None: _winreg.CloseKey(env)
			elif self.platform == self.platforms.linux or self.platform == self.platforms.mac:
				if self.file is not None:
					try:
						file = None
						file = open(self.file)
						import re
						self.patten = re.compile(r"^export[ \t]+%s=(.+)"%key)
						for line in file:
							match = self.patten.match(line.lstrip(" \t"))
							if match is not None:
								value = match.group(1)
								break
					except Exception: pass
					finally:
						if file is not None: file.close()
		return value

	def set_env(self, key, value):
		ret = True
		if self.platform == self.platforms.windows:
			import _winreg
			try:
				env = None
				env = _winreg.OpenKeyEx(_winreg.HKEY_CURRENT_USER, "Environment", 0, _winreg.KEY_SET_VALUE|_winreg.KEY_READ)
				_winreg.SetValueEx(env, key, 0, _winreg.REG_SZ, value)
				_winreg.FlushKey(env)
			except Exception: ret = False
			finally:
				if env is not None: _winreg.CloseKey(env)
		elif self.platform == self.platforms.linux or self.platform == self.platforms.mac:
			if self.file is not None:
				if self.get_env(key) is None:
					try:
						file  = None
						file = open(self.file, "a")
						file.write("export %s=%s\n"%(key,value))
					except Exception: ret = False
					finally:
						if file is not None: file.close()
				else:
					try:
						file_r = None
						file_r = open(self.file, "r")
						file_w = None
						file_w = open(self.file, "w")
						lines = file_r.readlines()
						import re
						self.patten = re.compile(r"^export[ \t]+%s=(.+)"%key)
						for i in range(len(lines)):
							if self.patten.match(lines[i].lstrip(" \t")) is not None:
								lines[i] = "export %s=%s\n"%(key,value)
								break
						file_w.writelines(lines)
					except Exception: ret = False
					finally:
						if file_r is not None: file_r.close()
						if file_w is not None: file_w.close()
		else: ret = False
		return ret

if __name__ == "__main__":
	env = EnvValue()
	value = env.get_env("CMAKE_FRAMEWORK")
	if value is not None: print "Already exist %s"%value
	if value != sys.path[0]:
		if EnvValue().set_env("CMAKE_FRAMEWORK", sys.path[0]): print "Succeed %s"%sys.path[0]
		else: print "Failed"
