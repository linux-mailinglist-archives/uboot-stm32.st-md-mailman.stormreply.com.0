Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B7598DF426
	for <lists+uboot-stm32@lfdr.de>; Mon, 21 Oct 2019 19:26:16 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 704B6C36B0A
	for <lists+uboot-stm32@lfdr.de>; Mon, 21 Oct 2019 17:26:16 +0000 (UTC)
Received: from mail-yb1-f195.google.com (mail-yb1-f195.google.com
 [209.85.219.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9AAEFC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Oct 2019 17:26:14 +0000 (UTC)
Received: by mail-yb1-f195.google.com with SMTP id m1so4275959ybm.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Oct 2019 10:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=lH6AdDy8i/ir0EOibKpRttICt/t71B502VhdV3FsF18=;
 b=RztbSp/phCE2aLjbMLbGBDmUB12PrwkhB02xnRrVkSkBVpYpSC75oLu9ozmRLbMmSO
 pdvIglnfF3Z5V+s3l7TygyL9xxBA5E2h9id24d0+F36PWtudNtDgJ98VitgnMINGGETa
 sjNi+oUsz3KYDSSuN7q1smrLki98EOQIETsMI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=lH6AdDy8i/ir0EOibKpRttICt/t71B502VhdV3FsF18=;
 b=QqmmBcsw4i6jAnh91sA1ue8T5FUXPZC/F99ASS2j+AfM47lC6Vbtk6LTBvezon1cXW
 3ODxCnoIp7ISL1zYu0cKN5VvIL4c1ly2njz5WdinHoxDYKFBXKwFZ0hRLt6e+mbnm5y6
 jm+fG9LKe93O9nOcYq6b2NP921Hzxv0QvKDx4j2ow6lPxuteK0sr9izIPHxT0CfZBP9Q
 szCHXFmbLeMz2S5ojEuYvuppFcqkp2riTL706pCe1gDw3DeVnBgi38TGV38JNgsLcOQz
 vsO+4ncnStirqtYIgAUOnOr39xXzQ0GiWZBRrp+3aPQjCXouG3ZeDd0Mvrs8Z/fMfErW
 3gJA==
X-Gm-Message-State: APjAAAXQm7eXoViQ14lZYw1lFk+qFzPJmNpLYEorxTLY6MKEUW+QdFO/
 EV7A9rvscGHmoA7Vq/ti66b2nA==
X-Google-Smtp-Source: APXvYqwk39M34vbfl8SfiSkZ9leJ6uNl56wA+xSkVhjtiS+wpy3709bCKJcq+fPY24El0AAr16D4Xw==
X-Received: by 2002:a25:cd88:: with SMTP id d130mr15008942ybf.65.1571678772779; 
 Mon, 21 Oct 2019 10:26:12 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-142-8.ec.res.rr.com. [65.184.142.8])
 by smtp.gmail.com with ESMTPSA id s24sm341252ywa.92.2019.10.21.10.26.11
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 21 Oct 2019 10:26:11 -0700 (PDT)
Date: Mon, 21 Oct 2019 13:26:09 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20191021172609.GQ11173@bill-the-cat>
References: <20191021130754.32466-1-patrick.delaunay@st.com>
MIME-Version: 1.0
In-Reply-To: <20191021130754.32466-1-patrick.delaunay@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Ryder Lee <ryder.lee@mediatek.com>, u-boot@lists.denx.de,
 David Wu <david.wu@rock-chips.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Chris Packham <judge.packham@gmail.com>,
 Christoph Muellner <christoph.muellner@theobroma-systems.com>
Subject: Re: [Uboot-stm32] [U-Boot] [PATCH] pinctrl: Kconfig: remove
	duplicated nodes
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
Content-Type: multipart/mixed; boundary="===============8510700630011188446=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============8510700630011188446==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4dIe/AmYstFUGHTF"
Content-Disposition: inline


--4dIe/AmYstFUGHTF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 21, 2019 at 03:07:54PM +0200, Patrick Delaunay wrote:

> Remove the duplicated configs introduced when the same patch is
> applied twice times:
> - commit e878b53a79d1 ("dm: pinctrl: introduce PINCONF_RECURSIVE
>   option")
> - commit c20851b3d850 ("dm: pinctrl: introduce PINCONF_RECURSIVE
>   option")
>=20
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>

Applied to u-boot/master, thanks!

--=20
Tom

--4dIe/AmYstFUGHTF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE6HLbQJwaaH776GM2h/n2NdMddlIFAl2t6i4ACgkQh/n2NdMd
dlLQzg//TbUW3kJIVeVQg2TQdnNBndlSMA+FhbhP6OyT+rNQ6zy+aJ9DG7ifZ7sp
/vrL7sldfcjbVwAFh1TMpCZ34qW8Icc4VmnxtmgGDtD2oaBeUyEtXGRnhB2QSOmd
luKZvc3teCV13dYG4y0U8NSEm1VjTLs7SeX5A3czmKfLNuPBItQEiGpJ8rDvbV3s
nlbm5peSvFg+rqa/LiE66o1JGFVaUgz1oYwcO5ZDHP3i3dpVesKLCKIpAH55oEt1
zHfdb19FcoLF2wIibZDDaGAHQDbIulhpfyQRMRslORwH2yc4BUTNGbxp/WY9RQgN
hb/679kE9jIyRE2D7b/YZr15aRRnl3RwdiUGuluvbaTH9QR9Ooq9k6RTor91bc5V
ddVWilSzl5A/EHyVX65+4SwGEoe2SWaBadK1y+nL8FzXaOZC3piYc79qn7L6pV1H
chdNpt/q+3zXCMGkrB6oOSC7Fxekg1I1Yn0exomBo2seqHj3mtFE5GHVJIVBPLtD
v8MPdAS9d3+Lhbuz1jokuXjm5hFfcIsjIxlVZMPFus2hXRCWzmsK9CHb8I7vjsFD
o4aHw++SD4766s4iPKkv6TTDEjRiK9BJFlj7NCKpAFeHQrLK4FJInBFZZqXtt8ZN
p0ge+MK5hob3MkCcy5Q5EL0ykY0bumD34HuAveamDLGI6w/9AoU=
=iZSG
-----END PGP SIGNATURE-----

--4dIe/AmYstFUGHTF--

--===============8510700630011188446==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============8510700630011188446==--
