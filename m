Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1FB189807
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Mar 2020 10:39:35 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5CCFBC36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Mar 2020 09:39:35 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4A1E1C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Mar 2020 09:39:33 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02I9cROX016717; Wed, 18 Mar 2020 10:39:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=KyIZsezss1HqAULrDNXe214DiIorcYFP0wpqLuH3syc=;
 b=mSKYXOxOJ15eTksT92P1EhgyyCeTztLWKRvleYyrG1OM2ueIRi6YvysNQ/rHairCKHdS
 MAJaAYxU4QH+1pjo61lzSULdvFM6jnm38ToPtgF91rTy8SQPD+JI99G7iHXB5eJfIMcF
 s9h7GiqwrgOyEiZtwUEf4N94O7a/sYrlLiGfS8bVVgwgX2ncv/4upBrgQsUxWl+qsZc7
 6wMeUdgK9onxTuZRlG/zE7UEg+79RNRxvL0jPdTvIPx5PXr8uHI1VUQtgKCKC1/COrHs
 mSPtZQsNG397IntKMJ+UEYc7AZ+pQlSvYZvZaLLh8a/7wnw3j4Q3OEm4qhsKWE/juHmP iw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yu95ujhva-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Mar 2020 10:39:29 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EA93E10002A;
 Wed, 18 Mar 2020 10:39:28 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DCA2F21FE9A;
 Wed, 18 Mar 2020 10:39:28 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 18 Mar
 2020 10:39:28 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Wed, 18 Mar 2020 10:39:28 +0100
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH 1/9] ram: stm32mp1: increase vdd2_ddr: buck2 for 32bits
 LPDDR
Thread-Index: AQHV86AFvrmnHwxuoUGSLF14fmKBc6hOGjeA
Date: Wed, 18 Mar 2020 09:39:28 +0000
Message-ID: <5ef6bd63-dc91-5344-a2e9-e92c670e4041@st.com>
References: <20200306101412.15376-1-patrick.delaunay@st.com>
 <20200306111355.1.Ifeb02af238a2e3d0407465a868761e5efd7f968b@changeid>
In-Reply-To: <20200306111355.1.Ifeb02af238a2e3d0407465a868761e5efd7f968b@changeid>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.49]
Content-ID: <20FAF80CEF8620478F6FC52A7D353172@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-18_03:2020-03-17,
 2020-03-18 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Lukasz Majewski <lukma@denx.de>
Subject: Re: [Uboot-stm32] [PATCH 1/9] ram: stm32mp1: increase vdd2_ddr:
 buck2 for 32bits LPDDR
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


On 3/6/20 11:14 AM, Patrick Delaunay wrote:
> Need to increase the LPDDR2/LPDDR3 the voltage vdd2_ddr: buck2
> form 1.2V to 1.25V for 32bits configuration.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  arch/arm/mach-stm32mp/include/mach/ddr.h |  6 +++--
>  board/st/stm32mp1/board.c                | 23 ++++++++++++++----
>  drivers/ram/stm32mp1/stm32mp1_ddr.c      | 30 ++++++++++++++++++++----
>  include/power/stpmic1.h                  |  1 +
>  4 files changed, 49 insertions(+), 11 deletions(-)
>
> diff --git a/arch/arm/mach-stm32mp/include/mach/ddr.h b/arch/arm/mach-stm32mp/include/mach/ddr.h
> index b8a17cfbdd..bfc42a7c48 100644
> --- a/arch/arm/mach-stm32mp/include/mach/ddr.h
> +++ b/arch/arm/mach-stm32mp/include/mach/ddr.h
> @@ -9,8 +9,10 @@
>  /* DDR power initializations */
>  enum ddr_type {
>  	STM32MP_DDR3,
> -	STM32MP_LPDDR2,
> -	STM32MP_LPDDR3,
> +	STM32MP_LPDDR2_16,
> +	STM32MP_LPDDR2_32,
> +	STM32MP_LPDDR3_16,
> +	STM32MP_LPDDR3_32,
>  };
>  
>  int board_ddr_power_init(enum ddr_type ddr_type);
> diff --git a/board/st/stm32mp1/board.c b/board/st/stm32mp1/board.c
> index c3d832f584..4e35d36c76 100644
> --- a/board/st/stm32mp1/board.c
> +++ b/board/st/stm32mp1/board.c
> @@ -43,6 +43,7 @@ int board_ddr_power_init(enum ddr_type ddr_type)
>  	struct udevice *dev;
>  	bool buck3_at_1800000v = false;
>  	int ret;
> +	u32 buck2;
>  
>  	ret = uclass_get_device_by_driver(UCLASS_PMIC,
>  					  DM_GET_DRIVER(pmic_stpmic1), &dev);
> @@ -102,8 +103,10 @@ int board_ddr_power_init(enum ddr_type ddr_type)
>  
>  		break;
>  
> -	case STM32MP_LPDDR2:
> -	case STM32MP_LPDDR3:
> +	case STM32MP_LPDDR2_16:
> +	case STM32MP_LPDDR2_32:
> +	case STM32MP_LPDDR3_16:
> +	case STM32MP_LPDDR3_32:
>  		/*
>  		 * configure VDD_DDR1 = LDO3
>  		 * Set LDO3 to 1.8V
> @@ -133,11 +136,23 @@ int board_ddr_power_init(enum ddr_type ddr_type)
>  		if (ret < 0)
>  			return ret;
>  
> -		/* VDD_DDR2 : Set BUCK2 to 1.2V */
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
>  		ret = pmic_clrsetbits(dev,
>  				      STPMIC1_BUCKX_MAIN_CR(STPMIC1_BUCK2),
>  				      STPMIC1_BUCK_VOUT_MASK,
> -				      STPMIC1_BUCK2_1200000V);
> +				      buck2);
>  		if (ret < 0)
>  			return ret;
>  
> diff --git a/drivers/ram/stm32mp1/stm32mp1_ddr.c b/drivers/ram/stm32mp1/stm32mp1_ddr.c
> index d765a46f7c..a87914f2d5 100644
> --- a/drivers/ram/stm32mp1/stm32mp1_ddr.c
> +++ b/drivers/ram/stm32mp1/stm32mp1_ddr.c
> @@ -668,14 +668,34 @@ void stm32mp1_ddr_init(struct ddr_info *priv,
>  {
>  	u32 pir;
>  	int ret = -EINVAL;
> +	char bus_width;
> +
> +	switch (config->c_reg.mstr & DDRCTRL_MSTR_DATA_BUS_WIDTH_MASK) {
> +	case DDRCTRL_MSTR_DATA_BUS_WIDTH_QUARTER:
> +		bus_width = 8;
> +		break;
> +	case DDRCTRL_MSTR_DATA_BUS_WIDTH_HALF:
> +		bus_width = 16;
> +		break;
> +	default:
> +		bus_width = 32;
> +		break;
> +	}
> +
>  
>  	if (config->c_reg.mstr & DDRCTRL_MSTR_DDR3)
>  		ret = board_ddr_power_init(STM32MP_DDR3);
> -	else if (config->c_reg.mstr & DDRCTRL_MSTR_LPDDR2)
> -		ret = board_ddr_power_init(STM32MP_LPDDR2);
> -	else if (config->c_reg.mstr & DDRCTRL_MSTR_LPDDR3)
> -		ret = board_ddr_power_init(STM32MP_LPDDR3);
> -
> +	else if (config->c_reg.mstr & DDRCTRL_MSTR_LPDDR2) {
> +		if (bus_width == 32)
> +			ret = board_ddr_power_init(STM32MP_LPDDR2_32);
> +		else
> +			ret = board_ddr_power_init(STM32MP_LPDDR2_16);
> +	} else if (config->c_reg.mstr & DDRCTRL_MSTR_LPDDR3) {
> +		if (bus_width == 32)
> +			ret = board_ddr_power_init(STM32MP_LPDDR3_32);
> +		else
> +			ret = board_ddr_power_init(STM32MP_LPDDR3_16);
> +	}
>  	if (ret)
>  		panic("ddr power init failed\n");
>  
> diff --git a/include/power/stpmic1.h b/include/power/stpmic1.h
> index dc8b5a7459..1493a677f0 100644
> --- a/include/power/stpmic1.h
> +++ b/include/power/stpmic1.h
> @@ -37,6 +37,7 @@
>  #define STPMIC1_BUCK_VOUT(sel)		(sel << STPMIC1_BUCK_VOUT_SHIFT)
>  
>  #define STPMIC1_BUCK2_1200000V		STPMIC1_BUCK_VOUT(24)
> +#define STPMIC1_BUCK2_1250000V		STPMIC1_BUCK_VOUT(26)
>  #define STPMIC1_BUCK2_1350000V		STPMIC1_BUCK_VOUT(30)
>  
>  #define STPMIC1_BUCK3_1800000V		STPMIC1_BUCK_VOUT(39)

Acked-by: Patrice Chotard <patrice.chotard@st.com>

Thanks

Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
