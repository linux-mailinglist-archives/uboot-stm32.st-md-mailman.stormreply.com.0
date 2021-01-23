Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ABDAA301509
	for <lists+uboot-stm32@lfdr.de>; Sat, 23 Jan 2021 13:15:50 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5D459C56635;
	Sat, 23 Jan 2021 12:15:50 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 20202C56630
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 23 Jan 2021 12:15:48 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4DNFTB6xrPz1rx88;
 Sat, 23 Jan 2021 13:15:42 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4DNFTB5gZbz1tYW3;
 Sat, 23 Jan 2021 13:15:42 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id yvYGKuiCma21; Sat, 23 Jan 2021 13:15:37 +0100 (CET)
X-Auth-Info: oJ2AH5LKwWVF3tCPkCW/OiAQlfA5tMuYm40+7IgfKwk=
Received: from jawa (89-64-25-12.dynamic.chello.pl [89.64.25.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Sat, 23 Jan 2021 13:15:37 +0100 (CET)
Date: Sat, 23 Jan 2021 13:15:36 +0100
From: Lukasz Majewski <lukma@denx.de>
To: Patrick DELAUNAY <patrick.delaunay@st.com>
Message-ID: <20210123131536.15685a00@jawa>
In-Reply-To: <8d6dfa51d37a4fcdb2f58516473925de@SFHDAG2NODE3.st.com>
References: <20200909152228.1.I4ae7c1ab59fed4861cde9322a8d12167c9d0187a@changeid>
 <8d6dfa51d37a4fcdb2f58516473925de@SFHDAG2NODE3.st.com>
Organization: denx.de
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Peng Fan <peng.fan@nxp.com>, Mingming lee <mingming.lee@mediatek.com>,
 Simon Glass <sjg@chromium.org>, Kever Yang <kever.yang@rock-chips.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 1/4] fastboot: mmc: Add
	CONFIG_FASTBOOT_MMC_USER_SUPPORT
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
Content-Type: multipart/mixed; boundary="===============3794953982184375642=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

--===============3794953982184375642==
Content-Type: multipart/signed; micalg=pgp-sha512;
 boundary="Sig_/sCJpqlRYWlNO7vVnzBevRGT"; protocol="application/pgp-signature"

--Sig_/sCJpqlRYWlNO7vVnzBevRGT
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Patrick,

> Hi Lukasz,
>=20
> > From: Patrick DELAUNAY <patrick.delaunay@st.com>
> > Sent: mercredi 9 septembre 2020 15:23
> > To: u-boot@lists.denx.de
> > Cc: Patrick DELAUNAY <patrick.delaunay@st.com>; Jagan Teki
> > <jagan@amarulasolutions.com>; Kever Yang
> > <kever.yang@rock-chips.com>; Mingming lee
> > <mingming.lee@mediatek.com>; Miquel Raynal
> > <miquel.raynal@bootlin.com>; Peng Fan <peng.fan@nxp.com>; Simon
> > Glass <sjg@chromium.org>; U-Boot STM32 <uboot-stm32@st-md-
> > mailman.stormreply.com> Subject: [PATCH 1/4] fastboot: mmc: Add
> > CONFIG_FASTBOOT_MMC_USER_SUPPORT
> > Importance: High
> >=20
> > Split userdata and boot partition support for eMMC update and
> > correct the description (update is supported).
> >=20
> > The new configuration CONFIG_FASTBOOT_MMC_USER_SUPPORT allows to
> > activate support of userdata partition update, based on target
> > name=3DCONFIG_FASTBOOT_MMC_USER_NAME
> >=20
> > This patch also removes the unnecessary dependency with
> > ARCH_MEDIATEK and EFI_PARTITION.
> >=20
> > Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> > ---
> >=20
> >  configs/mt8518_ap1_emmc_defconfig |  1 +
> >  drivers/fastboot/Kconfig          | 22 +++++++++++++++++-----
> >  drivers/fastboot/fb_mmc.c         |  9 ++++++---
> >  3 files changed, 24 insertions(+), 8 deletions(-)
> >  =20
>=20
> Gentle reminder,
>=20
> Any comments on this serie [1]
>=20
> [1] http://patchwork.ozlabs.org/project/uboot/list/?series=3D200509
>=20
> Patrick=20

Could you rebase this on top of current -master (after I do send the
PR) and resend. There are now build / application errors on this series.

Thanks in advance and please find my apologize for very late reply
(covid19 + personal matters).


Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/sCJpqlRYWlNO7vVnzBevRGT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAmAME2gACgkQAR8vZIA0
zr2XIQgA0REp3B0BQ9C0gdpSZK97SUMZMzMQAWa0jQ+VylJepmwlv4RUIWZBmZGW
NLu2YaxWr+80XzGXWOhe0Rwkz4GsgSBVvtpy3jT/7PALRsFViXzV9tL8UDXYW17z
nvhhpO5zDdH4Yl3/S2qAV1jUxW3xllXfgjPgy4EbD5CnOeM44km1liRjVzsUbxqf
c1ewhoBVnbBkzFgpH6hv6U3yqqR+d1fppuVHOrazfjtZcLy77v2Y6/2jjf2uHtff
m6qsT9c0CeJCC6ln81jDGDera66O1jNydUHGm+cmAeidVEwFSM2hofJTshifPntM
lN+1HxfGGt4ZjQs4wlNgiSgiX+ydCA==
=KHGb
-----END PGP SIGNATURE-----

--Sig_/sCJpqlRYWlNO7vVnzBevRGT--

--===============3794953982184375642==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============3794953982184375642==--
