Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 226D8B16E63
	for <lists+uboot-stm32@lfdr.de>; Thu, 31 Jul 2025 11:20:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D8319C3F933;
	Thu, 31 Jul 2025 09:20:19 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CE02CC36B27
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 31 Jul 2025 09:20:18 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56V9Ehig002503;
 Thu, 31 Jul 2025 11:19:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 SdQTT1/gv7w1VWfV5Tk/DiGVup0fE+vVnCMLbt8HaTs=; b=ecOC1oNUj+U56gxJ
 uJVbEDY91xnqCanStRMv9lW/jGetPQYPEhhgIPsmgnAXUUaKnP4/jtGu/ecJaKlO
 gnCpA+rxxN2TtaH7CkYNpbJe2Q3RbVpxroyUtPG7QOyDMz7TJR3A8sh9ugxAOiu6
 VAKZ868maxmf5oH+75C773Qku2HD05CiwX26YDru/PWQGVHkmjmjmENW79g/NWxq
 qNV/F/oXF9KrpPuMy4R/Soyg/UNR0RZ3nGcnKDqarKMqEEpNFlWP1ejyNRYAQvuz
 tOdtJ+00E63bT+YQhud5E6GRpVwG6QJk0HroG+aP5S2Hvun/tobONbQI2KWWuZzt
 0S73qQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4859ynu60j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 31 Jul 2025 11:19:50 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id D868140058;
 Thu, 31 Jul 2025 11:18:53 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 958C47530B4;
 Thu, 31 Jul 2025 11:18:21 +0200 (CEST)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 31 Jul
 2025 11:18:20 +0200
Message-ID: <dc20598a-d2b1-451d-87ee-54909a9cbff1@foss.st.com>
Date: Thu, 31 Jul 2025 11:18:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marek Vasut <marek.vasut@mailbox.org>, <u-boot@lists.denx.de>
References: <20250630001053.952342-1-marek.vasut@mailbox.org>
 <20250630001053.952342-4-marek.vasut@mailbox.org>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20250630001053.952342-4-marek.vasut@mailbox.org>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-31_01,2025-07-31_01,2025-03-28_01
Cc: Tom Rini <trini@konsulko.com>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>, u-boot@dh-electronics.com,
 Cheick Traore <cheick.traore@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Sughosh Ganu <sughosh.ganu@linaro.org>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Lionel Debieve <lionel.debieve@foss.st.com>,
 Pascal Zimmermann <pzimmermann@dh-electronics.com>,
 Simon Glass <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [PATCH v2 04/10] ARM: stm32: Add STM32MP13xx PMIC
 initialization for DDR3 DRAM type
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



On 6/30/25 02:10, Marek Vasut wrote:
> The STM32MP13xx PMIC initialization for DDR3 DRAM type is similar
> to the STM32MP15xx PMIC initialization, except the VTT rail is not
> enabled. Fill in the STM32MP13xx support.
> 
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
> ---
> Cc: Cheick Traore <cheick.traore@foss.st.com>
> Cc: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> Cc: Gatien Chevallier <gatien.chevallier@foss.st.com>
> Cc: Lionel Debieve <lionel.debieve@foss.st.com>
> Cc: Pascal Zimmermann <pzimmermann@dh-electronics.com>
> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Cc: Simon Glass <sjg@chromium.org>
> Cc: Sughosh Ganu <sughosh.ganu@linaro.org>
> Cc: Tom Rini <trini@konsulko.com>
> Cc: u-boot@dh-electronics.com
> Cc: u-boot@lists.denx.de
> Cc: uboot-stm32@st-md-mailman.stormreply.com
> ---
> V2: Add RB from Patrice
> ---
>  board/st/common/stpmic1.c | 51 ++++++++++++++++++++++++++-------------
>  1 file changed, 34 insertions(+), 17 deletions(-)
> 
> diff --git a/board/st/common/stpmic1.c b/board/st/common/stpmic1.c
> index 45c2bb5bcea..b46f89dacb9 100644
> --- a/board/st/common/stpmic1.c
> +++ b/board/st/common/stpmic1.c
> @@ -14,8 +14,19 @@
>  #include <power/pmic.h>
>  #include <power/stpmic1.h>
>  
> +static bool is_stm32mp13xx(void)
> +{
> +	if (!IS_ENABLED(CONFIG_STM32MP13X))
> +		return false;
> +
> +	return of_machine_is_compatible("st,stm32mp131") ||
> +	       of_machine_is_compatible("st,stm32mp133") ||
> +	       of_machine_is_compatible("st,stm32mp135");
> +}
> +
>  int board_ddr_power_init(enum ddr_type ddr_type)
>  {
> +	bool is_mp13 = is_stm32mp13xx();
>  	struct udevice *dev;
>  	bool buck3_at_1800000v = false;
>  	int ret;
> @@ -30,18 +41,21 @@ int board_ddr_power_init(enum ddr_type ddr_type)
>  	switch (ddr_type) {
>  	case STM32MP_DDR3:
>  		/* VTT = Set LDO3 to sync mode */
> -		ret = pmic_reg_read(dev, STPMIC1_LDOX_MAIN_CR(STPMIC1_LDO3));
> -		if (ret < 0)
> -			return ret;
> -
> -		ret &= ~STPMIC1_LDO3_MODE;
> -		ret &= ~STPMIC1_LDO12356_VOUT_MASK;
> -		ret |= STPMIC1_LDO_VOUT(STPMIC1_LDO3_DDR_SEL);
> -
> -		ret = pmic_reg_write(dev, STPMIC1_LDOX_MAIN_CR(STPMIC1_LDO3),
> -				     ret);
> -		if (ret < 0)
> -			return ret;
> +		if (!is_mp13) {
> +			/* Enable VTT only on STM32MP15xx */
> +			ret = pmic_reg_read(dev, STPMIC1_LDOX_MAIN_CR(STPMIC1_LDO3));
> +			if (ret < 0)
> +				return ret;
> +
> +			ret &= ~STPMIC1_LDO3_MODE;
> +			ret &= ~STPMIC1_LDO12356_VOUT_MASK;
> +			ret |= STPMIC1_LDO_VOUT(STPMIC1_LDO3_DDR_SEL);
> +
> +			ret = pmic_reg_write(dev, STPMIC1_LDOX_MAIN_CR(STPMIC1_LDO3),
> +					     ret);
> +			if (ret < 0)
> +				return ret;
> +		}
>  
>  		/* VDD_DDR = Set BUCK2 to 1.35V */
>  		ret = pmic_clrsetbits(dev,
> @@ -69,11 +83,14 @@ int board_ddr_power_init(enum ddr_type ddr_type)
>  		mdelay(STPMIC1_DEFAULT_START_UP_DELAY_MS);
>  
>  		/* Enable VTT = LDO3 */
> -		ret = pmic_clrsetbits(dev,
> -				      STPMIC1_LDOX_MAIN_CR(STPMIC1_LDO3),
> -				      STPMIC1_LDO_ENA, STPMIC1_LDO_ENA);
> -		if (ret < 0)
> -			return ret;
> +		if (!is_mp13) {
> +			/* Enable VTT only on STM32MP15xx */
> +			ret = pmic_clrsetbits(dev,
> +					      STPMIC1_LDOX_MAIN_CR(STPMIC1_LDO3),
> +					      STPMIC1_LDO_ENA, STPMIC1_LDO_ENA);
> +			if (ret < 0)
> +				return ret;
> +		}
>  
>  		mdelay(STPMIC1_DEFAULT_START_UP_DELAY_MS);
>  
Applied to u-boot-stm32/master

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
