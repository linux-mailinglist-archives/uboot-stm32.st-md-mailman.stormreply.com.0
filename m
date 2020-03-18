Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 27EFD1897EF
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Mar 2020 10:31:29 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 218FAC36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Mar 2020 09:31:28 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DF6F6C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Mar 2020 09:31:25 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02I9HVnG009222; Wed, 18 Mar 2020 10:31:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=Pc4E0YGannsHZt7X+hKV4vnKLZfrVut4Trc/eZQHc2E=;
 b=kxFPy9ELKggnsN+xUo+n8oDFmAf9KtPXuWsxQMe+m3ztjU2iz4WqAjT0SSIhoUq/KMF2
 rsDPK/TviiL9uErrQ2D/5DFRDp+xPMFyWsF9+TKd68gECTNiPaBe0tLyH81Ek9tnoW3e
 xDQdkHhKGV1ud+hS3dgKZSJTdiSJ3Nl6InZ1PtDOx49zqQULEwGHkJOO1Tsjs3YjtX+i
 zQ1CT0B8NuGsbdgBz9EAplsIV5XYj2iZBFrkRzRQh5B7qLbjQBbmmoN+kZtZhvEB6r4E
 R2Yezk6Y5i5ry3namlb/8v8OvoN8osmPOddSHGR3oIVEFAw4eswVhHbCz1d1EMchpwQB Dw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yu8etanu6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Mar 2020 10:31:22 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B20EC10002A;
 Wed, 18 Mar 2020 10:31:21 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 88D4321CA88;
 Wed, 18 Mar 2020 10:31:21 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 18 Mar
 2020 10:31:21 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Wed, 18 Mar 2020 10:31:21 +0100
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH 1/2] clk: stm32mp1: correct CKSELR masks
Thread-Index: AQHV9hrxpzqBo4Rs4kSLR9nHfqQ72KhOEvuA
Date: Wed, 18 Mar 2020 09:31:20 +0000
Message-ID: <d275bbae-ac0d-c57b-f251-3a9bfe432889@st.com>
References: <20200309135923.429-1-patrick.delaunay@st.com>
In-Reply-To: <20200309135923.429-1-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.51]
Content-ID: <7B98C2EA7AB8CC498B83EDEF7FBA9183@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-18_03:2020-03-17,
 2020-03-18 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Lukasz Majewski <lukma@denx.de>
Subject: Re: [Uboot-stm32] [PATCH 1/2] clk: stm32mp1: correct CKSELR masks
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

On 3/9/20 2:59 PM, Patrick Delaunay wrote:
> Correct three masks used to access on the RCC register
> RCC_QSPICKSELR, RCC_FMCCKSELR and RCC_ADCCKSELR: only 3 bits.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  drivers/clk/clk_stm32mp1.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/clk/clk_stm32mp1.c b/drivers/clk/clk_stm32mp1.c
> index fd8c821e48..42f9ef4e46 100644
> --- a/drivers/clk/clk_stm32mp1.c
> +++ b/drivers/clk/clk_stm32mp1.c
> @@ -621,13 +621,13 @@ static const struct stm32mp1_clk_sel stm32mp1_clk_sel[_PARENT_SEL_NB] = {
>  	STM32MP1_CLK_PARENT(_SDMMC3_SEL, RCC_SDMMC3CKSELR, 0, 0x7,
>  			    sdmmc3_parents),
>  	STM32MP1_CLK_PARENT(_ETH_SEL, RCC_ETHCKSELR, 0, 0x3, eth_parents),
> -	STM32MP1_CLK_PARENT(_QSPI_SEL, RCC_QSPICKSELR, 0, 0xf, qspi_parents),
> -	STM32MP1_CLK_PARENT(_FMC_SEL, RCC_FMCCKSELR, 0, 0xf, fmc_parents),
> +	STM32MP1_CLK_PARENT(_QSPI_SEL, RCC_QSPICKSELR, 0, 0x3, qspi_parents),
> +	STM32MP1_CLK_PARENT(_FMC_SEL, RCC_FMCCKSELR, 0, 0x3, fmc_parents),
>  	STM32MP1_CLK_PARENT(_USBPHY_SEL, RCC_USBCKSELR, 0, 0x3, usbphy_parents),
>  	STM32MP1_CLK_PARENT(_USBO_SEL, RCC_USBCKSELR, 4, 0x1, usbo_parents),
>  	STM32MP1_CLK_PARENT(_STGEN_SEL, RCC_STGENCKSELR, 0, 0x3, stgen_parents),
>  	STM32MP1_CLK_PARENT(_DSI_SEL, RCC_DSICKSELR, 0, 0x1, dsi_parents),
> -	STM32MP1_CLK_PARENT(_ADC12_SEL, RCC_ADCCKSELR, 0, 0x1, adc_parents),
> +	STM32MP1_CLK_PARENT(_ADC12_SEL, RCC_ADCCKSELR, 0, 0x3, adc_parents),
>  	STM32MP1_CLK_PARENT(_SPI1_SEL, RCC_SPI2S1CKSELR, 0, 0x7, spi_parents),
>  	STM32MP1_CLK_PARENT(_RTC_SEL, RCC_BDCR, RCC_BDCR_RTCSRC_SHIFT,
>  			    (RCC_BDCR_RTCSRC_MASK >> RCC_BDCR_RTCSRC_SHIFT),

Acked-by: Patrice Chotard <patrice.chotard@st.com>

Thanks

Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
