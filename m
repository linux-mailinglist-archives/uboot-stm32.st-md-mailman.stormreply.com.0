Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8763516EE48
	for <lists+uboot-stm32@lfdr.de>; Tue, 25 Feb 2020 19:44:31 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 329D6C36B0A
	for <lists+uboot-stm32@lfdr.de>; Tue, 25 Feb 2020 18:44:31 +0000 (UTC)
Received: from mail-yw1-f68.google.com (mail-yw1-f68.google.com
 [209.85.161.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 160DDC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Feb 2020 18:44:28 +0000 (UTC)
Received: by mail-yw1-f68.google.com with SMTP id n127so440289ywd.9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Feb 2020 10:44:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ME+K2+ed4TNq+ktSlexxRGR7XiotiYSQl8qtPf/T0CM=;
 b=LtmXienPU8uOrbluvS4HJrR18RvK1rgh4oLjaR8PMmkoCk+mk15feDxXnMQnwRFBfy
 vFsWqecMpuaXWiDeAGrcHdi/2tkHrc2Ay4japGeemYsIp6ktUzzJaJ6o2BoS6Awronj4
 +uLHkEAAkKBOei+Z68Mcv0CiTTix1D4T2t68U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ME+K2+ed4TNq+ktSlexxRGR7XiotiYSQl8qtPf/T0CM=;
 b=oOulIJtZGKLtSIifnOMFtlLVTe07agGRT2nU+09svjVF9vN77u21CVbYQkEx6SHcwm
 OV3+S6cPwAb1GqH4ITQO8eS+vuex6EMcxAQJ4obXbnnKvHOSrC4iZbP5XcRVi75Y0fK2
 MakKL5NF2qS+aue53IO12SsPT+YpB7iyIkoSUcE4nBdw8n9K7+rk6x2kJsnrZXnky/A3
 yIcVI6VudcjiYSidSCx/4/Ga9+ustrtiBhmpYhWUiXwK3ifSgrQ/0BO+0yxlt6uDpEvF
 0akFUfaZq2sQV2qqWJuZGasD2Hi6tP0a0X75B/XKGizCNnYHT7NQZdmH07NW/ps9bjpt
 HZBw==
X-Gm-Message-State: APjAAAXCa/HCO7J/cqczA+ztaE+5FFrSpZ9v36s7azwdk4VNbwpLP3dH
 ATIR1TgoeCnCTufQ1dfA9nyahA==
X-Google-Smtp-Source: APXvYqxr7L6KGYFM+qOOP4cgXtS8/bGqwzOFY98NFDJLe32GjkRk38LEjbnq0nU7MrCFm3S5I81ikA==
X-Received: by 2002:a81:1a4b:: with SMTP id a72mr71967ywa.511.1582656266910;
 Tue, 25 Feb 2020 10:44:26 -0800 (PST)
Received: from bill-the-cat
 (2606-a000-1401-86dd-dc6c-1058-57dc-cc1b.inf6.spectrum.com.
 [2606:a000:1401:86dd:dc6c:1058:57dc:cc1b])
 by smtp.gmail.com with ESMTPSA id j68sm6810884ywg.6.2020.02.25.10.44.25
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 25 Feb 2020 10:44:25 -0800 (PST)
Date: Tue, 25 Feb 2020 13:44:23 -0500
From: Tom Rini <trini@konsulko.com>
To: Heinrich Schuchardt <xypron.glpk@gmx.de>
Message-ID: <20200225184423.GK18302@bill-the-cat>
References: <20200225180011.8129-1-patrick.delaunay@st.com>
 <f435e69b-7e4f-b58b-8903-eda993c60792@gmx.de>
MIME-Version: 1.0
In-Reply-To: <f435e69b-7e4f-b58b-8903-eda993c60792@gmx.de>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Breno Matheus Lima <breno.lima@nxp.com>, u-boot@lists.denx.de,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Bin Meng <bmeng.cn@gmail.com>, Patrick Delaunay <patrick.delaunay@st.com>
Subject: Re: [Uboot-stm32] [PATCH] doc: Makefile: remove target refcheckdocs
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
Content-Type: multipart/mixed; boundary="===============7163625179641883970=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============7163625179641883970==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Ky0ujAyBToem0Xjc"
Content-Disposition: inline


--Ky0ujAyBToem0Xjc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 25, 2020 at 07:10:01PM +0100, Heinrich Schuchardt wrote:
> On 2/25/20 7:00 PM, Patrick Delaunay wrote:
> > Remove the target refcheckdocs, based on the missing script
> > scripts/documentation-file-ref-check.
> >=20
> > This script exists in Linux tree but wasn't imported when 'doc' move
> > to SPHINX in commit 78a88f7930be ("doc: Replace DocBook with
> > sphinx-based docs")
> >=20
> > This patch avoids the error:
> >=20
> > make refcheckdocs
> > /bin/sh: scripts/documentation-file-ref-check: No such file or directory
> > doc/Makefile:102: recipe for target 'refcheckdocs' failed
> > make[1]: *** [refcheckdocs] Error 127
> > Makefile:2094: recipe for target 'refcheckdocs' failed
> > make: *** [refcheckdocs] Error 2
> >=20
> > Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
>=20
> When we copy and adjust the missing script we can identify dozens of
> documentation errors, see below. So I think we should fix the make
> target instead of removing it.
>=20
> arch/arm/mach-imx/Kconfig: doc/README.mxc_hab
> arch/arm/mach-imx/Kconfig: doc/README.mxc_hab
> board/advantech/dms-ba16/dms-ba16_1g.cfg: doc/README.imximage
> board/advantech/dms-ba16/dms-ba16_2g.cfg: doc/README.imximage
> board/aristainetos/aristainetos2.cfg: doc/README.imximage
> board/bachmann/ot1200/mx6q_4x_mt41j128.cfg: doc/README.imximage
> board/barco/titanium/imximage.cfg: doc/README.imximage
> board/boundary/nitrogen6x/nitrogen6dl.cfg: doc/README.imximage
> board/boundary/nitrogen6x/nitrogen6dl2g.cfg: doc/README.imximage
> board/boundary/nitrogen6x/nitrogen6q.cfg: doc/README.imximage
> board/boundary/nitrogen6x/nitrogen6q2g.cfg: doc/README.imximage
> board/boundary/nitrogen6x/nitrogen6s.cfg: doc/README.imximage
> board/boundary/nitrogen6x/nitrogen6s1g.cfg: doc/README.imximage
> board/ccv/xpress/imximage.cfg: doc/README.imximage
> board/cobra5272/README: u-boot-x-x-x/doc/README.COBRA5272
> board/freescale/imx8qxp_mek/imximage.cfg: doc/README.imx8image
> board/freescale/m52277evb/README: doc/README.m52277evb
> board/freescale/m53017evb/README: doc/README.m53017evb
> board/freescale/m5373evb/README: doc/README.m5373evb
> board/freescale/m54455evb/README: doc/README.m54455evb
> board/freescale/m547xevb/README: doc/README.m5475evb
> board/freescale/mx25pdk/imximage.cfg: doc/README.imximage
> board/freescale/mx51evk/imximage.cfg: doc/README.imximage
> board/freescale/mx53ard/imximage_dd3.cfg: doc/README.imximage
> board/freescale/mx53evk/imximage.cfg: doc/README.imximage
> board/freescale/mx53loco/imximage.cfg: doc/README.imximage
> board/freescale/mx53smd/imximage.cfg: doc/README.imximage
> board/freescale/mx6qarm2/imximage.cfg: doc/README.imximage
> board/freescale/mx6qarm2/imximage_mx6dl.cfg: doc/README.imximage
> board/freescale/mx6slevk/imximage.cfg: doc/README.imximage
> board/freescale/mx6ullevk/imximage.cfg: doc/README.imximage
> board/freescale/mx7dsabresd/imximage.cfg: doc/README.imximage
> board/freescale/s32v234evb/s32v234evb.cfg: doc/README.imximage
> board/freescale/vf610twr/imximage.cfg: doc/README.imximage
> board/ge/bx50v3/bx50v3.cfg: doc/README.imximage
> board/ge/mx53ppd/imximage.cfg: doc/README.imximage
> board/menlo/m53menlo/imximage.cfg: doc/README.imximage
> board/phytec/pcm052/imximage.cfg: doc/README.imximage
> board/seco/mx6quq7/mx6quq7-2g.cfg: doc/README.imximage
> board/siemens/capricorn/imximage.cfg: doc/README.imx8image
> board/technexion/pico-imx6ul/imximage.cfg: doc/README.imximage
> board/toradex/apalis-imx8/apalis-imx8qm-imximage.cfg: doc/README.imx8image
> board/toradex/colibri-imx6ull/imximage.cfg: doc/README.imximage
> board/toradex/colibri-imx8x/colibri-imx8qxp-imximage.cfg:
> doc/README.imx8image
> board/toradex/colibri_imx7/imximage.cfg: doc/README.imximage
> board/toradex/colibri_vf/imximage.cfg: doc/README.imximage
> board/tqc/tqma6/clocks.cfg: doc/README.imximage
> board/tqc/tqma6/tqma6dl.cfg: doc/README.imximage
> board/tqc/tqma6/tqma6q.cfg: doc/README.imximage
> board/tqc/tqma6/tqma6s.cfg: doc/README.imximage
> board/warp/imximage.cfg: doc/README.imximage
> board/warp7/imximage.cfg: doc/README.imximage
> cmd/Kconfig: doc/README.beddbug
> doc/README.drivers.eth: doc/driver-model/README.txt
> doc/README.fdt-control: doc/driver-model/README.txt
> doc/device-tree-bindings/net/ti,dp83867.txt:
> doc/devicetree/bindings/net/ethernet.txt
> doc/device-tree-bindings/video/rockchip-lvds.txt:
> doc/devicetree/device-tree-bindings/video/display-timing.txt
> doc/imx/misc/sdp.txt: doc/README.imximage
> doc/sphinx/parse-headers.pl: doc/doc-guide/parse-headers.rst
> doc/sphinx/rstFlatTable.py: doc/books/kernel-doc-HOWTO
> drivers/i2c/davinci_i2c.c: doc/driver-model/i2c-howto.txt
> drivers/i2c/kona_i2c.c: doc/driver-model/i2c-howto.txt
> drivers/i2c/sh_i2c.c: doc/driver-model/i2c-howto.txt
> drivers/i2c/soft_i2c.c: doc/driver-model/i2c-howto.txt
> drivers/rtc/ds1374.c: Watchdoc/Alarm
> include/ata.h: ftp://ftp.fee.vutbr.cz/pub/doc/io/ata/ata-3/ata3r5v.zip
> include/configs/sbc8548.h: doc/README.sbc8548
> include/fsl_qe.h: doc/README.qe_firmware
> lib/zlib/trees.c: ftp.uu.net:/pub/archiving/zip/doc/deflate-1.1.doc
> tools/dtoc/dtb_platdata.py: doc/driver-model/of-plat.txt
> tools/dtoc/dtoc.py: doc/driver-model/of-plat.txt

Agreed.  And then make new errors a CI fatal?  Thanks!

--=20
Tom

--Ky0ujAyBToem0Xjc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl5Vav0ACgkQFHw5/5Y0
tyyRfgwAl56uOAfXGbPgwjxNd5vyN2E2fk7MNnJfpkUozJzmLta6IOwVKjMZNzYb
HnlBrRWL47aNtquGA5/4CEngYUHNk2UyeIh/z2MRodPX8dydl0boTjpdIYRjKPRW
t0honpRiKaxSGSv2aOdzJgQzRQJnEJNO8xeJlY2vC8eMNipPHokVTnsm/onOVjkF
pT3mxKapQAzh4F0HS3y3NYdZvJlNoDSGPohMwvRFBsddhMPfam9v7KHwedSzVzBl
LPpdEiy6YMQXp1L4v+y8tqOWddHAFbCPSpvWEtWwyz3F/fqas1M0W4PduE7j7xLy
03xIzJkQ3trgU06lPysABU1IpJbdY/Tg+PQ77fYL5iI7INemHJEHh6IrSVoq+3gb
Yehs/K5DXI53cgsNrWKwKTkT0XlTOC1oLBjzLStbEOqEpiwTuyiVpmwUB9CYK8Ph
YL9jVFQrWKtZDYhEoTMMA1f6798uGUZfiKqu8vI4Z38/zgkfnJ41p/9Te/0vgowq
cB0a06DQ
=kV3X
-----END PGP SIGNATURE-----

--Ky0ujAyBToem0Xjc--

--===============7163625179641883970==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============7163625179641883970==--
