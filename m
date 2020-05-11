Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C95D1CDBC6
	for <lists+uboot-stm32@lfdr.de>; Mon, 11 May 2020 15:50:02 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1F39EC36B25
	for <lists+uboot-stm32@lfdr.de>; Mon, 11 May 2020 13:50:02 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6B484C36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 May 2020 13:50:01 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04BDQbRi032483; Mon, 11 May 2020 15:50:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=Rdsf0IuXEUXr+qZkFKeC7zbMLL+gGAtaOjZnLlwbaNw=;
 b=qUGFAJ1CoN5vXewkVvDco/G7CHVCrEOEiAJKYFh0YGncMk0fdYjYN4/p9AcZQYWfbfoE
 QjobhuRqNu6pl9aehd1+dssk1yPTh86V2Im6TOk8jdtZ/c5UNjUGCLdk1Dl/4ya5xSor
 J4mx+5A4F0MlrYAGnVC94CkXb3mA2mvPxmkqg0GWvN5dKu0Q3eDAdHjwrkAQdQeY0mIz
 pM0fGmSXuO/ar3g88nGMBP6fGX1T9ScEdzrKw8SlQr/3qDvNWSgWkU5vcZy+5pHrYyFV
 aW6eLu629ES4Bm5IXLOftcvXnalWO9EvJVmkrHyvyjwi9AnhcnPM7fMJ6oqO1EcOetpx lQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30wkdgtd9c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 May 2020 15:50:00 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B7FCD10002A;
 Mon, 11 May 2020 15:49:59 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id ACD012A72F8;
 Mon, 11 May 2020 15:49:59 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 11 May
 2020 15:49:59 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Mon, 11 May 2020 15:49:59 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [Uboot-stm32] [PATCH 3/9] board: st: create common file stpmic1.c
Thread-Index: AQHWF+8xMipz41mLAUShQ4vl7nVBvaii5LgA
Date: Mon, 11 May 2020 13:49:59 +0000
Message-ID: <9acb5804-a19c-5d44-6c89-ad8f51288ee2@st.com>
References: <20200421151128.18072-1-patrick.delaunay@st.com>
 <20200421171123.3.I68223ba559c92c10a234c74b5589a38df45603c1@changeid>
In-Reply-To: <20200421171123.3.I68223ba559c92c10a234c74b5589a38df45603c1@changeid>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.48]
Content-ID: <BAFC0B41B500B14B8BDD2C288356AC49@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-11_06:2020-05-11,
 2020-05-11 signatures=0
Cc: Marek Vasut <marex@denx.de>, "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 3/9] board: st: create common file
	stpmic1.c
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

Hi Patrick

On 4/21/20 5:11 PM, Patrick Delaunay wrote:
> Move function board_ddr_power_init() in a new file stpmic1 in
> board/st/common to avoid duplicated code in each board using
> stpmic1
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  board/dhelectronics/dh_stm32mp1/Makefile |   2 +-
>  board/st/common/Makefile                 |   1 +
>  board/st/common/stpmic1.c                | 162 +++++++++++++++++++++++
>  board/st/stm32mp1/board.c                | 158 ----------------------
>  4 files changed, 164 insertions(+), 159 deletions(-)
>  create mode 100644 board/st/common/stpmic1.c
>
> diff --git a/board/dhelectronics/dh_stm32mp1/Makefile b/board/dhelectronics/dh_stm32mp1/Makefile
> index b42c4e4c04..04586c0a28 100644
> --- a/board/dhelectronics/dh_stm32mp1/Makefile
> +++ b/board/dhelectronics/dh_stm32mp1/Makefile
> @@ -7,4 +7,4 @@ ifdef CONFIG_SPL_BUILD
>  obj-y += ../../st/stm32mp1/spl.o
>  endif
>  
> -obj-y += ../../st/stm32mp1/board.o board.o
> +obj-y += ../../st/common/stpmic1.o board.o
> diff --git a/board/st/common/Makefile b/board/st/common/Makefile
> index 8553606b90..78bc0307f7 100644
> --- a/board/st/common/Makefile
> +++ b/board/st/common/Makefile
> @@ -4,3 +4,4 @@
>  #
>  
>  obj-$(CONFIG_CMD_STBOARD) += cmd_stboard.o
> +obj-$(CONFIG_PMIC_STPMIC1) += stpmic1.o
> diff --git a/board/st/common/stpmic1.c b/board/st/common/stpmic1.c
> new file mode 100644
> index 0000000000..ca10a2246b
> --- /dev/null
> +++ b/board/st/common/stpmic1.c
> @@ -0,0 +1,162 @@
> +// SPDX-License-Identifier: GPL-2.0+ OR BSD-3-Clause
> +/*
> + * Copyright (C) 2020, STMicroelectronics - All Rights Reserved
> + */
> +
> +#include <common.h>
> +#include <dm.h>
> +#include <asm/arch/ddr.h>
> +#include <power/pmic.h>
> +#include <power/stpmic1.h>
> +
> +int board_ddr_power_init(enum ddr_type ddr_type)
> +{
> +	struct udevice *dev;
> +	bool buck3_at_1800000v = false;
> +	int ret;
> +	u32 buck2;
> +
> +	ret = uclass_get_device_by_driver(UCLASS_PMIC,
> +					  DM_GET_DRIVER(pmic_stpmic1), &dev);
> +	if (ret)
> +		/* No PMIC on board */
> +		return 0;
> +
> +	switch (ddr_type) {
> +	case STM32MP_DDR3:
> +		/* VTT = Set LDO3 to sync mode */
> +		ret = pmic_reg_read(dev, STPMIC1_LDOX_MAIN_CR(STPMIC1_LDO3));
> +		if (ret < 0)
> +			return ret;
> +
> +		ret &= ~STPMIC1_LDO3_MODE;
> +		ret &= ~STPMIC1_LDO12356_VOUT_MASK;
> +		ret |= STPMIC1_LDO_VOUT(STPMIC1_LDO3_DDR_SEL);
> +
> +		ret = pmic_reg_write(dev, STPMIC1_LDOX_MAIN_CR(STPMIC1_LDO3),
> +				     ret);
> +		if (ret < 0)
> +			return ret;
> +
> +		/* VDD_DDR = Set BUCK2 to 1.35V */
> +		ret = pmic_clrsetbits(dev,
> +				      STPMIC1_BUCKX_MAIN_CR(STPMIC1_BUCK2),
> +				      STPMIC1_BUCK_VOUT_MASK,
> +				      STPMIC1_BUCK2_1350000V);
> +		if (ret < 0)
> +			return ret;
> +
> +		/* Enable VDD_DDR = BUCK2 */
> +		ret = pmic_clrsetbits(dev,
> +				      STPMIC1_BUCKX_MAIN_CR(STPMIC1_BUCK2),
> +				      STPMIC1_BUCK_ENA, STPMIC1_BUCK_ENA);
> +		if (ret < 0)
> +			return ret;
> +
> +		mdelay(STPMIC1_DEFAULT_START_UP_DELAY_MS);
> +
> +		/* Enable VREF */
> +		ret = pmic_clrsetbits(dev, STPMIC1_REFDDR_MAIN_CR,
> +				      STPMIC1_VREF_ENA, STPMIC1_VREF_ENA);
> +		if (ret < 0)
> +			return ret;
> +
> +		mdelay(STPMIC1_DEFAULT_START_UP_DELAY_MS);
> +
> +		/* Enable VTT = LDO3 */
> +		ret = pmic_clrsetbits(dev,
> +				      STPMIC1_LDOX_MAIN_CR(STPMIC1_LDO3),
> +				      STPMIC1_LDO_ENA, STPMIC1_LDO_ENA);
> +		if (ret < 0)
> +			return ret;
> +
> +		mdelay(STPMIC1_DEFAULT_START_UP_DELAY_MS);
> +
> +		break;
> +
> +	case STM32MP_LPDDR2_16:
> +	case STM32MP_LPDDR2_32:
> +	case STM32MP_LPDDR3_16:
> +	case STM32MP_LPDDR3_32:
> +		/*
> +		 * configure VDD_DDR1 = LDO3
> +		 * Set LDO3 to 1.8V
> +		 * + bypass mode if BUCK3 = 1.8V
> +		 * + normal mode if BUCK3 != 1.8V
> +		 */
> +		ret = pmic_reg_read(dev,
> +				    STPMIC1_BUCKX_MAIN_CR(STPMIC1_BUCK3));
> +		if (ret < 0)
> +			return ret;
> +
> +		if ((ret & STPMIC1_BUCK3_1800000V) == STPMIC1_BUCK3_1800000V)
> +			buck3_at_1800000v = true;
> +
> +		ret = pmic_reg_read(dev, STPMIC1_LDOX_MAIN_CR(STPMIC1_LDO3));
> +		if (ret < 0)
> +			return ret;
> +
> +		ret &= ~STPMIC1_LDO3_MODE;
> +		ret &= ~STPMIC1_LDO12356_VOUT_MASK;
> +		ret |= STPMIC1_LDO3_1800000;
> +		if (buck3_at_1800000v)
> +			ret |= STPMIC1_LDO3_MODE;
> +
> +		ret = pmic_reg_write(dev, STPMIC1_LDOX_MAIN_CR(STPMIC1_LDO3),
> +				     ret);
> +		if (ret < 0)
> +			return ret;
> +
> +		/* VDD_DDR2 : Set BUCK2 to 1.2V (16bits) or 1.25V (32 bits)*/
> +		switch (ddr_type) {
> +		case STM32MP_LPDDR2_32:
> +		case STM32MP_LPDDR3_32:
> +			buck2 = STPMIC1_BUCK2_1250000V;
> +			break;
> +		default:
> +		case STM32MP_LPDDR2_16:
> +		case STM32MP_LPDDR3_16:
> +			buck2 = STPMIC1_BUCK2_1200000V;
> +			break;
> +		}
> +
> +		ret = pmic_clrsetbits(dev,
> +				      STPMIC1_BUCKX_MAIN_CR(STPMIC1_BUCK2),
> +				      STPMIC1_BUCK_VOUT_MASK,
> +				      buck2);
> +		if (ret < 0)
> +			return ret;
> +
> +		/* Enable VDD_DDR1 = LDO3 */
> +		ret = pmic_clrsetbits(dev, STPMIC1_LDOX_MAIN_CR(STPMIC1_LDO3),
> +				      STPMIC1_LDO_ENA, STPMIC1_LDO_ENA);
> +		if (ret < 0)
> +			return ret;
> +
> +		mdelay(STPMIC1_DEFAULT_START_UP_DELAY_MS);
> +
> +		/* Enable VDD_DDR2 =BUCK2 */
> +		ret = pmic_clrsetbits(dev,
> +				      STPMIC1_BUCKX_MAIN_CR(STPMIC1_BUCK2),
> +				      STPMIC1_BUCK_ENA, STPMIC1_BUCK_ENA);
> +		if (ret < 0)
> +			return ret;
> +
> +		mdelay(STPMIC1_DEFAULT_START_UP_DELAY_MS);
> +
> +		/* Enable VREF */
> +		ret = pmic_clrsetbits(dev, STPMIC1_REFDDR_MAIN_CR,
> +				      STPMIC1_VREF_ENA, STPMIC1_VREF_ENA);
> +		if (ret < 0)
> +			return ret;
> +
> +		mdelay(STPMIC1_DEFAULT_START_UP_DELAY_MS);
> +
> +		break;
> +
> +	default:
> +		break;
> +	};
> +
> +	return 0;
> +}
> diff --git a/board/st/stm32mp1/board.c b/board/st/stm32mp1/board.c
> index 4e35d36c76..1887941e57 100644
> --- a/board/st/stm32mp1/board.c
> +++ b/board/st/stm32mp1/board.c
> @@ -4,11 +4,7 @@
>   */
>  
>  #include <common.h>
> -#include <dm.h>
>  #include <asm/io.h>
> -#include <asm/arch/ddr.h>
> -#include <power/pmic.h>
> -#include <power/stpmic1.h>
>  
>  #ifdef CONFIG_DEBUG_UART_BOARD_INIT
>  void board_debug_uart_init(void)
> @@ -36,157 +32,3 @@ void board_debug_uart_init(void)
>  #endif
>  }
>  #endif
> -
> -#ifdef CONFIG_PMIC_STPMIC1
> -int board_ddr_power_init(enum ddr_type ddr_type)
> -{
> -	struct udevice *dev;
> -	bool buck3_at_1800000v = false;
> -	int ret;
> -	u32 buck2;
> -
> -	ret = uclass_get_device_by_driver(UCLASS_PMIC,
> -					  DM_GET_DRIVER(pmic_stpmic1), &dev);
> -	if (ret)
> -		/* No PMIC on board */
> -		return 0;
> -
> -	switch (ddr_type) {
> -	case STM32MP_DDR3:
> -		/* VTT = Set LDO3 to sync mode */
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
> -
> -		/* VDD_DDR = Set BUCK2 to 1.35V */
> -		ret = pmic_clrsetbits(dev,
> -				      STPMIC1_BUCKX_MAIN_CR(STPMIC1_BUCK2),
> -				      STPMIC1_BUCK_VOUT_MASK,
> -				      STPMIC1_BUCK2_1350000V);
> -		if (ret < 0)
> -			return ret;
> -
> -		/* Enable VDD_DDR = BUCK2 */
> -		ret = pmic_clrsetbits(dev,
> -				      STPMIC1_BUCKX_MAIN_CR(STPMIC1_BUCK2),
> -				      STPMIC1_BUCK_ENA, STPMIC1_BUCK_ENA);
> -		if (ret < 0)
> -			return ret;
> -
> -		mdelay(STPMIC1_DEFAULT_START_UP_DELAY_MS);
> -
> -		/* Enable VREF */
> -		ret = pmic_clrsetbits(dev, STPMIC1_REFDDR_MAIN_CR,
> -				      STPMIC1_VREF_ENA, STPMIC1_VREF_ENA);
> -		if (ret < 0)
> -			return ret;
> -
> -		mdelay(STPMIC1_DEFAULT_START_UP_DELAY_MS);
> -
> -		/* Enable VTT = LDO3 */
> -		ret = pmic_clrsetbits(dev,
> -				      STPMIC1_LDOX_MAIN_CR(STPMIC1_LDO3),
> -				      STPMIC1_LDO_ENA, STPMIC1_LDO_ENA);
> -		if (ret < 0)
> -			return ret;
> -
> -		mdelay(STPMIC1_DEFAULT_START_UP_DELAY_MS);
> -
> -		break;
> -
> -	case STM32MP_LPDDR2_16:
> -	case STM32MP_LPDDR2_32:
> -	case STM32MP_LPDDR3_16:
> -	case STM32MP_LPDDR3_32:
> -		/*
> -		 * configure VDD_DDR1 = LDO3
> -		 * Set LDO3 to 1.8V
> -		 * + bypass mode if BUCK3 = 1.8V
> -		 * + normal mode if BUCK3 != 1.8V
> -		 */
> -		ret = pmic_reg_read(dev,
> -				    STPMIC1_BUCKX_MAIN_CR(STPMIC1_BUCK3));
> -		if (ret < 0)
> -			return ret;
> -
> -		if ((ret & STPMIC1_BUCK3_1800000V) == STPMIC1_BUCK3_1800000V)
> -			buck3_at_1800000v = true;
> -
> -		ret = pmic_reg_read(dev, STPMIC1_LDOX_MAIN_CR(STPMIC1_LDO3));
> -		if (ret < 0)
> -			return ret;
> -
> -		ret &= ~STPMIC1_LDO3_MODE;
> -		ret &= ~STPMIC1_LDO12356_VOUT_MASK;
> -		ret |= STPMIC1_LDO3_1800000;
> -		if (buck3_at_1800000v)
> -			ret |= STPMIC1_LDO3_MODE;
> -
> -		ret = pmic_reg_write(dev, STPMIC1_LDOX_MAIN_CR(STPMIC1_LDO3),
> -				     ret);
> -		if (ret < 0)
> -			return ret;
> -
> -		/* VDD_DDR2 : Set BUCK2 to 1.2V (16bits) or 1.25V (32 bits)*/
> -		switch (ddr_type) {
> -		case STM32MP_LPDDR2_32:
> -		case STM32MP_LPDDR3_32:
> -			buck2 = STPMIC1_BUCK2_1250000V;
> -			break;
> -		default:
> -		case STM32MP_LPDDR2_16:
> -		case STM32MP_LPDDR3_16:
> -			buck2 = STPMIC1_BUCK2_1200000V;
> -			break;
> -		}
> -
> -		ret = pmic_clrsetbits(dev,
> -				      STPMIC1_BUCKX_MAIN_CR(STPMIC1_BUCK2),
> -				      STPMIC1_BUCK_VOUT_MASK,
> -				      buck2);
> -		if (ret < 0)
> -			return ret;
> -
> -		/* Enable VDD_DDR1 = LDO3 */
> -		ret = pmic_clrsetbits(dev, STPMIC1_LDOX_MAIN_CR(STPMIC1_LDO3),
> -				      STPMIC1_LDO_ENA, STPMIC1_LDO_ENA);
> -		if (ret < 0)
> -			return ret;
> -
> -		mdelay(STPMIC1_DEFAULT_START_UP_DELAY_MS);
> -
> -		/* Enable VDD_DDR2 =BUCK2 */
> -		ret = pmic_clrsetbits(dev,
> -				      STPMIC1_BUCKX_MAIN_CR(STPMIC1_BUCK2),
> -				      STPMIC1_BUCK_ENA, STPMIC1_BUCK_ENA);
> -		if (ret < 0)
> -			return ret;
> -
> -		mdelay(STPMIC1_DEFAULT_START_UP_DELAY_MS);
> -
> -		/* Enable VREF */
> -		ret = pmic_clrsetbits(dev, STPMIC1_REFDDR_MAIN_CR,
> -				      STPMIC1_VREF_ENA, STPMIC1_VREF_ENA);
> -		if (ret < 0)
> -			return ret;
> -
> -		mdelay(STPMIC1_DEFAULT_START_UP_DELAY_MS);
> -
> -		break;
> -
> -	default:
> -		break;
> -	};
> -
> -	return 0;
> -}
> -#endif


Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks

Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
