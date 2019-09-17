// Texture pixel/fragment shader
// Basic fragment shader for rendering textured geometry

// Texture and sampler registers
Texture2D texture0 : register(t0);
Texture2D texture1 : register(t1);
SamplerState Sampler0 : register(s0);

struct InputType
{
	float4 position : SV_POSITION;
	float2 tex : TEXCOORD0;
};


float4 main(InputType input) : SV_TARGET
{
	float4 textureColor;
	float4 textureColor2;
	// Shift texture 0.5 units along the x axis
	//input.tex.x += 0.5f;

	// Sample the pixel color from the texture using the sampler at this texture coordinate location.
	textureColor = texture0.Sample(Sampler0, input.tex);
	textureColor2 = texture1.Sample(Sampler0, input.tex);

	// Invert texture colours
	//textureColor = float4 (1.0 - textureColor.x, 1.0 - textureColor.y, 1.0 - textureColor.z, 1);

	// Blend both textures together
	float4 textureColor3 = lerp(textureColor, textureColor2, 0.5);

	return textureColor3;
}