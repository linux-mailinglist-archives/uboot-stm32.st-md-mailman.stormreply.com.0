Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D9AACD7B2
	for <lists+uboot-stm32@lfdr.de>; Wed,  4 Jun 2025 08:02:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 70115C3F95A;
	Wed,  4 Jun 2025 06:02:44 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 734D4C3F958
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Jun 2025 06:02:43 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5544aeia026862;
 Wed, 4 Jun 2025 08:02:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 hhABldEnOSkZRLXkF2I4yI2aQit9WEtS2svHfpYsGU0=; b=iI6oDnWDHpF6HKI8
 2+TgkiMDGYlSMkoG64H8kjvIFCxBzqJ4j1OGh/k7bL5rellp2WMVndnCYVXDazMG
 wb/fN+Zo1CDHmyApV0GMZdmuEfF+g0gxmZAngCFMilLecgV4L2uPCi2xuofY8YMi
 QJswUBnMzfOhs6ykkIBFTG3nRttiRkupic1ydp/2PP/plr1OFyTBCV8XaVIwbgPp
 aUAucoSnaBnzFP1Groy4sU8R/OrtB/1XfL56/J7TF+LuMtSG938vmOwLsRz072Tp
 xrsr2WDtAXejPeNiiWfsvHzUBAfysIi3OWwpo20ZkdzCZ5Q9Z2UfY8ikhENMJ95c
 yFeCWQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 471g93fhww-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 Jun 2025 08:02:38 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 862DD40072;
 Wed,  4 Jun 2025 08:01:45 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 416695C4F56;
 Wed,  4 Jun 2025 08:01:22 +0200 (CEST)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 4 Jun
 2025 08:01:21 +0200
Message-ID: <6a2349ea-b26b-4405-981e-4de175ef61af@foss.st.com>
Date: Wed, 4 Jun 2025 08:01:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: <u-boot@lists.denx.de>
References: <20250527132755.2169508-1-patrice.chotard@foss.st.com>
 <20250527132755.2169508-4-patrice.chotard@foss.st.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20250527132755.2169508-4-patrice.chotard@foss.st.com>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_01,2025-06-03_02,2025-03-28_01
Cc: Tom Rini <trini@konsulko.com>, Valentin Caron <valentin.caron@foss.st.com>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Sean Anderson <seanga2@gmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Lukasz Majewski <lukma@denx.de>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH v2 03/13] clk: stm32mp25: implement clock
 check security function
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



On 5/27/25 15:27, Patrice Chotard wrote:
> From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> 
> Check clock security to avoid access at boot time.
> 
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: Lukasz Majewski <lukma@denx.de>
> Cc: Sean Anderson <seanga2@gmail.com>
> ---
> 
> (no changes since v1)
> 
>  drivers/clk/stm32/clk-stm32-core.c |   2 +-
>  drivers/clk/stm32/clk-stm32-core.h |   2 +-
>  drivers/clk/stm32/clk-stm32mp13.c  |   2 +-
>  drivers/clk/stm32/clk-stm32mp25.c  | 449 ++++++++++++++++++-----------
>  4 files changed, 286 insertions(+), 169 deletions(-)
> 
> diff --git a/drivers/clk/stm32/clk-stm32-core.c b/drivers/clk/stm32/clk-stm32-core.c
> index cad07cc952e..358ee56682a 100644
> --- a/drivers/clk/stm32/clk-stm32-core.c
> +++ b/drivers/clk/stm32/clk-stm32-core.c
> @@ -41,7 +41,7 @@ int stm32_rcc_init(struct udevice *dev,
>  		const struct clock_config *cfg = &data->tab_clocks[i];
>  		struct clk *clk = ERR_PTR(-ENOENT);
>  
> -		if (data->check_security && data->check_security(priv->base, cfg))
> +		if (data->check_security && data->check_security(dev, priv->base, cfg))
>  			continue;
>  
>  		if (cfg->setup) {
> diff --git a/drivers/clk/stm32/clk-stm32-core.h b/drivers/clk/stm32/clk-stm32-core.h
> index f9ef0702005..c13204260a9 100644
> --- a/drivers/clk/stm32/clk-stm32-core.h
> +++ b/drivers/clk/stm32/clk-stm32-core.h
> @@ -127,7 +127,7 @@ struct stm32_clock_match_data {
>  	unsigned int num_clocks;
>  	const struct clock_config *tab_clocks;
>  	const struct clk_stm32_clock_data *clock_data;
> -	int (*check_security)(void __iomem *base,
> +	int (*check_security)(struct udevice *dev, void __iomem *base,
>  			      const struct clock_config *cfg);
>  };
>  
> diff --git a/drivers/clk/stm32/clk-stm32mp13.c b/drivers/clk/stm32/clk-stm32mp13.c
> index 362dba10252..ded0fdb4372 100644
> --- a/drivers/clk/stm32/clk-stm32mp13.c
> +++ b/drivers/clk/stm32/clk-stm32mp13.c
> @@ -769,7 +769,7 @@ static const struct clock_config stm32mp13_clock_cfg[] = {
>  			      GATE_TRACECK, DIV_TRACE),
>  };
>  
> -static int stm32mp13_check_security(void __iomem *base,
> +static int stm32mp13_check_security(struct udevice *dev, void __iomem *base,
>  				    const struct clock_config *cfg)
>  {
>  	int sec_id = cfg->sec_id;
> diff --git a/drivers/clk/stm32/clk-stm32mp25.c b/drivers/clk/stm32/clk-stm32mp25.c
> index 043dd2273e1..18c0b1cb867 100644
> --- a/drivers/clk/stm32/clk-stm32mp25.c
> +++ b/drivers/clk/stm32/clk-stm32mp25.c
> @@ -6,8 +6,10 @@
>  #include <clk-uclass.h>
>  #include <dm.h>
>  #include <dt-bindings/clock/st,stm32mp25-rcc.h>
> +#include <linux/bitfield.h>
>  #include <linux/clk-provider.h>
>  #include <linux/io.h>
> +#include <mach/rif.h>
>  
>  #include "clk-stm32-core.h"
>  #include "stm32mp25_rcc.h"
> @@ -15,6 +17,32 @@
>  /* Clock security definition */
>  #define SECF_NONE	-1
>  
> +#define RCC_REG_SIZE	32
> +#define RCC_SECCFGR(x)	(((x) / RCC_REG_SIZE) * 0x4 + RCC_SECCFGR0)
> +#define RCC_CIDCFGR(x)	((x) * 0x8 + RCC_R0CIDCFGR)
> +#define RCC_SEMCR(x)	((x) * 0x8 + RCC_R0SEMCR)
> +#define RCC_CID1	1
> +
> +/* Register: RIFSC_CIDCFGR */
> +#define RCC_CIDCFGR_CFEN	BIT(0)
> +#define RCC_CIDCFGR_SEM_EN	BIT(1)
> +#define RCC_CIDCFGR_SEMWLC1_EN	BIT(17)
> +#define RCC_CIDCFGR_SCID_MASK	GENMASK(6, 4)
> +
> +/* Register: RIFSC_SEMCR */
> +#define RCC_SEMCR_SEMCID_MASK	GENMASK(6, 4)
> +
> +#define STM32MP25_RIFRCC_DBG_ID		73
> +#define STM32MP25_RIFRCC_IS2M_ID	107
> +#define STM32MP25_RIFRCC_MCO1_ID	108
> +#define STM32MP25_RIFRCC_MCO2_ID	109
> +#define STM32MP25_RIFRCC_OSPI1_ID	110
> +#define STM32MP25_RIFRCC_OSPI2_ID	111
> +
> +#define SEC_RIFSC_FLAG		BIT(31)
> +#define SEC_RIFRCC(_id)		(STM32MP25_RIFRCC_##_id##_ID)
> +#define SEC_RIFSC(_id)		((_id) | SEC_RIFSC_FLAG)
> +
>  static const char * const adc12_src[] = {
>  	"ck_flexgen_46", "ck_icn_ls_mcu"
>  };
> @@ -355,279 +383,366 @@ static const struct stm32_gate_cfg stm32mp25_gates[GATE_NB] = {
>  	GATE_CFG(GATE_I3C4,		RCC_I3C4CFGR,		1,	0),
>  };
>  
> +static int stm32_rcc_get_access(struct udevice *dev, u32 index)
> +{
> +	fdt_addr_t rcc_base = dev_read_addr(dev->parent);
> +	u32 seccfgr, cidcfgr, semcr;
> +	int bit, cid;
> +
> +	bit = index % RCC_REG_SIZE;
> +
> +	seccfgr = readl(rcc_base + RCC_SECCFGR(index));
> +	if (seccfgr & BIT(bit))
> +		return -EACCES;
> +
> +	cidcfgr = readl(rcc_base + RCC_CIDCFGR(index));
> +	if (!(cidcfgr & RCC_CIDCFGR_CFEN))
> +		/* CID filtering is turned off: access granted */
> +		return 0;
> +
> +	if (!(cidcfgr & RCC_CIDCFGR_SEM_EN)) {
> +		/* Static CID mode */
> +		cid = FIELD_GET(RCC_CIDCFGR_SCID_MASK, cidcfgr);
> +		if (cid != RCC_CID1)
> +			return -EACCES;
> +		return 0;
> +	}
> +
> +	/* Pass-list with semaphore mode */
> +	if (!(cidcfgr & RCC_CIDCFGR_SEMWLC1_EN))
> +		return -EACCES;
> +
> +	semcr = readl(rcc_base + RCC_SEMCR(index));
> +
> +	cid = FIELD_GET(RCC_SEMCR_SEMCID_MASK, semcr);
> +	if (cid != RCC_CID1)
> +		return -EACCES;
> +
> +	return 0;
> +}
> +
> +static int stm32mp25_check_security(struct udevice *dev, void __iomem *base,
> +				    const struct clock_config *cfg)
> +{
> +	int ret = 0;
> +
> +	if (cfg->sec_id != SECF_NONE) {
> +		u32 index = (u32)cfg->sec_id;
> +
> +		if (index & SEC_RIFSC_FLAG)
> +			ret = stm32_rifsc_check_access_by_id(dev_ofnode(dev),
> +							     index & ~SEC_RIFSC_FLAG);
> +		else
> +			ret = stm32_rcc_get_access(dev, index);
> +	}
> +
> +	return ret;
> +}
>  #define STM32_COMPOSITE_NODIV(_id, _name, _flags, _sec_id, _gate_id, _mux_id)\
>  	STM32_COMPOSITE(_id, _name, _flags, _sec_id, _gate_id, _mux_id, NO_STM32_DIV)
>  
>  static const struct clock_config stm32mp25_clock_cfg[] = {
>  	/* ADC */
> -	STM32_GATE(CK_BUS_ADC12, "ck_icn_p_adc12", "ck_icn_ls_mcu", 0, GATE_ADC12, SECF_NONE),
> -	STM32_COMPOSITE_NODIV(CK_KER_ADC12, "ck_ker_adc12", 0, SECF_NONE, GATE_ADC12, MUX_ADC12),
> -	STM32_GATE(CK_BUS_ADC3, "ck_icn_p_adc3", "ck_icn_ls_mcu", 0, GATE_ADC3, SECF_NONE),
> -	STM32_COMPOSITE_NODIV(CK_KER_ADC3, "ck_ker_adc3", 0, SECF_NONE, GATE_ADC3, MUX_ADC3),
> +	STM32_GATE(CK_BUS_ADC12, "ck_icn_p_adc12", "ck_icn_ls_mcu", 0, GATE_ADC12,
> +		   SEC_RIFSC(58)),
> +	STM32_COMPOSITE_NODIV(CK_KER_ADC12, "ck_ker_adc12", 0, SEC_RIFSC(58),
> +			      GATE_ADC12, MUX_ADC12),
> +	STM32_GATE(CK_BUS_ADC3, "ck_icn_p_adc3", "ck_icn_ls_mcu", 0, GATE_ADC3, SEC_RIFSC(59)),
> +	STM32_COMPOSITE_NODIV(CK_KER_ADC3, "ck_ker_adc3", 0, SEC_RIFSC(59), GATE_ADC3, MUX_ADC3),
>  
>  	/* ADF */
> -	STM32_GATE(CK_BUS_ADF1, "ck_icn_p_adf1", "ck_icn_ls_mcu", 0, GATE_ADF1, SECF_NONE),
> -	STM32_GATE(CK_KER_ADF1, "ck_ker_adf1", "ck_flexgen_42", 0, GATE_ADF1, SECF_NONE),
> +	STM32_GATE(CK_BUS_ADF1, "ck_icn_p_adf1", "ck_icn_ls_mcu", 0, GATE_ADF1, SEC_RIFSC(55)),
> +	STM32_GATE(CK_KER_ADF1, "ck_ker_adf1", "ck_flexgen_42", 0, GATE_ADF1, SEC_RIFSC(55)),
>  
>  	/* Camera */
>  	/* DCMI */
> -	STM32_GATE(CK_BUS_CCI, "ck_icn_p_cci", "ck_icn_ls_mcu", 0, GATE_CCI, SECF_NONE),
> +	STM32_GATE(CK_BUS_CCI, "ck_icn_p_cci", "ck_icn_ls_mcu", 0, GATE_CCI, SEC_RIFSC(88)),
>  
>  	/* CSI-HOST */
> -	STM32_GATE(CK_BUS_CSI, "ck_icn_p_csi", "ck_icn_apb4", 0, GATE_CSI, SECF_NONE),
> -	STM32_GATE(CK_KER_CSI, "ck_ker_csi", "ck_flexgen_29", 0, GATE_CSI, SECF_NONE),
> -	STM32_GATE(CK_KER_CSITXESC, "ck_ker_csitxesc", "ck_flexgen_30", 0, GATE_CSI, SECF_NONE),
> +	STM32_GATE(CK_BUS_CSI, "ck_icn_p_csi", "ck_icn_apb4", 0, GATE_CSI, SEC_RIFSC(86)),
> +	STM32_GATE(CK_KER_CSI, "ck_ker_csi", "ck_flexgen_29", 0, GATE_CSI, SEC_RIFSC(86)),
> +	STM32_GATE(CK_KER_CSITXESC, "ck_ker_csitxesc", "ck_flexgen_30", 0, GATE_CSI,
> +		   SEC_RIFSC(86)),
>  
>  	/* CSI-PHY */
> -	STM32_GATE(CK_KER_CSIPHY, "ck_ker_csiphy", "ck_flexgen_31", 0, GATE_CSI, SECF_NONE),
> +	STM32_GATE(CK_KER_CSIPHY, "ck_ker_csiphy", "ck_flexgen_31", 0, GATE_CSI,
> +		   SEC_RIFSC(86)),
>  
>  	/* DCMIPP */
> -	STM32_GATE(CK_BUS_DCMIPP, "ck_icn_p_dcmipp", "ck_icn_apb4", 0, GATE_DCMIPP, SECF_NONE),
> +	STM32_GATE(CK_BUS_DCMIPP, "ck_icn_p_dcmipp", "ck_icn_apb4", 0, GATE_DCMIPP,
> +		   SEC_RIFSC(87)),
>  
>  	/* CRC */
> -	STM32_GATE(CK_BUS_CRC, "ck_icn_p_crc", "ck_icn_ls_mcu", 0, GATE_CRC, SECF_NONE),
> +	STM32_GATE(CK_BUS_CRC, "ck_icn_p_crc", "ck_icn_ls_mcu", 0, GATE_CRC, SEC_RIFSC(109)),
>  
>  	/* CRYP */
> -	STM32_GATE(CK_BUS_CRYP1, "ck_icn_p_cryp1", "ck_icn_ls_mcu", 0, GATE_CRYP1, SECF_NONE),
> -	STM32_GATE(CK_BUS_CRYP2, "ck_icn_p_cryp2", "ck_icn_ls_mcu", 0, GATE_CRYP2, SECF_NONE),
> +	STM32_GATE(CK_BUS_CRYP1, "ck_icn_p_cryp1", "ck_icn_ls_mcu", 0, GATE_CRYP1,
> +		   SEC_RIFSC(96)),
> +	STM32_GATE(CK_BUS_CRYP2, "ck_icn_p_cryp2", "ck_icn_ls_mcu", 0, GATE_CRYP2,
> +		   SEC_RIFSC(97)),
>  
>  	/* DBG & TRACE*/
> -	STM32_GATE(CK_KER_TSDBG, "ck_ker_tsdbg", "ck_flexgen_43", 0, GATE_DBG, SECF_NONE),
> -	STM32_GATE(CK_KER_TPIU, "ck_ker_tpiu", "ck_flexgen_44", 0, GATE_TRACE, SECF_NONE),
> -	STM32_GATE(CK_BUS_SYSATB, "ck_sys_atb", "ck_flexgen_45", 0, GATE_DBG, SECF_NONE),
> -	STM32_GATE(CK_BUS_ETR, "ck_icn_m_etr", "ck_flexgen_45", 0, GATE_ETR, SECF_NONE),
> +	/* Trace and debug clocks are managed by SCMI */
>  
>  	/* Display subsystem */
>  	/* LTDC */
> -	STM32_GATE(CK_BUS_LTDC, "ck_icn_p_ltdc", "ck_icn_apb4", 0, GATE_LTDC, SECF_NONE),
> -	STM32_GATE(CK_KER_LTDC, "ck_ker_ltdc", "ck_flexgen_27", CLK_SET_RATE_PARENT,
> -		   GATE_LTDC, SECF_NONE),
> +	STM32_GATE(CK_BUS_LTDC, "ck_icn_p_ltdc", "ck_icn_apb4", 0, GATE_LTDC, SEC_RIFSC(80)),
> +	STM32_GATE(CK_KER_LTDC, "ck_ker_ltdc", "ck_flexgen_27", CLK_SET_RATE_PARENT, GATE_LTDC,
> +		   SEC_RIFSC(80)),
>  
>  	/* DSI */
> -	STM32_GATE(CK_BUS_DSI, "ck_icn_p_dsi", "ck_icn_apb4", 0, GATE_DSI, SECF_NONE),
> -	STM32_COMPOSITE_NODIV(CK_KER_DSIBLANE, "clk_lanebyte", 0, SECF_NONE,
> +	STM32_GATE(CK_BUS_DSI, "ck_icn_p_dsi", "ck_icn_apb4", 0, GATE_DSI, SEC_RIFSC(81)),
> +	STM32_COMPOSITE_NODIV(CK_KER_DSIBLANE, "clk_lanebyte", 0, SEC_RIFSC(81),
>  			      GATE_DSI, MUX_DSIBLANE),
>  
>  	/* LVDS */
> -	STM32_GATE(CK_BUS_LVDS, "ck_icn_p_lvds", "ck_icn_apb4", 0, GATE_LVDS, SECF_NONE),
> +	STM32_GATE(CK_BUS_LVDS, "ck_icn_p_lvds", "ck_icn_apb4", 0, GATE_LVDS, SEC_RIFSC(84)),
>  
>  	/* DSI PHY */
> -	STM32_COMPOSITE_NODIV(CK_KER_DSIPHY, "ck_ker_dsiphy", 0, SECF_NONE, GATE_DSI, MUX_DSIPHY),
> +	STM32_COMPOSITE_NODIV(CK_KER_DSIPHY, "ck_ker_dsiphy", 0, SEC_RIFSC(81),
> +			      GATE_DSI, MUX_DSIPHY),
>  
>  	/* LVDS PHY */
> -	STM32_COMPOSITE_NODIV(CK_KER_LVDSPHY, "ck_ker_lvdsphy", 0,
> -			      SECF_NONE, GATE_LVDS, MUX_LVDSPHY),
> +	STM32_COMPOSITE_NODIV(CK_KER_LVDSPHY, "ck_ker_lvdsphy", 0, SEC_RIFSC(84),
> +			      GATE_LVDS, MUX_LVDSPHY),
>  
>  	/* DTS */
> -	STM32_COMPOSITE_NODIV(CK_KER_DTS, "ck_ker_dts", 0, SECF_NONE, GATE_DTS, MUX_DTS),
> +	STM32_COMPOSITE_NODIV(CK_KER_DTS, "ck_ker_dts", 0, SEC_RIFSC(107), GATE_DTS, MUX_DTS),
>  
>  	/* ETHERNET */
> -	STM32_GATE(CK_BUS_ETH1, "ck_icn_p_eth1", "ck_icn_ls_mcu", 0, GATE_ETH1, SECF_NONE),
> -	STM32_GATE(CK_ETH1_STP, "ck_ker_eth1stp", "ck_icn_ls_mcu", 0, GATE_ETH1STP, SECF_NONE),
> -	STM32_GATE(CK_KER_ETH1, "ck_ker_eth1", "ck_flexgen_54", 0, GATE_ETH1, SECF_NONE),
> -	STM32_GATE(CK_KER_ETH1, "ck_ker_eth1ptp", "ck_flexgen_56", 0, GATE_ETH1, SECF_NONE),
> -	STM32_GATE(CK_ETH1_MAC, "ck_ker_eth1mac", "ck_icn_ls_mcu", 0, GATE_ETH1MAC, SECF_NONE),
> -	STM32_GATE(CK_ETH1_TX, "ck_ker_eth1tx", "ck_icn_ls_mcu", 0, GATE_ETH1TX, SECF_NONE),
> -	STM32_GATE(CK_ETH1_RX, "ck_ker_eth1rx", "ck_icn_ls_mcu", 0, GATE_ETH1RX, SECF_NONE),
> -
> -	STM32_GATE(CK_BUS_ETH2, "ck_icn_p_eth2", "ck_icn_ls_mcu", 0, GATE_ETH2, SECF_NONE),
> -	STM32_GATE(CK_ETH2_STP, "ck_ker_eth2stp", "ck_icn_ls_mcu", 0, GATE_ETH2STP, SECF_NONE),
> -	STM32_GATE(CK_KER_ETH2, "ck_ker_eth2", "ck_flexgen_54", 0, GATE_ETH2, SECF_NONE),
> -	STM32_GATE(CK_KER_ETH2, "ck_ker_eth2ptp", "ck_flexgen_56", 0, GATE_ETH2, SECF_NONE),
> -	STM32_GATE(CK_ETH2_MAC, "ck_ker_eth2mac", "ck_icn_ls_mcu", 0, GATE_ETH2MAC, SECF_NONE),
> -	STM32_GATE(CK_ETH2_TX, "ck_ker_eth2tx", "ck_icn_ls_mcu", 0, GATE_ETH2TX, SECF_NONE),
> -	STM32_GATE(CK_ETH2_RX, "ck_ker_eth2rx", "ck_icn_ls_mcu", 0, GATE_ETH2RX, SECF_NONE),
> -
> -	STM32_GATE(CK_BUS_ETHSW, "ck_icn_p_ethsw", "ck_icn_ls_mcu", 0, GATE_ETHSWMAC, SECF_NONE),
> -	STM32_GATE(CK_KER_ETHSW, "ck_ker_ethsw", "ck_flexgen_54", 0, GATE_ETHSW, SECF_NONE),
> -	STM32_GATE(CK_KER_ETHSWREF, "ck_ker_ethswref", "ck_flexgen_60", 0,
> -		   GATE_ETHSWREF, SECF_NONE),
> +	STM32_GATE(CK_BUS_ETH1, "ck_icn_p_eth1", "ck_icn_ls_mcu", 0, GATE_ETH1, SEC_RIFSC(60)),
> +	STM32_GATE(CK_ETH1_STP, "ck_ker_eth1stp", "ck_icn_ls_mcu", 0, GATE_ETH1STP,
> +		   SEC_RIFSC(60)),
> +	STM32_GATE(CK_KER_ETH1, "ck_ker_eth1", "ck_flexgen_54", 0, GATE_ETH1, SEC_RIFSC(60)),
> +	STM32_GATE(CK_KER_ETH1, "ck_ker_eth1ptp", "ck_flexgen_56", 0, GATE_ETH1, SEC_RIFSC(60)),
> +	STM32_GATE(CK_ETH1_MAC, "ck_ker_eth1mac", "ck_icn_ls_mcu", 0, GATE_ETH1MAC,
> +		   SEC_RIFSC(60)),
> +	STM32_GATE(CK_ETH1_TX, "ck_ker_eth1tx", "ck_icn_ls_mcu", 0, GATE_ETH1TX, SEC_RIFSC(60)),
> +	STM32_GATE(CK_ETH1_RX, "ck_ker_eth1rx", "ck_icn_ls_mcu", 0, GATE_ETH1RX, SEC_RIFSC(60)),
> +
> +	STM32_GATE(CK_BUS_ETH2, "ck_icn_p_eth2", "ck_icn_ls_mcu", 0, GATE_ETH2, SEC_RIFSC(61)),
> +	STM32_GATE(CK_ETH2_STP, "ck_ker_eth2stp", "ck_icn_ls_mcu", 0, GATE_ETH2STP,
> +		   SEC_RIFSC(61)),
> +	STM32_GATE(CK_KER_ETH2, "ck_ker_eth2", "ck_flexgen_54", 0, GATE_ETH2, SEC_RIFSC(61)),
> +	STM32_GATE(CK_KER_ETH2, "ck_ker_eth2ptp", "ck_flexgen_56", 0, GATE_ETH2, SEC_RIFSC(61)),
> +	STM32_GATE(CK_ETH2_MAC, "ck_ker_eth2mac", "ck_icn_ls_mcu", 0, GATE_ETH2MAC,
> +		   SEC_RIFSC(61)),
> +	STM32_GATE(CK_ETH2_TX, "ck_ker_eth2tx", "ck_icn_ls_mcu", 0, GATE_ETH2TX, SEC_RIFSC(61)),
> +	STM32_GATE(CK_ETH2_RX, "ck_ker_eth2rx", "ck_icn_ls_mcu", 0, GATE_ETH2RX, SEC_RIFSC(61)),
> +
> +	STM32_GATE(CK_BUS_ETHSW, "ck_icn_p_ethsw", "ck_icn_ls_mcu", 0, GATE_ETHSWMAC,
> +		   SEC_RIFSC(70)),
> +	STM32_GATE(CK_KER_ETHSW, "ck_ker_ethsw", "ck_flexgen_54", 0, GATE_ETHSW,
> +		   SEC_RIFSC(70)),
> +	STM32_GATE(CK_KER_ETHSWREF, "ck_ker_ethswref", "ck_flexgen_60", 0, GATE_ETHSWREF,
> +		   SEC_RIFSC(70)),
>  
>  	/* FDCAN */
> -	STM32_GATE(CK_BUS_FDCAN, "ck_icn_p_fdcan", "ck_icn_apb2", 0, GATE_FDCAN, SECF_NONE),
> -	STM32_GATE(CK_KER_FDCAN, "ck_ker_fdcan", "ck_flexgen_26", 0, GATE_FDCAN, SECF_NONE),
> +	STM32_GATE(CK_BUS_FDCAN, "ck_icn_p_fdcan", "ck_icn_apb2", 0, GATE_FDCAN, SEC_RIFSC(56)),
> +	STM32_GATE(CK_KER_FDCAN, "ck_ker_fdcan", "ck_flexgen_26", 0, GATE_FDCAN, SEC_RIFSC(56)),
>  
>  	/* GPU */
> -	STM32_GATE(CK_BUS_GPU, "ck_icn_m_gpu", "ck_flexgen_59", 0, GATE_GPU, SECF_NONE),
> +	STM32_GATE(CK_BUS_GPU, "ck_icn_m_gpu", "ck_flexgen_59", 0, GATE_GPU, SEC_RIFSC(79)),
> +	STM32_GATE(CK_KER_GPU, "ck_ker_gpu", "ck_pll3", 0, GATE_GPU, SEC_RIFSC(79)),
>  
>  	/* HASH */
> -	STM32_GATE(CK_BUS_HASH, "ck_icn_p_hash", "ck_icn_ls_mcu", 0, GATE_HASH, SECF_NONE),
> +	STM32_GATE(CK_BUS_HASH, "ck_icn_p_hash", "ck_icn_ls_mcu", 0, GATE_HASH, SEC_RIFSC(95)),
>  
>  	/* HDP */
> -	STM32_GATE(CK_BUS_HDP, "ck_icn_p_hdp", "ck_icn_apb3", 0, GATE_HDP, SECF_NONE),
> +	STM32_GATE(CK_BUS_HDP, "ck_icn_p_hdp", "ck_icn_apb3", 0, GATE_HDP, SEC_RIFSC(57)),
>  
>  	/* I2C */
> -	STM32_GATE(CK_KER_I2C1, "ck_ker_i2c1", "ck_flexgen_12", 0, GATE_I2C1, SECF_NONE),
> -	STM32_GATE(CK_KER_I2C2, "ck_ker_i2c2", "ck_flexgen_12", 0, GATE_I2C2, SECF_NONE),
> -	STM32_GATE(CK_KER_I2C3, "ck_ker_i2c3", "ck_flexgen_13", 0, GATE_I2C3, SECF_NONE),
> -	STM32_GATE(CK_KER_I2C5, "ck_ker_i2c5", "ck_flexgen_13", 0, GATE_I2C5, SECF_NONE),
> -	STM32_GATE(CK_KER_I2C4, "ck_ker_i2c4", "ck_flexgen_14", 0, GATE_I2C4, SECF_NONE),
> -	STM32_GATE(CK_KER_I2C6, "ck_ker_i2c6", "ck_flexgen_14", 0, GATE_I2C6, SECF_NONE),
> -	STM32_GATE(CK_KER_I2C7, "ck_ker_i2c7", "ck_flexgen_15", 0, GATE_I2C7, SECF_NONE),
> -	STM32_GATE(CK_KER_I2C8, "ck_ker_i2c8", "ck_flexgen_38", 0, GATE_I2C8, SECF_NONE),
> +	STM32_GATE(CK_KER_I2C1, "ck_ker_i2c1", "ck_flexgen_12", 0, GATE_I2C1, SEC_RIFSC(41)),
> +	STM32_GATE(CK_KER_I2C2, "ck_ker_i2c2", "ck_flexgen_12", 0, GATE_I2C2, SEC_RIFSC(42)),
> +	STM32_GATE(CK_KER_I2C3, "ck_ker_i2c3", "ck_flexgen_13", 0, GATE_I2C3, SEC_RIFSC(43)),
> +	STM32_GATE(CK_KER_I2C5, "ck_ker_i2c5", "ck_flexgen_13", 0, GATE_I2C5, SEC_RIFSC(45)),
> +	STM32_GATE(CK_KER_I2C4, "ck_ker_i2c4", "ck_flexgen_14", 0, GATE_I2C4, SEC_RIFSC(44)),
> +	STM32_GATE(CK_KER_I2C6, "ck_ker_i2c6", "ck_flexgen_14", 0, GATE_I2C6, SEC_RIFSC(46)),
> +	STM32_GATE(CK_KER_I2C7, "ck_ker_i2c7", "ck_flexgen_15", 0, GATE_I2C7, SEC_RIFSC(47)),
> +	STM32_GATE(CK_KER_I2C8, "ck_ker_i2c8", "ck_flexgen_38", 0, GATE_I2C8, SEC_RIFSC(48)),
>  
>  	/* I3C */
> -	STM32_GATE(CK_KER_I3C1, "ck_ker_i3c1", "ck_flexgen_12", 0, GATE_I3C1, SECF_NONE),
> -	STM32_GATE(CK_KER_I3C2, "ck_ker_i3c2", "ck_flexgen_12", 0, GATE_I3C2, SECF_NONE),
> -	STM32_GATE(CK_KER_I3C3, "ck_ker_i3c3", "ck_flexgen_13", 0, GATE_I3C3, SECF_NONE),
> -	STM32_GATE(CK_KER_I3C4, "ck_ker_i3c4", "ck_flexgen_36", 0, GATE_I3C4, SECF_NONE),
> +	STM32_GATE(CK_KER_I3C1, "ck_ker_i3c1", "ck_flexgen_12", 0, GATE_I3C1, SEC_RIFSC(114)),
> +	STM32_GATE(CK_KER_I3C2, "ck_ker_i3c2", "ck_flexgen_12", 0, GATE_I3C2, SEC_RIFSC(115)),
> +	STM32_GATE(CK_KER_I3C3, "ck_ker_i3c3", "ck_flexgen_13", 0, GATE_I3C3, SEC_RIFSC(116)),
> +	STM32_GATE(CK_KER_I3C4, "ck_ker_i3c4", "ck_flexgen_36", 0, GATE_I3C4, SEC_RIFSC(117)),
>  
>  	/* I2S */
> -	STM32_GATE(CK_BUS_IS2M, "ck_icn_p_is2m", "ck_icn_apb3", 0, GATE_IS2M, SECF_NONE),
> +	STM32_GATE(CK_BUS_IS2M, "ck_icn_p_is2m", "ck_icn_apb3", 0, GATE_IS2M, SEC_RIFRCC(IS2M)),
>  
>  	/* IWDG */
> -	STM32_GATE(CK_BUS_IWDG1, "ck_icn_p_iwdg1", "ck_icn_apb3", 0, GATE_IWDG1, SECF_NONE),
> -	STM32_GATE(CK_BUS_IWDG2, "ck_icn_p_iwdg2", "ck_icn_apb3", 0, GATE_IWDG2, SECF_NONE),
> -	STM32_GATE(CK_BUS_IWDG3, "ck_icn_p_iwdg3", "ck_icn_apb3", 0, GATE_IWDG3, SECF_NONE),
> -	STM32_GATE(CK_BUS_IWDG4, "ck_icn_p_iwdg4", "ck_icn_apb3", 0, GATE_IWDG4, SECF_NONE),
> -	STM32_GATE(CK_BUS_IWDG5, "ck_icn_p_iwdg5", "ck_icn_ls_mcu", 0, GATE_IWDG5, SECF_NONE),
> +	STM32_GATE(CK_BUS_IWDG1, "ck_icn_p_iwdg1", "ck_icn_apb3", 0, GATE_IWDG1, SEC_RIFSC(98)),
> +	STM32_GATE(CK_BUS_IWDG2, "ck_icn_p_iwdg2", "ck_icn_apb3", 0, GATE_IWDG2, SEC_RIFSC(99)),
> +	STM32_GATE(CK_BUS_IWDG3, "ck_icn_p_iwdg3", "ck_icn_apb3", 0, GATE_IWDG3, SEC_RIFSC(100)),
> +	STM32_GATE(CK_BUS_IWDG4, "ck_icn_p_iwdg4", "ck_icn_apb3", 0, GATE_IWDG4, SEC_RIFSC(101)),
> +	STM32_GATE(CK_BUS_IWDG5, "ck_icn_p_iwdg5", "ck_icn_ls_mcu", 0, GATE_IWDG5,
> +		   SEC_RIFSC(102)),
>  
>  	/* LPTIM */
> -	STM32_GATE(CK_KER_LPTIM1, "ck_ker_lptim1", "ck_flexgen_07", 0, GATE_LPTIM1, SECF_NONE),
> -	STM32_GATE(CK_KER_LPTIM2, "ck_ker_lptim2", "ck_flexgen_07", 0, GATE_LPTIM2, SECF_NONE),
> -	STM32_GATE(CK_KER_LPTIM3, "ck_ker_lptim3", "ck_flexgen_40", 0, GATE_LPTIM3, SECF_NONE),
> -	STM32_GATE(CK_KER_LPTIM4, "ck_ker_lptim4", "ck_flexgen_41", 0, GATE_LPTIM4, SECF_NONE),
> -	STM32_GATE(CK_KER_LPTIM5, "ck_ker_lptim5", "ck_flexgen_41", 0, GATE_LPTIM5, SECF_NONE),
> +	STM32_GATE(CK_KER_LPTIM1, "ck_ker_lptim1", "ck_flexgen_07", 0, GATE_LPTIM1,
> +		   SEC_RIFSC(17)),
> +	STM32_GATE(CK_KER_LPTIM2, "ck_ker_lptim2", "ck_flexgen_07", 0, GATE_LPTIM2,
> +		   SEC_RIFSC(18)),
> +	STM32_GATE(CK_KER_LPTIM3, "ck_ker_lptim3", "ck_flexgen_40", 0, GATE_LPTIM3,
> +		   SEC_RIFSC(19)),
> +	STM32_GATE(CK_KER_LPTIM4, "ck_ker_lptim4", "ck_flexgen_41", 0, GATE_LPTIM4,
> +		   SEC_RIFSC(20)),
> +	STM32_GATE(CK_KER_LPTIM5, "ck_ker_lptim5", "ck_flexgen_41", 0, GATE_LPTIM5,
> +		   SEC_RIFSC(21)),
>  
>  	/* LPUART */
> -	STM32_GATE(CK_KER_LPUART1, "ck_ker_lpuart1", "ck_flexgen_39", 0, GATE_LPUART1, SECF_NONE),
> +	STM32_GATE(CK_KER_LPUART1, "ck_ker_lpuart1", "ck_flexgen_39", 0, GATE_LPUART1,
> +		   SEC_RIFSC(40)),
>  
>  	/* MCO1 & MCO2 */
> -	STM32_COMPOSITE_NODIV(CK_MCO1, "ck_mco1", 0, SECF_NONE, GATE_MCO1, MUX_MCO1),
> -	STM32_COMPOSITE_NODIV(CK_MCO2, "ck_mco2", 0, SECF_NONE, GATE_MCO2, MUX_MCO2),
> +	STM32_COMPOSITE_NODIV(CK_MCO1, "ck_mco1", 0, SEC_RIFRCC(MCO1), GATE_MCO1, MUX_MCO1),
> +	STM32_COMPOSITE_NODIV(CK_MCO2, "ck_mco2", 0, SEC_RIFRCC(MCO2), GATE_MCO2, MUX_MCO2),
>  
>  	/* MDF */
> -	STM32_GATE(CK_KER_MDF1, "ck_ker_mdf1", "ck_flexgen_23", 0, GATE_MDF1, SECF_NONE),
> +	STM32_GATE(CK_KER_MDF1, "ck_ker_mdf1", "ck_flexgen_23", 0, GATE_MDF1, SEC_RIFSC(54)),
>  
>  	/* OCTOSPI */
> -	STM32_GATE(CK_BUS_OSPI1, "ck_icn_s_ospi1,", "ck_icn_hs_mcu", 0, GATE_OSPI1, SECF_NONE),
> -	STM32_GATE(CK_BUS_OTFD1, "ck_icn_p_otfd1,", "ck_icn_hs_mcu", 0, GATE_OSPI1, SECF_NONE),
> -	STM32_GATE(CK_KER_OSPI1, "ck_ker_ospi1", "ck_flexgen_48", 0, GATE_OSPI1, SECF_NONE),
> -	STM32_GATE(CK_BUS_OSPI2, "ck_icn_s_ospi2,", "ck_icn_hs_mcu", 0, GATE_OSPI2, SECF_NONE),
> -	STM32_GATE(CK_BUS_OTFD2, "ck_icn_p_otfd2,", "ck_icn_hs_mcu", 0, GATE_OSPI2, SECF_NONE),
> -	STM32_GATE(CK_KER_OSPI2, "ck_ker_ospi2", "ck_flexgen_49", 0, GATE_OSPI2, SECF_NONE),
> -	STM32_GATE(CK_BUS_OSPIIOM, "ck_icn_p_ospiiom", "ck_icn_ls_mcu", 0, GATE_OSPIIOM, SECF_NONE),
> +	STM32_GATE(CK_BUS_OSPIIOM, "ck_icn_p_ospiiom", "ck_icn_ls_mcu", 0, GATE_OSPIIOM,
> +		   SEC_RIFSC(111)),
>  
>  	/* PCIE */
> -	STM32_GATE(CK_BUS_PCIE, "ck_icn_p_pcie", "ck_icn_ls_mcu", 0, GATE_PCIE, SECF_NONE),
> +	STM32_GATE(CK_BUS_PCIE, "ck_icn_p_pcie", "ck_icn_ls_mcu", 0, GATE_PCIE, SEC_RIFSC(68)),
>  
>  	/* PKA */
> -	STM32_GATE(CK_BUS_PKA, "ck_icn_p_pka", "ck_icn_ls_mcu", 0, GATE_PKA, SECF_NONE),
> +	STM32_GATE(CK_BUS_PKA, "ck_icn_p_pka", "ck_icn_ls_mcu", 0, GATE_PKA, SEC_RIFSC(93)),
>  
>  	/* RNG */
> -	STM32_GATE(CK_BUS_RNG, "ck_icn_p_rng", "ck_icn_ls_mcu", CLK_IGNORE_UNUSED,
> -		   GATE_RNG, SECF_NONE),
> +	STM32_GATE(CK_BUS_RNG, "ck_icn_p_rng", "ck_icn_ls_mcu", CLK_IGNORE_UNUSED, GATE_RNG,
> +		   SEC_RIFSC(92)),
>  
>  	/* SAES */
> -	STM32_GATE(CK_BUS_SAES, "ck_icn_p_saes", "ck_icn_ls_mcu", 0, GATE_SAES, SECF_NONE),
> +	STM32_GATE(CK_BUS_SAES, "ck_icn_p_saes", "ck_icn_ls_mcu", 0, GATE_SAES, SEC_RIFSC(94)),
>  
>  	/* SAI [1..4] */
> -	STM32_GATE(CK_BUS_SAI1, "ck_icn_p_sai1", "ck_icn_apb2", 0, GATE_SAI1, SECF_NONE),
> -	STM32_GATE(CK_BUS_SAI2, "ck_icn_p_sai2", "ck_icn_apb2", 0, GATE_SAI2, SECF_NONE),
> -	STM32_GATE(CK_BUS_SAI3, "ck_icn_p_sai3", "ck_icn_apb2", 0, GATE_SAI3, SECF_NONE),
> -	STM32_GATE(CK_BUS_SAI4, "ck_icn_p_sai4", "ck_icn_apb2", 0, GATE_SAI4, SECF_NONE),
> -	STM32_GATE(CK_KER_SAI1, "ck_ker_sai1", "ck_flexgen_23", 0, GATE_SAI1, SECF_NONE),
> -	STM32_GATE(CK_KER_SAI2, "ck_ker_sai2", "ck_flexgen_24", 0, GATE_SAI2, SECF_NONE),
> -	STM32_GATE(CK_KER_SAI3, "ck_ker_sai3", "ck_flexgen_25", 0, GATE_SAI3, SECF_NONE),
> -	STM32_GATE(CK_KER_SAI4, "ck_ker_sai4", "ck_flexgen_25", 0, GATE_SAI4, SECF_NONE),
> +	STM32_GATE(CK_BUS_SAI1, "ck_icn_p_sai1", "ck_icn_apb2", 0, GATE_SAI1, SEC_RIFSC(49)),
> +	STM32_GATE(CK_BUS_SAI2, "ck_icn_p_sai2", "ck_icn_apb2", 0, GATE_SAI2, SEC_RIFSC(50)),
> +	STM32_GATE(CK_BUS_SAI3, "ck_icn_p_sai3", "ck_icn_apb2", 0, GATE_SAI3, SEC_RIFSC(51)),
> +	STM32_GATE(CK_BUS_SAI4, "ck_icn_p_sai4", "ck_icn_apb2", 0, GATE_SAI4, SEC_RIFSC(52)),
> +	STM32_GATE(CK_KER_SAI1, "ck_ker_sai1", "ck_flexgen_23", 0, GATE_SAI1, SEC_RIFSC(49)),
> +	STM32_GATE(CK_KER_SAI2, "ck_ker_sai2", "ck_flexgen_24", 0, GATE_SAI2, SEC_RIFSC(50)),
> +	STM32_GATE(CK_KER_SAI3, "ck_ker_sai3", "ck_flexgen_25", 0, GATE_SAI3, SEC_RIFSC(51)),
> +	STM32_GATE(CK_KER_SAI4, "ck_ker_sai4", "ck_flexgen_25", 0, GATE_SAI4, SEC_RIFSC(52)),
>  
>  	/* SDMMC */
> -	STM32_GATE(CK_KER_SDMMC1, "ck_ker_sdmmc1", "ck_flexgen_51", 0, GATE_SDMMC1, SECF_NONE),
> -	STM32_GATE(CK_KER_SDMMC2, "ck_ker_sdmmc2", "ck_flexgen_52", 0, GATE_SDMMC2, SECF_NONE),
> -	STM32_GATE(CK_KER_SDMMC3, "ck_ker_sdmmc3", "ck_flexgen_53", 0, GATE_SDMMC3, SECF_NONE),
> +	STM32_GATE(CK_KER_SDMMC1, "ck_ker_sdmmc1", "ck_flexgen_51", 0, GATE_SDMMC1,
> +		   SEC_RIFSC(76)),
> +	STM32_GATE(CK_KER_SDMMC2, "ck_ker_sdmmc2", "ck_flexgen_52", 0, GATE_SDMMC2,
> +		   SEC_RIFSC(77)),
> +	STM32_GATE(CK_KER_SDMMC3, "ck_ker_sdmmc3", "ck_flexgen_53", 0, GATE_SDMMC3,
> +		   SEC_RIFSC(78)),
>  
>  	/* SERC */
> -	STM32_GATE(CK_BUS_SERC, "ck_icn_p_serc", "ck_icn_apb3", 0, GATE_SERC, SECF_NONE),
> +	STM32_GATE(CK_BUS_SERC, "ck_icn_p_serc", "ck_icn_apb3", 0, GATE_SERC, SEC_RIFSC(110)),
>  
>  	/* SPDIF */
> -	STM32_GATE(CK_KER_SPDIFRX, "ck_ker_spdifrx", "ck_flexgen_11", 0, GATE_SPDIFRX, SECF_NONE),
> +	STM32_GATE(CK_KER_SPDIFRX, "ck_ker_spdifrx", "ck_flexgen_11", 0, GATE_SPDIFRX,
> +		   SEC_RIFSC(30)),
>  
>  	/* SPI */
> -	STM32_GATE(CK_KER_SPI1, "ck_ker_spi1", "ck_flexgen_16", 0, GATE_SPI1, SECF_NONE),
> -	STM32_GATE(CK_KER_SPI2, "ck_ker_spi2", "ck_flexgen_10", 0, GATE_SPI2, SECF_NONE),
> -	STM32_GATE(CK_KER_SPI3, "ck_ker_spi3", "ck_flexgen_10", 0, GATE_SPI3, SECF_NONE),
> -	STM32_GATE(CK_KER_SPI4, "ck_ker_spi4", "ck_flexgen_17", 0, GATE_SPI4, SECF_NONE),
> -	STM32_GATE(CK_KER_SPI5, "ck_ker_spi5", "ck_flexgen_17", 0, GATE_SPI5, SECF_NONE),
> -	STM32_GATE(CK_KER_SPI6, "ck_ker_spi6", "ck_flexgen_18", 0, GATE_SPI6, SECF_NONE),
> -	STM32_GATE(CK_KER_SPI7, "ck_ker_spi7", "ck_flexgen_18", 0, GATE_SPI7, SECF_NONE),
> -	STM32_GATE(CK_KER_SPI8, "ck_ker_spi8", "ck_flexgen_37", 0, GATE_SPI8, SECF_NONE),
> +	STM32_GATE(CK_KER_SPI1, "ck_ker_spi1", "ck_flexgen_16", 0, GATE_SPI1, SEC_RIFSC(22)),
> +	STM32_GATE(CK_KER_SPI2, "ck_ker_spi2", "ck_flexgen_10", 0, GATE_SPI2, SEC_RIFSC(23)),
> +	STM32_GATE(CK_KER_SPI3, "ck_ker_spi3", "ck_flexgen_10", 0, GATE_SPI3, SEC_RIFSC(24)),
> +	STM32_GATE(CK_KER_SPI4, "ck_ker_spi4", "ck_flexgen_17", 0, GATE_SPI4, SEC_RIFSC(25)),
> +	STM32_GATE(CK_KER_SPI5, "ck_ker_spi5", "ck_flexgen_17", 0, GATE_SPI5, SEC_RIFSC(26)),
> +	STM32_GATE(CK_KER_SPI6, "ck_ker_spi6", "ck_flexgen_18", 0, GATE_SPI6, SEC_RIFSC(27)),
> +	STM32_GATE(CK_KER_SPI7, "ck_ker_spi7", "ck_flexgen_18", 0, GATE_SPI7, SEC_RIFSC(28)),
> +	STM32_GATE(CK_KER_SPI8, "ck_ker_spi8", "ck_flexgen_37", 0, GATE_SPI8, SEC_RIFSC(29)),
>  
>  	/* STGEN */
> -	STM32_GATE(CK_KER_STGEN, "ck_ker_stgen", "ck_flexgen_33", CLK_IGNORE_UNUSED,
> -		   GATE_STGEN, SECF_NONE),
> -
> -	/* STM500 */
> -	STM32_GATE(CK_BUS_STM500, "ck_icn_s_stm500", "ck_icn_ls_mcu", 0, GATE_STM500, SECF_NONE),
> +	STM32_GATE(CK_KER_STGEN, "ck_ker_stgen", "ck_flexgen_33", CLK_IGNORE_UNUSED, GATE_STGEN,
> +		   SEC_RIFSC(73)),
>  
>  	/* Timers */
> -	STM32_GATE(CK_KER_TIM2, "ck_ker_tim2", "timg1_ck", 0, GATE_TIM2, SECF_NONE),
> -	STM32_GATE(CK_KER_TIM3, "ck_ker_tim3", "timg1_ck", 0, GATE_TIM3, SECF_NONE),
> -	STM32_GATE(CK_KER_TIM4, "ck_ker_tim4", "timg1_ck", 0, GATE_TIM4, SECF_NONE),
> -	STM32_GATE(CK_KER_TIM5, "ck_ker_tim5", "timg1_ck", 0, GATE_TIM5, SECF_NONE),
> -	STM32_GATE(CK_KER_TIM6, "ck_ker_tim6", "timg1_ck", 0, GATE_TIM6, SECF_NONE),
> -	STM32_GATE(CK_KER_TIM7, "ck_ker_tim7", "timg1_ck", 0, GATE_TIM7, SECF_NONE),
> -	STM32_GATE(CK_KER_TIM10, "ck_ker_tim10", "timg1_ck", 0, GATE_TIM10, SECF_NONE),
> -	STM32_GATE(CK_KER_TIM11, "ck_ker_tim11", "timg1_ck", 0, GATE_TIM11, SECF_NONE),
> -	STM32_GATE(CK_KER_TIM12, "ck_ker_tim12", "timg1_ck", 0, GATE_TIM12, SECF_NONE),
> -	STM32_GATE(CK_KER_TIM13, "ck_ker_tim13", "timg1_ck", 0, GATE_TIM13, SECF_NONE),
> -	STM32_GATE(CK_KER_TIM14, "ck_ker_tim14", "timg1_ck", 0, GATE_TIM14, SECF_NONE),
> -
> -	STM32_GATE(CK_KER_TIM1, "ck_ker_tim1", "timg2_ck", 0, GATE_TIM1, SECF_NONE),
> -	STM32_GATE(CK_KER_TIM8, "ck_ker_tim8", "timg2_ck", 0, GATE_TIM8, SECF_NONE),
> -	STM32_GATE(CK_KER_TIM15, "ck_ker_tim15", "timg2_ck", 0, GATE_TIM15, SECF_NONE),
> -	STM32_GATE(CK_KER_TIM16, "ck_ker_tim16", "timg2_ck", 0, GATE_TIM16, SECF_NONE),
> -	STM32_GATE(CK_KER_TIM17, "ck_ker_tim17", "timg2_ck", 0, GATE_TIM17, SECF_NONE),
> -	STM32_GATE(CK_KER_TIM20, "ck_ker_tim20", "timg2_ck", 0, GATE_TIM20, SECF_NONE),
> +	STM32_GATE(CK_KER_TIM2, "ck_ker_tim2", "timg1_ck", 0, GATE_TIM2, SEC_RIFSC(1)),
> +	STM32_GATE(CK_KER_TIM3, "ck_ker_tim3", "timg1_ck", 0, GATE_TIM3, SEC_RIFSC(2)),
> +	STM32_GATE(CK_KER_TIM4, "ck_ker_tim4", "timg1_ck", 0, GATE_TIM4, SEC_RIFSC(3)),
> +	STM32_GATE(CK_KER_TIM5, "ck_ker_tim5", "timg1_ck", 0, GATE_TIM5, SEC_RIFSC(4)),
> +	STM32_GATE(CK_KER_TIM6, "ck_ker_tim6", "timg1_ck", 0, GATE_TIM6, SEC_RIFSC(5)),
> +	STM32_GATE(CK_KER_TIM7, "ck_ker_tim7", "timg1_ck", 0, GATE_TIM7, SEC_RIFSC(6)),
> +	STM32_GATE(CK_KER_TIM10, "ck_ker_tim10", "timg1_ck", 0, GATE_TIM10, SEC_RIFSC(8)),
> +	STM32_GATE(CK_KER_TIM11, "ck_ker_tim11", "timg1_ck", 0, GATE_TIM11, SEC_RIFSC(9)),
> +	STM32_GATE(CK_KER_TIM12, "ck_ker_tim12", "timg1_ck", 0, GATE_TIM12, SEC_RIFSC(10)),
> +	STM32_GATE(CK_KER_TIM13, "ck_ker_tim13", "timg1_ck", 0, GATE_TIM13, SEC_RIFSC(11)),
> +	STM32_GATE(CK_KER_TIM14, "ck_ker_tim14", "timg1_ck", 0, GATE_TIM14, SEC_RIFSC(12)),
> +
> +	STM32_GATE(CK_KER_TIM1, "ck_ker_tim1", "timg2_ck", 0, GATE_TIM1, SEC_RIFSC(0)),
> +	STM32_GATE(CK_KER_TIM8, "ck_ker_tim8", "timg2_ck", 0, GATE_TIM8, SEC_RIFSC(7)),
> +	STM32_GATE(CK_KER_TIM15, "ck_ker_tim15", "timg2_ck", 0, GATE_TIM15, SEC_RIFSC(13)),
> +	STM32_GATE(CK_KER_TIM16, "ck_ker_tim16", "timg2_ck", 0, GATE_TIM16, SEC_RIFSC(14)),
> +	STM32_GATE(CK_KER_TIM17, "ck_ker_tim17", "timg2_ck", 0, GATE_TIM17, SEC_RIFSC(15)),
> +	STM32_GATE(CK_KER_TIM20, "ck_ker_tim20", "timg2_ck", 0, GATE_TIM20, SEC_RIFSC(20)),
>  
>  	/* UART/USART */
> -	STM32_GATE(CK_KER_USART2, "ck_ker_usart2", "ck_flexgen_08", 0, GATE_USART2, SECF_NONE),
> -	STM32_GATE(CK_KER_UART4, "ck_ker_uart4", "ck_flexgen_08", 0, GATE_UART4, SECF_NONE),
> -	STM32_GATE(CK_KER_USART3, "ck_ker_usart3", "ck_flexgen_09", 0, GATE_USART3, SECF_NONE),
> -	STM32_GATE(CK_KER_UART5, "ck_ker_uart5", "ck_flexgen_09", 0, GATE_UART5, SECF_NONE),
> -	STM32_GATE(CK_KER_USART1, "ck_ker_usart1", "ck_flexgen_19", 0, GATE_USART1, SECF_NONE),
> -	STM32_GATE(CK_KER_USART6, "ck_ker_usart6", "ck_flexgen_20", 0, GATE_USART6, SECF_NONE),
> -	STM32_GATE(CK_KER_UART7, "ck_ker_uart7", "ck_flexgen_21", 0, GATE_UART7, SECF_NONE),
> -	STM32_GATE(CK_KER_UART8, "ck_ker_uart8", "ck_flexgen_21", 0, GATE_UART8, SECF_NONE),
> -	STM32_GATE(CK_KER_UART9, "ck_ker_uart9", "ck_flexgen_22", 0, GATE_UART9, SECF_NONE),
> +	STM32_GATE(CK_KER_USART2, "ck_ker_usart2", "ck_flexgen_08", 0, GATE_USART2,
> +		   SEC_RIFSC(32)),
> +	STM32_GATE(CK_KER_UART4, "ck_ker_uart4", "ck_flexgen_08", 0, GATE_UART4,
> +		   SEC_RIFSC(34)),
> +	STM32_GATE(CK_KER_USART3, "ck_ker_usart3", "ck_flexgen_09", 0, GATE_USART3,
> +		   SEC_RIFSC(33)),
> +	STM32_GATE(CK_KER_UART5, "ck_ker_uart5", "ck_flexgen_09", 0, GATE_UART5,
> +		   SEC_RIFSC(35)),
> +	STM32_GATE(CK_KER_USART1, "ck_ker_usart1", "ck_flexgen_19", 0, GATE_USART1,
> +		   SEC_RIFSC(31)),
> +	STM32_GATE(CK_KER_USART6, "ck_ker_usart6", "ck_flexgen_20", 0, GATE_USART6,
> +		   SEC_RIFSC(36)),
> +	STM32_GATE(CK_KER_UART7, "ck_ker_uart7", "ck_flexgen_21", 0, GATE_UART7,
> +		   SEC_RIFSC(37)),
> +	STM32_GATE(CK_KER_UART8, "ck_ker_uart8", "ck_flexgen_21", 0, GATE_UART8,
> +		   SEC_RIFSC(38)),
> +	STM32_GATE(CK_KER_UART9, "ck_ker_uart9", "ck_flexgen_22", 0, GATE_UART9,
> +		   SEC_RIFSC(39)),
>  
>  	/* USB2PHY1 */
> -	STM32_COMPOSITE_NODIV(CK_KER_USB2PHY1, "ck_ker_usb2phy1", 0,
> -			      SECF_NONE, GATE_USB2PHY1, MUX_USB2PHY1),
> +	STM32_COMPOSITE_NODIV(CK_KER_USB2PHY1, "ck_ker_usb2phy1", 0, SEC_RIFSC(63),
> +			      GATE_USB2PHY1, MUX_USB2PHY1),
>  
>  	/* USBH */
> -	STM32_GATE(CK_BUS_USB2OHCI, "ck_icn_m_usb2ohci", "ck_icn_hsl", 0, GATE_USBH, SECF_NONE),
> -	STM32_GATE(CK_BUS_USB2EHCI, "ck_icn_m_usb2ehci", "ck_icn_hsl", 0, GATE_USBH, SECF_NONE),
> +	STM32_GATE(CK_BUS_USB2OHCI, "ck_icn_m_usb2ohci", "ck_icn_hsl", 0, GATE_USBH,
> +		   SEC_RIFSC(63)),
> +	STM32_GATE(CK_BUS_USB2EHCI, "ck_icn_m_usb2ehci", "ck_icn_hsl", 0, GATE_USBH,
> +		   SEC_RIFSC(63)),
>  
>  	/* USB2PHY2 */
> -	STM32_COMPOSITE_NODIV(CK_KER_USB2PHY2EN, "ck_ker_usb2phy2_en", 0,
> -			      SECF_NONE, GATE_USB2PHY2, MUX_USB2PHY2),
> +	STM32_COMPOSITE_NODIV(CK_KER_USB2PHY2EN, "ck_ker_usb2phy2_en", 0, SEC_RIFSC(66),
> +			      GATE_USB2PHY2, MUX_USB2PHY2),
>  
>  	/* USB3 PCIe COMBOPHY */
> -	STM32_GATE(CK_BUS_USB3PCIEPHY, "ck_icn_p_usb3pciephy", "ck_icn_apb4", 0,
> -		   GATE_USB3PCIEPHY, SECF_NONE),
> +	STM32_GATE(CK_BUS_USB3PCIEPHY, "ck_icn_p_usb3pciephy", "ck_icn_apb4", 0, GATE_USB3PCIEPHY,
> +		   SEC_RIFSC(67)),
>  
> -	STM32_COMPOSITE_NODIV(CK_KER_USB3PCIEPHY, "ck_ker_usb3pciephy", 0,
> -			      SECF_NONE, GATE_USB3PCIEPHY, MUX_USB3PCIEPHY),
> +	STM32_COMPOSITE_NODIV(CK_KER_USB3PCIEPHY, "ck_ker_usb3pciephy", 0, SEC_RIFSC(67),
> +			      GATE_USB3PCIEPHY, MUX_USB3PCIEPHY),
>  
>  	/* USB3 DRD */
> -	STM32_GATE(CK_BUS_USB3DR, "ck_icn_m_usb3dr", "ck_icn_hsl", 0, GATE_USB3DR, SECF_NONE),
> -	STM32_GATE(CK_KER_USB2PHY2, "ck_ker_usb2phy2", "ck_flexgen_58", 0,
> -		   GATE_USB3DR, SECF_NONE),
> +	STM32_GATE(CK_BUS_USB3DR, "ck_icn_m_usb3dr", "ck_icn_hsl", 0, GATE_USB3DR,
> +		   SEC_RIFSC(66)),
> +	STM32_GATE(CK_KER_USB2PHY2, "ck_ker_usb2phy2", "ck_flexgen_58", 0, GATE_USB3DR,
> +		   SEC_RIFSC(66)),
>  
>  	/* UCPD */
> -	STM32_GATE(CK_BUS_USBTC, "ck_icn_p_usbtc", "ck_flexgen_35", 0, GATE_USBTC, SECF_NONE),
> -	STM32_GATE(CK_KER_USBTC, "ck_ker_usbtc", "ck_flexgen_35", 0, GATE_USBTC, SECF_NONE),
> +	STM32_GATE(CK_BUS_USBTC, "ck_icn_p_usbtc", "ck_flexgen_35", 0, GATE_USBTC,
> +		   SEC_RIFSC(69)),
> +	STM32_GATE(CK_KER_USBTC, "ck_ker_usbtc", "ck_flexgen_35", 0, GATE_USBTC,
> +		   SEC_RIFSC(69)),
>  
>  	/* VDEC / VENC */
> -	STM32_GATE(CK_BUS_VDEC, "ck_icn_p_vdec", "ck_icn_apb4", 0, GATE_VDEC, SECF_NONE),
> -	STM32_GATE(CK_BUS_VENC, "ck_icn_p_venc", "ck_icn_apb4", 0, GATE_VENC, SECF_NONE),
> +	STM32_GATE(CK_BUS_VDEC, "ck_icn_p_vdec", "ck_icn_apb4", 0, GATE_VDEC, SEC_RIFSC(89)),
> +	STM32_GATE(CK_BUS_VENC, "ck_icn_p_venc", "ck_icn_apb4", 0, GATE_VENC, SEC_RIFSC(90)),
>  
>  	/* VREF */
> -	STM32_GATE(CK_BUS_VREF, "ck_icn_p_vref", "ck_icn_apb3", 0, RCC_VREFCFGR, SECF_NONE),
> +	STM32_GATE(CK_BUS_VREF, "ck_icn_p_vref", "ck_icn_apb3", 0, RCC_VREFCFGR,
> +		   SEC_RIFSC(106)),
>  
>  	/* WWDG */
> -	STM32_GATE(CK_BUS_WWDG1, "ck_icn_p_wwdg1", "ck_icn_apb3", 0, GATE_WWDG1, SECF_NONE),
> -	STM32_GATE(CK_BUS_WWDG2, "ck_icn_p_wwdg2", "ck_icn_ls_mcu", 0, GATE_WWDG2, SECF_NONE),
> +	STM32_GATE(CK_BUS_WWDG1, "ck_icn_p_wwdg1", "ck_icn_apb3", 0, GATE_WWDG1,
> +		   SEC_RIFSC(103)),
> +	STM32_GATE(CK_BUS_WWDG2, "ck_icn_p_wwdg2", "ck_icn_ls_mcu", 0, GATE_WWDG2,
> +		   SEC_RIFSC(104)),
>  };
>  
>  static const struct stm32_clock_match_data stm32mp25_data = {
> @@ -638,6 +753,8 @@ static const struct stm32_clock_match_data stm32mp25_data = {
>  		.gates		= stm32mp25_gates,
>  		.muxes		= stm32mp25_muxes,
>  	},
> +	.check_security = stm32mp25_check_security,
> +
>  };
>  
>  static int stm32mp25_clk_probe(struct udevice *dev)
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
