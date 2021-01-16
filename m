Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B7C2F8DAE
	for <lists+uboot-stm32@lfdr.de>; Sat, 16 Jan 2021 17:24:36 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A9457C57190;
	Sat, 16 Jan 2021 16:24:36 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
 [209.85.222.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 92A21C5718F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 16 Jan 2021 16:24:35 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id c7so14842993qke.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 16 Jan 2021 08:24:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=LSNCTQACNbd2iSa0eiV0hJ72V7McLVPhUQr6XXP3aUU=;
 b=BPDaU2R/0po0YaEAp9JDiGyu51FZI88/cbqBlAIhOaHiBkp+/JdagHtokmzWerPLC6
 lNQsPcRqzQYyyHGyYBbfr5z7uMbYSDXb7Ys2VmYaweqhxxx3E+MsA0HMwBI4fcpHh1Cq
 wfC+6jpj7CVQ9Tc7wVQ9ZbeiG0MrtyEAtOPac=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=LSNCTQACNbd2iSa0eiV0hJ72V7McLVPhUQr6XXP3aUU=;
 b=tF5JKQc5W5Fd6KM1Bo7f72Wbz+7/YQEgU1ftYdoPfaKQFkFAHQHogKlLpQFvhpeeex
 5ej8iyVojJ9DL8ArkMjN7qpTGh3Aj7wsM36S1aDWUojzoUnWp3LxCcGrj09Zs0jFfBsW
 Mdp0NAv6aDopDIXr1Zl8tRr/SEyzAUPqy557aHH24V4tX0wAauu/9qLa0coJVSuKxWLs
 EbIHWcvx/9WGBeFZBqurQdt0Is9HKvBLQbS7dIoI49r3eWDNleqUZGoUU0Vy8sHMj97T
 vkBTp54kuJqCdIdYjrIOFiYqVCZz0hswrJMApbt9tOOQhvkKywH40oJs3A1Mnwfbmn2V
 rW7Q==
X-Gm-Message-State: AOAM532u/7UFlv8BuQCycmjC1yuUlYvkRuQGhHH7K2/mTe/r5Z03heC0
 VITiStvCgyxeW5G6BusxdyXFZA==
X-Google-Smtp-Source: ABdhPJwGybPPPVujZquJzLN24dfwBnuzwNrUSRiWH+KH4ngCilpVFag3M0H7/mE7pu+VEcP5Zhzjug==
X-Received: by 2002:a05:620a:1346:: with SMTP id
 c6mr17901336qkl.136.1610814274620; 
 Sat, 16 Jan 2021 08:24:34 -0800 (PST)
Received: from bill-the-cat
 (2603-6081-7b42-3f4c-bc5a-f8b8-3605-e048.res6.spectrum.com.
 [2603:6081:7b42:3f4c:bc5a:f8b8:3605:e048])
 by smtp.gmail.com with ESMTPSA id y17sm7223176qki.48.2021.01.16.08.24.33
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 16 Jan 2021 08:24:34 -0800 (PST)
Date: Sat, 16 Jan 2021 11:24:31 -0500
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Message-ID: <20210116162431.GP9782@bill-the-cat>
References: <20201218114646.9902-1-patrick.delaunay@foss.st.com>
 <20201218124642.v3.4.I810a6b37da2c8aa13ca2e20408a8d54b08e2ef32@changeid>
MIME-Version: 1.0
In-Reply-To: <20201218124642.v3.4.I810a6b37da2c8aa13ca2e20408a8d54b08e2ef32@changeid>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Bin Meng <bmeng.cn@gmail.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Simon Glass <sjg@chromium.org>, Patrick Delaunay <patrick.delaunay@st.com>,
 u-boot@lists.denx.de, U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Anatolij Gustschin <agust@denx.de>
Subject: Re: [Uboot-stm32] [PATCH v3 4/4] console: add console_has_tstc
 helper function for CONSOLE_MUX
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
Content-Type: multipart/mixed; boundary="===============0396983415703296090=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============0396983415703296090==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SlNsYPPA1sYaSN7W"
Content-Disposition: inline


--SlNsYPPA1sYaSN7W
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 18, 2020 at 12:46:46PM +0100, Patrick Delaunay wrote:

> From: Patrick Delaunay <patrick.delaunay@st.com>
>=20
> Add the helper function console_has_tstc() and replace the test
> #if CONFIG_IS_ENABLED(CONSOLE_MUX) to a simple 'if' test to
> respect the U-Boot coding rule.
>=20
> No functional change.
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Reviewed-by: Simon Glass <sjg@chromium.org>

Applied to u-boot/master, thanks!

--=20
Tom

--SlNsYPPA1sYaSN7W
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmADEz8ACgkQFHw5/5Y0
tyxVdwv+NIEJCFPuUU7biZEzgj/a+BoBr4WBShGYtIofI5Zgg1zH0PtrYE7LbV90
SWMKGPwFBkLbHWHmrBKCSXG1GmIQp/clxtgddk5UP8DHlx1zVtccuo/w2u2+N+C9
lLVta0h4SKiP7PWjPYgbYtD4pzObSctkmXXQTDMqm0wVRw82BOo0iLYLKgQsyr2v
w4DfGQiSXNpLaY5lHHBIvqiSGcoiGU+etdVCvE2UXuOnb2X60EX6ZjVdfdcS1PHo
N9Xqbuer8bmJwiFhYiRX+nZHyvaI2FghFHawDx0DXyrzjnPTUkCC88TQqtYd/DhZ
LapmLjeMkDTwaLIoaS7Qc7VG7PglFSM3bDv2/O+R00R2cDd1biqoft4dCnwcBl73
KmZYHdUOojp4yaTnehahFmhYcSOuY4AttdiCuI+BEPbd49BvnqxjvIYDqIbiAUTt
gAHDlwxcQWtJysZ1n03GgTQ9i+oOMt/6r8ILmGat5bUlTVZdrPXsb3CsUtCt9C1H
6wuUAn4X
=trKH
-----END PGP SIGNATURE-----

--SlNsYPPA1sYaSN7W--

--===============0396983415703296090==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============0396983415703296090==--
