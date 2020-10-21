Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CF68D294BDD
	for <lists+uboot-stm32@lfdr.de>; Wed, 21 Oct 2020 13:42:39 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 60CF2C3FAE0;
	Wed, 21 Oct 2020 11:42:39 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 16E4AC3FAD5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Oct 2020 11:42:37 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09LBfo8F020069; Wed, 21 Oct 2020 13:42:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=SB8QkXvCnN9WSy9O70o7oW4hNMdi7myviqD39iXSa8Y=;
 b=UoX1NFwHUtaMcm/pikheoJcinqw1KRfT5An+FFwC47QxZO5kt3IZp1dYrLOmAYkZtFKq
 YfEP341fkqttHJysbPVngvUKsrRoLsClMDfwwMVVlnEjvA3vg5RTzTRoA0+5iQW6Qfou
 /OJXJWN1zkcgWJUWWqdwtq+PRS/7ljs3mhBfubOhXTH58wnLsgUabundm9PW0bbZkQbj
 yZ2gNgKdsGGGUXbCEvmot1iqeYLHLSP9Y2pb15qvckMTYoAaMfVPIqlO7tkk43/DyMNz
 R5YMXhHSU2vg/Pnrd8X9p140kVyoMaEL673WilZSPyRT4KwTWuPdRjnlOcyreUcinBsH eA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 347qgga9kh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Oct 2020 13:42:36 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8B6A0100034;
 Wed, 21 Oct 2020 13:42:35 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node1.st.com [10.75.127.4])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6F2262A705E;
 Wed, 21 Oct 2020 13:42:35 +0200 (CEST)
Received: from SFHDAG2NODE3.st.com (10.75.127.6) by SFHDAG2NODE1.st.com
 (10.75.127.4) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 21 Oct
 2020 13:42:35 +0200
Received: from SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c]) by
 SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c%20]) with mapi id
 15.00.1473.003; Wed, 21 Oct 2020 13:42:34 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH 1/3] reset: stm32: Add support of MCU HOLD BOOT
Thread-Index: AQHWovND4UCTTIVUi0uhAy5XJussa6mh1xgA
Date: Wed, 21 Oct 2020 11:42:34 +0000
Message-ID: <fdf727b6-d8e5-cc05-9dee-d04ef8404950@st.com>
References: <20201015150101.1.Ic4f6a36fa0594203b3f994a9e1d48143b420f072@changeid>
In-Reply-To: <20201015150101.1.Ic4f6a36fa0594203b3f994a9e1d48143b420f072@changeid>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.50]
Content-ID: <6A1AA9561FE88041B745CC13F0D546C7@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.737
 definitions=2020-10-21_05:2020-10-20,
 2020-10-21 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Arnaud POULIQUEN <arnaud.pouliquen@st.com>,
 Fabien DESSENNE <fabien.dessenne@st.com>
Subject: Re: [Uboot-stm32] [PATCH 1/3] reset: stm32: Add support of MCU HOLD
	BOOT
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

On 10/15/20 3:01 PM, Patrick Delaunay wrote:
> Handle the register RCC_MP_GCR without SET/CLR registers
> but with a direct access to bit BOOT_MCU:
> - deassert => set the bit: The MCU will not be in HOLD_BOOT
> - assert => clear the bit: The MCU will be set in HOLD_BOOT
>
> With this patch the RCC driver handles the MCU_HOLD_BOOT_R value
> added in binding stm32mp1-resets.h
>
> Cc: Fabien DESSENNE <fabien.dessenne@st.com>
> Cc: Arnaud POULIQUEN <arnaud.pouliquen@st.com>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  drivers/reset/stm32-reset.c                 | 17 +++++++++++++----
>  include/dt-bindings/reset/stm32mp1-resets.h |  1 +
>  2 files changed, 14 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/reset/stm32-reset.c b/drivers/reset/stm32-reset.c
> index 64a11cfcfc..20c36a99eb 100644
> --- a/drivers/reset/stm32-reset.c
> +++ b/drivers/reset/stm32-reset.c
> @@ -14,6 +14,9 @@
>  #include <asm/io.h>
>  #include <linux/bitops.h>
>  
> +/* offset of register without set/clear management */
> +#define RCC_MP_GCR_OFFSET 0x10C
> +
>  /* reset clear offset for STM32MP RCC */
>  #define RCC_CL 0x4
>  
> @@ -40,8 +43,11 @@ static int stm32_reset_assert(struct reset_ctl *reset_ctl)
>  	      reset_ctl->id, bank, offset);
>  
>  	if (dev_get_driver_data(reset_ctl->dev) == STM32MP1)
> -		/* reset assert is done in rcc set register */
> -		writel(BIT(offset), priv->base + bank);
> +		if (bank != RCC_MP_GCR_OFFSET)
> +			/* reset assert is done in rcc set register */
> +			writel(BIT(offset), priv->base + bank);
> +		else
> +			clrbits_le32(priv->base + bank, BIT(offset));
>  	else
>  		setbits_le32(priv->base + bank, BIT(offset));
>  
> @@ -57,8 +63,11 @@ static int stm32_reset_deassert(struct reset_ctl *reset_ctl)
>  	      reset_ctl->id, bank, offset);
>  
>  	if (dev_get_driver_data(reset_ctl->dev) == STM32MP1)
> -		/* reset deassert is done in rcc clr register */
> -		writel(BIT(offset), priv->base + bank + RCC_CL);
> +		if (bank != RCC_MP_GCR_OFFSET)
> +			/* reset deassert is done in rcc clr register */
> +			writel(BIT(offset), priv->base + bank + RCC_CL);
> +		else
> +			setbits_le32(priv->base + bank, BIT(offset));
>  	else
>  		clrbits_le32(priv->base + bank, BIT(offset));
>  
> diff --git a/include/dt-bindings/reset/stm32mp1-resets.h b/include/dt-bindings/reset/stm32mp1-resets.h
> index f0c3aaef67..702da37a2e 100644
> --- a/include/dt-bindings/reset/stm32mp1-resets.h
> +++ b/include/dt-bindings/reset/stm32mp1-resets.h
> @@ -7,6 +7,7 @@
>  #ifndef _DT_BINDINGS_STM32MP1_RESET_H_
>  #define _DT_BINDINGS_STM32MP1_RESET_H_
>  
> +#define MCU_HOLD_BOOT_R	2144
>  #define LTDC_R		3072
>  #define DSI_R		3076
>  #define DDRPERFM_R	3080

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
