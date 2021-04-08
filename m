Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 414EC3584FD
	for <lists+uboot-stm32@lfdr.de>; Thu,  8 Apr 2021 15:42:17 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E4CE3C56639;
	Thu,  8 Apr 2021 13:42:16 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E21D2C32E8F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Apr 2021 13:42:15 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 138Dfuq3004296; Thu, 8 Apr 2021 15:41:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=QUC4H2uPdzXLjMWY2bPW9OCAtRlUcUTp9kLId4izSws=;
 b=P7AOBi9yvv0XEPqJ8ygjzaREP0HQchcA4JHcq4iz/6a2zpvUwljzEuxrZjcRAUO9n0xn
 wL1BnfZV6XNs6aKgGhEoGF2GDf9N02LV7SN/qY6cCea7hT4skNQa8R4nTUQJso5ZMgpn
 v+ZzeW6DF281qVXiMGpleOkkYA5mUqBMr8FGCYMZ/gGBLERmT7p/Ll8fiiW64skmk6yM
 vouGY59KyBAXuCyZYUiNwEasTluhdk3LhZz+suE0hzWRUkjAezTmqSatvUmscUZZcgdF
 2ZHp61OX4VttEQO5N76mWDAaoVyedBwRxFk4O7nDE4U4Hb+IhPtcgVcuRQI1NMwwR5j4 zQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 37ssm3k2s4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Apr 2021 15:41:58 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 145D910002A;
 Thu,  8 Apr 2021 15:41:57 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F1CFC237044;
 Thu,  8 Apr 2021 15:41:56 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.51) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 8 Apr
 2021 15:41:56 +0200
To: <dillon.minfei@gmail.com>, <kever.yang@rock-chips.com>,
 <andre.przywara@arm.com>, <priyanka.jain@nxp.com>,
 <jagan@amarulasolutions.com>, <narmstrong@baylibre.com>,
 <marex@denx.de>, <aford173@gmail.com>, <ioana.ciornei@nxp.com>,
 <josip.kelecic@sartura.hr>, <festevam@gmail.com>, <hs@denx.de>,
 <heiko.stuebner@theobroma-systems.com>, <u-boot@lists.denx.de>,
 <patrick.delaunay@foss.st.com>,
 <uboot-stm32@st-md-mailman.stormreply.com>, <sjg@chromium.org>
References: <1617352961-20550-1-git-send-email-dillon.minfei@gmail.com>
 <1617352961-20550-4-git-send-email-dillon.minfei@gmail.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <37007a2d-39bc-38cc-dd4e-96a7eaad7e9d@foss.st.com>
Date: Thu, 8 Apr 2021 15:41:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1617352961-20550-4-git-send-email-dillon.minfei@gmail.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-08_03:2021-04-08,
 2021-04-08 signatures=0
Subject: Re: [Uboot-stm32] [PATCH v4 3/7] ARM: dts: stm32: add new instances
 for stm32h743 MCU
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

Hi Dillon

On 4/2/21 10:42 AM, dillon.minfei@gmail.com wrote:
> From: dillon min <dillon.minfei@gmail.com>
> 
> Some instances are missing in current support of stm32h743 MCU. This commit
> adds usart3/uart4 and sdmmc2 support.
> 
> Signed-off-by: dillon min <dillon.minfei@gmail.com>
> ---
> v4: sync with kernel side commit
> link:
> https://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git/commit/?h=stm32-dt-for-v5.13&id=4e1593391fa38c0a8ec0f314f37ec5543475bf9d
> 
>  arch/arm/dts/stm32h743.dtsi | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/arch/arm/dts/stm32h743.dtsi b/arch/arm/dts/stm32h743.dtsi
> index 8c96698..77a8aef 100644
> --- a/arch/arm/dts/stm32h743.dtsi
> +++ b/arch/arm/dts/stm32h743.dtsi
> @@ -99,6 +99,22 @@
>  			clocks = <&rcc USART2_CK>;
>  		};
>  
> +		usart3: serial@40004800 {
> +			compatible = "st,stm32h7-uart";
> +			reg = <0x40004800 0x400>;
> +			interrupts = <39>;
> +			status = "disabled";
> +			clocks = <&rcc USART3_CK>;
> +		};
> +
> +		uart4: serial@40004c00 {
> +			compatible = "st,stm32h7-uart";
> +			reg = <0x40004c00 0x400>;
> +			interrupts = <52>;
> +			status = "disabled";
> +			clocks = <&rcc UART4_CK>;
> +		};
> +
>  		i2c1: i2c@40005400 {
>  			compatible = "st,stm32f7-i2c";
>  			#address-cells = <1>;
> @@ -332,6 +348,20 @@
>  			max-frequency = <120000000>;
>  		};
>  
> +		sdmmc2: sdmmc@48022400 {
> +			compatible = "arm,pl18x", "arm,primecell";
> +			arm,primecell-periphid = <0x10153180>;
> +			reg = <0x48022400 0x400>;
> +			interrupts = <124>;
> +			interrupt-names	= "cmd_irq";
> +			clocks = <&rcc SDMMC2_CK>;
> +			clock-names = "apb_pclk";
> +			resets = <&rcc STM32H7_AHB2_RESET(SDMMC2)>;
> +			cap-sd-highspeed;
> +			cap-mmc-highspeed;
> +			max-frequency = <120000000>;
> +		};
> +
>  		exti: interrupt-controller@58000000 {
>  			compatible = "st,stm32h7-exti";
>  			interrupt-controller;
> 

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
