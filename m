Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F0F908934
	for <lists+uboot-stm32@lfdr.de>; Fri, 14 Jun 2024 12:06:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DB045C6C83A;
	Fri, 14 Jun 2024 10:06:03 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 86EE3C5E2CD
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Jun 2024 10:05:56 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45E7HmaZ017587;
 Fri, 14 Jun 2024 12:05:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 A6Ivds1TItrNmuKfVA2X3kccA54uR+wKdIryWiyp1gg=; b=QQUwFDxPq+obxZ3H
 CHucaqT3o/k1dJuG4eNCI8QGX+4rbhx1Jz69hY+eRCeQhMdC1c1ah/PX1Z1EqBRi
 nU/K6G8UA7SFI3sMgmgsGLMrStCF17gSwy0vB79u5Dok4J2D2Cl1dSTmY7969dbZ
 iBYINkjS6BgpjN99V+qpUaIbBrgRFJk0lid4TV75xaJ9TItQT1WdB4z6sWIQsRlw
 wdNz+UO9B6uQeYPZjJwPL4Dwl+ATGPqAapegt92eZo9GC1uSZkwG6T8oM35gkM/N
 WAT7CArQOVVDfPwFkC8C6aV5BLdBEa7qkBmF1Cty2Zrtu0fNTk9LnJCnyTAiqftZ
 zZciFQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ypbp30d82-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Jun 2024 12:05:46 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id DECA540045;
 Fri, 14 Jun 2024 12:05:41 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 769CF211967;
 Fri, 14 Jun 2024 12:05:16 +0200 (CEST)
Received: from [10.252.18.60] (10.252.18.60) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 14 Jun
 2024 12:05:15 +0200
Message-ID: <7537a3c5-aacb-441d-b966-dbee79e294b8@foss.st.com>
Date: Fri, 14 Jun 2024 12:05:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marek Vasut <marex@denx.de>, <u-boot@lists.denx.de>
References: <20240606130222.24530-1-marex@denx.de>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20240606130222.24530-1-marex@denx.de>
X-Originating-IP: [10.252.18.60]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-13_15,2024-06-13_02,2024-05-17_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>,
 u-boot@dh-electronics.com, uboot-stm32@st-md-mailman.stormreply.com
Subject: Re: [Uboot-stm32] [PATCH] ARM: dts: stm32: Auto-detect second MAC
 on STM32MP15xx DH electronics DHCOM
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



On 6/6/24 15:01, Marek Vasut wrote:
> Test whether this system is compatible with STM32MP15xx DHCOM SoM,
> if so, test whether R292 pull up is populated on pin PC3, which is
> an indication that the second MAC chip, KS8851-16MLL, is populated.
> Use this information to patch 'status' DT property into the second
> ethernet MAC DT node and enable/disable the MAC on systems where
> the chip is/isn't populated respectively.
> 
> Use spl_perform_fixups() to patch the U-Boot proper DT from SPL and
> ft_board_setup() to patch Linux DT from U-Boot proper. This way both
> software components are configured the same way.
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
>  arch/arm/dts/stm32mp15xx-dhcom-u-boot.dtsi |  1 +
>  board/dhelectronics/dh_stm32mp1/board.c    | 65 ++++++++++++++++++++++
>  2 files changed, 66 insertions(+)
> 
> diff --git a/arch/arm/dts/stm32mp15xx-dhcom-u-boot.dtsi b/arch/arm/dts/stm32mp15xx-dhcom-u-boot.dtsi
> index 1b445619325..d7b78cdcfa9 100644
> --- a/arch/arm/dts/stm32mp15xx-dhcom-u-boot.dtsi
> +++ b/arch/arm/dts/stm32mp15xx-dhcom-u-boot.dtsi
> @@ -26,6 +26,7 @@
>  		u-boot,error-led = "error";
>  		dh,som-coding-gpios = <&gpiof 12 0>, <&gpiof 13 0>, <&gpiof 15 0>;
>  		dh,ddr3-coding-gpios = <&gpioz 6 0>, <&gpioz 7 0>;
> +		dh,mac-coding-gpios = <&gpioc 3 0>;
>  	};
>  };
>  
> diff --git a/board/dhelectronics/dh_stm32mp1/board.c b/board/dhelectronics/dh_stm32mp1/board.c
> index 20c9d70737e..ebd45f9053f 100644
> --- a/board/dhelectronics/dh_stm32mp1/board.c
> +++ b/board/dhelectronics/dh_stm32mp1/board.c
> @@ -37,6 +37,7 @@
>  #include <power/regulator.h>
>  #include <remoteproc.h>
>  #include <reset.h>
> +#include <spl.h>
>  #include <syscon.h>
>  #include <usb.h>
>  #include <usb/dwc2_udc.h>
> @@ -672,12 +673,69 @@ void board_quiesce_devices(void)
>  #endif
>  }
>  
> +static void dh_stm32_ks8851_fixup(void *blob)
> +{
> +	struct gpio_desc ks8851intrn;
> +	bool compatible = false;
> +	int ks8851intrn_value;
> +	const char *prop;
> +	ofnode node;
> +	int idx = 0;
> +	int offset;
> +	int ret;
> +
> +	/* Do nothing if not STM32MP15xx DHCOM SoM */
> +	while ((prop = fdt_stringlist_get(blob, 0, "compatible", idx++, NULL))) {
> +		if (!strstr(prop, "dhcom-som"))
> +			continue;
> +		compatible = true;
> +		break;
> +	}
> +
> +	if (!compatible)
> +		return;
> +
> +	/*
> +	 * Read state of INTRN pull up resistor, if this pull up is populated,
> +	 * KS8851-16MLL is populated as well and should be enabled, otherwise
> +	 * it should be disabled.
> +	 */
> +	node = ofnode_path("/config");
> +	if (!ofnode_valid(node))
> +		return;
> +
> +	ret = gpio_request_by_name_nodev(node, "dh,mac-coding-gpios", 0,
> +					 &ks8851intrn, GPIOD_IS_IN);
> +	if (ret)
> +		return;
> +
> +	ks8851intrn_value = dm_gpio_get_value(&ks8851intrn);
> +
> +	dm_gpio_free(NULL, &ks8851intrn);
> +
> +	/* Set the 'status' property into KS8851-16MLL DT node. */
> +	offset = fdt_path_offset(blob, "ethernet1");
> +	ret = fdt_node_check_compatible(blob, offset, "micrel,ks8851-mll");
> +	if (ret)	/* Not compatible */
> +		return;
> +
> +	/* Add a bit of extra space for new 'status' property */
> +	ret = fdt_shrink_to_minimum(blob, 4096);
> +	if (!ret)
> +		return;
> +
> +	fdt_setprop_string(blob, offset, "status",
> +			   ks8851intrn_value ? "okay" : "disabled");
> +}
> +
>  #if defined(CONFIG_OF_BOARD_SETUP)
>  int ft_board_setup(void *blob, struct bd_info *bd)
>  {
>  	const char *buck3path = "/soc/i2c@5c002000/stpmic@33/regulators/buck3";
>  	int buck3off, ret, uv;
>  
> +	dh_stm32_ks8851_fixup(blob);
> +
>  	ret = board_get_regulator_buck3_nvm_uv_av96(&uv);
>  	if (ret)	/* Not Avenger96 board, do not patch Buck3 in DT. */
>  		return 0;
> @@ -698,6 +756,13 @@ int ft_board_setup(void *blob, struct bd_info *bd)
>  }
>  #endif
>  
> +#if defined(CONFIG_SPL_BUILD)
> +void spl_perform_fixups(struct spl_image_info *spl_image)
> +{
> +	dh_stm32_ks8851_fixup(spl_image_fdt_addr(spl_image));
> +}
> +#endif
> +
>  static void board_copro_image_process(ulong fw_image, size_t fw_size)
>  {
>  	int ret, id = 0; /* Copro id fixed to 0 as only one coproc on mp1 */


Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks

PAtrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
