#ifndef __QUATERNION__
#define __QUATERNION__
#include <math.h>

struct Vec3;
struct Quaternion;
const float kmQuaternionDot(const Quaternion*, const Quaternion*);
void kmQuaternionRotationAxis(Quaternion* , const Vec3* , float );

struct Vec3 {
  float x,y,z;
  Vec3(float _x, float _y, float _z){
    this->x = _x;
    this->y = _y;
    this->z = _z;
  }
};

struct Quaternion {
	Quaternion(float _w, float _x, float _y, float _z): w(_w), x(_x), y(_y), z(_z){

  };

	float w,x,y,z;
  
  float dot (const Quaternion* q) {
    return kmQuaternionDot(this, q);
  }
  void rotationAxis ( Vec3* vec, float angle ) {
    kmQuaternionRotationAxis(this, vec, angle);
  }
};

const float kmQuaternionDot(const Quaternion* q1, const Quaternion* q2)
{
	return (q1->w * q2->w +
			q1->x * q2->x +
			q1->y * q2->y +
			q1->z * q2->z);
}

void kmQuaternionRotationAxis(Quaternion* pOut, const Vec3* pV, float angle)
{
	float rad = angle * 0.5f;
	float scale	= sinf(rad);

	pOut->w = cosf(rad);
	pOut->x = pV->x * scale;
	pOut->y = pV->y * scale;
	pOut->z = pV->z * scale;

}

#endif
