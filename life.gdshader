shader_type canvas_item;

void fragment(){
	COLOR.rgba = vec4(vec3(0), 1);
	COLOR.g = texture(TEXTURE, UV).g;
	float bot = texture(TEXTURE, UV - TEXTURE_PIXEL_SIZE * vec2(0, 1)).g;
	float top = texture(TEXTURE, UV - TEXTURE_PIXEL_SIZE * vec2(0, -1)).g;
	float right = texture(TEXTURE, UV - TEXTURE_PIXEL_SIZE * vec2(1, 0)).g;
	float left = texture(TEXTURE, UV - TEXTURE_PIXEL_SIZE * vec2(-1, 0)).g;
	float left_bot = texture(TEXTURE, UV - TEXTURE_PIXEL_SIZE * vec2(-1, 1)).g;
	float left_top = texture(TEXTURE, UV - TEXTURE_PIXEL_SIZE * vec2(-1, -1)).g;
	float right_bot = texture(TEXTURE, UV - TEXTURE_PIXEL_SIZE * vec2(1, 1)).g;
	float right_top = texture(TEXTURE, UV - TEXTURE_PIXEL_SIZE * vec2(1, -1)).g;
	int neighbours = int(round(bot + top + right + left + left_bot + left_top + right_bot + right_top));
	if (neighbours == 3 || COLOR.g > 0.5 && neighbours == 2){
		COLOR.g = 1.;
	}else{
		COLOR.g = 0.;
	}
}