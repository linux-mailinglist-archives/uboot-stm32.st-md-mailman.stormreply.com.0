Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B890D1F5AFA
	for <lists+uboot-stm32@lfdr.de>; Wed, 10 Jun 2020 20:10:27 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A13C8C36B0D
	for <lists+uboot-stm32@lfdr.de>; Wed, 10 Jun 2020 18:10:26 +0000 (UTC)
Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com
 [209.85.219.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7E039C36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Jun 2020 18:10:24 +0000 (UTC)
Received: by mail-qv1-f67.google.com with SMTP id dp10so1448904qvb.10
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Jun 2020 11:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=qi7yw4HnaYlrCWH9vsuIdlHHO2ED+0h72ZybBOqjjHY=;
 b=MqKSEB0bD+jEzXs7i7yxKCCYLv92cLnAxnqjfND8XG7r8mg8R8cLuOgRA3YlqftbCR
 6g4jrwlG/yZCMWyxHABYvNEwBJVJBE/WXYi23KumuPYEtk2BX9GeyNSp07IBwYN9bDug
 Gs+SDZsiBnnHAWvp1394w4RvETKY1zwqHdQ7o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=qi7yw4HnaYlrCWH9vsuIdlHHO2ED+0h72ZybBOqjjHY=;
 b=KyRAMaCgHcbbqip8Lckk8SKO26e7Z3zvBD0nmFteLCiiGd2mTSiRoPCS5xj6Zu20rH
 grOYiuAiVMMVtYoBTWMZbc/H3JTGYUNrqiZf2FWgbgNNboy8BRrSWFYHub0LfL5KJs9S
 ziySOSQDlz1FwUnV6UpqhfcmTn7QWxo4T62xxd4yFVmILyEvD6YzbUeA9g0AbRvD8PwP
 Q8LDUVhcaYW4XCVzKB3WyvDgRjPZ9nTUsZay/As/iW4ZC+m/DEKsS8ue7XzN8/uGvHOc
 y+U/KH0aprkdRGQV1Aj3YwIIKEmVmg8NfG7gRdEAQcKnrBTBqgTxF98nHj06tdxoQJvF
 jsZA==
X-Gm-Message-State: AOAM532NDzOlKTD6+AcRObZpqYZQhZvoAVHjsr9sFHlcaeaqe9CrF4zA
 pEVEK00DJBUUgdoVo+2LbN0k5Q==
X-Google-Smtp-Source: ABdhPJwBgNSlrEK6vl4J0RnEggccGDGekWtMP7ZcRB8+DefrtkKBK7JpZE5MLtqkMY5sa66HSuaS+Q==
X-Received: by 2002:a0c:f494:: with SMTP id i20mr4326820qvm.179.1591812623081; 
 Wed, 10 Jun 2020 11:10:23 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-8080-2c5b-4fc8-1785-177e.inf6.spectrum.com.
 [2606:a000:1401:8080:2c5b:4fc8:1785:177e])
 by smtp.gmail.com with ESMTPSA id 195sm320234qkg.74.2020.06.10.11.10.21
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 10 Jun 2020 11:10:21 -0700 (PDT)
Date: Wed, 10 Jun 2020 14:10:19 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20200610181019.GE24893@bill-the-cat>
References: <20200608092719.10643-1-patrick.delaunay@st.com>
MIME-Version: 1.0
In-Reply-To: <20200608092719.10643-1-patrick.delaunay@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Marek Vasut <marex@denx.de>, u-boot@lists.denx.de,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
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
Content-Type: multipart/mixed; boundary="===============8691410464986962399=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============8691410464986962399==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KzTpGdFWKkiGyjCs"
Content-Disposition: inline


--KzTpGdFWKkiGyjCs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 08, 2020 at 11:27:19AM +0200, Patrick Delaunay wrote:

> Add configuration flag to select the supported dwc driver configuration:
> - CONFIG_DWC_ETH_QOS_TEGRA186
> - CONFIG_DWC_ETH_QOS_IMX
> - CONFIG_DWC_ETH_QOS_STM32
>=20
> See Linux driver ethernet/stmicro/stmmac and associated glue layers
> for other configuration examples.
>=20
> This patch removes the not-selected compatibles and lets the linker remove
> the unused functions to reduce the size of the driver.
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
> Hi,
>=20
> I propose this patch after Marek's remark in [1].
>=20
> It is also linked to [2] to limit the STM32 glue for ST compatible.
>=20
> [1] net: dwc_eth_qos: Make clk_rx and clk_tx optional
>     http://patchwork.ozlabs.org/project/uboot/patch/20200512095603.29126-=
5-david.wu@rock-chips.com/#2432595
>=20
> [2] net: dwc_eth_qos: update the compatible supported for STM32
>     http://patchwork.ozlabs.org/project/uboot/list/?series=3D176917
>=20
>=20
>  drivers/net/Kconfig       | 27 ++++++++++++++++++++++++---
>  drivers/net/dwc_eth_qos.c | 12 +++++++++---
>  2 files changed, 33 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/net/Kconfig b/drivers/net/Kconfig
> index 0b08de0ef4..c4b3667d3b 100644
> --- a/drivers/net/Kconfig
> +++ b/drivers/net/Kconfig
> @@ -156,9 +156,30 @@ config DWC_ETH_QOS
>  	help
>  	  This driver supports the Synopsys Designware Ethernet QOS (Quality
>  	  Of Service) IP block. The IP supports many options for bus type,
> -	  clocking/reset structure, and feature list. This driver currently
> -	  supports the specific configuration used in NVIDIA's Tegra186 chip,
> -	  but should be extensible to other combinations quite easily.
> +	  clocking/reset structure, and feature list.
> +
> +config DWC_ETH_QOS_IMX
> +	bool "Synopsys DWC Ethernet QOS device support for IMX"
> +	depends on DWC_ETH_QOS
> +	help
> +	  The Synopsys Designware Ethernet QOS IP block with the specific
> +	  configuration used in IMX soc.
> +
> +config DWC_ETH_QOS_STM32
> +	bool "Synopsys DWC Ethernet QOS device support for STM32"
> +	depends on DWC_ETH_QOS
> +	default y if ARCH_STM32MP
> +	help
> +	  The Synopsys Designware Ethernet QOS IP block with the specific
> +	  configuration used in STM32MP soc.
> +
> +config DWC_ETH_QOS_TEGRA186
> +	bool "Synopsys DWC Ethernet QOS device support for TEGRA186"
> +	depends on DWC_ETH_QOS
> +	default y if TEGRA186
> +	help
> +	  The Synopsys Designware Ethernet QOS IP block with specific
> +	  configuration used in NVIDIA's Tegra186 chip.
> =20
>  config E1000
>  	bool "Intel PRO/1000 Gigabit Ethernet support"

I like this idea.  But, is there a reason to have more than one of these
enabled?  Assuming not, we should do this as a choice I think so it'll
be clear to the next SoC that they'll need to add this table right away.
Thanks!

--=20
Tom

--KzTpGdFWKkiGyjCs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl7hIgMACgkQFHw5/5Y0
tyxDbgv/f+nzEUcV13q7oXssPly1ww96+IJ+dSmRHWwiGYf3tbjDmJ0OVVPHAW/T
TB99qHI+B3h/AKqVxNZcR/G051tkUt40/vKNzqqvUAr8KeGwhohWHNRX/tdJcoba
AAtT+NWdzlBb3XFjuA9cgq6GA9ieSd8E2qglxxLkF6uS6jjQOXZ+zc2HYl4rg0IU
NmlN31EgQWrd2bvPJujc7hZiweVDWEXw/NAWhFxVRK3wT3ZDrXFepRLE5yEYg4z4
8B31AILzIhFKQSoqjh6emh/4BB9D4DTy22Td1Hn0FuP4AhK0eb3Pnn/YxBNcmje1
LYV13O0EDYa8XZYf0MhjjM5k1Pv+/uYYx1O/PozaeWIvx9NQIVE1Lm6k/znSvx5K
0j9W/zOZxCcXa8cB9CJTtJPdcX3j2FHIUMSrT9M5duZSW7192DzIN1ruc+qR6JOk
ytqkIjZkuN0Hz8KX7DrLGnj1eg76O6UUvVhDm/wV5EHYd9XaQa9pNW83iKuPcQOe
RkQ4sZAX
=4ZFQ
-----END PGP SIGNATURE-----

--KzTpGdFWKkiGyjCs--

--===============8691410464986962399==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============8691410464986962399==--
