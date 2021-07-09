Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B7663C2383
	for <lists+uboot-stm32@lfdr.de>; Fri,  9 Jul 2021 14:38:53 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E3A0DCFAC5A;
	Fri,  9 Jul 2021 12:38:52 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 83B0AC424BD
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 Jul 2021 12:38:51 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 169CRG1x012115; Fri, 9 Jul 2021 14:38:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=3ps6RfhyWPQPjG/fNkR8Vn8Q1toNi/Gvu/bD2AfkBJE=;
 b=R08jIh7AzS0aJCWez2o8jc8a4gsB1/PdpEESl00f46gfj1Zod8oiSGrA2Se2rPYzwDWy
 8UNXaAol/vWOQ1FcjKzShZmEl9uZSxVnbsl9bE+2KWRRG7bjCGiOgR953eQLyqTzsCA3
 sdSAxpxT7P7QzxbrJCJIbs7zibo36ptIs/XyueyAT8d53IeHs/UxDwhth3+WD+OBHe6x
 OwZIt0Y9LKerKNqbU6WMMPvP8JoA4Gw30KGVw27Jf8bJHGAk/dT2h5BsXYL34GeN97pW
 oD63+BNP1HnuU+9yhWnBWhcjZ2aoIeVCSyw/gxJIg83db2bKaJxqvcFrAnWrdwclmBHn Vg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 39p4vbcx3j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Jul 2021 14:38:50 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AF786100034;
 Fri,  9 Jul 2021 14:38:49 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A4F2D2248A2;
 Fri,  9 Jul 2021 14:38:49 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.49) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 9 Jul
 2021 14:38:49 +0200
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20210709095322.1.I3841c4ea8add371529df3e03de5439659a69f38b@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <5770954f-afe7-1413-5e68-7bb0865f3c17@foss.st.com>
Date: Fri, 9 Jul 2021 14:38:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210709095322.1.I3841c4ea8add371529df3e03de5439659a69f38b@changeid>
Content-Language: en-US
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-09_05:2021-07-09,
 2021-07-09 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH] stm32mp1: add pull-up for gpio button
	PA13 and PA14
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

On 7/9/21 9:53 AM, Patrick Delaunay wrote:
> When a push-button is released and PA13/PA14 are defined as input (high-Z)
> the LED should not be active as the circuit is open but a small current
> leak through PCB or push-button close the circuit and allows a small LED
> bias giving erroneous level voltage.
> 
> So it is recommended to activate an internal pull-up in order to clearly
> fix the voltage at PA13/PA14 when button is released and to wait
> a short delay before to read the GPIO value only when the pull-up is
> correctly configured.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi | 4 ++--
>  arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi | 4 ++--
>  board/st/stm32mp1/stm32mp1.c             | 2 ++
>  3 files changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi b/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
> index 6787619290..d44da7566f 100644
> --- a/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
> +++ b/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
> @@ -18,8 +18,8 @@
>  		u-boot,error-led = "error";
>  		u-boot,mmc-env-partition = "ssbl";
>  		st,adc_usb_pd = <&adc1 18>, <&adc1 19>;
> -		st,fastboot-gpios = <&gpioa 13 GPIO_ACTIVE_LOW>;
> -		st,stm32prog-gpios = <&gpioa 14 GPIO_ACTIVE_LOW>;
> +		st,fastboot-gpios = <&gpioa 13 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> +		st,stm32prog-gpios = <&gpioa 14 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
>  	};
>  
>  	firmware {
> diff --git a/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi b/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi
> index f3002e995b..3b94218b2f 100644
> --- a/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi
> +++ b/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi
> @@ -18,8 +18,8 @@
>  		u-boot,boot-led = "heartbeat";
>  		u-boot,error-led = "error";
>  		u-boot,mmc-env-partition = "ssbl";
> -		st,fastboot-gpios = <&gpioa 13 GPIO_ACTIVE_LOW>;
> -		st,stm32prog-gpios = <&gpioa 14 GPIO_ACTIVE_LOW>;
> +		st,fastboot-gpios = <&gpioa 13 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> +		st,stm32prog-gpios = <&gpioa 14 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
>  	};
>  
>  	firmware {
> diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
> index 18b8870269..e1796e7e31 100644
> --- a/board/st/stm32mp1/stm32mp1.c
> +++ b/board/st/stm32mp1/stm32mp1.c
> @@ -155,6 +155,7 @@ static void board_key_check(void)
>  					       &gpio, GPIOD_IS_IN)) {
>  			log_debug("could not find a /config/st,fastboot-gpios\n");
>  		} else {
> +			udelay(20);
>  			if (dm_gpio_get_value(&gpio)) {
>  				log_notice("Fastboot key pressed, ");
>  				boot_mode = BOOT_FASTBOOT;
> @@ -168,6 +169,7 @@ static void board_key_check(void)
>  					       &gpio, GPIOD_IS_IN)) {
>  			log_debug("could not find a /config/st,stm32prog-gpios\n");
>  		} else {
> +			udelay(20);
>  			if (dm_gpio_get_value(&gpio)) {
>  				log_notice("STM32Programmer key pressed, ");
>  				boot_mode = BOOT_STM32PROG;
> 

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
