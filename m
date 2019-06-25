Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F2C54D8E
	for <lists+uboot-stm32@lfdr.de>; Tue, 25 Jun 2019 13:26:25 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A2FB5C0B761
	for <lists+uboot-stm32@lfdr.de>; Tue, 25 Jun 2019 11:26:25 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AC4B0C0B760
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Jun 2019 11:26:22 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5PBQ40n028308; Tue, 25 Jun 2019 13:26:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=bPWTgMrK6IqheXPvMXYkfjq826R80llx/iMsnMvYBP0=;
 b=iECZoo7SJBf7EN01459w9kyUuFRZ3A19WoLAspbrPDMXQLZb0H8NF522zsHN0GUigEyA
 9BMTXGNu/coylk3JR/WnrUWcNwWZg05b2htzgroUTD95juWb6P8+IkdqjK/TqEusXbAO
 UPJzffLOVE/h3JTbYJxQFv/BlvuwR8wHkIClPx4BO7U4LONWlPZjbjXguD411zIClc2t
 bR1jKIRhPOXiRelO5QU3fjoHy6sE+gVLBVxi2bFjpYaddW7pV9G9WBMz9egSRJlM3ARJ
 kLX0aB2Hs+HxjrzI5blkpAp4oVPupFYq7PQJD5/c73izR+/o0r7YblXIP0SWuiOu3em7 GQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2t9d2g8wrf-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 25 Jun 2019 13:26:21 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 63B4834;
 Tue, 25 Jun 2019 11:26:20 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4B1282845;
 Tue, 25 Jun 2019 11:26:20 +0000 (GMT)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 25 Jun
 2019 13:26:19 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 25 Jun 2019 13:26:19 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Benjamin GAIGNARD <benjamin.gaignard@st.com>, Patrick DELAUNAY
 <patrick.delaunay@st.com>, "sjg@chromium.org" <sjg@chromium.org>
Thread-Topic: [PATCH 1/2] clk: stm32mp1: Add RTC clock entry
Thread-Index: AQHVKzfEB5eN59eXMkmWWdv5SVmAJaasGaeA
Date: Tue, 25 Jun 2019 11:26:19 +0000
Message-ID: <fe4d868e-ba47-b8f2-0adb-87dcf70e994d@st.com>
References: <20190625092401.4573-1-benjamin.gaignard@st.com>
 <20190625092401.4573-2-benjamin.gaignard@st.com>
In-Reply-To: <20190625092401.4573-2-benjamin.gaignard@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.44]
Content-ID: <2D69BDED112EAD4A9EAF072C071B67A6@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-25_08:, , signatures=0
Cc: "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Subject: Re: [Uboot-stm32] [PATCH 1/2] clk: stm32mp1: Add RTC clock entry
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

Hi Benjamin

On 6/25/19 11:24 AM, Benjamin Gaignard wrote:
> From: Patrick Delaunay <patrick.delaunay@st.com>
>
> Add RTCAPB and RTC clock support.
>
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>  drivers/clk/clk_stm32mp1.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/drivers/clk/clk_stm32mp1.c b/drivers/clk/clk_stm32mp1.c
> index f295e4864b..97d4a34deb 100644
> --- a/drivers/clk/clk_stm32mp1.c
> +++ b/drivers/clk/clk_stm32mp1.c
> @@ -300,6 +300,7 @@ enum stm32mp1_parent_sel {
>  	_DSI_SEL,
>  	_ADC12_SEL,
>  	_SPI1_SEL,
> +	_RTC_SEL,
>  	_PARENT_SEL_NB,
>  	_UNKNOWN_SEL = 0xff,
>  };
> @@ -534,6 +535,7 @@ static const struct stm32mp1_clk_gate stm32mp1_clk_gate[] = {
>  	STM32MP1_CLK_SET_CLR(RCC_MP_APB4ENSETR, 16, USBPHY_K, _USBPHY_SEL),
>  
>  	STM32MP1_CLK_SET_CLR(RCC_MP_APB5ENSETR, 2, I2C4_K, _I2C46_SEL),
> +	STM32MP1_CLK_SET_CLR(RCC_MP_APB5ENSETR, 8, RTCAPB, _PCLK5),
>  	STM32MP1_CLK_SET_CLR(RCC_MP_APB5ENSETR, 20, STGEN_K, _STGEN_SEL),
>  
>  	STM32MP1_CLK_SET_CLR_F(RCC_MP_AHB2ENSETR, 5, ADC12, _HCLK2),
> @@ -569,6 +571,8 @@ static const struct stm32mp1_clk_gate stm32mp1_clk_gate[] = {
>  	STM32MP1_CLK_SET_CLR(RCC_MP_AHB6ENSETR, 24, USBH, _UNKNOWN_SEL),
>  
>  	STM32MP1_CLK(RCC_DBGCFGR, 8, CK_DBG, _UNKNOWN_SEL),
> +
> +	STM32MP1_CLK(RCC_BDCR, 20, RTC, _RTC_SEL),
>  };
>  
>  static const u8 i2c12_parents[] = {_PCLK1, _PLL4_R, _HSI_KER, _CSI_KER};
> @@ -594,6 +598,7 @@ static const u8 dsi_parents[] = {_DSI_PHY, _PLL4_P};
>  static const u8 adc_parents[] = {_PLL4_R, _CK_PER, _PLL3_Q};
>  static const u8 spi_parents[] = {_PLL4_P, _PLL3_Q, _I2S_CKIN, _CK_PER,
>  				 _PLL3_R};
> +static const u8 rtc_parents[] = {_UNKNOWN_ID, _LSE, _LSI, _HSE};
>  
>  static const struct stm32mp1_clk_sel stm32mp1_clk_sel[_PARENT_SEL_NB] = {
>  	STM32MP1_CLK_PARENT(_I2C12_SEL, RCC_I2C12CKSELR, 0, 0x7, i2c12_parents),
> @@ -619,6 +624,9 @@ static const struct stm32mp1_clk_sel stm32mp1_clk_sel[_PARENT_SEL_NB] = {
>  	STM32MP1_CLK_PARENT(_DSI_SEL, RCC_DSICKSELR, 0, 0x1, dsi_parents),
>  	STM32MP1_CLK_PARENT(_ADC12_SEL, RCC_ADCCKSELR, 0, 0x1, adc_parents),
>  	STM32MP1_CLK_PARENT(_SPI1_SEL, RCC_SPI2S1CKSELR, 0, 0x7, spi_parents),
> +	STM32MP1_CLK_PARENT(_RTC_SEL, RCC_BDCR, RCC_BDCR_RTCSRC_SHIFT,
> +			    (RCC_BDCR_RTCSRC_MASK >> RCC_BDCR_RTCSRC_SHIFT),
> +			    rtc_parents),
>  };
>  
>  #ifdef STM32MP1_CLOCK_TREE_INIT
> @@ -734,6 +742,7 @@ char * const stm32mp1_clk_parent_sel_name[_PARENT_SEL_NB] = {
>  	[_DSI_SEL] = "DSI",
>  	[_ADC12_SEL] = "ADC12",
>  	[_SPI1_SEL] = "SPI1",
> +	[_RTC_SEL] = "RTC",
>  };
>  
>  static const struct stm32mp1_clk_data stm32mp1_data = {

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>


Thanks

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
