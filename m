Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 523F240C1E1
	for <lists+uboot-stm32@lfdr.de>; Wed, 15 Sep 2021 10:37:47 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1D4ECC597BE;
	Wed, 15 Sep 2021 08:37:47 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3F34DC597BC
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Sep 2021 08:37:46 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18F5igs6017993; 
 Wed, 15 Sep 2021 10:37:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=LZqfb/YYw5+xBMBBHxUQttPTnCdMcHLQARZM79cQFP0=;
 b=o/DiGEjBAnPpIG6sOaGnfWv/WqHxL6BSVFi6bZdy9FJ0jBtX//4+vVuJGHpk8/S6rhN9
 SYUKadjNWoi/zhU2OWU5HmL77hf/HkNUfDiYKy6Ct+NTpLaQ4NCU7+oeTvpiJhAdSkEU
 GSq8Xax4rF+lEMV3zGlvVgm0WhDOkdEt6bth6RF+jtZk4auEN7ul66MzOuf453+4xv8E
 eL7PhljjtAs28m4v1ZLm+XMqb3MbpA2ei4ZLWK0kQXs8cBUGQMLBnzfRR/ZGNguIdiW4
 N0LPcCnIpsmkv8+9HpTk0n8oYqk1IWrva0TZhptTyITIawiqQ1x2WMX2gO2HkzudP0jg ng== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3b3axv91tn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Sep 2021 10:37:44 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A1B8710002A;
 Wed, 15 Sep 2021 10:37:43 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 955DA212307;
 Wed, 15 Sep 2021 10:37:43 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.47) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Wed, 15 Sep
 2021 10:37:43 +0200
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20210914141449.1.I0015d48aa38713a09d1789547c90a9c444f1321e@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <c32fdf1d-41ff-f9a1-5c86-0e8524cde752@foss.st.com>
Date: Wed, 15 Sep 2021 10:37:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210914141449.1.I0015d48aa38713a09d1789547c90a9c444f1321e@changeid>
Content-Language: en-US
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-15_01,2021-09-14_01,2020-04-07_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>,
 Alexandru Gagniuc <mr.nuke.me@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH] arm: dts: stm32mp1: use ssbl partition
	name for U-Boot
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

HI Patrick

On 9/14/21 2:14 PM, Patrick Delaunay wrote:
> Continue to use the "ssbl" name for GPT partition of secondary boot
> stage = U-Boot for basic boot with SPL to avoid to disturb existing user.
> 
> The "fip" partition name is only used for TFA_BOOT with FIP, it is a TF-A
> BL2 requirement; it the default configuration for STMicroelectronics
> boards.
> 
> Fixes: b73e8bf453f8 ("arm: stm32mp: add defconfig for trusted boot with FIP")
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi | 4 +++-
>  arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi | 4 +++-
>  2 files changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi b/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
> index 0101962ea5..15a04ae927 100644
> --- a/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
> +++ b/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
> @@ -21,11 +21,13 @@
>  		st,stm32prog-gpios = <&gpioa 14 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
>  	};
>  
> -#ifdef CONFIG_STM32MP15x_STM32IMAGE
> +#if defined(CONFIG_STM32MP15x_STM32IMAGE) || defined(CONFIG_SPL)
>  	config {
>  		u-boot,mmc-env-partition = "ssbl";
>  	};
> +#endif
>  
> +#ifdef CONFIG_STM32MP15x_STM32IMAGE
>  	/* only needed for boot with TF-A, witout FIP support */
>  	firmware {
>  		optee {
> diff --git a/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi b/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi
> index 32777384c6..408abaf52f 100644
> --- a/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi
> +++ b/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi
> @@ -20,11 +20,13 @@
>  		st,stm32prog-gpios = <&gpioa 14 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
>  	};
>  
> -#ifdef CONFIG_STM32MP15x_STM32IMAGE
> +#if defined(CONFIG_STM32MP15x_STM32IMAGE) || defined(CONFIG_SPL)
>  	config {
>  		u-boot,mmc-env-partition = "ssbl";
>  	};
> +#endif
>  
> +#ifdef CONFIG_STM32MP15x_STM32IMAGE
>  	/* only needed for boot with TF-A, witout FIP support */
>  	firmware {
>  		optee {
> 
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
