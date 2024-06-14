Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EB60E908B48
	for <lists+uboot-stm32@lfdr.de>; Fri, 14 Jun 2024 14:11:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 99CE1C6B460;
	Fri, 14 Jun 2024 12:11:53 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C47F8C5E2CD
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Jun 2024 12:11:46 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45EC1lkN017638;
 Fri, 14 Jun 2024 14:11:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 z2NwmJBgONX8N4vOalNdLFUhrvblCiI7FaiYN+dXunA=; b=0NOdi4BLN5izzXBJ
 0UBtgLJW3a8nhXGNTTr7Mkmbl+r5GhyLNSXLUmSclpzT5tiMrLbUorcB8OqzzaOO
 Kix3JWWYzEqe8OnBSJkz05LAoM0xiiXhO23GUQAHO4K24x9emcnb8HpBJky4iAmo
 nKrDkel6me3cJzULQkt1U5tgos8QP9LrmJHSX+BA+rnHD5xNbjqyncsLGtrQmp9A
 mH3gpms59SsGmT6qlPh0hodPpZ3W9QV2fmYsEkbp4fozVtzbtHmH7iD2IAuw9AYz
 4YCyxGWkM+66bw8zgpUspD3JTq2NOxL1Px9zNk4OYW6z7upY5yQf+i95fLSbjwd4
 3LCL5Q==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ypbp30vxh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Jun 2024 14:11:36 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 8308440045;
 Fri, 14 Jun 2024 14:11:32 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 240552138D0;
 Fri, 14 Jun 2024 14:11:08 +0200 (CEST)
Received: from [10.252.18.60] (10.252.18.60) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 14 Jun
 2024 14:11:07 +0200
Message-ID: <61d4952b-d1cf-43bd-8bfd-0f96881f67b2@foss.st.com>
Date: Fri, 14 Jun 2024 14:11:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marek Vasut <marex@denx.de>, <u-boot@lists.denx.de>
References: <20240516234737.201250-1-marex@denx.de>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20240516234737.201250-1-marex@denx.de>
X-Originating-IP: [10.252.18.60]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-14_09,2024-06-14_03,2024-05-17_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>,
 u-boot@dh-electronics.com, uboot-stm32@st-md-mailman.stormreply.com
Subject: Re: [Uboot-stm32] [PATCH] ARM: dts: stm32: Add generic SoM
 compatible to STM32MP15xx DH electronics DHSOM
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>



On 5/17/24 01:47, Marek Vasut wrote:
> Add generic SoM compatible string into machine compatible string
> for all STM32MP15xx based DH electronics DHSOM. This way, common
> board code can match on this compatible. No functional change.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Cc: Simon Glass <sjg@chromium.org>
> Cc: Tom Rini <trini@konsulko.com>
> Cc: u-boot@dh-electronics.com
> Cc: u-boot@lists.denx.de
> Cc: uboot-stm32@st-md-mailman.stormreply.com
> ---
>  arch/arm/dts/stm32mp15xx-dhcom-drc02.dts       | 4 +++-
>  arch/arm/dts/stm32mp15xx-dhcom-pdk2.dts        | 4 +++-
>  arch/arm/dts/stm32mp15xx-dhcom-picoitx.dts     | 4 +++-
>  arch/arm/dts/stm32mp15xx-dhcor-avenger96.dts   | 4 +++-
>  arch/arm/dts/stm32mp15xx-dhcor-drc-compact.dts | 4 +++-
>  arch/arm/dts/stm32mp15xx-dhcor-testbench.dts   | 4 +++-
>  6 files changed, 18 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm/dts/stm32mp15xx-dhcom-drc02.dts b/arch/arm/dts/stm32mp15xx-dhcom-drc02.dts
> index 1ef9ac29cea..90625bf6b60 100644
> --- a/arch/arm/dts/stm32mp15xx-dhcom-drc02.dts
> +++ b/arch/arm/dts/stm32mp15xx-dhcom-drc02.dts
> @@ -11,5 +11,7 @@
>  
>  / {
>  	model = "DH Electronics STM32MP15xx DHCOM DRC02";
> -	compatible = "dh,stm32mp15xx-dhcom-drc02", "st,stm32mp1xx";
> +	compatible = "dh,stm32mp15xx-dhcom-drc02",
> +		     "dh,stm32mp15xx-dhcom-som",
> +		     "st,stm32mp1xx";
>  };
> diff --git a/arch/arm/dts/stm32mp15xx-dhcom-pdk2.dts b/arch/arm/dts/stm32mp15xx-dhcom-pdk2.dts
> index e2e01e2146c..b2e450aa13b 100644
> --- a/arch/arm/dts/stm32mp15xx-dhcom-pdk2.dts
> +++ b/arch/arm/dts/stm32mp15xx-dhcom-pdk2.dts
> @@ -11,5 +11,7 @@
>  
>  / {
>  	model = "STMicroelectronics STM32MP15xx DHCOM Premium Developer Kit (2)";
> -	compatible = "dh,stm32mp15xx-dhcom-pdk2", "st,stm32mp15x";
> +	compatible = "dh,stm32mp15xx-dhcom-pdk2",
> +		     "dh,stm32mp15xx-dhcom-som",
> +		     "st,stm32mp15x";
>  };
> diff --git a/arch/arm/dts/stm32mp15xx-dhcom-picoitx.dts b/arch/arm/dts/stm32mp15xx-dhcom-picoitx.dts
> index 06770b47873..3e908102f61 100644
> --- a/arch/arm/dts/stm32mp15xx-dhcom-picoitx.dts
> +++ b/arch/arm/dts/stm32mp15xx-dhcom-picoitx.dts
> @@ -11,5 +11,7 @@
>  
>  / {
>  	model = "DH Electronics STM32MP15xx DHCOM PicoITX";
> -	compatible = "dh,stm32mp15xx-dhcom-picoitx", "st,stm32mp1xx";
> +	compatible = "dh,stm32mp15xx-dhcom-picoitx",
> +		     "dh,stm32mp15xx-dhcom-som",
> +		     "st,stm32mp1xx";
>  };
> diff --git a/arch/arm/dts/stm32mp15xx-dhcor-avenger96.dts b/arch/arm/dts/stm32mp15xx-dhcor-avenger96.dts
> index 76ac5a873c1..dd8fcecbca5 100644
> --- a/arch/arm/dts/stm32mp15xx-dhcor-avenger96.dts
> +++ b/arch/arm/dts/stm32mp15xx-dhcor-avenger96.dts
> @@ -14,5 +14,7 @@
>  
>  / {
>  	model = "Arrow Electronics STM32MP15xx Avenger96 board";
> -	compatible = "arrow,stm32mp15xx-avenger96", "st,stm32mp15x";
> +	compatible = "arrow,stm32mp15xx-avenger96",
> +		     "dh,stm32mp15xx-dhcor-som",
> +		     "st,stm32mp15x";
>  };
> diff --git a/arch/arm/dts/stm32mp15xx-dhcor-drc-compact.dts b/arch/arm/dts/stm32mp15xx-dhcor-drc-compact.dts
> index 77dd944ff53..c1f99c1685e 100644
> --- a/arch/arm/dts/stm32mp15xx-dhcor-drc-compact.dts
> +++ b/arch/arm/dts/stm32mp15xx-dhcor-drc-compact.dts
> @@ -12,5 +12,7 @@
>  
>  / {
>  	model = "DH electronics STM32MP15xx DHCOR DRC Compact";
> -	compatible = "dh,stm32mp15xx-dhcor-drc-compact", "st,stm32mp1xx";
> +	compatible = "dh,stm32mp15xx-dhcor-drc-compact",
> +		     "dh,stm32mp15xx-dhcor-som",
> +		     "st,stm32mp1xx";
>  };
> diff --git a/arch/arm/dts/stm32mp15xx-dhcor-testbench.dts b/arch/arm/dts/stm32mp15xx-dhcor-testbench.dts
> index c9163e1c028..5fdd762ddbf 100644
> --- a/arch/arm/dts/stm32mp15xx-dhcor-testbench.dts
> +++ b/arch/arm/dts/stm32mp15xx-dhcor-testbench.dts
> @@ -9,7 +9,9 @@
>  
>  / {
>  	model = "DH electronics STM32MP15xx DHCOR Testbench";
> -	compatible = "dh,stm32mp15xx-dhcor-testbench", "st,stm32mp1xx";
> +	compatible = "dh,stm32mp15xx-dhcor-testbench",
> +		     "dh,stm32mp15xx-dhcor-som",
> +		     "st,stm32mp1xx";
>  
>  	aliases {
>  		ethernet0 = &ethernet0;
Applied to u-boot-stm32/next

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
