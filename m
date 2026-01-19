Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E77D3B10C
	for <lists+uboot-stm32@lfdr.de>; Mon, 19 Jan 2026 17:31:04 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 923FEC36B3C;
	Mon, 19 Jan 2026 16:31:04 +0000 (UTC)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com
 [209.85.167.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 04904C36B2A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Jan 2026 16:31:03 +0000 (UTC)
Received: by mail-oi1-f172.google.com with SMTP id
 5614622812f47-45c7c841904so2599943b6e.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Jan 2026 08:31:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=konsulko.com; s=google; t=1768840262; x=1769445062;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=MSsq6ZXdXwZ+OyRTp3Kvb9YQCj919Pvajln/SPZIPc4=;
 b=VMdjet1BGSdFu1pXWkMK3+MLZhBQSgr3Jdj/8h7H2GgDoPeGNRittF/pa6OXZeyXZn
 HPJcAUk1EegD6sK6iBYYwEigGFexWBRUUtTWv43NTo7XoEWetpGcRrnHxBjRltdIbdvo
 3XDXxNh7/ffgshglgeCu+sozZs1XTZn7Gf8pY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768840262; x=1769445062;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MSsq6ZXdXwZ+OyRTp3Kvb9YQCj919Pvajln/SPZIPc4=;
 b=ON+sdIca2fvurrJlyhKhLIUpAhddGCayogXu2PH1nqeNdD4axTyRvSDIEBI8WbLsls
 D79g8eitHt4gLuRZhHSFU6d/7j7RCCGfENaucY8gcqUDeh/1ahCtLeLx0iL8PwEv8VpO
 BWJYupNjrocHA5w0pFwNhNwk29p4Qo3+ITNlAS1HBUEHQodJZbLMlspoqnOf06+n9AB6
 07pFKRoeUvt8wuoOSf3MrDYKA9cXmHrl6Oo4qxTiYcHdJpkR5GoHUn/TPV/c3P+H4UFu
 EE9j4BlMJVuooQ32RwcI2//5wN7svM8aOBDxNdDdjhKDGc3CtMhhxQ2cijp42gy41dQx
 LlFw==
X-Gm-Message-State: AOJu0Yz8SE7Hys68Rj8kEQsbGtg1+f07LwWm+dX6nP+9i0b1r0adsxjH
 yLw/FQpZj4ldm1vPoiC86MCthxozv2Osn+fYAVscpormbaN4zc3PbO+1jwB3osfpHhM=
X-Gm-Gg: AY/fxX6iydL74uoRP6s0fumGMCkO6+Z5E3bSx+AFfyAZVAiWuuvUeUionAYu02D22JR
 xzPiP63sPP9snN53aaF6aqFFN/oAve8pEOQAOogqrI58+Lp1q1xvSVwIvWFdZxFl728No19H/qO
 MjBgEn4lhPtHf6YnQMbcudBuzw3IXpvGS1I+v9HJ8hzcSeDWCWC8wKzNhrf1uE/wJQF2GCPha8d
 R5FbPUKHq7MD+9lpLIjKVqwnGh42ZUOSt1+DAvBzjCj1T3KFX8ef/uPUcOdpMAnoMID3X8wuNS+
 UxYZWrr8LAQ1DzR/s8slNEfvpgHNuTfsv2ZaMqk9r8QXyq31pzGVDnLRZKf9YDHdt4qz2QS8nqe
 zAaOhYpKbVm1nE3Vx3D5dTBo/kBkMcauWXiCxITfk4loJcC5kdFnB3h6D0WbT4EIHLUxcgTx2G3
 ieprtu+q32F3O1JUTp+QqoGcWgijZEy98OJKvm19UJSwRkY4NND9yqRpTcjht7eLRYvnQVnr3Sk
 KHlnwWxW+XEVFq1rljIWd3khXdBEAN3DtrUshk=
X-Received: by 2002:a05:6808:148a:b0:44f:8c46:a2c2 with SMTP id
 5614622812f47-45c9d8f8c87mr4939043b6e.57.1768840261682; 
 Mon, 19 Jan 2026 08:31:01 -0800 (PST)
Received: from bill-the-cat (fixed-189-203-103-235.totalplay.net.
 [189.203.103.235]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-45c9e03e817sm5701466b6e.16.2026.01.19.08.31.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jan 2026 08:31:01 -0800 (PST)
Date: Mon, 19 Jan 2026 10:30:59 -0600
From: Tom Rini <trini@konsulko.com>
To: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <20260119163059.GZ3416603@bill-the-cat>
References: <20260116-add_bootph_all_for_ltdc-v1-1-de4dc0ae1115@foss.st.com>
 <20260116192837.GO3416603@bill-the-cat>
 <480a1eaa-c090-4293-bb1c-ebddc8a4d04a@foss.st.com>
 <a64676b0-c67c-4fa8-a399-905fc04a471e@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <a64676b0-c67c-4fa8-a399-905fc04a471e@foss.st.com>
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
Content-Type: multipart/mixed; boundary="===============5576449264162410576=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============5576449264162410576==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bgP9V3DKxHQcpZAw"
Content-Disposition: inline


--bgP9V3DKxHQcpZAw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 19, 2026 at 02:07:03PM +0100, Patrice CHOTARD wrote:
>=20
>=20
> On 1/19/26 08:53, Patrice CHOTARD wrote:
> >=20
> >=20
> > On 1/16/26 20:28, Tom Rini wrote:
> >> On Fri, Jan 16, 2026 at 08:12:06PM +0100, Patrice Chotard wrote:
> >>
> >>> Add bootph-all property in ltdc node in stm32mp257f-ev1-u-boot.dtsi
> >>> to fix the following issue :
> >>>
> >>> Video device 'display-controller@48010000' cannot allocate frame buff=
er
> >>> memory - ensure the device is set up beforen
> >>> stm32_rifsc bus@42080000: display-controller@48010000 failed to bind =
on
> >>> bus (-28)
> >>> stm32_rifsc bus@42080000: Some child failed to bind (-28)
> >>> initcall_run_r(): initcall initr_dm() failed
> >>> ERROR ### Please RESET the board ###
> >>>
> >>> Fixes: 29ab19c2bead ("Subtree merge tag 'v6.18-dts' of dts repo [1] i=
nto dts/upstream")
> >>>
> >>> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> >>> ---
> >>>  arch/arm/dts/stm32mp257f-ev1-u-boot.dtsi | 4 ++++
> >>>  1 file changed, 4 insertions(+)
> >>>
> >>> diff --git a/arch/arm/dts/stm32mp257f-ev1-u-boot.dtsi b/arch/arm/dts/=
stm32mp257f-ev1-u-boot.dtsi
> >>> index b70cd8b52ce..c3c9c94f165 100644
> >>> --- a/arch/arm/dts/stm32mp257f-ev1-u-boot.dtsi
> >>> +++ b/arch/arm/dts/stm32mp257f-ev1-u-boot.dtsi
> >>> @@ -52,6 +52,10 @@
> >>>  	};
> >>>  };
> >>> =20
> >>> +&ltdc {
> >>> +	bootph-all;
> >>> +};
> >>> +
> >>>  &usart2 {
> >>>  	bootph-all;
> >>>  };
> >>>
> >>
> >> Are you upstreaming these? Thanks.
> >>
> > Hi Tom
> >=20
> > I didn't get your point. Is there a problem ?
> > Yes of course i'm upstreaming this.
>=20
> I think i understood your remark, currently without this patch the board =
stm32mp257f-ev1 can't boot.
> I temporarily added the bootph-all in stm32mp257f-ev1-u-boot.dtsi to allo=
w this board to reach at least
> the U-Boot console.
>=20
> In kernel side, i submitted a series which add u-boot bootph-all property=
 for STM32 boards which is not already merged [1].
> When this kernel series will be merged and U-Boot will be synchonized wit=
h this kernel DT, i will then revert this patch.
>=20
> [1] https://lore.kernel.org/linux-arm-kernel/20260109-upstream_uboot_prop=
erties-v4-0-75e06657c600@foss.st.com/

Ah, yes, that was my question, thanks!

--=20
Tom

--bgP9V3DKxHQcpZAw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTzzqh0PWDgGS+bTHor4qD1Cr/kCgUCaW5cQgAKCRAr4qD1Cr/k
CtuKAP9v/p4OfKRKuxVsnZqjeYaI8umvME94codQE1EsFAakGwEA8zeXiVXsIXL+
vNWQHJ8JCX5iGnoFDSjgT+fdpQi+mAo=
=rXon
-----END PGP SIGNATURE-----

--bgP9V3DKxHQcpZAw--

--===============5576449264162410576==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============5576449264162410576==--
