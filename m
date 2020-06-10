Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0361F5C79
	for <lists+uboot-stm32@lfdr.de>; Wed, 10 Jun 2020 22:11:54 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4C555C36B0D
	for <lists+uboot-stm32@lfdr.de>; Wed, 10 Jun 2020 20:11:54 +0000 (UTC)
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
 [209.85.160.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 988F1C36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Jun 2020 20:11:53 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id c12so2822574qtq.11
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Jun 2020 13:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=vMfbUn/bwoyUEJ2qxVAOxPEHt1Vevs8pM6vOFQqRWTo=;
 b=qWF5q48a1stDQ5gi8GfMxluhm9WpqGupXErdzP2nqM9u1+U4agiNn9Xeawx0ELrwq8
 zhB7uj/V+kE34N/H4YNl2ZoYrJ/Rv8OEDqhLOmBAG3HVy4Ob5LwkbaqJLY93lkAn0AZa
 1uBqBskz1FzoeFfm434K/HXdEMeX/kVa+CyhQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=vMfbUn/bwoyUEJ2qxVAOxPEHt1Vevs8pM6vOFQqRWTo=;
 b=TykHzwk11lhtAD0O4unYIi5HCqowVfnbcPajjWkJKpSt/nc9IW7sgjcIt9mir9Nm3v
 Bh6pE93gaUedrZ4n9aBxBdGh+nO3EOZjFSWK8VWTL78jZTA2ZwmC+NxlElZipO680FgM
 6mjo9XZ+HXbEfO7IkW6/1MFYq9zzVaBvxEtGeBurqcauFUhjdSN8xcrZ/jBH7HJPZ6X6
 mVIJ0RAMr1SO0wTftnmBWSbIvADOCMKII9BsS/xVhQOihT0t17jskyX7FaCaYb3BlxYE
 4R6djsyB6Kg3Fpc5IN6slcSku7i8WDOPuD0vye2OxljrHO15JmVNlUTPAe8cYhlBKXJN
 Yz9w==
X-Gm-Message-State: AOAM530jN0A+3VL9nrFDfeqkx7gjbAsWqB2kCIz9rfiHaDNwLFQlvlr9
 5NH75nJB9J/OR/mOeYbSyuv0HQ==
X-Google-Smtp-Source: ABdhPJzpk8jW5ubnjZUkMnKUbB5iXYY+hIOdTuxKbIowxe1tbpKt71fbBxp8DL42vvelAh6QqZ7vSQ==
X-Received: by 2002:ac8:5245:: with SMTP id y5mr5213925qtn.368.1591819912193; 
 Wed, 10 Jun 2020 13:11:52 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-8080-2c5b-4fc8-1785-177e.inf6.spectrum.com.
 [2606:a000:1401:8080:2c5b:4fc8:1785:177e])
 by smtp.gmail.com with ESMTPSA id z19sm797317qtz.81.2020.06.10.13.11.50
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 10 Jun 2020 13:11:50 -0700 (PDT)
Date: Wed, 10 Jun 2020 16:11:48 -0400
From: Tom Rini <trini@konsulko.com>
To: Marek Vasut <marex@denx.de>
Message-ID: <20200610201148.GJ24893@bill-the-cat>
References: <20200608092719.10643-1-patrick.delaunay@st.com>
 <20200610181019.GE24893@bill-the-cat>
 <9f331ffe-b156-8add-e098-69908b80cebf@denx.de>
 <20200610185218.GH24893@bill-the-cat>
 <552c2b40-7aaf-c015-ca49-ef14ae6ac905@denx.de>
 <20200610185851.GI24893@bill-the-cat>
 <ca74b5b5-3de3-c249-16d5-c5e1de742dc2@denx.de>
MIME-Version: 1.0
In-Reply-To: <ca74b5b5-3de3-c249-16d5-c5e1de742dc2@denx.de>
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
Content-Type: multipart/mixed; boundary="===============8695353700032566713=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============8695353700032566713==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1RkCiX/UEfbG28Bk"
Content-Disposition: inline


--1RkCiX/UEfbG28Bk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 10, 2020 at 09:01:39PM +0200, Marek Vasut wrote:
> On 6/10/20 8:58 PM, Tom Rini wrote:
> > On Wed, Jun 10, 2020 at 08:55:36PM +0200, Marek Vasut wrote:
> >> On 6/10/20 8:52 PM, Tom Rini wrote:
> >>> On Wed, Jun 10, 2020 at 08:42:20PM +0200, Marek Vasut wrote:
> >>>> On 6/10/20 8:10 PM, Tom Rini wrote:
> >>>>> On Mon, Jun 08, 2020 at 11:27:19AM +0200, Patrick Delaunay wrote:
> >>>>>
> >>>>>> Add configuration flag to select the supported dwc driver configur=
ation:
> >>>>>> - CONFIG_DWC_ETH_QOS_TEGRA186
> >>>>>> - CONFIG_DWC_ETH_QOS_IMX
> >>>>>> - CONFIG_DWC_ETH_QOS_STM32
> >>>>>>
> >>>>>> See Linux driver ethernet/stmicro/stmmac and associated glue layers
> >>>>>> for other configuration examples.
> >>>>>>
> >>>>>> This patch removes the not-selected compatibles and lets the linke=
r remove
> >>>>>> the unused functions to reduce the size of the driver.
> >>>>>>
> >>>>>> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> >>>>>> ---
> >>>>>> Hi,
> >>>>>>
> >>>>>> I propose this patch after Marek's remark in [1].
> >>>>>>
> >>>>>> It is also linked to [2] to limit the STM32 glue for ST compatible.
> >>>>>>
> >>>>>> [1] net: dwc_eth_qos: Make clk_rx and clk_tx optional
> >>>>>>     http://patchwork.ozlabs.org/project/uboot/patch/20200512095603=
=2E29126-5-david.wu@rock-chips.com/#2432595
> >>>>>>
> >>>>>> [2] net: dwc_eth_qos: update the compatible supported for STM32
> >>>>>>     http://patchwork.ozlabs.org/project/uboot/list/?series=3D176917
> >>>>>>
> >>>>>>
> >>>>>>  drivers/net/Kconfig       | 27 ++++++++++++++++++++++++---
> >>>>>>  drivers/net/dwc_eth_qos.c | 12 +++++++++---
> >>>>>>  2 files changed, 33 insertions(+), 6 deletions(-)
> >>>>>>
> >>>>>> diff --git a/drivers/net/Kconfig b/drivers/net/Kconfig
> >>>>>> index 0b08de0ef4..c4b3667d3b 100644
> >>>>>> --- a/drivers/net/Kconfig
> >>>>>> +++ b/drivers/net/Kconfig
> >>>>>> @@ -156,9 +156,30 @@ config DWC_ETH_QOS
> >>>>>>  	help
> >>>>>>  	  This driver supports the Synopsys Designware Ethernet QOS (Qua=
lity
> >>>>>>  	  Of Service) IP block. The IP supports many options for bus typ=
e,
> >>>>>> -	  clocking/reset structure, and feature list. This driver curren=
tly
> >>>>>> -	  supports the specific configuration used in NVIDIA's Tegra186 =
chip,
> >>>>>> -	  but should be extensible to other combinations quite easily.
> >>>>>> +	  clocking/reset structure, and feature list.
> >>>>>> +
> >>>>>> +config DWC_ETH_QOS_IMX
> >>>>>> +	bool "Synopsys DWC Ethernet QOS device support for IMX"
> >>>>>> +	depends on DWC_ETH_QOS
> >>>>>> +	help
> >>>>>> +	  The Synopsys Designware Ethernet QOS IP block with the specific
> >>>>>> +	  configuration used in IMX soc.
> >>>>>> +
> >>>>>> +config DWC_ETH_QOS_STM32
> >>>>>> +	bool "Synopsys DWC Ethernet QOS device support for STM32"
> >>>>>> +	depends on DWC_ETH_QOS
> >>>>>> +	default y if ARCH_STM32MP
> >>>>>> +	help
> >>>>>> +	  The Synopsys Designware Ethernet QOS IP block with the specific
> >>>>>> +	  configuration used in STM32MP soc.
> >>>>>> +
> >>>>>> +config DWC_ETH_QOS_TEGRA186
> >>>>>> +	bool "Synopsys DWC Ethernet QOS device support for TEGRA186"
> >>>>>> +	depends on DWC_ETH_QOS
> >>>>>> +	default y if TEGRA186
> >>>>>> +	help
> >>>>>> +	  The Synopsys Designware Ethernet QOS IP block with specific
> >>>>>> +	  configuration used in NVIDIA's Tegra186 chip.
> >>>>>> =20
> >>>>>>  config E1000
> >>>>>>  	bool "Intel PRO/1000 Gigabit Ethernet support"
> >>>>>
> >>>>> I like this idea.  But, is there a reason to have more than one of =
these
> >>>>> enabled?  Assuming not, we should do this as a choice I think so it=
'll
> >>>>> be clear to the next SoC that they'll need to add this table right =
away.
> >>>>
> >>>> Should we be able to enable different settings in U-Boot and in SPL ,
> >>>> e.g. for the use case where the SPL is the same on different SoCs, w=
hile
> >>>> the U-Boot binary is not ?
> >>>
> >>> You mean be more like barebox and Linux where the board-specific stuff
> >>> is kicked up one level and we have a more generic binary?  I don't kn=
ow
> >>> and there's so much work that would be required before having to move
> >>> this from a Kconfig choice to just Kconfig options I don't see that as
> >>> being a relevant question here.
> >>>
> >>> Or did I misunderstand the question?
> >>
> >> More like automatically have a Kconfig option generate it's _SPL and
> >> _TPL variant.
> >=20
> > Ah.  Well, that is rephrasing my first question.  Would it ever make
> > sense to have more than one of these enabled?
>=20
> For some sort of universal SPL, maybe ?

So no, there's not a reason today then and it should be a choice.
Thanks!

--=20
Tom

--1RkCiX/UEfbG28Bk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl7hPoEACgkQFHw5/5Y0
tyzxHQwAhbaq/4wuFiYjIVE8ctv1xxY5YS6tC3w/0TI/OQALuPbfmuAl4vCQKsM1
WT1pD9UqKAOgpVvJwUeGNy//fiqcZGVEZuTY4MDkRgRWYkhWHqnIhYvX5I6GBauR
1X5HVisYmQa+3fCbJkSD6UeSGnX/DdKdhkhOoGhHMFLEaqwWQVqVTL5KmUpBxm3A
L1o1qayy2NqRnL/Cu2VBzyjl+deo1MJxql2Ml6Rr5vOjGl1OId1nB3QP6wOM/mIY
UqEPrufk/jr4+LmxsXuRKj5fnHQkQ9fhW+oSjvRnQ33b2CGz4jA/j/0gnhPJbbN8
+lwiSReV55BKXtdV1q7ZaBc4hK7yI2aOzvGz7Fw1juKsy4bNnS4zWudXjy5/yGNK
caqyFS+BrcPY/kMNkldRg1Mp28dqsE4yF0NFGzoMyXsCbFeU9lTCIA+zrRnx6qSk
f3wot3CRAmjuLPoSq03KMdBm3sKCEjNnhSmXMqKsHQ0K1/IgqcGSrbqW//GsI0Ti
qijvlvRL
=txcn
-----END PGP SIGNATURE-----

--1RkCiX/UEfbG28Bk--

--===============8695353700032566713==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============8695353700032566713==--
