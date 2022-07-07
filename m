Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD6D569BC7
	for <lists+uboot-stm32@lfdr.de>; Thu,  7 Jul 2022 09:39:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 87AA9C0D2BF;
	Thu,  7 Jul 2022 07:39:20 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ACA4CC5F1ED
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 Jul 2022 07:39:18 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26768Chl030872;
 Thu, 7 Jul 2022 09:39:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=yFMmg623HWzT7Nwslj8PuWNAaivzknpKBC8sC0dGy38=;
 b=AGix3EzdqJCf/4S9LaelkYv98jpZCGVBDN7JGuCO+PUZCAUuC/zyCHBWcc1ioucWLYLm
 wwmS9yqm4mHUiOQXR+0/tpOIyLZltLm2dPbX23x1P7sKt44xiXVc/0/aby6wYQNTcx01
 t4Y1OrVNkiTrsWhUIAtPRnyk5s4gZYzI/uNCOUnnM7ct15RPFYSIL8uComisaJEN7StO
 h7G0SkqTYZy4ELBA36Q9K4ZTwO9009IlzKBtuqcqw4kt98Y1SYOMjMHMVBBHnVrv5Y0G
 o1USXTeOnilEaV+Rc84vqS2khv/lt8fvxsTT4BKbylorkY/ruiutMGBMfF90fCZaMhs0 6A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3h4uadjy1d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 07 Jul 2022 09:39:17 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id ED2C510002A;
 Thu,  7 Jul 2022 09:39:16 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E800921161B;
 Thu,  7 Jul 2022 09:39:16 +0200 (CEST)
Received: from [10.201.20.162] (10.75.127.51) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Thu, 7 Jul
 2022 09:39:16 +0200
Message-ID: <e5605a81-2f6b-da4f-ac1f-199815136f68@foss.st.com>
Date: Thu, 7 Jul 2022 09:39:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20220630101930.v2.1.I32e861dc46886c23a866443be2bace22d86ae24e@changeid>
 <20220630101930.v2.5.Ia333feef96fc01ae8bf7d69c63581eca42559458@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20220630101930.v2.5.Ia333feef96fc01ae8bf7d69c63581eca42559458@changeid>
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-07_06,2022-06-28_01,2022-06-22_01
Cc: uboot-stm32@st-md-mailman.stormreply.com, Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH v2 05/10] ARM: dts: stm32mp13: activate
 led on STM32MP13F-DK
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

On 6/30/22 10:20, Patrick Delaunay wrote:
> Activate the led managed in stm32mp1 board for U-Boot indication
> in STM32MP13F-DK device tree.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
> (no changes since v1)
> 
>  arch/arm/dts/stm32mp135f-dk-u-boot.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm/dts/stm32mp135f-dk-u-boot.dtsi b/arch/arm/dts/stm32mp135f-dk-u-boot.dtsi
> index dfe5bbb2e34..cbe4eb56083 100644
> --- a/arch/arm/dts/stm32mp135f-dk-u-boot.dtsi
> +++ b/arch/arm/dts/stm32mp135f-dk-u-boot.dtsi
> @@ -11,8 +11,18 @@
>  	};
>  
>  	config {
> +		u-boot,boot-led = "led-blue";
> +		u-boot,error-led = "led-red";
>  		u-boot,mmc-env-partition = "u-boot-env";
>  	};
> +
> +	leds {
> +		led-red {
> +			color = <LED_COLOR_ID_RED>;
> +			gpios = <&gpioa 13 GPIO_ACTIVE_LOW>;
> +			default-state = "off";
> +		};
> +	};
>  };
>  
>  &uart4 {

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
