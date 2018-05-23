#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

constant uint _42_tmp [[function_constant(0)]];
constant uint _42 = is_function_constant_defined(_42_tmp) ? _42_tmp : 10u;
constant uint _43_tmp [[function_constant(1)]];
constant uint _43 = is_function_constant_defined(_43_tmp) ? _43_tmp : 3u;
constant uint _44_tmp [[function_constant(2)]];
constant uint _44 = is_function_constant_defined(_44_tmp) ? _44_tmp : 4u;
constant uint3 gl_WorkGroupSize = uint3(_42, _43, _44);

struct Stride
{
    uint2 u_stride;
};

struct Output
{
    uint3 result[1];
};

kernel void main0(constant Stride& stride [[buffer(0)]], device Output& sb_out [[buffer(1)]], uint3 gl_GlobalInvocationID [[thread_position_in_grid]])
{
    uint offset = ((stride.u_stride.x * gl_GlobalInvocationID.z) + (stride.u_stride.y * gl_GlobalInvocationID.y)) + gl_GlobalInvocationID.x;
    sb_out.result[offset] = gl_WorkGroupSize;
}
