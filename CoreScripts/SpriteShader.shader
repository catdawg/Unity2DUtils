Shader "SpriteShader" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
	}
	SubShader {
		Tags {"Queue"="Transparent" "ForceNoShadowCasting"="True" "IgnoreProjector"="True"}
		LOD 100
		
		Pass {
			Lighting Off 
			Cull Off 
			ZTest Always 
			ZWrite Off 
			Fog { Mode Off }
			SetTexture [_MainTex] { combine texture } 
		}
	} 
}

