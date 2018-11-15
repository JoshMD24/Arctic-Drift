//This is the shader that causes the terrain to deform as you go over it
//you must assign this to a metrial and put it on your plane
//you must have a render texture for this to work

Shader "SnowTrack" {
	Properties {
		_Color ("Color", Color) = (1,1,1,1)
		_MainTex ("Albedo (RGB)", 2D) = "white" {}
	    _NormalMap("Normal (RGB)", 2D) = "bump" {} //making the normal map texture
     	_DisplaceTex("Displace (RGB)", 2D) = "white" {} //making the displace texture
		_Displacement ("Displacement", Range(0,1)) = 0.2 // making the displacement with range and strangth
		_Glossiness("Smoothness", Range(0,1)) = 0.5 //setting the smoothness
		_Metallic ("Metallic", Range(0,1)) = 0.0 //how metallic it is
	}
	SubShader {
		Tags { "RenderType"="Opaque" }
		LOD 200

		CGPROGRAM
		// Physically based Standard lighting model, and enable shadows on all light types
		#pragma surface surf Standard addshadow fullforwardshadows vertex:vert

		// Use shader model 3.0 target, to get nicer looking lighting
		#pragma target 3.0

		sampler2D _MainTex;
		sampler2D _DisplaceTex;
		float _Displacement;

		struct Input {
			float2 uv_MainTex;
		};

		void vert(inout appdata_full v)
		{
			v.vertex.y -= tex2Dlod(_DisplaceTex, float4(v.texcoord.xy, 0, 0)).r * _Displacement + 0.01; // Making the displacement on the y axis
		}

		sampler2D _NormalMap;
		half _Glossiness;
		half _Metallic;
		fixed4 _Color;

		void surf (Input IN, inout SurfaceOutputStandard o) {
			// Albedo comes from a texture tinted by color
			fixed4 c = tex2D (_MainTex, IN.uv_MainTex) * _Color;
			o.Albedo = c.rgb;
			o.Normal = UnpackNormal(tex2D(_NormalMap, IN.uv_MainTex));
			// Metallic and smoothness come from slider variables
			o.Metallic = _Metallic;
			o.Smoothness = _Glossiness;
			o.Alpha = c.a;
		}
		ENDCG
	}
	FallBack "Diffuse"
}
