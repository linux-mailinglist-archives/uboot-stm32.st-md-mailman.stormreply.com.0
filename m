Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AE3F11158C4
	for <lists+uboot-stm32@lfdr.de>; Fri,  6 Dec 2019 22:48:28 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7939BC36B0A
	for <lists+uboot-stm32@lfdr.de>; Fri,  6 Dec 2019 21:48:28 +0000 (UTC)
Received: from mail-yw1-f68.google.com (mail-yw1-f68.google.com
 [209.85.161.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AF0EBC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Dec 2019 21:48:26 +0000 (UTC)
Received: by mail-yw1-f68.google.com with SMTP id 192so3321513ywy.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 06 Dec 2019 13:48:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=VM1VXQM3wwP3R17oIlhblQe/XnS4dosrJ9UbbXK12tw=;
 b=UKecFVi8gX38d9azEXyeEFD+ELiDpsgEajU2mzQ7h9JzfAaNvQ0eTewPhCDmiwUVvM
 sQTi58ZuVwZLyiLTu8S+k5O9C89zS7BcghrIDBPlyd2fCs29eE85sbZSFct2TGrqvFwj
 QnbK4tXNXTT4d++rZAPmoVNwZg2OvrmICqiHk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=VM1VXQM3wwP3R17oIlhblQe/XnS4dosrJ9UbbXK12tw=;
 b=sxEb655NwLjTU/Xyp1Ke6bJwRnBD9t6Ugg/5S3ZlUb/nQWL8/anG7zAzo6EfMpTFqk
 3YuM9P+eRxpYzSoj7gA0oC8SlLanD+hIqGmn+i801sY5xh8KF+tMP2oAc3+UiVZJuMZv
 4eUWmtUX6nehetzrdPvWv/K595zpZjOzzmpGH8sZidNf970gJEzk3H68yfTQ9IgkX1TQ
 eOFvAZjeRJPBf7L0ZmgAVsQTrYD+VLGNSc/MlTsL3NzaDs+iN6l18btXq01XvPUT6tve
 4cViXR5Y9IbGXIWDQ/7itmlUm/zm+v/KhFeR8vvZWdjFHwOuHa3P9cxWccwqhQjmak27
 CH3g==
X-Gm-Message-State: APjAAAU1LlhFF4EmjTfdsvApeCzH5xCGLY8bFPgMNusveypqdScU3gqx
 5ujcD2o4RW/xWpLWn5/VyOrR6Q==
X-Google-Smtp-Source: APXvYqxhWz/rucIRLSqpTYIJ7STVnj+3nmOql6e7p5V2j7Tsu7Q7saOFRDRWPDBCPghS0ZcHeJQA6w==
X-Received: by 2002:a0d:e68d:: with SMTP id
 p135mr11555197ywe.225.1575668905511; 
 Fri, 06 Dec 2019 13:48:25 -0800 (PST)
Received: from bill-the-cat
 (2606-a000-1401-86dd-d558-5e40-3af2-2592.inf6.spectrum.com.
 [2606:a000:1401:86dd:d558:5e40:3af2:2592])
 by smtp.gmail.com with ESMTPSA id k23sm3544712ywa.69.2019.12.06.13.48.24
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 06 Dec 2019 13:48:24 -0800 (PST)
Date: Fri, 6 Dec 2019 16:48:22 -0500
From: Tom Rini <trini@konsulko.com>
To: Patrice Chotard <patrice.chotard@st.com>
Message-ID: <20191206214822.GY9549@bill-the-cat>
References: <20191125080741.2215-1-patrice.chotard@st.com>
 <20191125080741.2215-4-patrice.chotard@st.com>
MIME-Version: 1.0
In-Reply-To: <20191125080741.2215-4-patrice.chotard@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Marek Vasut <marex@denx.de>, Joe Hershberger <joe.hershberger@ni.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Eugeniu Rosca <roscaeugeniu@gmail.com>, u-boot@lists.denx.de,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Ruslan Trofymenko <ruslan.trofymenko@linaro.org>, Stefan Roese <sr@denx.de>,
 Chris Packham <judge.packham@gmail.com>
Subject: Re: [Uboot-stm32] [U-Boot] [PATCH v3 3/6] cmd: sysboot: Create a
 sysboot command dedicated file
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
Content-Type: multipart/mixed; boundary="===============5990312148418542787=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============5990312148418542787==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/iWRbSEcwh9lL8jf"
Content-Disposition: inline


--/iWRbSEcwh9lL8jf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 25, 2019 at 09:07:38AM +0100, Patrice Chotard wrote:

> Extract all sysboot command related code from pxe.c to new sysboot.c
> Update Kconfig to insure that DISTRO_DEFAULT select new CMD_SYSBOOT
> command.
>=20
> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>

Applied to u-boot/master, thanks!

--=20
Tom

--/iWRbSEcwh9lL8jf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE6HLbQJwaaH776GM2h/n2NdMddlIFAl3qzKYACgkQh/n2NdMd
dlI+0w/9GFxnYdTvtgB8zKTQycTLM5hWqR9JLs9FfmbMhPwr9iR1yR9mjigW2yCy
Nm5ga3Gu4oRIIXSKczixE1rVSu6S1ExMQusp5hnlov5naQ//33cEfxaeTavceEIl
6T/pkwAL9Qbx30yuJZJ6h0WjiVrX3TZyBd29pEJcPFd9Qd9FtRE42xDr6tELLutL
PS45f/c2qs7KQxABvzWsTriFS70Mlc87RuWZhM7Q5GEeWayeFKeiAlcTI9L/VJo0
ssH6B6hkJCwEMvhrfx56jeJUtVyVZGSDJCFZtSsYufpPMBpD0p5tZrPHRpKtFALe
Ut1IZ/LzjdIlZj0sWJGZ9sEkl3TyoJiSFb6v8itkgjDAGAnLsT44b9NorUy3BvMf
y8FuZCgSfPpkGbkBrF+dPIcj8KuW4rF6veOo951BoE3eeUaymCD9AK8MqMjFhlTm
LE2f+Jrsn9rneVpr6/uK8UKhxIeTpVXAurtc5+LjU/iPpLv32OwowKv8hB9f7n1E
zFYOG0gQclqCFPKnQN6CDiGXxsEnbMsIxnH0yFrU8jfnxI8gnfkEky2+J4l6+StM
uV0ycpalrEEFeySiYtanMmJ18ZqdYIcZZ+SYkclwzD3Rmaw5FaEmBa6oWLFgzsdo
7WzkHaMFngGA5q6wgRCuDQQUzWHJdE3ssYCPL9GuBm/4qMyTctE=
=g3mT
-----END PGP SIGNATURE-----

--/iWRbSEcwh9lL8jf--

--===============5990312148418542787==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============5990312148418542787==--
