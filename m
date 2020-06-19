Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BE33E200CA4
	for <lists+uboot-stm32@lfdr.de>; Fri, 19 Jun 2020 16:51:52 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 870E5C36B0C
	for <lists+uboot-stm32@lfdr.de>; Fri, 19 Jun 2020 14:51:52 +0000 (UTC)
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
 [209.85.222.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F3CBEC36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Jun 2020 14:51:51 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id k18so23225qke.4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Jun 2020 07:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=lxEobvWJ4Oq2BobGUcfFTxLE1nNKfm6Oe9rW0rLR3aI=;
 b=sAwDbatL06ExuOKiM4Gr+6evHlw6mhemY9cC+p1I0ZGtdpXLg5NxUTIgRCIRYEme+/
 tfe7/8sWzBlbhid9aGltJvmxD6WhVhiwUQ7sPOt2PkUuDseIx5iDxc73xmj50AucG+vL
 cxtgN/Qwz6W9hf0VfgwmI3C1YguCYCs3PtuXQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=lxEobvWJ4Oq2BobGUcfFTxLE1nNKfm6Oe9rW0rLR3aI=;
 b=hUI7aZimFs7Wlm3CYQMnujG9bnmkrGHnblP/usJ0NPe96dIB1qJHbV1CEseNZNIyFN
 qKSchNaMOeofV/2zt2UQU+Aj+mbDWVnC5N28pfy9M5bWv2osxx/TZzERVYxOEbVzVmp7
 j1HnXX98qh8igAdqYufRLcp66rUuOIvy+prlXh1DVX9XVfz3BgiSDNKak8KrNcQZUtVE
 N/6X42lOGsTy48D+J9Jsbv/MAxMMzTLIfpvLczCFTTLjxzMiTYYDhc1l8CP0gidMPuP7
 v86rjfcgtJdGz8/LAFc6i0p9cYtC7CABppihADrI/PAfJR9vNcsARdY8f83OwMyfew8c
 8o6A==
X-Gm-Message-State: AOAM533eldd1n9LiRqtRuca5fhuTlgKM+ITcpOr4zlPyZ74K6H3ng3b/
 msS6EEjy6AOemu5lmCqPJ5Asqg==
X-Google-Smtp-Source: ABdhPJycVwBnyGIMm3I871erfmmWuEGHF0GEr1tlauxADGXvxXYFPx2Wp5rHx6FRtFfcDtk7m5FKcA==
X-Received: by 2002:a37:90c:: with SMTP id 12mr3701872qkj.96.1592578310845;
 Fri, 19 Jun 2020 07:51:50 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-8080-8c25-1271-b281-e614.inf6.spectrum.com.
 [2606:a000:1401:8080:8c25:1271:b281:e614])
 by smtp.gmail.com with ESMTPSA id k17sm7146010qtb.5.2020.06.19.07.51.49
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 19 Jun 2020 07:51:50 -0700 (PDT)
Date: Fri, 19 Jun 2020 10:51:47 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20200619145147.GL27801@bill-the-cat>
References: <20200619120337.17042-1-patrick.delaunay@st.com>
 <20200619120337.17042-3-patrick.delaunay@st.com>
MIME-Version: 1.0
In-Reply-To: <20200619120337.17042-3-patrick.delaunay@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 Leo Ruan <tingquan.ruan@cn.bosch.com>, Wolfgang Denk <wd@denx.de>,
 u-boot@lists.denx.de, AKASHI Takahiro <takahiro.akashi@linaro.org>,
 Simon Glass <sjg@chromium.org>, Frank Wunderlich <frank-w@public-files.de>,
 Joe Hershberger <joe.hershberger@ni.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [RESEND PATCH v5 2/4] cmd: env: check real
 location for env info command
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
Content-Type: multipart/mixed; boundary="===============0260694971482722939=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============0260694971482722939==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EecmvZxDifkbrwfl"
Content-Disposition: inline


--EecmvZxDifkbrwfl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 19, 2020 at 02:03:35PM +0200, Patrick Delaunay wrote:

> Check the current ENV location, dynamically provided by the weak
> function env_get_location to be sure that the environment can be
> persistent.
>=20
> The compilation flag ENV_IS_IN_DEVICE is not enough when the board
> dynamically select the available storage location (according boot
> device for example).
>=20
> This patch solves issue for stm32mp1 platform, when the boot device
> is USB.
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> Reviewed-by: Simon Glass <sjg@chromium.org>

Reviewed-by: Tom Rini <trini@konsulko.com>

--=20
Tom

--EecmvZxDifkbrwfl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl7s0QMACgkQFHw5/5Y0
tyzXjAv+MRa4lRZ5ZoZTJWpojk6APpYYYXTVmbH70M4pvLzwLVoU38R6y33IBjnc
+tVsA5fsWaf9w97uFLp5cIpFk6U0+cXp+luEMmylq7wa5x+uV+wlWoe4pRKAGLsW
KQhLjUdObkEGrNEUNdCs/iShvC/Gc5m22WxqrJqMuBG3+A56iQHGNLl7qSX/564N
1fs5g5SqyUrRupR9GYBN4bLPZSDMMNiw+vzf8qDWWa0TOL7cJFZeaMPAR8ZC7Wsq
+HsaFFqQUJ4jA3feRGD4csWL2vjsRGb9M7BxXTcgvPOzddXWIu6fTZHQZI2eJ4ZO
OC0NJesUlnXVZ2ug3SEbf4x+9S5MgKLDTaYw9wP24pqKPHTQeoVya+G03co0adM6
EQSmUByHry9F5Wr57xtryEQFA73UF6b4ZUJFneqFop1G/EYvlIGwYq2Q/3KDMbz/
qLXHSZvLepgs4XpYqEb9OaGCqqx1WYVLhK960id8EAYB9c6GC80bjcSFDmdZO25q
OxiNu7eN
=wcMt
-----END PGP SIGNATURE-----

--EecmvZxDifkbrwfl--

--===============0260694971482722939==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============0260694971482722939==--
