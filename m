Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B28677E28C
	for <lists+uboot-stm32@lfdr.de>; Wed, 16 Aug 2023 15:28:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1DF1AC6B45F;
	Wed, 16 Aug 2023 13:28:23 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 36C65C6B45E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Aug 2023 13:28:22 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 37G9C2lw021241; Wed, 16 Aug 2023 15:28:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=ahvggLXkldaOLlXgOau7hw/a8WVMq+fFB6DY4WeF/9w=; b=Bd
 Bc4DS9IJiKumdPmpRfLMANeqeYxaJf6oHF/0A1W+JPggb54EpJ6OD4zaGkmLa0Xz
 IWUzVmSSuEGS1gpccVNZkioIeemYsHOcYnMXffBUQjqJUK437XYNBtKCUQPIzPUS
 fhNzFKExzkg+A1U3Us2RwmmgqD8rCwOhhhGkqFIAMVBBH5hYlXV2utSWZ7zafgQa
 HHbzM7cXwouq4xo/PqQ4ssaMZnz4rObuHkwHRAruj0FeHs0rsdsvo9gkjCdSaSD0
 /eSKkF3sD2/7SrOXXLZIsG4RLKGetY9Q9EiZ1NWZhr+lsi4gncQ4wI2T/EsS80at
 8Z7hicUGX7Uese/x3Cjw==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3sgum7hena-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Aug 2023 15:28:20 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BFE1310005D;
 Wed, 16 Aug 2023 15:28:19 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node4.st.com [10.75.129.133])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B524D242AAE;
 Wed, 16 Aug 2023 15:28:19 +0200 (CEST)
Received: from [10.201.20.38] (10.201.20.38) by EQNDAG1NODE4.st.com
 (10.75.129.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Wed, 16 Aug
 2023 15:28:19 +0200
Message-ID: <afe7376c-a859-5305-d86d-0b23f3fc16bf@foss.st.com>
Date: Wed, 16 Aug 2023 15:28:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 <u-boot@lists.denx.de>
References: <20230703160233.2303076-1-dario.binacchi@amarulasolutions.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20230703160233.2303076-1-dario.binacchi@amarulasolutions.com>
X-Originating-IP: [10.201.20.38]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To EQNDAG1NODE4.st.com
 (10.75.129.133)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-16_12,2023-08-15_02,2023-05-22_02
Cc: Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, michael@amarulasolutions.com,
 Amarula patchwork <linux-amarula@amarulasolutions.com>
Subject: Re: [Uboot-stm32] [RESEND PATCH] ARM: dts: stm32: fix display
 pinmux for stm32f746-disco
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



On 7/3/23 18:02, Dario Binacchi wrote:
> As reported by the datasheet (DocID027590 Rev 4) for PG12:
> - AF9  -> LCD_B4
> - AF14 -> LCD_B1
> 
> So replace AF14 with AF9 for PG12 in the dts.
> 
> Fixes: fe63d3cfb77ef ("ARM: dts: stm32: Sync DT with v4.20 kernel for stm32f7")
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> 
> ---
> 
>  arch/arm/dts/stm32f746-disco-u-boot.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/dts/stm32f746-disco-u-boot.dtsi b/arch/arm/dts/stm32f746-disco-u-boot.dtsi
> index 19b5451db441..522cffb1ac9f 100644
> --- a/arch/arm/dts/stm32f746-disco-u-boot.dtsi
> +++ b/arch/arm/dts/stm32f746-disco-u-boot.dtsi
> @@ -169,7 +169,7 @@
>  	ltdc_pins: ltdc@0 {
>  		pins {
>  			pinmux = <STM32_PINMUX('E', 4, AF14)>, /* B0 */
> -				 <STM32_PINMUX('G',12, AF14)>, /* B4 */
> +				 <STM32_PINMUX('G',12, AF9)>,  /* B4 */
>  				 <STM32_PINMUX('I', 9, AF14)>, /* VSYNC */
>  				 <STM32_PINMUX('I',10, AF14)>, /* HSYNC */
>  				 <STM32_PINMUX('I',14, AF14)>, /* CLK */
Applied on stm32-master

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
