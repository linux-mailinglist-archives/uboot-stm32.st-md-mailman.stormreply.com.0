Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E041F5BA3
	for <lists+uboot-stm32@lfdr.de>; Wed, 10 Jun 2020 20:58:58 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 709FFC36B0D
	for <lists+uboot-stm32@lfdr.de>; Wed, 10 Jun 2020 18:58:57 +0000 (UTC)
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
 [209.85.222.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 993ACC36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Jun 2020 18:58:55 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id c185so3145348qke.7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Jun 2020 11:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=8g6dCDYNLl/Ij2+K7Yqr6OBn3G2WooaVIlq2YcfRE2c=;
 b=iF/JlQzHvfobTk4nTJQrloqdL8izWGKBs1PO7o3rUckR71a+dcgVTxt5sRuGNsN/PV
 Pr2FwPBL1dbgluRs5dqqXR5uH18sVvwcAInb9SOgy63zcaJrRdaYCIckvKLS8vjRrlJD
 NZqAXa0nhEU8YWe/lfYN271iqNr6pyI9Dplvs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=8g6dCDYNLl/Ij2+K7Yqr6OBn3G2WooaVIlq2YcfRE2c=;
 b=siqmISXkGjV9zluwhOWrxKVlCCfPVjv/kEC17szXcDiM+rJJ/IPwRzLBsJ7T6GHPHS
 +HOydoaq8+NjN2ja7j+yfbSHL5R9QmFHlKJbEtsLNth5fYibmwWTkZq0YWfRmKXiQnQ0
 bxOc3x4YbhNvk03aiapIghHCXbfMai7yk+TLCWx3ZYbtadnD744hvlpSijpANydTNkVf
 n85fQG/FhmLYhA81M0f2TTS4Jqhv2HM4G06lT4rDuwpOJ4hQozZuIAWZx1nasNg82PPG
 PVWtnKeir5IKLoXYSJDTyF/BvDbflbT4kjyjXmIPfEp/ApEUL96sUJqE8FMYvKooctkK
 ecgg==
X-Gm-Message-State: AOAM5314RP9VhcwUQErQY1u3ZOVCIArc/vxSLV7Sjp0g35s15bLitRRt
 0vPnJtcXuDBoYa7tKXjL8rmfNQ==
X-Google-Smtp-Source: ABdhPJw78FLt9/5/UyuQwSHZGHQA4tcoFBuYbQtqdlRb+kP31/zXxwY/FXmoPIlecYNrRI9axzM4Fw==
X-Received: by 2002:a37:9d81:: with SMTP id g123mr4342155qke.211.1591815534403; 
 Wed, 10 Jun 2020 11:58:54 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-8080-2c5b-4fc8-1785-177e.inf6.spectrum.com.
 [2606:a000:1401:8080:2c5b:4fc8:1785:177e])
 by smtp.gmail.com with ESMTPSA id p4sm448130qkf.53.2020.06.10.11.58.52
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 10 Jun 2020 11:58:53 -0700 (PDT)
Date: Wed, 10 Jun 2020 14:58:51 -0400
From: Tom Rini <trini@konsulko.com>
To: Marek Vasut <marex@denx.de>
Message-ID: <20200610185851.GI24893@bill-the-cat>
References: <20200608092719.10643-1-patrick.delaunay@st.com>
 <20200610181019.GE24893@bill-the-cat>
 <9f331ffe-b156-8add-e098-69908b80cebf@denx.de>
 <20200610185218.GH24893@bill-the-cat>
 <552c2b40-7aaf-c015-ca49-ef14ae6ac905@denx.de>
MIME-Version: 1.0
In-Reply-To: <552c2b40-7aaf-c015-ca49-ef14ae6ac905@denx.de>
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
Content-Type: multipart/mixed; boundary="===============2935318799303432189=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============2935318799303432189==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cKDw3XFoqocuprIa"
Content-Disposition: inline


--cKDw3XFoqocuprIa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 10, 2020 at 08:55:36PM +0200, Marek Vasut wrote:
> On 6/10/20 8:52 PM, Tom Rini wrote:
> > On Wed, Jun 10, 2020 at 08:42:20PM +0200, Marek Vasut wrote:
> >> On 6/10/20 8:10 PM, Tom Rini wrote:
> >>> On Mon, Jun 08, 2020 at 11:27:19AM +0200, Patrick Delaunay wrote:
> >>>
> >>>> Add configuration flag to select the supported dwc driver configurat=
ion:
> >>>> - CONFIG_DWC_ETH_QOS_TEGRA186
> >>>> - CONFIG_DWC_ETH_QOS_IMX
> >>>> - CONFIG_DWC_ETH_QOS_STM32
> >>>>
> >>>> See Linux driver ethernet/stmicro/stmmac and associated glue layers
> >>>> for other configuration examples.
> >>>>
> >>>> This patch removes the not-selected compatibles and lets the linker =
remove
> >>>> the unused functions to reduce the size of the driver.
> >>>>
> >>>> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> >>>> ---
> >>>> Hi,
> >>>>
> >>>> I propose this patch after Marek's remark in [1].
> >>>>
> >>>> It is also linked to [2] to limit the STM32 glue for ST compatible.
> >>>>
> >>>> [1] net: dwc_eth_qos: Make clk_rx and clk_tx optional
> >>>>     http://patchwork.ozlabs.org/project/uboot/patch/20200512095603.2=
9126-5-david.wu@rock-chips.com/#2432595
> >>>>
> >>>> [2] net: dwc_eth_qos: update the compatible supported for STM32
> >>>>     http://patchwork.ozlabs.org/project/uboot/list/?series=3D176917
> >>>>
> >>>>
> >>>>  drivers/net/Kconfig       | 27 ++++++++++++++++++++++++---
> >>>>  drivers/net/dwc_eth_qos.c | 12 +++++++++---
> >>>>  2 files changed, 33 insertions(+), 6 deletions(-)
> >>>>
> >>>> diff --git a/drivers/net/Kconfig b/drivers/net/Kconfig
> >>>> index 0b08de0ef4..c4b3667d3b 100644
> >>>> --- a/drivers/net/Kconfig
> >>>> +++ b/drivers/net/Kconfig
> >>>> @@ -156,9 +156,30 @@ config DWC_ETH_QOS
> >>>>  	help
> >>>>  	  This driver supports the Synopsys Designware Ethernet QOS (Quali=
ty
> >>>>  	  Of Service) IP block. The IP supports many options for bus type,
> >>>> -	  clocking/reset structure, and feature list. This driver currently
> >>>> -	  supports the specific configuration used in NVIDIA's Tegra186 ch=
ip,
> >>>> -	  but should be extensible to other combinations quite easily.
> >>>> +	  clocking/reset structure, and feature list.
> >>>> +
> >>>> +config DWC_ETH_QOS_IMX
> >>>> +	bool "Synopsys DWC Ethernet QOS device support for IMX"
> >>>> +	depends on DWC_ETH_QOS
> >>>> +	help
> >>>> +	  The Synopsys Designware Ethernet QOS IP block with the specific
> >>>> +	  configuration used in IMX soc.
> >>>> +
> >>>> +config DWC_ETH_QOS_STM32
> >>>> +	bool "Synopsys DWC Ethernet QOS device support for STM32"
> >>>> +	depends on DWC_ETH_QOS
> >>>> +	default y if ARCH_STM32MP
> >>>> +	help
> >>>> +	  The Synopsys Designware Ethernet QOS IP block with the specific
> >>>> +	  configuration used in STM32MP soc.
> >>>> +
> >>>> +config DWC_ETH_QOS_TEGRA186
> >>>> +	bool "Synopsys DWC Ethernet QOS device support for TEGRA186"
> >>>> +	depends on DWC_ETH_QOS
> >>>> +	default y if TEGRA186
> >>>> +	help
> >>>> +	  The Synopsys Designware Ethernet QOS IP block with specific
> >>>> +	  configuration used in NVIDIA's Tegra186 chip.
> >>>> =20
> >>>>  config E1000
> >>>>  	bool "Intel PRO/1000 Gigabit Ethernet support"
> >>>
> >>> I like this idea.  But, is there a reason to have more than one of th=
ese
> >>> enabled?  Assuming not, we should do this as a choice I think so it'll
> >>> be clear to the next SoC that they'll need to add this table right aw=
ay.
> >>
> >> Should we be able to enable different settings in U-Boot and in SPL ,
> >> e.g. for the use case where the SPL is the same on different SoCs, whi=
le
> >> the U-Boot binary is not ?
> >=20
> > You mean be more like barebox and Linux where the board-specific stuff
> > is kicked up one level and we have a more generic binary?  I don't know
> > and there's so much work that would be required before having to move
> > this from a Kconfig choice to just Kconfig options I don't see that as
> > being a relevant question here.
> >=20
> > Or did I misunderstand the question?
>=20
> More like automatically have a Kconfig option generate it's _SPL and
> _TPL variant.

Ah.  Well, that is rephrasing my first question.  Would it ever make
sense to have more than one of these enabled?

--=20
Tom

--cKDw3XFoqocuprIa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl7hLWsACgkQFHw5/5Y0
tywiCQwAlahwE1Dbbxhh2XZIO6dPyzHknU3RIYmklVPBri1jzLMVR+sC192aAq2f
uLwiKHzMxvGeWg9oe/5Xy5hgt+FHOO323Z8RNibNUQjBBdaz+DcWE33mSYd2F5gU
/nZHrsTsPaAT3nN9eIMdVkU/hoKxZVGsBZyN490VA8loZcgg1vrXXvo0R4qgEpzJ
ioz7yRqs7ez9QhW+yzW6ZkBsq+Pp/mB+uQY6jV6pjmru902wsZriTTOWDbx6cpjI
p9TwwjjqAhdNOLAqAOA9qNLih+oMFwSs9/Sfh0kY+WZWuooXkuB+Wsp6mJqjlsX7
RtCPm+yBfSSm30i+xKJ2P8YjmycW49TyPVKK9nO8rHra9Xgq7zEkMG5cSFRT5j/N
qTReElpNVpaCmQcXJimnrXsy7jZHmUeJY2/Rf7p4JPIDcj5OfzalzfwkdrgL4ufd
Yfhc0XBrbKUD6MB6Y7RhJpbKK6ikgHhU+mpOVW0KYYmkGWLsEBomDOlBJEZD7/NK
inceVGwU
=afGZ
-----END PGP SIGNATURE-----

--cKDw3XFoqocuprIa--

--===============2935318799303432189==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============2935318799303432189==--
