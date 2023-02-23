# distutils: language = c++
# distutils: sources = mt19937.cpp

cdef extern from "quaternion.h":
    cdef cppclass Quaternion:
        float w,x,y,z
        Quaternion(float, float, float, float)
        float dot(const Quaternion*)
        Quaternion* rotationAxis(Vec3 *, float angle)
    
    cdef cppclass Vec3:
        float x,y,z
        Vec3(float, float, float)
    
cdef class PyVec3:
    cdef Vec3* _thisptr
    def __cinit__ (self, float _x, float _y, float _z):
        self._thisptr = new Vec3( _x, _y, _z)
        if self._thisptr == NULL:
            raise MemoryError()

    def __dealloc__ (self):
        if self._thisptr != NULL:
            del self._thisptr
  
    @property
    def x(self):
        return self._thisptr.x

    @property
    def y(self):
        return self._thisptr.y

    @property
    def z(self):
        return self._thisptr.z
        
    @x.setter
    def x(self, val):
        self._thisptr.x = val
        
    @y.setter
    def y(self, val):
        self._thisptr.y = val

    @z.setter
    def z(self, val):
        self._thisptr.z = val

class Empty:
    pass

cdef class PyQuaternion:
    cdef Quaternion* _thisptr
    def __cinit__ (self, float _w, float _x, float _y, float _z):
        self._thisptr = new Quaternion(_w, _x, _y, _z)
        if self._thisptr == NULL:
            raise MemoryError()

    def __dealloc__ (self):
        if self._thisptr != NULL:
            del self._thisptr
    @property
    def w(self):
        return self._thisptr.w
    
    @property
    def x(self):
        return self._thisptr.x

    @property
    def y(self):
        return self._thisptr.y

    @property
    def z(self):
        return self._thisptr.z

    @w.setter
    def w(self, val):
        self._thisptr.w = val
        
    @x.setter
    def x(self, val):
        self._thisptr.x = val
        
    @y.setter
    def y(self, val):
        self._thisptr.y = val

    @z.setter
    def z(self, val):
        self._thisptr.z = val

    def dot(self, PyQuaternion q):
        return self._thisptr.dot(q._thisptr)
    
    #También podemos modificar rotationAxis en C++ para que reciba el puntero qout._thisptr
    #y guarde el resultado de la op. Sería más limpio.
    def rotationAxis(self, PyVec3 vec, angle):
        qout = PyQuaternion(0,0,0,0);
        if qout._thisptr != NULL:
            del qout._thisptr

        qout._thisptr = self._thisptr.rotationAxis(vec._thisptr, angle);
        
        return qout
