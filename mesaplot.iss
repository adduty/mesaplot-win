#define MyAppName "MESAplot"
#define MyAppVersion "0.3.4"
#define MyAppURL "http://mleewise.com/mesaplot.php"
#define MyAppExeName "MESAplot.py"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{25D0DA21-4B2B-4B36-A2EC-EA2C13657FB3}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={code:AddBackslash|{reg:HKLM\SOFTWARE\Python\PythonCore\2.7\InstallPath,|{reg:HKCU\Software\Python\PythonCore\2.7\InstallPath,|{sd}\python27}}}Lib\site-packages\{#MyAppName}
DisableProgramGroupPage=yes
LicenseFile=E:\mesaplot-wininst\gpl-2.0.rtf
OutputBaseFilename=mesaplot-setup
Compression=lzma2
SolidCompression=yes

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Messages]
SelectDirLabel3=Setup will install [name] into the following folder. If you already have a Python 2.7 version installed elsewhere, please install in [your_python_root]\Lib\site-packages\MESAplot

[Components]
Name: "python"; Description: "Python 2.7.11 installer"; Types: full; Check: PythonInstalled()
;Name: "numpy"; Description: "numpy Python module"; Types: full
;Name: "matplotlib"; Description: "matplotlib Python module"; Types: full
;Name: "wxpython"; Description: "wxPython Python module"; Types: full

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked
Name: "quicklaunchicon"; Description: "{cm:CreateQuickLaunchIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked; OnlyBelowVersion: 0,6.1

[Files]
Source: "E:\mesaplot-wininst\mesaplot\MESAplot.py"; DestDir: "{app}"; Flags: ignoreversion
Source: "E:\mesaplot-wininst\mesaplot\config.txt"; DestDir: "{app}"; Flags: ignoreversion
Source: "E:\mesaplot-wininst\mesaplot\default_settings.py"; DestDir: "{app}"; Flags: ignoreversion
Source: "E:\mesaplot-wininst\mesaplot\File_Manager.py"; DestDir: "{app}"; Flags: ignoreversion
Source: "E:\mesaplot-wininst\mesaplot\MESAoutput1.py"; DestDir: "{app}"; Flags: ignoreversion
Source: "E:\mesaplot-wininst\mesaplot\plot_manager.py"; DestDir: "{app}"; Flags: ignoreversion
Source: "E:\mesaplot-wininst\mesaplot\README.txt"; DestDir: "{app}"; Flags: ignoreversion isreadme
Source: "E:\mesaplot-wininst\python-2.7.11.msi"; DestDir: "{tmp}"; Flags: ignoreversion; Components: "python"
Source: "E:\mesaplot-wininst\wxPython3.0-win32-3.0.2.0-py27.exe"; DestDir: "{tmp}"; Flags: ignoreversion
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
Name: "{commonprograms}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{commondesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon
Name: "{userappdata}\Microsoft\Internet Explorer\Quick Launch\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: quicklaunchicon

[Registry]
; add Python root to path if not present
;Root: HKLM; Subkey: "SYSTEM\CurrentControlSet\Control\Session Manager\Environment"; \
    ValueType: string; ValueName: "Path"; ValueData: "{olddata};{app}"; \
    Check: NeedsAddPath(ExpandConstant('{sd}\python27'))
; add Python scripts dir to path if not present
;Root: HKLM; Subkey: "SYSTEM\CurrentControlSet\Control\Session Manager\Environment"; \
    ValueType: string; ValueName: "Path"; ValueData: "{olddata};{app}\Scripts"; \
    Check: NeedsAddPath(ExpandConstant('{sd}\python27\Scripts'))
; add .PYC to PATHEXT if not present
;Root: HKLM; Subkey: "SYSTEM\CurrentControlSet\Control\Session Manager\Environment"; \
    ValueType: expandsz; ValueName: "PATHEXT"; ValueData: "{olddata};.PYC"; \
    Check: NeedsAddPathExt('.PYC')
; add .PY to PATHEXT if not present
;Root: HKLM; Subkey: "SYSTEM\CurrentControlSet\Control\Session Manager\Environment"; \
    ValueType: expandsz; ValueName: "PATHEXT"; ValueData: "{olddata};.PY"; \
    Check: NeedsAddPathExt('.PY')
; add file associations if don't exist
Root: HKCR; Subkey: .py; ValueType: string; ValueData: "Python.File"; Flags: createvalueifdoesntexist
Root: HKCR; Subkey: .py; ValueType: string; ValueName: "Content Type"; ValueData: "text/plain"; Flags: createvalueifdoesntexist
Root: HKCR; Subkey: .pyc; ValueType: string; ValueData: "Python.CompiledFile"; Flags: createvalueifdoesntexist
Root: HKCR; Subkey: .pyo; ValueType: string; ValueData: "Python.CompiledFile"; Flags: createvalueifdoesntexist
Root: HKCR; Subkey: .pyw; ValueType: string; ValueData: "Python.NoConFile"; Flags: createvalueifdoesntexist
Root: HKCR; Subkey: .pyw; ValueType: string; ValueName: "Content Type"; ValueData: "text/plain"; Flags: createvalueifdoesntexist

Root: HKLM; Subkey: "SOFTWARE\Classes\Python.CompiledFile"; ValueType: string; ValueData: "Compiled Python File"; Flags: createvalueifdoesntexist
Root: HKLM; Subkey: "SOFTWARE\Classes\Python.CompiledFile\DefaultIcon"; ValueType: string; ValueData: "{code:AddBackslash|{reg:HKLM\SOFTWARE\Python\PythonCore\2.7\InstallPath,|{reg:HKCU\Software\Python\PythonCore\2.7\InstallPath,|{sd}\python27}}}DLLs\pyc.ico"; Flags: createvalueifdoesntexist
Root: HKLM; Subkey: "SOFTWARE\Classes\Python.CompiledFile\shell"; Flags: createvalueifdoesntexist
Root: HKLM; Subkey: "SOFTWARE\Classes\Python.CompiledFile\shell\open"; Flags: createvalueifdoesntexist
Root: HKLM; Subkey: "SOFTWARE\Classes\Python.CompiledFile\shell\open\command"; ValueType: string; ValueData: """{code:AddBackslash|{reg:HKLM\SOFTWARE\Python\PythonCore\2.7\InstallPath,|{reg:HKCU\Software\Python\PythonCore\2.7\InstallPath,|{sd}\python27}}}python.exe"" ""%1"" %*"; Flags: createvalueifdoesntexist
Root: HKLM; Subkey: "SOFTWARE\Classes\Python.CompiledFile\shellex"; Flags: createvalueifdoesntexist
Root: HKLM; Subkey: "SOFTWARE\Classes\Python.CompiledFile\shellex\DropHandler"; ValueType: string; ValueData: "{{60254CA5-953B-11CF-8C96-00AA00B8708C}"; Flags: createvalueifdoesntexist

Root: HKLM; Subkey: "SOFTWARE\Classes\Python.File"; ValueType: string; ValueData: "Python File"; Flags: createvalueifdoesntexist
Root: HKLM; Subkey: "SOFTWARE\Classes\Python.File\DefaultIcon"; ValueType: string; ValueData: "{code:AddBackslash|{reg:HKLM\SOFTWARE\Python\PythonCore\2.7\InstallPath,|{reg:HKCU\Software\Python\PythonCore\2.7\InstallPath,|{sd}\python27}}}DLLs\py.ico"; Flags: createvalueifdoesntexist
Root: HKLM; Subkey: "SOFTWARE\Classes\Python.File\shell"; Flags: createvalueifdoesntexist
Root: HKLM; Subkey: "SOFTWARE\Classes\Python.File\shell\Edit with IDLE"
Root: HKLM; Subkey: "SOFTWARE\Classes\Python.File\shell\Edit with IDLE\command"; ValueType: string; ValueData: """{code:AddBackslash|{reg:HKLM\SOFTWARE\Python\PythonCore\2.7\InstallPath,|{reg:HKCU\Software\Python\PythonCore\2.7\InstallPath,|{sd}\python27}}}pythonw.exe"" ""{code:AddBackslash|{reg:HKLM\SOFTWARE\Python\PythonCore\2.7\InstallPath,|{reg:HKCU\Software\Python\PythonCore\2.7\InstallPath,|{sd}\python27}}}Lib\idlelib\idle.pyw"" -e ""%1"""
Root: HKLM; Subkey: "SOFTWARE\Classes\Python.File\shell\open"; Flags: createvalueifdoesntexist
Root: HKLM; Subkey: "SOFTWARE\Classes\Python.File\shell\open\command"; ValueType: string; ValueData: """{code:AddBackslash|{reg:HKLM\SOFTWARE\Python\PythonCore\2.7\InstallPath,|{reg:HKCU\Software\Python\PythonCore\2.7\InstallPath,|{sd}\python27}}}python.exe"" ""%1"" %*"; Flags: createvalueifdoesntexist
Root: HKLM; Subkey: "SOFTWARE\Classes\Python.File\shellex"; Flags: createvalueifdoesntexist
Root: HKLM; Subkey: "SOFTWARE\Classes\Python.File\shellex\DropHandler"; ValueType: string; ValueData: "{{60254CA5-953B-11CF-8C96-00AA00B8708C}"; Flags: createvalueifdoesntexist

Root: HKLM; Subkey: "SOFTWARE\Classes\Python.NoConFile"; ValueType: string; ValueData: "Python File (no console)"; Flags: createvalueifdoesntexist
Root: HKLM; Subkey: "SOFTWARE\Classes\Python.NoConFile\DefaultIcon"; ValueType: string; ValueData: "{code:AddBackslash|{reg:HKLM\SOFTWARE\Python\PythonCore\2.7\InstallPath,|{reg:HKCU\Software\Python\PythonCore\2.7\InstallPath,|{sd}\python27}}}DLLs\py.ico"; Flags: createvalueifdoesntexist
Root: HKLM; Subkey: "SOFTWARE\Classes\Python.NoConFile\shell"; Flags: createvalueifdoesntexist
Root: HKLM; Subkey: "SOFTWARE\Classes\Python.NoConFile\shell\Edit with IDLE"
Root: HKLM; Subkey: "SOFTWARE\Classes\Python.NoConFile\shell\Edit with IDLE\command"; ValueType: string; ValueData: """{code:AddBackslash|{reg:HKLM\SOFTWARE\Python\PythonCore\2.7\InstallPath,|{reg:HKCU\Software\Python\PythonCore\2.7\InstallPath,|{sd}\python27}}}pythonw.exe"" ""{code:AddBackslash|{reg:HKLM\SOFTWARE\Python\PythonCore\2.7\InstallPath,|{reg:HKCU\Software\Python\PythonCore\2.7\InstallPath,|{sd}\python27}}}Lib\idlelib\idle.pyw"" -e ""%1"""
Root: HKLM; Subkey: "SOFTWARE\Classes\Python.NoConFile\shell\open"; Flags: createvalueifdoesntexist
Root: HKLM; Subkey: "SOFTWARE\Classes\Python.NoConFile\shell\open\command"; ValueType: string; ValueData: """{code:AddBackslash|{reg:HKLM\SOFTWARE\Python\PythonCore\2.7\InstallPath,|{reg:HKCU\Software\Python\PythonCore\2.7\InstallPath,|{sd}\python27}}}pythonw.exe"" ""%1"" %*"; Flags: createvalueifdoesntexist
Root: HKLM; Subkey: "SOFTWARE\Classes\Python.NoConFile\shellex"; Flags: createvalueifdoesntexist
Root: HKLM; Subkey: "SOFTWARE\Classes\Python.NoConFile\shellex\DropHandler"; ValueType: string; ValueData: "{{60254CA5-953B-11CF-8C96-00AA00B8708C}"; Flags: createvalueifdoesntexist

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: shellexec postinstall skipifsilent
; START PYTHON
Filename: "{sys}\msiexec.exe"; Parameters: "/i {tmp}\python-2.7.11.msi /qb ALLUSERS=1 ADDLOCAL=ALL TARGETDIR={sd}\python27"; WorkingDir: "{tmp}"; Check: PythonInstalled()
; END PYTHON
; START NUMPY
Filename: "{code:AddBackslash|{reg:HKLM\SOFTWARE\Python\PythonCore\2.7\InstallPath,|{sd}\python27}}Scripts\pip.exe"; Parameters: "install numpy"
; END NUMPY
; START MATPLOTLIB
Filename: "{code:AddBackslash|{reg:HKLM\SOFTWARE\Python\PythonCore\2.7\InstallPath,|{sd}\python27}}Scripts\pip.exe"; Parameters: "install matplotlib"
; END MATPLOTLIB
; START WXPYTHON
Filename: "{tmp}\wxPython3.0-win32-3.0.2.0-py27.exe"; Parameters: "/SILENT"; WorkingDir: "{tmp}"
; END WXPYTHON

[UninstallDelete]
Type: files; Name: "{app}\*.pyc"

;[UninstallRun]
;Filename: "{reg:HKLM\HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\wxPython3.0-py27_is1,UninstallString|{sd}\Python27\Lib\site-packages\wx-3.0-msw}"

[Code]
function NeedsAddPath(Param: string): boolean;
var
  OrigPath: string;
begin
  if not RegQueryStringValue(HKEY_LOCAL_MACHINE,
    'SYSTEM\CurrentControlSet\Control\Session Manager\Environment',
    'Path', OrigPath)
  then begin
    Result := True;
    exit;
  end;
  if RegKeyExists(HKEY_LOCAL_MACHINE, 'SOFTWARE\Python\PythonCore\2.7\InstallPath')
  then begin
    Result := False;
    exit;
  end;
  // look for the path with leading and trailing semicolon
  // Pos() returns 0 if not found
  Result := Pos(';' + Param + ';', ';' + OrigPath + ';') = 0;
end;

function NeedsAddPathExt(Param: string): boolean;
var
  OrigPath: string;
begin
  if not RegQueryStringValue(HKEY_LOCAL_MACHINE,
    'SYSTEM\CurrentControlSet\Control\Session Manager\Environment',
    'PATHEXT', OrigPath)
  then begin
    Result := True;
    exit;
  end;
  if RegKeyExists(HKEY_LOCAL_MACHINE, 'SOFTWARE\Python\PythonCore\2.7\InstallPath')
  then begin
    Result := False;
    exit;
  end;
  // look for the path with leading and trailing semicolon
  // Pos() returns 0 if not found
  Result := Pos(';' + Param + ';', ';' + OrigPath + ';') = 0;
end;

function PythonInstalled(): boolean;
begin
  if not RegKeyExists(HKEY_LOCAL_MACHINE, 'SOFTWARE\Python\PythonCore\2.7\InstallPath') and not RegKeyExists(HKEY_CURRENT_USER, 'Software\Python\PythonCore\2.7\InstallPath')
  then begin
    Result := True;
    exit;
  end;
end;