Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 92AC5770598
	for <lists+uboot-stm32@lfdr.de>; Fri,  4 Aug 2023 18:06:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 510D1C6B463;
	Fri,  4 Aug 2023 16:06:08 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 43E0EC65E4F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Aug 2023 16:06:07 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 374E2oI5015431; Fri, 4 Aug 2023 18:05:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=VUlZUQ8UviXR+q3R6864QIlGu+f8LOonQnWmoXqOon0=; b=iY
 TY0RXwuF1G6MLo5cLH9gQ+F4bldGIYuK2CuEawRvEHABk6WxHaDhCMGMcCNRnFpS
 x6hH5SPQZHOsdE8ZtOiyImuiJc3/q6YtZOd0cjeIDAFtehBcxsFwEB3M+TKNVF6s
 6TX8pLqbI3cwPXcWRjaRcpToAfzDxI23QWamPjrxd43Kafect02Tqn2KBoKN1B8a
 pzpA4ZSSXIJ7wCYPAVCNiArhIvC/YU4BYfZiWz1pXnkhS522zZ952NIFAJUXy3gp
 ffcRNxxowgVwQw/03lxYiPhS/P+gJrUKdBCNI3vFfR+O3sBFWAiqctSrT+od8snd
 mPqV78YZOygwCsFKvf2w==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3s92rf8jrm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Aug 2023 18:05:57 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 07B7E10004F;
 Fri,  4 Aug 2023 18:05:56 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F3E52228A5A;
 Fri,  4 Aug 2023 18:05:55 +0200 (CEST)
Received: from [10.201.20.38] (10.201.20.38) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Fri, 4 Aug
 2023 18:05:55 +0200
Message-ID: <7d43d26b-fbf5-e5c1-f8b8-ca7a2740e155@foss.st.com>
Date: Fri, 4 Aug 2023 18:05:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, <u-boot@lists.denx.de>
References: <20230726235807.497657-1-marex@denx.de>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20230726235807.497657-1-marex@denx.de>
X-Originating-IP: [10.201.20.38]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-04_15,2023-08-03_01,2023-05-22_02
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com, u-boot@dh-electronics.com
Subject: Re: [Uboot-stm32] [PATCH v2] ARM: dts: stm32: Switch DWMAC RMII
 clock to MCO2 on DHCOM
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



On 7/27/23 01:58, Marek Vasut wrote:
> The DHCOM SoM has two options for supplying ETHRX clock to the DWMAC
> block and PHY. Either (1) ETHCK_K generates 50 MHz clock on ETH_CLK
> pad for the PHY and the same 50 MHz clock are fed back to ETHRX via
> internal eth_clk_fb clock connection OR (2) ETH_CLK is not used at
> all, MCO2 generates 50 MHz clock on MCO2 output pad for the PHY and
> the same MCO2 clock are fed back into ETHRX via ETH_RX_CLK input pad
> using external pad-to-pad connection.
> 
> Option (1) has two downsides. ETHCK_K is supplied directly from either
> PLL3_Q or PLL4_P, hence the PLL output is limited to exactly 50 MHz and
> since the same PLL output is also used to supply SDMMC blocks, the
> performance of SD and eMMC access is affected. The second downside is
> that using this option, the EMI of the SoM is higher.
> 
> Option (2) solves both of those problems, so implement it here. In this
> case, the PLL4_P is no longer limited and can be operated faster, at
> 100 MHz, which improves SDMMC performance (read performance is improved
> from ~41 MiB/s to ~57 MiB/s with dd if=/dev/mmcblk1 of=/dev/null bs=64M
> count=1). The EMI interference also decreases.
> 
> Ported from Linux kernel commit
> 73ab99aad50cd ("ARM: dts: stm32: Switch DWMAC RMII clock to MCO2 on DHCOM")
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Cc: u-boot@dh-electronics.com
> Cc: uboot-stm32@st-md-mailman.stormreply.com
> ---
> V2: Add U-Boot specifics to cater also for clock and clock-names in stm32mp151.dtsi
> ---
>  arch/arm/dts/stm32mp15xx-dhcom-som.dtsi    | 22 ++++++++++++++++++----
>  arch/arm/dts/stm32mp15xx-dhcom-u-boot.dtsi | 14 ++++++++++++++
>  2 files changed, 32 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm/dts/stm32mp15xx-dhcom-som.dtsi b/arch/arm/dts/stm32mp15xx-dhcom-som.dtsi
> index 83e2c87713f..238a611192e 100644
> --- a/arch/arm/dts/stm32mp15xx-dhcom-som.dtsi
> +++ b/arch/arm/dts/stm32mp15xx-dhcom-som.dtsi
> @@ -118,13 +118,12 @@
>  
>  &ethernet0 {
>  	status = "okay";
> -	pinctrl-0 = <&ethernet0_rmii_pins_a>;
> -	pinctrl-1 = <&ethernet0_rmii_sleep_pins_a>;
> +	pinctrl-0 = <&ethernet0_rmii_pins_c &mco2_pins_a>;
> +	pinctrl-1 = <&ethernet0_rmii_sleep_pins_c &mco2_sleep_pins_a>;
>  	pinctrl-names = "default", "sleep";
>  	phy-mode = "rmii";
>  	max-speed = <100>;
>  	phy-handle = <&phy0>;
> -	st,eth-ref-clk-sel;
>  
>  	mdio0 {
>  		#address-cells = <1>;
> @@ -136,7 +135,7 @@
>  			/* LAN8710Ai */
>  			compatible = "ethernet-phy-id0007.c0f0",
>  				     "ethernet-phy-ieee802.3-c22";
> -			clocks = <&rcc ETHCK_K>;
> +			clocks = <&rcc CK_MCO2>;
>  			reset-gpios = <&gpioh 3 GPIO_ACTIVE_LOW>;
>  			reset-assert-us = <500>;
>  			reset-deassert-us = <500>;
> @@ -446,6 +445,21 @@
>  	};
>  };
>  
> +&rcc {
> +	/* Connect MCO2 output to ETH_RX_CLK input via pad-pad connection */
> +	clocks = <&rcc CK_MCO2>;
> +	clock-names = "ETH_RX_CLK/ETH_REF_CLK";
> +
> +	/*
> +	 * Set PLL4P output to 100 MHz to supply SDMMC with faster clock,
> +	 * set MCO2 output to 50 MHz to supply ETHRX clock with PLL4P/2,
> +	 * so that MCO2 behaves as a divider for the ETHRX clock here.
> +	 */
> +	assigned-clocks = <&rcc CK_MCO2>, <&rcc PLL4_P>;
> +	assigned-clock-parents = <&rcc PLL4_P>;
> +	assigned-clock-rates = <50000000>, <100000000>;
> +};
> +
>  &rng1 {
>  	status = "okay";
>  };
> diff --git a/arch/arm/dts/stm32mp15xx-dhcom-u-boot.dtsi b/arch/arm/dts/stm32mp15xx-dhcom-u-boot.dtsi
> index bc0730cf2bd..ff5e9034951 100644
> --- a/arch/arm/dts/stm32mp15xx-dhcom-u-boot.dtsi
> +++ b/arch/arm/dts/stm32mp15xx-dhcom-u-boot.dtsi
> @@ -126,6 +126,20 @@
>  };
>  
>  &rcc {
> +	/*
> +	 * Reinstate clock names from stm32mp151.dtsi, the MCO2 trick
> +	 * used in stm32mp15xx-dhcom-som.dtsi is not supported by the
> +	 * U-Boot clock framework.
> +	 */
> +	clock-names = "hse", "hsi", "csi", "lse", "lsi";
> +	clocks = <&clk_hse>, <&clk_hsi>, <&clk_csi>,
> +		 <&clk_lse>, <&clk_lsi>;
> +
> +	/* The MCO2 is already configured correctly, remove those. */
> +	/delete-property/ assigned-clocks;
> +	/delete-property/ assigned-clock-parents;
> +	/delete-property/ assigned-clock-rates;
> +
>  	st,clksrc = <
>  		CLK_MPU_PLL1P
>  		CLK_AXI_PLL2P
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
