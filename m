Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 73406216DE9
	for <lists+uboot-stm32@lfdr.de>; Tue,  7 Jul 2020 15:38:37 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DD550C36B29
	for <lists+uboot-stm32@lfdr.de>; Tue,  7 Jul 2020 13:38:36 +0000 (UTC)
Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com
 [209.85.219.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 59EB5C36B27
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Jul 2020 13:38:35 +0000 (UTC)
Received: by mail-qv1-f68.google.com with SMTP id u8so18799028qvj.12
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 07 Jul 2020 06:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=yakSAgmqxBXq7aYycoxfqL9zZb7Q1ZC/B8pcJ3qYqTs=;
 b=JOJ474TN+9kHy7s+4wi/EJvTImje/rQrMviE/L8n4bZxdnrMH5yF7tOjzyd6XQaki5
 wp/DcHyXSO1TFqD6Rm11Sq9ilnjrmNg+H/d34p3i/KUNib53mG9FIm7ALsduNx4rz1Na
 5qD9WHQpqjtqNXonI4o6jfZ4rKA855sqSAduo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=yakSAgmqxBXq7aYycoxfqL9zZb7Q1ZC/B8pcJ3qYqTs=;
 b=BXxTG/TnDC1p6UY6vB4N7zmxumilolRnyROU+TgN8wWK+mlthvBTzFICKqcHOPl47Z
 ystCrJptNH7enBIWV9ZPCosVK8KTEbwHRH4V0K43bt95fWLDOrlG81PjDldjkybST9kk
 CID7Jy4BHueZPWeE0KSG5Hev77ukkWISKQuWyEsXFPWb9Y7FCJqR5VJF+ZnX8+B9TTVT
 wt0v54rTYpVn/lqe+NTtrHZLuLS2gFDEEorlEWfK9sfL1oRqi5ucn5FtzxsA93l9qRwW
 d2Deq/KkJkhCIqGCR73HMIvh49qcqY8/+bc6k34rYyXFPSVADUWqdb05qSE8M3NY9xti
 zdGg==
X-Gm-Message-State: AOAM531bkAfcUGUon3rHdOEEVA4Wp3G4OcQdhkn2RYRRftKs70CIW1gv
 tziqe13GlXhdV/hz0f6yd4Bo3w==
X-Google-Smtp-Source: ABdhPJyckLfLlE7NHvtiJBcxzAvs7kuurXXF1bpemtvHe4d7piwx2bTprGF53aV/gKz5d90h1uGKyA==
X-Received: by 2002:a0c:a8e6:: with SMTP id h38mr46218993qvc.15.1594129114011; 
 Tue, 07 Jul 2020 06:38:34 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-8080-dd52-ab8a-1bf1-56f7.inf6.spectrum.com.
 [2606:a000:1401:8080:dd52:ab8a:1bf1:56f7])
 by smtp.gmail.com with ESMTPSA id x23sm15052031qki.6.2020.07.07.06.38.32
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 07 Jul 2020 06:38:33 -0700 (PDT)
Date: Tue, 7 Jul 2020 09:38:30 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20200707133830.GK1306@bill-the-cat>
References: <20200701125610.22340-1-patrick.delaunay@st.com>
MIME-Version: 1.0
In-Reply-To: <20200701125610.22340-1-patrick.delaunay@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: u-boot@lists.denx.de, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Simon Glass <sjg@chromium.org>, Patrice Chotard <patrice.chotard@st.com>,
 Yannick =?iso-8859-1?Q?Fertr=E9?= <yannick.fertre@st.com>,
 Joe Hershberger <joe.hershberger@ni.com>, Soeren Moch <smoch@web.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Anatolij Gustschin <agust@denx.de>
Subject: Re: [Uboot-stm32] [PATCH] video: restore CONFIG_VIDCONSOLE_AS_LCD
	as boolean
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
Content-Type: multipart/mixed; boundary="===============2408265194251634658=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============2408265194251634658==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="56hrQfoz910L17cR"
Content-Disposition: inline


--56hrQfoz910L17cR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 01, 2020 at 02:56:10PM +0200, Patrick Delaunay wrote:

> This patch restores CONFIG_VIDCONSOLE_AS_LCD as boolean
> and introduce a separate sting as CONFIG_VIDCONSOLE_AS_NAME
> to search this string in stdout used as videoconsole.
>=20
> This patch avoid issue with board defconfig or code expecting
> CONFIG_VIDCONSOLE_AS_LCD as boolean.
>=20
> Fixes: 22b897a12323 ("video: extend stdout video console work-around for =
'vga'")
> Reviewed-by: Simon Glass <sjg@chromium.org>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>

Applied to u-boot/master, thanks!

--=20
Tom

--56hrQfoz910L17cR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl8EetYACgkQFHw5/5Y0
tyylHgv/VXyPGhKu6uUcCUdrH+1vBAIDcZnXht/D/Kpzb6DwBxoZjR17qHo36Z+z
urk82FNBtKg4zYPsLfgcGN1++qvv43l26JZWv/uLg7IXY+wwr2C25dQNIZYNb0Mb
xed+zUVLJsKeC4u4aFBsZj+bLJMIN79AaQj3WyWxIBHasiMgZMyRhA1Z4q6wLD3A
WH+NI1BM9OYP6xKO6aK2jb6PGq0uoFDcfpTjanCd+rtwJMmaf+btrFtgK4w4HE9F
m0J+wHfcTkScyn3LE8Q0BwsANviapQMwwT4dgVXkU9con9mTbLCF7dpS+/dSrtLd
zlOjTMbddA7/XSUD+j2pSTYrSBtOnsz94dl3q4D4Fho6yCaIGFQJ+U3elOWSAf+2
nUEdE4dYZh9nc24Kt7EjD3QCDJebKK1yYEVoU7evT5bfdNhOYjbA+ODbzTftK95H
HGHdkF7ZsRvQAdR/6C68OBdgKbys/7OlTru2pYNa1c4i15p9S1SILMndrIN9JX2L
p78k2/vO
=dhU6
-----END PGP SIGNATURE-----

--56hrQfoz910L17cR--

--===============2408265194251634658==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============2408265194251634658==--
