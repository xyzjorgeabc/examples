from distutils.core import setup, Extension
from Cython.Build import cythonize

ext = Extension("RNG",
                sources=["RNG.pyx", "mt19937.cpp"],
                language="c++")

extq = Extension("Quaternion",
                sources=["quaternion.pyx"],
                language="c++")

setup(name="RNG",
      ext_modules=cythonize([ext, extq]))
