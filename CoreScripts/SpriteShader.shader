Shader "SpriteShader" {
	Properties {
		_MainTex ("Base (RGBA)", 2D) = "white" {}
	}
	SubShader {
		Tags {"Queue"="Transparent" "ForceNoShadowCasting"="True" "IgnoreProjector"="True"}
		LOD 100
		
		Pass {
			Lighting Off 
			Cull Off 
			ZTest Always 
			ZWrite Off 
			Blend SrcAlpha OneMinusSrcAlpha
			Fog { Mode Off }
			SetTexture [_MainTex] { combine texture } 
		}
	} 
}

