Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 715FA1D37C7
	for <lists+uboot-stm32@lfdr.de>; Thu, 14 May 2020 19:15:52 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 374F2C36B10
	for <lists+uboot-stm32@lfdr.de>; Thu, 14 May 2020 17:15:52 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com
 [209.85.219.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 47511C36B0E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 May 2020 17:15:49 +0000 (UTC)
Received: by mail-qv1-f42.google.com with SMTP id t8so2054559qvw.5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 May 2020 10:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=r7SSy6EHXHSZOXCjybmg4PWxcoopuWWlxm1Sz0QxNdU=;
 b=q90JTNEwaf84UZNsVsYH3DOesW7SWUECK5mhttz3dOnqOYk6cyxaObJsbBVmRsEzah
 0Pn40Oos823u+55jhDXa6spy+6Hc+OSHKJ9HLJALyQ9D5D2+kZde27eowM4+VKtif+YM
 UWQ/yLg6MYGzkQcug+L+AjTry3uAXqF4CAH3I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=r7SSy6EHXHSZOXCjybmg4PWxcoopuWWlxm1Sz0QxNdU=;
 b=PlFShQPba+HA/xDK2Nd2NHKBtQpov6ko8xuR29DnvsHU+6DKouPrST5U247PjR6wTv
 wba7VCPcjsMOAm7OpPzK+e0V2Y5FtduMRDm5d1TrywVn/8RUDXStlU4rJSEllhUOpH62
 00sr+RbqlhXrUIJ3EhrVjxOFF4f+UMpdxUJ1q3qKSq1PKHY4TrK2dkKYaLKnNnFVVf9r
 eWGTnacsTstcBWh1Hd5v0bxoFcKieMUclX9EjYKRBpMttZKvKtVGtNBnwXq/OOaX0Bgz
 pGjZquZOYdAk6+GOJqSG6lQErOwRPLOBy12zpT4M2edaEjaIeT84zj2xJiiPFuoB6jS3
 Lo2g==
X-Gm-Message-State: AOAM531XmqZZydR75blreZ4vAeVrRmpj89QZYmpRc4WbN6SqLwgz8IQ7
 KWBurM5bj8TgyWeu3cziECs2oyDMC6k=
X-Google-Smtp-Source: ABdhPJz1AV0E1nBGOSMATyagSd1fBH1D1RBvufa9wu0/TkfZhOrg7TgBTct47EYh88/89ix8WmADAA==
X-Received: by 2002:a0c:aec2:: with SMTP id n2mr5796905qvd.16.1589476548313;
 Thu, 14 May 2020 10:15:48 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-826f-9072-2581-ca55-941b.inf6.spectrum.com.
 [2606:a000:1401:826f:9072:2581:ca55:941b])
 by smtp.gmail.com with ESMTPSA id m25sm2983545qkg.83.2020.05.14.10.15.46
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 14 May 2020 10:15:47 -0700 (PDT)
Date: Thu, 14 May 2020 13:15:45 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>
Message-ID: <20200514171545.GF4794@bill-the-cat>
References: <bbbace4ec92f4be7af31e46ee7c5bcbb@SFHDAG6NODE3.st.com>
MIME-Version: 1.0
In-Reply-To: <bbbace4ec92f4be7af31e46ee7c5bcbb@SFHDAG6NODE3.st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>, Marek Vasut <marex@denx.de>,
 Patrice CHOTARD <patrice.chotard@st.com>
Subject: Re: [Uboot-stm32] [PULL] Pull request: u-boot-stm/master
	=u-boot-stm32-20200514
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
Content-Type: multipart/mixed; boundary="===============6158723519114100261=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============6158723519114100261==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kR3zbvD4cgoYnS/6"
Content-Disposition: inline


--kR3zbvD4cgoYnS/6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 14, 2020 at 10:03:33AM +0000, Patrick DELAUNAY wrote:

> Hi Tom,
>=20
> Please pull the STM32 related fixes for v2020.07-rc3 =3D u-boot-stm32-202=
00514
> =20
> With the following changes:
> - stm32mp1: migrate MTD and DFU configuration in Kconfig
> - stm32mp1: add command stm32prog
> - stm32mp1: several board and arch updates
> - stm32mp1: activate data cache in SPL and before relocation
> - Many improvement for AV96 board and DHCOR SoM
>   (add new defconfig, DDR3 coding on DHCOR SoM, split between board and S=
OM=20
>    Synchronize DDR setttings on DH SoMs, setting for I2C EEPROM)
> - clk: stm32mp1: fix CK_MPU calculation
> - DT alignment of stm32mp1 device tree with Linux 5.7-rc2
> =20
> CI status:
>      https://gitlab.denx.de/u-boot/custodians/u-boot-stm/pipelines/3238>=
=20
>=20
> Thanks,
> Patrick
>=20
> The following changes since commit 10bca13ea6d9d4b85f80f02c8795227f63240f=
59:
>=20
>   Merge https://gitlab.denx.de/u-boot/custodians/u-boot-usb (2020-05-12 1=
6:20:10 -0400)
>=20
> are available in the Git repository at:
>=20
>   https://gitlab.denx.de/u-boot/custodians/u-boot-stm.git tags/u-boot-stm=
32-20200514
>=20
> for you to fetch changes up to 1b28a5e2b00a9bf3523cc63694baa03f23604619:
>=20
>   ARM: dts: stm32mp1: DT alignment with Linux 5.7-rc2 (2020-05-14 09:02:1=
2 +0200)
>=20

Applied to u-boot/master, thanks!

--=20
Tom

--kR3zbvD4cgoYnS/6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl69fMAACgkQFHw5/5Y0
tyxkKQv9G/7B5juES9L+axrF1V1rzvP1BoJyvKkRqMTeCh10d1L28gWrKiG88WRn
5zFfdveDTBFu4gZsbf2cWlBR50sV91j0LnonlhAbpInjxTHO+DPhAfiicxX0SuMf
wq90zw/6oV4QbBwQ5Nv3icMDvDHQf9rigsVTVFck3o32WIYfBdXb5Ao9hg5MqdlT
dmXRfUPDm+goDARLq4UJrShL9JfdH6lBKzxJDsH6ncrrKqoCdnJQ+YEA/aeZIFtx
Jain/uI9mrkNV0JOEFDme9AqfImlmy5nKJdOUC1QYNGHU53sHzdUrNl2DlVh+76z
HmZHcxJ8kF/owimUvhabBk87naXR8SaSqWJ5yXFsrv6RT0KyZOMUgCGOWJ5rcybg
X+HBxkPCja73aKgIFQx8hMraX8NG2udJDSaTl9IT9OwXmH7mkrCsG6C664oOfqyp
gJDW4v2UR7BS7mmdFe7dJJhNy0jTnNq3a3dOoHjRrey/imFEBv0KMZYRIyDBaS07
rV+MMlN3
=YSTN
-----END PGP SIGNATURE-----

--kR3zbvD4cgoYnS/6--

--===============6158723519114100261==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============6158723519114100261==--
