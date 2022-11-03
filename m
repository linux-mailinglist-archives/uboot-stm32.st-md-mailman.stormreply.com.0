Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB606177E5
	for <lists+uboot-stm32@lfdr.de>; Thu,  3 Nov 2022 08:45:51 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6AE23C04003;
	Thu,  3 Nov 2022 07:45:51 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B9ABAC03FD6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  3 Nov 2022 07:45:49 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2A34WhnI023948; Thu, 3 Nov 2022 08:45:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=5KeLWe3fq/RO0nvjdIVe33Wr35A5qvxooXULAxtG7MA=;
 b=ukTUcSmz8ByVjSswAk3nCW48oqJPXQOFbYu5UVg8b5trzBU3YjlqsZyA8hiJHi0XtLfg
 AjHciqujt1lj/x6vyuWFBL8Lo8Z5WTvbL9fjrM6HEoyALs8dpvqyaN3BGmwuIeqIK+go
 e7nl53AF0d06cfsOXCzFuBpkdA681u1yK7CGx3lUX6GZJcqNouQpm1is2s1rhm1tJgEr
 1Iq5DeVNbQRMCT71vibof7bI0X72Rq8L9drqVDyqBTrQX6/UND6eFJs3YfQjl1bmlfqN
 pBBss5utKMV6zuHWvVLzo8M2zTpTd0D+te4PrLwI4nTv9VXMfOtzY0rdwCRR+AQ2w9uw Tw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3kknqvxr1y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Nov 2022 08:45:46 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 466E310002A;
 Thu,  3 Nov 2022 08:45:42 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3D27E2132E9;
 Thu,  3 Nov 2022 08:45:42 +0100 (CET)
Received: from [10.252.29.133] (10.252.29.133) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Thu, 3 Nov
 2022 08:45:41 +0100
Message-ID: <cf75807b-51c0-83f4-1122-97df2ff57281@foss.st.com>
Date: Thu, 3 Nov 2022 08:45:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: en-US
To: Yann Gautier <yann.gautier@foss.st.com>, <u-boot@lists.denx.de>
References: <20221102135349.102615-1-yann.gautier@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20221102135349.102615-1-yann.gautier@foss.st.com>
X-Originating-IP: [10.252.29.133]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-02_15,2022-11-02_01,2022-06-22_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Christophe KERELLO <christophe.kerello@foss.st.com>,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH 1/2] ARM: dts: stm32: add sdmmc cd-gpios
 for STM32MP135F-DK
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



On 11/2/22 14:53, Yann Gautier wrote:
> On STM32MP135F-DK, the SD card detect GPIO is GPIOH4.
> Backport of the Linux patch:
> https://lore.kernel.org/linux-arm-kernel/20220921160334.3227138-1-yann.gautier@foss.st.com/
> 
> Signed-off-by: Yann Gautier <yann.gautier@foss.st.com>
> Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
> ---
> 
>  arch/arm/dts/stm32mp135f-dk.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/dts/stm32mp135f-dk.dts b/arch/arm/dts/stm32mp135f-dk.dts
> index e6b8ffd332..52f86596ce 100644
> --- a/arch/arm/dts/stm32mp135f-dk.dts
> +++ b/arch/arm/dts/stm32mp135f-dk.dts
> @@ -82,7 +82,7 @@
>  	pinctrl-0 = <&sdmmc1_b4_pins_a &sdmmc1_clk_pins_a>;
>  	pinctrl-1 = <&sdmmc1_b4_od_pins_a &sdmmc1_clk_pins_a>;
>  	pinctrl-2 = <&sdmmc1_b4_sleep_pins_a>;
> -	broken-cd;
> +	cd-gpios = <&gpioh 4 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
>  	disable-wp;
>  	st,neg-edge;
>  	bus-width = <4>;
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
