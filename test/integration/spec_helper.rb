# frozen_string_literal: true

def program_files
  os_env('ProgramFiles').content
end

def beyondcompare_exe
  "#{program_files}\\Beyond Compare 4\\BCompare.exe"
end

def git_exe
  "#{program_files}\\Git\\cmd\\git.exe"
end

def git_config(key)
  powershell(%(& "#{git_exe}" config --global --get "#{key}"))
end
