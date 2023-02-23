#ifndef __QUATERNION__
#define __QUATERNION__

struct Quaternion;
const float kmQuaternionDot(const Quaternion*, const Quaternion*);

struct Quaternion {
	Quaternion(float _w, float _x, float _y, float _z): w(_w), x(_x), y(_y), z(_z){

  };

	float w,x,y,z;
  
  float dot (const Quaternion* q) {
    return kmQuaternionDot(this, q);
  }
};

const float kmQuaternionDot(const Quaternion* q1, const Quaternion* q2)
{
	return (q1->w * q2->w +
			q1->x * q2->x +
			q1->y * q2->y +
			q1->z * q2->z);
}


#endif
