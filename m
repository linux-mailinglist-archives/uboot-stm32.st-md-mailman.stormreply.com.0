Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3A42967EB
	for <lists+uboot-stm32@lfdr.de>; Fri, 23 Oct 2020 02:27:49 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 62F86C3FAD5;
	Fri, 23 Oct 2020 00:27:49 +0000 (UTC)
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
 [209.85.160.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A2F72C36B37
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Oct 2020 00:27:47 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id p88so2805338qtd.12
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Oct 2020 17:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=98Jgf0KGSSF+B2gX/kiyvtIeRkMR4rS1Lwi4PkAL41M=;
 b=sDyWzLA/cksPd8cHrW7ZSDlkHxq09rbzt7lkU3K2WVEKkXNDSaCbkxah4wWaTB7VIx
 zB9wp+KMF2Y2CYhMpwqdttVZcIu4qQh6+FW5gaSVnuUcbg271kaO2ZYoTVksaTMUxfEW
 QAc73aRPndt8J27N1l/gl6wksamYgr0bHoDI4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=98Jgf0KGSSF+B2gX/kiyvtIeRkMR4rS1Lwi4PkAL41M=;
 b=fhblUjwpnxyQLq7xyuoct6DndjM5Mocj/fO6CoTSAlHiQIv46AwvkD6yiUdLtsTTap
 aVHcbXEwxOH+hLibpZmXiFl75Gjg6Xm1UqqvIWtDWtBQ1aYfYD7vXD7bzfBO4/R35DrF
 cR4oG7UK4TwUkddqUmYgoMrdPS/W31YUj1ZgSaf/4JGh3yVmY2oIELTeMMdiKDMGMDgA
 U+eA9cjj/8vwUqk2TGxr0RZQ7o/tLhlXhuNLLLAms5+v88KLME7iWlWw8PWe90HjZkSx
 nuMmDLySlFnAxdcQtAqYdnU1GneQ9CWOHteqQPwwZUK6C9Z9fk1xfuERO34bIXNolZv3
 0GwA==
X-Gm-Message-State: AOAM533CovQjBRPgZMMKG1/jhOghK7r6o+1FJ+dxsT5t1SJaEFiIpE0l
 KBXkAtsG/IiSy9PhBy4lkAHEIQ==
X-Google-Smtp-Source: ABdhPJwWmzWbSUcSqhxRmqwiRlnUtISqcTB18ryg0ExNBG63qr15PR503yPSZQPxoiKrD8/dRpXNaw==
X-Received: by 2002:ac8:74ca:: with SMTP id j10mr4623260qtr.253.1603412866332; 
 Thu, 22 Oct 2020 17:27:46 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-8ebe-545f-9691-be58-8292.inf6.spectrum.com.
 [2606:a000:1401:8ebe:545f:9691:be58:8292])
 by smtp.gmail.com with ESMTPSA id n57sm2331848qtf.52.2020.10.22.17.27.38
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 22 Oct 2020 17:27:39 -0700 (PDT)
Date: Thu, 22 Oct 2020 20:27:36 -0400
From: Tom Rini <trini@konsulko.com>
To: Heinrich Schuchardt <xypron.glpk@gmx.de>
Message-ID: <20201023002736.GA14816@bill-the-cat>
References: <20201007161148.59389-1-xypron.glpk@gmx.de>
MIME-Version: 1.0
In-Reply-To: <20201007161148.59389-1-xypron.glpk@gmx.de>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Anatolij Gustschin <agust@denx.de>,
 Daniel Schwierzeck <daniel.schwierzeck@gmail.com>,
 Lokesh Vutla <lokeshvutla@ti.com>, Weijie Gao <weijie.gao@mediatek.com>,
 Simon Glass <sjg@chromium.org>, Sean Anderson <seanga2@gmail.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Cristian Ciocaltea <cristian.ciocaltea@gmail.com>, u-boot@lists.denx.de,
 Alexander Graf <agraf@csgraf.de>,
 Thirupathaiah Annapureddy <thiruan@linux.microsoft.com>,
 Ovidiu Panait <ovidiu.panait@windriver.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Bin Meng <bmeng.cn@gmail.com>,
 Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
 Andreas Dannenberg <dannenberg@ti.com>
Subject: Re: [Uboot-stm32] [PATCH 1/1] common: rename getc() to getchar()
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
Content-Type: multipart/mixed; boundary="===============3727544936457063610=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============3727544936457063610==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+PIqGITk9NA83ikA"
Content-Disposition: inline


--+PIqGITk9NA83ikA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 07, 2020 at 06:11:48PM +0200, Heinrich Schuchardt wrote:

> The sandbox is built with the SDL2 library with invokes the X11 library
> which in turn calls getc(). But getc() in glibc is defined as
>=20
>     int getc(FILE *)
>=20
> This does not match our definition.
>=20
>     int getc(void)
>=20
> The sandbox crashes when called with parameter -l.
>=20
> Rename our library symbol getc() to getchar().
>=20
> Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
> Reviewed-by: Tom Rini <trini@konsulko.com>
> Reviewed-by: Simon Glass <sjg@chromium.org>

Applied to u-boot/master, thanks!

--=20
Tom

--+PIqGITk9NA83ikA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl+SI3gACgkQFHw5/5Y0
tyySgwwAqhW8VNHPnuO8aEmvNXYOPRpriXwW/Fu1ibDLHFsPFGJXcD8Kta1rl9lL
3X6MIQwL0bmF1R8oTlltZGKMjTBdUxelf7KHrxAznl9hEU5MdPjZYNyYYHyS35GO
LuJ/YfZPIfDQeGnauEt1ZWPL61g97RRucbbY8nwepYcLgzaUQrFKFGA+Sn2JG4js
zz3u5ha5xEZziGm7ZIfkt8njY1E/tleu+h5WHaefGUZp0dGFRTwW8OM5YRlyDSW7
1cWnjMvhCmjCr198Pd1tK0Egjhb2v6uji86uIB/xCSJmfj2pUAvXPn68WBqzFRHQ
DaTjxCAhqwdGXLRQFHdh0ERzOmOlgB5A29lv+umd5eeQo4FG1P3DdxBiw/Nu/bxI
Tzk3wdXcubNM83xzDWeq23PzvQCVtp/YPj7qVLp4sotiYZaMDUT5+G07WJZsRQsp
qcHaDzXJppJ3B1n8fdj+P0UEbgXNBnS6Gow0wDhZgE0R+UdL8Geqg62rTUvVMGGV
qfe++vYU
=2jBG
-----END PGP SIGNATURE-----

--+PIqGITk9NA83ikA--

--===============3727544936457063610==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============3727544936457063610==--
