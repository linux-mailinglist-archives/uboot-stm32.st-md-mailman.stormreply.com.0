Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D080E61F377
	for <lists+uboot-stm32@lfdr.de>; Mon,  7 Nov 2022 13:37:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7C617C6334A;
	Mon,  7 Nov 2022 12:37:39 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9AA6EC04003
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Nov 2022 12:37:38 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2A7AekwV006374; Mon, 7 Nov 2022 13:37:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=OJYPxrnaZlsIFs3CM1ruUc8mUUA2u736lKgBYT1D+Ag=;
 b=zpd42adhG5rbTDHj4LaGgekrtpK9irr4BfYmics43sUyP6FQ+lHfAuJi5LpzeU+g9Ulz
 aHTkrVi384bBaljsbWEhRiQTxHKHH84YbzHmF6UwSJGno9b5hV/v0KMSJV0KvVv82tVz
 +qqnpdIFoLNIFInxLnpmPUsmSTA0rsa9ZOM8Kl2t8XAdCdhticY7Fm0F7b4Ur7gYKG7T
 puUYe5xyPvvW1X9cLcD8OZT5KNYr1Ht5ytWHPcFl2CiwxuxGbroejm1q0p/2q3HqwEey
 cjcKYI525kud4PoWdOzLAzPbbfkhAUqcfxrHEBrwBe8s4ZWvgnHTs4+jkAh2USgfTaWF Rw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3kq0ftrnef-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Nov 2022 13:37:36 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EF798100034;
 Mon,  7 Nov 2022 13:37:31 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E438F21F0C4;
 Mon,  7 Nov 2022 13:37:31 +0100 (CET)
Received: from [10.48.0.157] (10.48.0.157) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.32; Mon, 7 Nov
 2022 13:37:30 +0100
Message-ID: <1241fb3e-d567-fa3e-c996-5feba3afb2db@foss.st.com>
Date: Mon, 7 Nov 2022 13:37:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: en-US
To: Yann Gautier <yann.gautier@foss.st.com>, <u-boot@lists.denx.de>
References: <20221102135349.102615-1-yann.gautier@foss.st.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20221102135349.102615-1-yann.gautier@foss.st.com>
X-Originating-IP: [10.48.0.157]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-07_05,2022-11-07_01,2022-06-22_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Christophe KERELLO <christophe.kerello@foss.st.com>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Hi

On 11/2/22 14:53, Yann Gautier wrote:
> On STM32MP135F-DK, the SD card detect GPIO is GPIOH4.
> Backport of the Linux patch:
> https://lore.kernel.org/linux-arm-kernel/20220921160334.3227138-1-yann.gautier@foss.st.com/
>
> Signed-off-by: Yann Gautier <yann.gautier@foss.st.com>
> Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
> ---
>
>   arch/arm/dts/stm32mp135f-dk.dts | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/dts/stm32mp135f-dk.dts b/arch/arm/dts/stm32mp135f-dk.dts
> index e6b8ffd332..52f86596ce 100644
> --- a/arch/arm/dts/stm32mp135f-dk.dts
> +++ b/arch/arm/dts/stm32mp135f-dk.dts
> @@ -82,7 +82,7 @@
>   	pinctrl-0 = <&sdmmc1_b4_pins_a &sdmmc1_clk_pins_a>;
>   	pinctrl-1 = <&sdmmc1_b4_od_pins_a &sdmmc1_clk_pins_a>;
>   	pinctrl-2 = <&sdmmc1_b4_sleep_pins_a>;
> -	broken-cd;
> +	cd-gpios = <&gpioh 4 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
>   	disable-wp;
>   	st,neg-edge;
>   	bus-width = <4>;


Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick


_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
