# Compiles main.f

# CFT     = f77
# LDR     = f77
# mac f77 FFLAGS = -N113 -f -N1 -O
# sgi FFLAGS  = -r8
# CFT     = /Applications/Absoft/bin/f90
# LDR     = /Applications/Absoft/bin/f90
# FFLAGS  = -N113 -lU77 -s -O
# CFT     = xlf -F:xlf_s
# LDR     = xlf -F:xlf_s
# CFT     = xlf 
# LDR     = xlf
CFT     = gfortran
LDR     = gfortran
# FFLAGS  = -qfixed=132 -qautodbl=dbl -qlanglvl -C -qflttrap
# FFLAGS  = -qfixed=132 -qautodbl=dbl -qlanglvl -O2 -static
# FFLAGS  = -qfixed=132 -qautodbl=dbl -qlanglvl 
LFLAGS = -lnlopt -lm
# FFLAGS  = -ffixed-line-length-132 -fimplicit-none -fno-automatic -O4
FFLAGS  = -ffixed-line-length-132 -fno-automatic -Ofast -g -fcheck=all -Wall -fbacktrace
COMMAND = main

.f.o :
	$(CFT) $(FFLAGS) $*.f -c

MAIN = main.o

SUBS = \

# LIB1 = /afs/lsa.umich.edu/group/geo/users/stixrude/NUMRECSGI/libsginumrec.a
# LIB1 = /big3/crlb/FORCES/,subroutines/libnumrec.a
# LIB1 = ~/work/ARCHIVES/blas-old/liblpsblas.a
# LIB1 = /Users/stixrude/work/ARCHIVES/ATLAS3.8.0/ATLAS_mac/lib/libtstatlas.a
# LIB1 = /System/Library/Frameworks/Accelerate.framework/Versions/A/Frameworks/vecLib.framework/Versions/A/libBLAS.dylib
# LIB2 = /System/Library/Frameworks/Accelerate.framework/Versions/A/Frameworks/vecLib.framework/Versions/A/libLAPACK.dylib
LIB1 = -framework Accelerate
LIB3 = /Users/stixrude/WORK/SCILIBS/MINPACK/minpack_dp.a
# LIB4 = /Users/stixrude/WORK/SCILIBS/slatec4gf41c/libslatec.a
LIB4 = /Users/stixrude/WORK/SCILIBS/slatec/libslatec.a

$(COMMAND): $(MAIN) $(SUBS)
	$(LDR) $(LFLAGS) -o $(COMMAND) $(MAIN) $(SUBS) $(LIB1) $(LIB2) $(LIB3) $(LIB4)
