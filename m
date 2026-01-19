Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4C8D3B0F8
	for <lists+uboot-stm32@lfdr.de>; Mon, 19 Jan 2026 17:30:25 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7D71CC36B3C;
	Mon, 19 Jan 2026 16:30:25 +0000 (UTC)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com
 [209.85.210.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C5051C36B2A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Jan 2026 16:30:24 +0000 (UTC)
Received: by mail-ot1-f44.google.com with SMTP id
 46e09a7af769-7cfca52ac2dso2817399a34.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Jan 2026 08:30:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=konsulko.com; s=google; t=1768840223; x=1769445023;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=U8Pn2Qiwuca7fubi4+O3X71fd8bg/fzU8siHXNZVDBs=;
 b=Wsr19/kma3TMErhbGZG8O+MJylNJ1IZcLGr/G1tyEiHMeCzPOQoGq1qvSJsQTdx9Rb
 cNufGgoymaf5lW9Ea02+i51FN+7elZ4wyRRwk4Dd5lQcf/YiR+UIeqPGU3l3BWdfEwO6
 +VfqPJsHtQBay0xcz3uF/Vo5u5/WQdo1VD348=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768840223; x=1769445023;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U8Pn2Qiwuca7fubi4+O3X71fd8bg/fzU8siHXNZVDBs=;
 b=Z1evI42m4Tv+cA7Nm4Gpt/fckL9UzuCW0RegEzn/p5Z+as6n3SEXY0/oyVItB2DRWH
 4tjEqOD3viKcvme7RvxxKQhhTVZKNlEndeySsp/2VLYp8+/5V4AZCJjpTfpq2nfCXOmL
 juOV5wFEJLVM51fqkaFYMxwP6Kane9TBuXZS7uU6I7Z7gDj3WI5Re9OOFQrxUqAK+uc6
 PCDwYFbyEDCUMgf0cuKfJUUG1DNKrekG6gfKRro4fcuUHAa42fhIJvd1T5fv4z0/Y5TI
 t003pqgFT/wTqmrxOaPsxFMaFmtm4Xm0xGWaI3ToL33GPfwvD64vxVr4PL/SkUSLA1wG
 uLRg==
X-Gm-Message-State: AOJu0Yw5YaY5XxvzazYLV71RaoEVaZjeIAb9tTKK6YRfg3al+RRt5rRn
 b69bE/WZ0SdkbHWdyVnkxG/B1WnQd3DTr3cSp264wSDMdA2GGLcfiPiirtHDk943UD0=
X-Gm-Gg: AY/fxX7YfNzJGsBC3gBV4lsSbLXLt4qA/kGGTbCCRoVSMHctDE2zy8UhqrssU9Jg02T
 tITS4j3uSg2nlbgSTyNG75XC/MBfRDsVSO8BhwTBH+ZePYAHa2pkgakg42XSpNJYl9q1aScFoKe
 3JOPcPtbtngemSgH/ylFhOr5WjFxLVBoIIqkxkFWdTrgpME61BcDNO5pfv29buzbup100zZeiQ1
 C/DEne79LEapJebP2b/hxFIJSSG7h77ThBZOXm/p26e0rVpVhV87FMgTXhi+l6aCxqIa5OR9dBr
 sgwwnTdEVYNBSFVmQHyZdEFlVhK/91XUaWmcOteG55SqanbhMoUdn9wo8rAiTMs+wUu1KdKWIew
 4S4cKCHUra6TFRls/qTY8Cv8nFOu5CYo58oXg1JGbIq0z9t4GNe4ooX6YwyYANTFHjZuTjUADR5
 xffJoCx3jhf5XZVy8ZJPNs3LdrhWZoNYz4uwAkRe43BC27J/KwyoY9qJCpTNkIA+h9HUqh9J2Ro
 44A51P2LfbEi/L5F9chvd45MdC1jgbNGVDeRSA=
X-Received: by 2002:a05:6830:6d4e:b0:7cf:d2f3:af8a with SMTP id
 46e09a7af769-7cfdee50f9bmr5888323a34.28.1768840223456; 
 Mon, 19 Jan 2026 08:30:23 -0800 (PST)
Received: from bill-the-cat (fixed-189-203-103-235.totalplay.net.
 [189.203.103.235]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7cfdf0e9209sm6939218a34.8.2026.01.19.08.30.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jan 2026 08:30:22 -0800 (PST)
Date: Mon, 19 Jan 2026 10:30:20 -0600
From: Tom Rini <trini@konsulko.com>
To: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <20260119163020.GY3416603@bill-the-cat>
References: <20260116-add_bootph_all_for_ltdc-v1-1-de4dc0ae1115@foss.st.com>
 <20260116192837.GO3416603@bill-the-cat>
 <480a1eaa-c090-4293-bb1c-ebddc8a4d04a@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <480a1eaa-c090-4293-bb1c-ebddc8a4d04a@foss.st.com>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [Uboot-stm32] [PATCH] ARM: dts: stm32: Add bootph-all in ltdc
 node in stm32mp257f-ev1-u-boot
X-BeenThere: uboot-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <uboot-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/uboot-stm32/>
List-Post: <mailto:uboot-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============9124364170996170723=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============9124364170996170723==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="J40/4dXd9d/Vg1gU"
Content-Disposition: inline


--J40/4dXd9d/Vg1gU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 19, 2026 at 08:53:39AM +0100, Patrice CHOTARD wrote:
>=20
>=20
> On 1/16/26 20:28, Tom Rini wrote:
> > On Fri, Jan 16, 2026 at 08:12:06PM +0100, Patrice Chotard wrote:
> >=20
> >> Add bootph-all property in ltdc node in stm32mp257f-ev1-u-boot.dtsi
> >> to fix the following issue :
> >>
> >> Video device 'display-controller@48010000' cannot allocate frame buffer
> >> memory - ensure the device is set up beforen
> >> stm32_rifsc bus@42080000: display-controller@48010000 failed to bind on
> >> bus (-28)
> >> stm32_rifsc bus@42080000: Some child failed to bind (-28)
> >> initcall_run_r(): initcall initr_dm() failed
> >> ERROR ### Please RESET the board ###
> >>
> >> Fixes: 29ab19c2bead ("Subtree merge tag 'v6.18-dts' of dts repo [1] in=
to dts/upstream")
> >>
> >> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> >> ---
> >>  arch/arm/dts/stm32mp257f-ev1-u-boot.dtsi | 4 ++++
> >>  1 file changed, 4 insertions(+)
> >>
> >> diff --git a/arch/arm/dts/stm32mp257f-ev1-u-boot.dtsi b/arch/arm/dts/s=
tm32mp257f-ev1-u-boot.dtsi
> >> index b70cd8b52ce..c3c9c94f165 100644
> >> --- a/arch/arm/dts/stm32mp257f-ev1-u-boot.dtsi
> >> +++ b/arch/arm/dts/stm32mp257f-ev1-u-boot.dtsi
> >> @@ -52,6 +52,10 @@
> >>  	};
> >>  };
> >> =20
> >> +&ltdc {
> >> +	bootph-all;
> >> +};
> >> +
> >>  &usart2 {
> >>  	bootph-all;
> >>  };
> >>
> >=20
> > Are you upstreaming these? Thanks.
> >=20
> Hi Tom
>=20
> I didn't get your point. Is there a problem ?
> Yes of course i'm upstreaming this.

I see how I was unclear, sorry. Are you submitting these to the Linux
kernel so they can be removed from our tree? Those are valid for the
upstream dts itself.

--=20
Tom

--J40/4dXd9d/Vg1gU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTzzqh0PWDgGS+bTHor4qD1Cr/kCgUCaW5cGAAKCRAr4qD1Cr/k
CudpAP42i8bTghQnM4xcaNe8Vwovya2XMzn0BsEGrRxz7VJGnAD/aceTNKptJdkz
qYBtnnLioJX/QEc7xau5YnHerqY1hAo=
=6O+3
-----END PGP SIGNATURE-----

--J40/4dXd9d/Vg1gU--

--===============9124364170996170723==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============9124364170996170723==--
