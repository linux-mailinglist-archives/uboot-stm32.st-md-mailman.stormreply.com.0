Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 55CF910996
	for <lists+uboot-stm32@lfdr.de>; Wed,  1 May 2019 16:49:37 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A32FCC35E01
	for <lists+uboot-stm32@lfdr.de>; Wed,  1 May 2019 14:49:36 +0000 (UTC)
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
 [209.85.128.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 23674C36B3F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 May 2019 14:49:35 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id q15so1698154wmf.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 01 May 2019 07:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=72tIMjhedoyvrqdJVWhBh7XW83I6j0NNlw7SH7XdDi4=;
 b=mn2ZGpQuVDmmI+aE1AlBNBkatG2xfKAIhtQwSdsZThKGXi+vO7NycddBdkRzYf4KP2
 pUBGolcMnrn5BzflN2pTgM3nhv6hw0IvF37WvFu/cV7YzlfouWhAtOvLwMStudLEisJR
 XbPTqh2ts3Z7JEbKQ+4lEcHD4jsaPqfOS/6Cg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=72tIMjhedoyvrqdJVWhBh7XW83I6j0NNlw7SH7XdDi4=;
 b=UydNKfOciYDeu4oeUOY81twvKr3XbcyAkm43tH7pqYpX+sQ3J7q2TsB00W9IuoWnaZ
 7OOS21FqTVRXmB179LhAL4rlhTZI/jofqCa8c7urRm3/yLu9p75jD2yH3KGy1s6L3tiI
 IiBxVUlAuFkTB5/4qrAXo3Am1/W1UPqbwpe1v00m94MDqm/U/ayy2TGRybb0KYqyaZwj
 hP1i0S57Kxo8fCSsLoQe/ykzgfh4e9PF56X/y9OPLCUhrk1ezqQReIypYYMEOF7s2TTa
 Vi16K5UkKOWV+S+5NK6L7D2cUGxth7tEto0qQ58IhLxtw4HrDbW7zURMGKmeRsSeEt9W
 YVPA==
X-Gm-Message-State: APjAAAX/IBc+Bd3NPeiZz1ZcfMqHDWH4BfGtNCcHVltzulc0f9ghWVKx
 slmkzeyGS/gDGlhKrCcdhqfgQA==
X-Google-Smtp-Source: APXvYqyuoMoxZOwrPTNz2j07M87ItDjzp/7Ntzs8iQ0XVWcc0W/B4zenKbuz5GINlG1pjvlmZMp4Lw==
X-Received: by 2002:a1c:7d10:: with SMTP id y16mr2525371wmc.83.1556722174616; 
 Wed, 01 May 2019 07:49:34 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-141-147.ec.res.rr.com.
 [65.184.141.147])
 by smtp.gmail.com with ESMTPSA id e5sm23598492wrh.79.2019.05.01.07.49.29
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 01 May 2019 07:49:33 -0700 (PDT)
Date: Wed, 1 May 2019 10:49:26 -0400
From: Tom Rini <trini@konsulko.com>
To: Alex Kiernan <alex.kiernan@gmail.com>
Message-ID: <20190501144926.GX31207@bill-the-cat>
References: <20190501075827.12992-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20190501075827.12992-1-alex.kiernan@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: Eric =?iso-8859-1?Q?B=E9nard?= <eric@eukrea.com>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Adrian Alonso <adrian.alonso@nxp.com>, Ken Lin <Ken.Lin@advantech.com.tw>,
 Vanessa Maegima <vanessa.maegima@nxp.com>, u-boot@lists.denx.de,
 Max Krummenacher <max.krummenacher@toradex.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Stefan Roese <sr@denx.de>,
 Chris Packham <judge.packham@gmail.com>,
 Richard Hu <richard.hu@technexion.com>, Marek Vasut <marex@denx.de>,
 Akshay Saraswat <akshay.s@samsung.com>, Stephen Warren <swarren@nvidia.com>,
 Stefan Agner <stefan.agner@toradex.com>, Ingo Schroeck <open-source@samtec.de>,
 Toradex ARM Support <support.arm@toradex.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Michal Simek <michal.simek@xilinx.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Ian Ray <ian.ray@ge.com>, Simone CIANNI <simone.cianni@bticino.it>,
 Ramon Fried <ramon.fried@gmail.com>, Otavio Salvador <otavio@ossystems.com.br>,
 Ryder Lee <ryder.lee@mediatek.com>,
 Raffaele RECALCATI <raffaele.recalcati@bticino.it>,
 Gregory CLEMENT <gregory.clement@free-electrons.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Akshay Bhat <akshaybhat@timesys.com>
Subject: Re: [Uboot-stm32] [U-Boot] [PATCH v3] Convert
	CONFIG_SUPPORT_EMMC_BOOT to Kconfig
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
Content-Type: multipart/mixed; boundary="===============4784799984319938668=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============4784799984319938668==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Otx5hRnTD1Pvw/IU"
Content-Disposition: inline


--Otx5hRnTD1Pvw/IU
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 01, 2019 at 07:58:27AM +0000, Alex Kiernan wrote:
> This converts the following to Kconfig:
>    CONFIG_SUPPORT_EMMC_BOOT
>=20
> As requested by Michal Simek <michal.simek@xilinx.com>, these boards
> have no eMMC so CONFIG_SUPPORT_EMMC_BOOT has not been migrated:
>=20
>   xilinx_zynqmp_zc1275_revB
>   xilinx_zynqmp_zc1751_xm018_dc4
>   xilinx_zynqmp_zc1751_xm019_dc5
>   xilinx_zynqmp_zcu100_revC
>   xilinx_zynqmp_zcu102_rev1_0
>   xilinx_zynqmp_zcu102_revA
>   xilinx_zynqmp_zcu102_revB
>   xilinx_zynqmp_zcu104_revA
>   xilinx_zynqmp_zcu104_revC
>   xilinx_zynqmp_zcu106_revA
>   xilinx_zynqmp_zcu111_revA
>=20
> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> Acked-by: Lukasz Majewski <lukma@denx.de>
> Acked-by: Patrick Delaunay <patrick.delaunay@st.com>
> Acked-by: Ramon Fried <ramon.fried@gmail.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Tested-by: S=E9bastien Szymanski <sebastien.szymanski@armadeus.com>
> ---
> Green travis build:
>=20
> https://travis-ci.org/akiernan/u-boot/builds/526591535
>=20
> Testing for configuration changes shows just the expected xilinx_zynqmp
> boards:

So, FWIW, what I do (and will do for this patch when I check it out
before pushing) ends up as:
$ export SOURCE_DATE_EPOCH=3D`date +%s`
$ ./tools/buildman/buildman -o /tmp/test -b master --force-build --step 0 \
  -SCdvel \
  'arc|arm|sandbox|x86|aarch64|powerpc|m68k|nios2|nds32|sh|mips|xtensa|risc=
v'
$ ./tools/buildman/buildman -o /tmp/test -b master --step 0 -Ssdel \
  'arc|arm|sandbox|x86|aarch64|powerpc|m68k|nios2|nds32|sh|mips|xtensa|risc=
v'

With the patch applied in some branch that has 'master' as the upstream.
This is basically a world-build and will size compare before/after,
noting changes.  If I see a size difference (outside of a few boards
that include the config in the binary and so grow slightly on
conversions), I use:
$ export SOURCE_DATE_EPOCH=3D`date +%s`
$ ./tools/buildman/buildman -o /tmp/brd -b master --step 0 -SBCdevlk BOARD
$ ./tools/buildman/buildman -o /tmp/brd -b master --step 0 -SsBdevlk BOARD

Which probably has a few more flags than required but will also tell
which functions within the binary have changed and so a good place to
hunt down what didn't convert correctly and why.

--=20
Tom

--Otx5hRnTD1Pvw/IU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJcybH2AAoJEIf59jXTHXZSf8oP/jHHnKSzqdwrKvrz+feKLUHl
TvyB5xIaspAG4YHIF6uwYdTQbTzWMBGQwtPMF5T58t6dV6XO+V0OQeVB4yrusIOw
Uh3yLmZkcBtJdHB7ChUVd0TuGa4M8crT5iq+aOcHOczAt4CulAvD3Pvk7U6bQU+f
vq6BwtTGnARHMvZ6Oge3H/pXHYrg1c3wn3RLh6po/xWt6uPORBkfl4X0MgiAlhsD
c8MvAHHgWliEdQ3T9sXkNEXDWh4Kzu6dxszgvizWkGz4dI5vvvIhsuxqerD2cklm
HnVp7qS5akHnHu2in91IDZCeQfpaD+wC3tWprjsaCTgveVDXmd/aZM3BEDBrLEG2
k7Mf4CCQriVR9wSw0mU8Y3zDqJyBqKj08pAZt/hqklXiRC7BuummWQ7d9JD5vw4k
lmVFs6SqJn7A8S+0dw+lDZM/N0+GMRUTC1nN+G6Sma9f6d3Vtap+BeENlodTh9Fx
dOBT/GIpq8z5a+yG14QQ0ZODxkZxvu0eMjEZ+V8g35NivPNIbZ8QKgNwHNI1zXyb
cOJy0A34Ifp/KX9jZdwK7tUshYVcWTtJZhrjSsdhqlrspcbkLAR+9xVsw+IG3+/J
DFfzKXvAqoaIHIeh8rJZnVto8TtTGN3C0jojgBCbpQ9QlwpxeQWFo2YBASAZ9ruE
ruLhFwFtxzvRCe9roPyz
=9Qr6
-----END PGP SIGNATURE-----

--Otx5hRnTD1Pvw/IU--

--===============4784799984319938668==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============4784799984319938668==--
