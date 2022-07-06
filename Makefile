# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.14

# Default target executed when no arguments are given to make.
default_target: all

.PHONY : default_target

# Allow only one "make -f Makefile2" at a time, but pass parallelism.
.NOTPARALLEL:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Produce verbose output by default.
VERBOSE = 1

# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /apps/sylar/bin/cmake

# The command to remove a file.
RM = /apps/sylar/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /root/code/SmtpSendEmail

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /root/code/SmtpSendEmail

#=============================================================================
# Targets provided globally by CMake.

# Special rule for the target rebuild_cache
rebuild_cache:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "Running CMake to regenerate build system..."
	/apps/sylar/bin/cmake -S$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR)
.PHONY : rebuild_cache

# Special rule for the target rebuild_cache
rebuild_cache/fast: rebuild_cache

.PHONY : rebuild_cache/fast

# Special rule for the target edit_cache
edit_cache:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "Running CMake cache editor..."
	/apps/sylar/bin/ccmake -S$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR)
.PHONY : edit_cache

# Special rule for the target edit_cache
edit_cache/fast: edit_cache

.PHONY : edit_cache/fast

# The main all target
all: cmake_check_build_system
	$(CMAKE_COMMAND) -E cmake_progress_start /root/code/SmtpSendEmail/CMakeFiles /root/code/SmtpSendEmail/CMakeFiles/progress.marks
	$(MAKE) -f CMakeFiles/Makefile2 all
	$(CMAKE_COMMAND) -E cmake_progress_start /root/code/SmtpSendEmail/CMakeFiles 0
.PHONY : all

# The main clean target
clean:
	$(MAKE) -f CMakeFiles/Makefile2 clean
.PHONY : clean

# The main clean target
clean/fast: clean

.PHONY : clean/fast

# Prepare targets for installation.
preinstall: all
	$(MAKE) -f CMakeFiles/Makefile2 preinstall
.PHONY : preinstall

# Prepare targets for installation.
preinstall/fast:
	$(MAKE) -f CMakeFiles/Makefile2 preinstall
.PHONY : preinstall/fast

# clear depends
depend:
	$(CMAKE_COMMAND) -S$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR) --check-build-system CMakeFiles/Makefile.cmake 1
.PHONY : depend

#=============================================================================
# Target rules for targets named Jxiepc

# Build rule for target.
Jxiepc: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 Jxiepc
.PHONY : Jxiepc

# fast build rule for target.
Jxiepc/fast:
	$(MAKE) -f CMakeFiles/Jxiepc.dir/build.make CMakeFiles/Jxiepc.dir/build
.PHONY : Jxiepc/fast

#=============================================================================
# Target rules for targets named test_send

# Build rule for target.
test_send: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 test_send
.PHONY : test_send

# fast build rule for target.
test_send/fast:
	$(MAKE) -f CMakeFiles/test_send.dir/build.make CMakeFiles/test_send.dir/build
.PHONY : test_send/fast

Jxiepc/smtp.o: Jxiepc/smtp.cpp.o

.PHONY : Jxiepc/smtp.o

# target to build an object file
Jxiepc/smtp.cpp.o:
	$(MAKE) -f CMakeFiles/Jxiepc.dir/build.make CMakeFiles/Jxiepc.dir/Jxiepc/smtp.cpp.o
.PHONY : Jxiepc/smtp.cpp.o

Jxiepc/smtp.i: Jxiepc/smtp.cpp.i

.PHONY : Jxiepc/smtp.i

# target to preprocess a source file
Jxiepc/smtp.cpp.i:
	$(MAKE) -f CMakeFiles/Jxiepc.dir/build.make CMakeFiles/Jxiepc.dir/Jxiepc/smtp.cpp.i
.PHONY : Jxiepc/smtp.cpp.i

Jxiepc/smtp.s: Jxiepc/smtp.cpp.s

.PHONY : Jxiepc/smtp.s

# target to generate assembly for a file
Jxiepc/smtp.cpp.s:
	$(MAKE) -f CMakeFiles/Jxiepc.dir/build.make CMakeFiles/Jxiepc.dir/Jxiepc/smtp.cpp.s
.PHONY : Jxiepc/smtp.cpp.s

tests/test_smtp.o: tests/test_smtp.cpp.o

.PHONY : tests/test_smtp.o

# target to build an object file
tests/test_smtp.cpp.o:
	$(MAKE) -f CMakeFiles/test_send.dir/build.make CMakeFiles/test_send.dir/tests/test_smtp.cpp.o
.PHONY : tests/test_smtp.cpp.o

tests/test_smtp.i: tests/test_smtp.cpp.i

.PHONY : tests/test_smtp.i

# target to preprocess a source file
tests/test_smtp.cpp.i:
	$(MAKE) -f CMakeFiles/test_send.dir/build.make CMakeFiles/test_send.dir/tests/test_smtp.cpp.i
.PHONY : tests/test_smtp.cpp.i

tests/test_smtp.s: tests/test_smtp.cpp.s

.PHONY : tests/test_smtp.s

# target to generate assembly for a file
tests/test_smtp.cpp.s:
	$(MAKE) -f CMakeFiles/test_send.dir/build.make CMakeFiles/test_send.dir/tests/test_smtp.cpp.s
.PHONY : tests/test_smtp.cpp.s

# Help Target
help:
	@echo "The following are some of the valid targets for this Makefile:"
	@echo "... all (the default if no target is provided)"
	@echo "... clean"
	@echo "... depend"
	@echo "... rebuild_cache"
	@echo "... edit_cache"
	@echo "... Jxiepc"
	@echo "... test_send"
	@echo "... Jxiepc/smtp.o"
	@echo "... Jxiepc/smtp.i"
	@echo "... Jxiepc/smtp.s"
	@echo "... tests/test_smtp.o"
	@echo "... tests/test_smtp.i"
	@echo "... tests/test_smtp.s"
.PHONY : help



#=============================================================================
# Special targets to cleanup operation of make.

# Special rule to run CMake to check the build system integrity.
# No rule that depends on this can have commands that come from listfiles
# because they might be regenerated.
cmake_check_build_system:
	$(CMAKE_COMMAND) -S$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR) --check-build-system CMakeFiles/Makefile.cmake 0
.PHONY : cmake_check_build_system

