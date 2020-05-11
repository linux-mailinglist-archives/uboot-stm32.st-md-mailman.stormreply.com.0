Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3E71CDC6F
	for <lists+uboot-stm32@lfdr.de>; Mon, 11 May 2020 16:02:36 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2266EC36B25
	for <lists+uboot-stm32@lfdr.de>; Mon, 11 May 2020 14:02:36 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 588E0C36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 May 2020 14:02:33 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04BDQa9l032388; Mon, 11 May 2020 16:00:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=TzJFNNZG/Y/2x6FZjekGztePl363NQnAdqJM78zeznU=;
 b=uLkHj2dOpf8UDGSG2IFJvVWXUHYedKgMzjnDdaY/emNndhDRJTRT1BZD/rMVY8j3uwwP
 N2S3MuUf17G9q0p3mRBe3adzrmCRxjdvRFMqgarcxnBXOuENm0LHPyPBRY/YxQWtfzxH
 Xh4UEZpQWr2h9m6mUjBtezDMdZ//KaJI1yCjAT2v6499KkwwARSEAnAIH29rJWtgqOmy
 6MiedvKbWvtVYhGi19WspRI7MhjsdfsIWwsP0fJs9xWOsMAhBIC6DW8OffJIkH8cmtX9
 X6wZ0NzTftuZmzok7vcDfzXHYBOwZXtmU1RYfxUg/zr8Rt4LEn1T4I+fZs+N/4aCI4BP 8g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30wkdgtevk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 May 2020 16:00:03 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3B99610002A;
 Mon, 11 May 2020 16:00:03 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag7node2.st.com [10.75.127.20])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 319692A9794;
 Mon, 11 May 2020 16:00:03 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG7NODE2.st.com
 (10.75.127.20) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 11 May
 2020 16:00:02 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Mon, 11 May 2020 16:00:02 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH] clk: stm32mp1: fix CK_MPU calculation
Thread-Index: AQHWGj775aVu3hEi2kSolIaz+F6vLqii4ukA
Date: Mon, 11 May 2020 14:00:02 +0000
Message-ID: <66af517e-920a-7f39-6965-659e18eea923@st.com>
References: <20200424154751.1.Ic2e6fdeb2c6943f077579212f2625f0532a16ceb@changeid>
In-Reply-To: <20200424154751.1.Ic2e6fdeb2c6943f077579212f2625f0532a16ceb@changeid>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.48]
Content-ID: <402DFE5287C50643A2CD204BD34990EA@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-11_06:2020-05-11,
 2020-05-11 signatures=0
Cc: Lionel DEBIEVE <lionel.debieve@st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Lukasz Majewski <lukma@denx.de>
Subject: Re: [Uboot-stm32] [PATCH] clk: stm32mp1: fix CK_MPU calculation
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


On 4/24/20 3:47 PM, Patrick Delaunay wrote:
> From: Lionel Debieve <lionel.debieve@st.com>
>
> When the CK_MPU used PLL1_MPUDIV, the current rate is
> wrong. The clock must use stm32mp1_mpu_div as a shift
> value. Fix the check value used to enter PLL_MPUDIV.
>
> Signed-off-by: Lionel Debieve <lionel.debieve@st.com>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  drivers/clk/clk_stm32mp1.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/clk/clk_stm32mp1.c b/drivers/clk/clk_stm32mp1.c
> index 50df8425bf..0d0ea43fd2 100644
> --- a/drivers/clk/clk_stm32mp1.c
> +++ b/drivers/clk/clk_stm32mp1.c
> @@ -954,10 +954,11 @@ static ulong stm32mp1_clk_get(struct stm32mp1_clk_priv *priv, int p)
>  		case RCC_MPCKSELR_PLL:
>  		case RCC_MPCKSELR_PLL_MPUDIV:
>  			clock = stm32mp1_read_pll_freq(priv, _PLL1, _DIV_P);
> -			if (p == RCC_MPCKSELR_PLL_MPUDIV) {
> +			if ((reg & RCC_SELR_SRC_MASK) ==
> +			    RCC_MPCKSELR_PLL_MPUDIV) {
>  				reg = readl(priv->base + RCC_MPCKDIVR);
> -				clock /= stm32mp1_mpu_div[reg &
> -							  RCC_MPUDIV_MASK];
> +				clock >>= stm32mp1_mpu_div[reg &
> +					RCC_MPUDIV_MASK];
>  			}
>  			break;
>  		}
>
> Reviewed-by: Patrice Chotard <patrice.chotard@st.com>
>
> Thanks
>
> Patrice
>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
