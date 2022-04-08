Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C834F9C32
	for <lists+uboot-stm32@lfdr.de>; Fri,  8 Apr 2022 20:03:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0B537C628A2;
	Fri,  8 Apr 2022 18:03:19 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com
 [209.85.219.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A7C15C60479
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Apr 2022 18:03:17 +0000 (UTC)
Received: by mail-qv1-f41.google.com with SMTP id e22so8070196qvf.9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 08 Apr 2022 11:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=oF7M+NElyIDGLDXGpHl9zdeGSF9KR8BjuT94tC88kzw=;
 b=fY8+vVc9DfgbS5xY5rGZ6SasAB8LURwziLUf28d1/gCcotjquc1inP8skwFbTuGoxu
 PJDSfJdNgVmYSxSUawHESexT213DBrtwcaaKgj6P+q41qu23v+lCXteemJHPrXiGga7a
 zBycLKcz9PHhEazP2UbrTiKGUEKBy7jSLxwWc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=oF7M+NElyIDGLDXGpHl9zdeGSF9KR8BjuT94tC88kzw=;
 b=KSl/OloB80CGLuGzHTeENV4NAQkmzex82xRA7QwdPcHpmyGohrKKF9FN06VG+N/j+l
 WwWUnKqRoCtdD/6SJr9PNJ0DqL/bPwDX1Sty5hIBIRLey5xORsBFYTmmVWyTrjW5ON0v
 ckBVquq3tJq7kMkPBfDx1T9rCyDTLeP8Ou8Zc7HyS3/k8DsufyLvXD6ZtKaPO1HK6XyU
 78bMkJCfbeCU/A4SSivMLlyULGXPgZ7ku7mhgyYJt9fg5fGBjE1C8wyVsVWuY1Sv829M
 ij0waI9X76bdxA3mkxi4Wt5pc6+ERRSPiHQhLmYrjtaDP1ws2htATxPuEXhnH3aWnGdD
 ymRw==
X-Gm-Message-State: AOAM531A8MRSIzHK/Fdz269Oa3C3QFIZdqMswayMGoah6z1IQXS6yvTV
 mvuKa1hAC7oUHAgvkTFU2r66kg==
X-Google-Smtp-Source: ABdhPJzrg1V8DPXytEwL8CCJX+gGBZbR74gMixnxg5ylhQTMc9dHuwVP7m+Slhc9U73yfGeIJ1jSvA==
X-Received: by 2002:a05:6214:2528:b0:441:402c:178d with SMTP id
 gg8-20020a056214252800b00441402c178dmr17427541qvb.59.1649440996600; 
 Fri, 08 Apr 2022 11:03:16 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b01-cbda-2ef0-5dff-fedb-a8ba.res6.spectrum.com.
 [2603:6081:7b01:cbda:2ef0:5dff:fedb:a8ba])
 by smtp.gmail.com with ESMTPSA id
 h6-20020ac85e06000000b002e1e8a98abbsm18997721qtx.41.2022.04.08.11.03.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 11:03:15 -0700 (PDT)
Date: Fri, 8 Apr 2022 14:03:13 -0400
From: Tom Rini <trini@konsulko.com>
To: u-boot@lists.denx.de
Message-ID: <20220408180313.GL14282@bill-the-cat>
References: <20220330220735.908616-1-trini@konsulko.com>
 <20220330220735.908616-9-trini@konsulko.com>
MIME-Version: 1.0
In-Reply-To: <20220330220735.908616-9-trini@konsulko.com>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Kamil Lulko <kamil.lulko@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH 09/25] stm32f429-discovery: Migrate
 CONFIG_*_LED out of CONFIG namespace
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
Content-Type: multipart/mixed; boundary="===============3943561200497560875=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============3943561200497560875==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="J2dKNoLeXnWu5vox"
Content-Disposition: inline


--J2dKNoLeXnWu5vox
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 30, 2022 at 06:07:19PM -0400, Tom Rini wrote:

> These values are only used in one file, reference them more directly.
>=20
> Cc: Kamil Lulko <kamil.lulko@gmail.com>
> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: uboot-stm32@st-md-mailman.stormreply.com
> Signed-off-by: Tom Rini <trini@konsulko.com>
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Applied to u-boot/master, thanks!

--=20
Tom

--J2dKNoLeXnWu5vox
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmJQeOEACgkQFHw5/5Y0
tywnxgwAjki5+LrsyDRzrR4/6Q2KkoQ9O8YNKvv7V0MeZaydSuXqswP/iQ4/UQ3l
2Jgvr+MVDFZckV9UM/tERumSFcha54tiEKJkEv2e6gvPtlx9kM4SOjbTGXpp+uM/
v1L0yC6Tcegwv7GC2AI4PQKy9WVgKBJzUIQAInfRcUFxG/3L09oEFeOCiseWwBhS
l4l2stntCYt76Xrd0bNKq5JRs3ZKrwLzLcKrbn7b0BQrNpsYYXPZ7C0I52lm4VVJ
0SzZniMmxEK/D5YOJMafmFKWsHI9dRdhdFNAzCa+0tkCgKto/FSzzbNlquX93pnP
TUyuoGJuLCuaGPWYqdKj1Dc2sbdZmCSYs6lWXjVFRqWXsYPaGjoled7Xrde8ewES
kyGKruo11zlf1ChP+aEcSmOz+0BV0m2tQnMA/e7rucmOYwnTbiOYxQN3iKxr0tMI
FHxD6/OAyTwroUCsXU6eusE4sipS34HkgxSS48xVmdU78grPrWifqKoZaKcyDugq
W07Ay4hH
=F0qO
-----END PGP SIGNATURE-----

--J2dKNoLeXnWu5vox--

--===============3943561200497560875==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============3943561200497560875==--
