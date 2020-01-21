Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 689CA143525
	for <lists+uboot-stm32@lfdr.de>; Tue, 21 Jan 2020 02:27:25 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0A6A9C36B0B
	for <lists+uboot-stm32@lfdr.de>; Tue, 21 Jan 2020 01:27:25 +0000 (UTC)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com
 [209.85.219.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 52B11C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Jan 2020 01:27:24 +0000 (UTC)
Received: by mail-yb1-f182.google.com with SMTP id z15so638703ybm.8
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Jan 2020 17:27:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=zCNb7riCwUk2gI4YkHSuvYAvOeJTLDCJR11E0pLQ5rM=;
 b=Le6YUTPGCOEd1hU1nCfAhSVN1wDfN5m+whbBz7ovrNOagaf4PquapVE1t5t6YPZhVV
 mmua635dSCpkCFWDfJjpLOVFisUuXreEn5XdsuMO+cIhkndFer+YHf+hzo2cBbfjYdMh
 Qk1rpTVebHYSuXvMCMo4EGVKvtiIY9or1rj2s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=zCNb7riCwUk2gI4YkHSuvYAvOeJTLDCJR11E0pLQ5rM=;
 b=UnIvyVZRdnYUCh1rzJfWGR6Y4VIkvi3dCHJF9s2dPzBBTwDsz4i1/5wEBYQBQ8iruI
 sUmNZ3bzZNx9mcBDTp+CWD4T8h0QlROaCDHmjDRoK8lfAYvpiI8XWLCnHa+t1PLWemD0
 KCbDYzKZhVR7RXDV9vImbApwJimtRswM/xgmwyvkLqfcFmOmFQJz6Xf2+4MZxxgoD+cp
 yhdNhHOWw+HHmpH0tC39AzjZUEyRM62ezkrgaw+j8YEiStp/ZIhObtAM65V/lL9E8EFt
 W3KAF+QCs4AV135RApfbWvzAmbnQ/VcQgRfOjpzul29EiE4QgXse1ohmhlvaH+tNmiJz
 jcFQ==
X-Gm-Message-State: APjAAAXTuOdc0vN25fVjeGwnFU5W/zqYErd+eZGmjH4B5hBBKY39zkce
 M1BozjU6Q1asHXTT3gCa4Ubf4Q==
X-Google-Smtp-Source: APXvYqyCHZytcM6VgsvGTmSoq8zZ7ESZGwclflHaRUE5KUsL4d0x9JNKvdakKckBNk8cADQjI5BBsA==
X-Received: by 2002:a05:6902:52d:: with SMTP id
 y13mr1713546ybs.433.1579570042941; 
 Mon, 20 Jan 2020 17:27:22 -0800 (PST)
Received: from bill-the-cat
 (2606-a000-1401-86dd-b96e-413f-6954-8a35.inf6.spectrum.com.
 [2606:a000:1401:86dd:b96e:413f:6954:8a35])
 by smtp.gmail.com with ESMTPSA id d10sm16504681ywd.107.2020.01.20.17.27.20
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 20 Jan 2020 17:27:21 -0800 (PST)
Date: Mon, 20 Jan 2020 20:27:18 -0500
From: Tom Rini <trini@konsulko.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>
Message-ID: <20200121012718.GO8732@bill-the-cat>
References: <2ee6127028ec4e94b070befc6240354e@SFHDAG6NODE3.st.com>
 <bcd0648cb68e483595473d78b3ff7ce7@SFHDAG6NODE3.st.com>
MIME-Version: 1.0
In-Reply-To: <bcd0648cb68e483595473d78b3ff7ce7@SFHDAG6NODE3.st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 Patrice CHOTARD <patrice.chotard@st.com>
Subject: Re: [Uboot-stm32] [PULL] Pull request: u-boot-stm32
	u-boot-stm32-20200117
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
Content-Type: multipart/mixed; boundary="===============4145915376325803058=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============4145915376325803058==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Q7bfAqWrbHh5tT1G"
Content-Disposition: inline


--Q7bfAqWrbHh5tT1G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 20, 2020 at 08:35:00AM +0000, Patrick DELAUNAY wrote:

> Hi Tom
>=20
> Please pull the first STM32 related patches for v2020.04
>=20
> Gitlab CI status:
>      https://gitlab.denx.de/u-boot/custodians/u-boot-stm/pipelines/1900
>=20
> With the following fixes:
> - stm32mp1: split SOC and board and cleanup config
>=20
> It is a preliminary step for DH Electronics DHCOM SoM and PDK2 board
>=20
> NB: I resent the email with correct Title (I just remove "Re:") to avoid =
confusion.
>=20
> Thanks,
> Patrick
>=20
> git request-pull origin/master https://gitlab.denx.de/u-boot/custodians/u=
-boot-stm.git u-boot-stm32-20200117 The following changes since commit d7bb=
6aceb2e99a832efbb96f9bf480bf95602192:
>=20
>   Merge tag 'mmc-1-16-2020' of https://gitlab.denx.de/u-boot/custodians/u=
-boot-mmc (2020-01-16 13:20:51 -0500)
>=20
> are available in the Git repository at:
>=20
>   https://gitlab.denx.de/u-boot/custodians/u-boot-stm.git tags/u-boot-stm=
32-20200117
>=20
> for you to fetch changes up to db48e11b1eccf23f3f9ba26e886a798e74df6a01:
>=20
>   ARM: dts: stm32: Add missing ETHCK clock to ethernet node (2020-01-17 1=
6:26:42 +0100)
>=20

Applied to u-boot/master, thanks!

--=20
Tom

--Q7bfAqWrbHh5tT1G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE6HLbQJwaaH776GM2h/n2NdMddlIFAl4mU3AACgkQh/n2NdMd
dlLUvRAAjvD3PFwQO6GREFmyC8kOVWy1ws5E64qCfVnm+Dg6rRelXMh95IeXMEhi
MackVhkYthoY8rFbTuAQqFNR00kY3y+DYDiNmBw+Up5QQ4KbUc8IuRQqxvlNF/zn
R4MsG8QjFNWa25piq2ozMDHoz/5h1fxGBVrJleF+lV4YrLrY2qgBOtpi+LczK5+c
A3SdQSZi83FA/lYdhTYcdzphezcRmWZI5jhjnKnhLbGh3x8MGrFiEg0r/byrwqHD
kygYUV6H7pu/DnRAls4x5/KJw1G4mNtRnwEBmNRVcOUZzoLiYpZjQ6Gh83NB/PSL
/yF+X7IGX49seSaeQ0mDLWA7lZfYppHiPbQVOBoPtM1WZYizHDFg6IXZhzKmALj2
OgU+5bwiIb9YUH1wM/du8zRVr8h4rrretTOGY35xT5kfy1Dk1zILuLDAjhfkMwah
qXDOGyFbby3iCoA0Ibv2XroJYFDz9rZ6CnwHHVfV3YpnJEqbByHC08p5NDBltn1H
NKu9L41BMS8xvYx9ttw+rY9poWfg1ASguW/7nGs1IfEdxxkeWZh+fTBqrw9mHujo
7am/FZxx+cRph2t8bk7ieS+/n1MkazX79nsJWEcyZ4C8pnoE/p3z98PW589g3ZNd
3rOdZrSH3rB63Tk/1tE87L2KitkFcjYfsWKawRJT7ftnZloLEFs=
=EmvR
-----END PGP SIGNATURE-----

--Q7bfAqWrbHh5tT1G--

--===============4145915376325803058==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============4145915376325803058==--
