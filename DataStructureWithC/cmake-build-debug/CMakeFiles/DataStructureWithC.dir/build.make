# CMAKE generated file: DO NOT EDIT!
# Generated by "NMake Makefiles" Generator, CMake Version 3.15

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE
NULL=nul
!ENDIF
SHELL = cmd.exe

# The CMake executable.
CMAKE_COMMAND = "C:\Program Files\JetBrains\CLion 2019.3.2\bin\cmake\win\bin\cmake.exe"

# The command to remove a file.
RM = "C:\Program Files\JetBrains\CLion 2019.3.2\bin\cmake\win\bin\cmake.exe" -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = C:\Storage\Github\StudyNotes\DataStructureWithC

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = C:\Storage\Github\StudyNotes\DataStructureWithC\cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles\DataStructureWithC.dir\depend.make

# Include the progress variables for this target.
include CMakeFiles\DataStructureWithC.dir\progress.make

# Include the compile flags for this target's objects.
include CMakeFiles\DataStructureWithC.dir\flags.make

CMakeFiles\DataStructureWithC.dir\basic_C_studies\ex011.c.obj: CMakeFiles\DataStructureWithC.dir\flags.make
CMakeFiles\DataStructureWithC.dir\basic_C_studies\ex011.c.obj: ..\basic_C_studies\ex011.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=C:\Storage\Github\StudyNotes\DataStructureWithC\cmake-build-debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/DataStructureWithC.dir/basic_C_studies/ex011.c.obj"
	C:\PROGRA~2\MICROS~1\2019\COMMUN~1\VC\Tools\MSVC\1424~1.283\bin\Hostx86\x86\cl.exe @<<
 /nologo $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) /FoCMakeFiles\DataStructureWithC.dir\basic_C_studies\ex011.c.obj /FdCMakeFiles\DataStructureWithC.dir\ /FS -c C:\Storage\Github\StudyNotes\DataStructureWithC\basic_C_studies\ex011.c
<<

CMakeFiles\DataStructureWithC.dir\basic_C_studies\ex011.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/DataStructureWithC.dir/basic_C_studies/ex011.c.i"
	C:\PROGRA~2\MICROS~1\2019\COMMUN~1\VC\Tools\MSVC\1424~1.283\bin\Hostx86\x86\cl.exe > CMakeFiles\DataStructureWithC.dir\basic_C_studies\ex011.c.i @<<
 /nologo $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E C:\Storage\Github\StudyNotes\DataStructureWithC\basic_C_studies\ex011.c
<<

CMakeFiles\DataStructureWithC.dir\basic_C_studies\ex011.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/DataStructureWithC.dir/basic_C_studies/ex011.c.s"
	C:\PROGRA~2\MICROS~1\2019\COMMUN~1\VC\Tools\MSVC\1424~1.283\bin\Hostx86\x86\cl.exe @<<
 /nologo $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) /FoNUL /FAs /FaCMakeFiles\DataStructureWithC.dir\basic_C_studies\ex011.c.s /c C:\Storage\Github\StudyNotes\DataStructureWithC\basic_C_studies\ex011.c
<<

# Object files for target DataStructureWithC
DataStructureWithC_OBJECTS = \
"CMakeFiles\DataStructureWithC.dir\basic_C_studies\ex011.c.obj"

# External object files for target DataStructureWithC
DataStructureWithC_EXTERNAL_OBJECTS =

DataStructureWithC.exe: CMakeFiles\DataStructureWithC.dir\basic_C_studies\ex011.c.obj
DataStructureWithC.exe: CMakeFiles\DataStructureWithC.dir\build.make
DataStructureWithC.exe: CMakeFiles\DataStructureWithC.dir\objects1.rsp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=C:\Storage\Github\StudyNotes\DataStructureWithC\cmake-build-debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable DataStructureWithC.exe"
	"C:\Program Files\JetBrains\CLion 2019.3.2\bin\cmake\win\bin\cmake.exe" -E vs_link_exe --intdir=CMakeFiles\DataStructureWithC.dir --rc=C:\PROGRA~2\WI3CF2~1\10\bin\100183~1.0\x86\rc.exe --mt=C:\PROGRA~2\WI3CF2~1\10\bin\100183~1.0\x86\mt.exe --manifests  -- C:\PROGRA~2\MICROS~1\2019\COMMUN~1\VC\Tools\MSVC\1424~1.283\bin\Hostx86\x86\link.exe /nologo @CMakeFiles\DataStructureWithC.dir\objects1.rsp @<<
 /out:DataStructureWithC.exe /implib:DataStructureWithC.lib /pdb:C:\Storage\Github\StudyNotes\DataStructureWithC\cmake-build-debug\DataStructureWithC.pdb /version:0.0  /machine:X86 /debug /INCREMENTAL /subsystem:console kernel32.lib user32.lib gdi32.lib winspool.lib shell32.lib ole32.lib oleaut32.lib uuid.lib comdlg32.lib advapi32.lib 
<<

# Rule to build all files generated by this target.
CMakeFiles\DataStructureWithC.dir\build: DataStructureWithC.exe

.PHONY : CMakeFiles\DataStructureWithC.dir\build

CMakeFiles\DataStructureWithC.dir\clean:
	$(CMAKE_COMMAND) -P CMakeFiles\DataStructureWithC.dir\cmake_clean.cmake
.PHONY : CMakeFiles\DataStructureWithC.dir\clean

CMakeFiles\DataStructureWithC.dir\depend:
	$(CMAKE_COMMAND) -E cmake_depends "NMake Makefiles" C:\Storage\Github\StudyNotes\DataStructureWithC C:\Storage\Github\StudyNotes\DataStructureWithC C:\Storage\Github\StudyNotes\DataStructureWithC\cmake-build-debug C:\Storage\Github\StudyNotes\DataStructureWithC\cmake-build-debug C:\Storage\Github\StudyNotes\DataStructureWithC\cmake-build-debug\CMakeFiles\DataStructureWithC.dir\DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles\DataStructureWithC.dir\depend

