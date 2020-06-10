Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 416501F5B7E
	for <lists+uboot-stm32@lfdr.de>; Wed, 10 Jun 2020 20:52:24 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 03570C36B0D
	for <lists+uboot-stm32@lfdr.de>; Wed, 10 Jun 2020 18:52:24 +0000 (UTC)
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
 [209.85.160.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8CA60C36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Jun 2020 18:52:22 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id j32so2607169qte.10
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Jun 2020 11:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=2nWFghfAhzbs+xmfs0I11a4sbKWe13rMAffXDKBHSMs=;
 b=Hj8matvZ/SUDgm6Y9Gm/YhkohImsxkwI4mKqs/9zOY8Pvwf8H9KJ4H+BnjLzid4+YA
 ujOqVkc6KLopLFlGOiVjg6O7ffp7un7h76U3PgprqCP2zjB4P3WJAgG8c24VhnxwKZ6t
 6IYqqWYUHd4nwVn7JHGvMvaJhF2EmmBu+B85A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=2nWFghfAhzbs+xmfs0I11a4sbKWe13rMAffXDKBHSMs=;
 b=LtWwSenS5AWC8Xr5QR3eSyho4vOWZSOTOv+XhskW+9UcQsRdl77it9yRrHDJU0EYLo
 qQEITglPcHfP+/PAGn2iwmEyzPEdx6CPVaN6U7supZ/+eakjPvbFXqcXwcU22mHiiQhf
 vLpGOcaMV8SSa25fl6IlTe6I6/RmiPRw7uhWrVbhltvLS5g6EX00h9pZ7kCjnto7CRml
 PRBSnrFpyPPt9B2BsQHFavQbwZyPL++pYzOd8lmL1ndwMi4Q5nI7nLQT3O25i3vXLGuK
 mzEGklGuz1XK99DYsNfP/GuUwRS6qHInQleqvckw9Gb3XGwzFwt4+Nqw8wtadfRh24bQ
 P/MA==
X-Gm-Message-State: AOAM53277Pwd42Yu2Npm3yvhYnVnEvkg5GXhEujKMxdSymz2xNc+KY1S
 noQJxuTb0h/Mc3BU9mpmVUpW3Q==
X-Google-Smtp-Source: ABdhPJxZq/0T9AFbfm6WWxYeryQa/du81hoRdRD1YINQ15W7iIS2M7wRbYKvaLpWVmbHbxwoLMk/YQ==
X-Received: by 2002:ac8:8d8:: with SMTP id y24mr4813183qth.155.1591815141297; 
 Wed, 10 Jun 2020 11:52:21 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-8080-2c5b-4fc8-1785-177e.inf6.spectrum.com.
 [2606:a000:1401:8080:2c5b:4fc8:1785:177e])
 by smtp.gmail.com with ESMTPSA id p185sm361440qkd.128.2020.06.10.11.52.19
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 10 Jun 2020 11:52:20 -0700 (PDT)
Date: Wed, 10 Jun 2020 14:52:18 -0400
From: Tom Rini <trini@konsulko.com>
To: Marek Vasut <marex@denx.de>
Message-ID: <20200610185218.GH24893@bill-the-cat>
References: <20200608092719.10643-1-patrick.delaunay@st.com>
 <20200610181019.GE24893@bill-the-cat>
 <9f331ffe-b156-8add-e098-69908b80cebf@denx.de>
MIME-Version: 1.0
In-Reply-To: <9f331ffe-b156-8add-e098-69908b80cebf@denx.de>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Patrick Delaunay <patrick.delaunay@st.com>,
 Joe Hershberger <joe.hershberger@ni.com>
Subject: Re: [Uboot-stm32] [PATCH] net: dwc_eth_qos: add Kconfig option to
 select supported configuration
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
Content-Type: multipart/mixed; boundary="===============4188741619666307008=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============4188741619666307008==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1xx5Q0+Cw+ObE54D"
Content-Disposition: inline


--1xx5Q0+Cw+ObE54D
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 10, 2020 at 08:42:20PM +0200, Marek Vasut wrote:
> On 6/10/20 8:10 PM, Tom Rini wrote:
> > On Mon, Jun 08, 2020 at 11:27:19AM +0200, Patrick Delaunay wrote:
> >=20
> >> Add configuration flag to select the supported dwc driver configuratio=
n:
> >> - CONFIG_DWC_ETH_QOS_TEGRA186
> >> - CONFIG_DWC_ETH_QOS_IMX
> >> - CONFIG_DWC_ETH_QOS_STM32
> >>
> >> See Linux driver ethernet/stmicro/stmmac and associated glue layers
> >> for other configuration examples.
> >>
> >> This patch removes the not-selected compatibles and lets the linker re=
move
> >> the unused functions to reduce the size of the driver.
> >>
> >> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> >> ---
> >> Hi,
> >>
> >> I propose this patch after Marek's remark in [1].
> >>
> >> It is also linked to [2] to limit the STM32 glue for ST compatible.
> >>
> >> [1] net: dwc_eth_qos: Make clk_rx and clk_tx optional
> >>     http://patchwork.ozlabs.org/project/uboot/patch/20200512095603.291=
26-5-david.wu@rock-chips.com/#2432595
> >>
> >> [2] net: dwc_eth_qos: update the compatible supported for STM32
> >>     http://patchwork.ozlabs.org/project/uboot/list/?series=3D176917
> >>
> >>
> >>  drivers/net/Kconfig       | 27 ++++++++++++++++++++++++---
> >>  drivers/net/dwc_eth_qos.c | 12 +++++++++---
> >>  2 files changed, 33 insertions(+), 6 deletions(-)
> >>
> >> diff --git a/drivers/net/Kconfig b/drivers/net/Kconfig
> >> index 0b08de0ef4..c4b3667d3b 100644
> >> --- a/drivers/net/Kconfig
> >> +++ b/drivers/net/Kconfig
> >> @@ -156,9 +156,30 @@ config DWC_ETH_QOS
> >>  	help
> >>  	  This driver supports the Synopsys Designware Ethernet QOS (Quality
> >>  	  Of Service) IP block. The IP supports many options for bus type,
> >> -	  clocking/reset structure, and feature list. This driver currently
> >> -	  supports the specific configuration used in NVIDIA's Tegra186 chip,
> >> -	  but should be extensible to other combinations quite easily.
> >> +	  clocking/reset structure, and feature list.
> >> +
> >> +config DWC_ETH_QOS_IMX
> >> +	bool "Synopsys DWC Ethernet QOS device support for IMX"
> >> +	depends on DWC_ETH_QOS
> >> +	help
> >> +	  The Synopsys Designware Ethernet QOS IP block with the specific
> >> +	  configuration used in IMX soc.
> >> +
> >> +config DWC_ETH_QOS_STM32
> >> +	bool "Synopsys DWC Ethernet QOS device support for STM32"
> >> +	depends on DWC_ETH_QOS
> >> +	default y if ARCH_STM32MP
> >> +	help
> >> +	  The Synopsys Designware Ethernet QOS IP block with the specific
> >> +	  configuration used in STM32MP soc.
> >> +
> >> +config DWC_ETH_QOS_TEGRA186
> >> +	bool "Synopsys DWC Ethernet QOS device support for TEGRA186"
> >> +	depends on DWC_ETH_QOS
> >> +	default y if TEGRA186
> >> +	help
> >> +	  The Synopsys Designware Ethernet QOS IP block with specific
> >> +	  configuration used in NVIDIA's Tegra186 chip.
> >> =20
> >>  config E1000
> >>  	bool "Intel PRO/1000 Gigabit Ethernet support"
> >=20
> > I like this idea.  But, is there a reason to have more than one of these
> > enabled?  Assuming not, we should do this as a choice I think so it'll
> > be clear to the next SoC that they'll need to add this table right away.
>=20
> Should we be able to enable different settings in U-Boot and in SPL ,
> e.g. for the use case where the SPL is the same on different SoCs, while
> the U-Boot binary is not ?

You mean be more like barebox and Linux where the board-specific stuff
is kicked up one level and we have a more generic binary?  I don't know
and there's so much work that would be required before having to move
this from a Kconfig choice to just Kconfig options I don't see that as
being a relevant question here.

Or did I misunderstand the question?

--=20
Tom

--1xx5Q0+Cw+ObE54D
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl7hK+IACgkQFHw5/5Y0
tywYsAv9GLX0EJsLUOF+4xYh0otJMDt5qpRvH3XgOqLBGelO1QdV/ONJ8S1pzYkz
qZx9FSrr7cFXf6IkRARoLFDk7HKyKnuFGjFKOwSG5EI0NsQsWhV9OojuytqL1AND
kxxDx3HmleNATh6TCk+cDx5iZi9sIsn8+m54Vn4wg7scsJbMB19OclALdgDNudNz
nTtbK0poGYyE4MvYmQ5LpMNtDBvQRnSJuaFEQGp4koFuoYBw43uCH9QHvPRGxoBg
0ghN6wyZAp0VZM1G6ol+n6JUJPvKStZCXuNdKQycxcUryIpby5SIVbCZqjqMKDE1
3VdU4Q5KFDgDTTf3DceWaaXy3jiWx3Ma/5fymVsCtcDbxftm4+tBe/+xeQWWZKHt
xamQmpCMEm4++nUBoyzpM58mXbNAjQKHyE4BAPLnnohiFzj6d/E/aRoDBhuIau0E
T5AnWFg7q5fyBCO3PwQv8k+Zr8nvlNu3qETGRnHfi8YgpsV9P1hZqiNqdE7T+G9a
6SAqjlRx
=hoLy
-----END PGP SIGNATURE-----

--1xx5Q0+Cw+ObE54D--

--===============4188741619666307008==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============4188741619666307008==--
