Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 978038A7F41
	for <lists+uboot-stm32@lfdr.de>; Wed, 17 Apr 2024 11:08:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5DDC3C6DD6D;
	Wed, 17 Apr 2024 09:08:22 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 912A6C6DD67
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Apr 2024 09:08:20 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 43H8kTgr015928; Wed, 17 Apr 2024 11:08:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=xtBGIN+KHyWDEBnS+RmuZGAtVWELrXbLx7h7gwtG0fw=; b=40
 Kv3hUuRUvbBY9oz0qaCJ2vz9BD3OdhAq2NoLrCrxuT7teiS2KjfeZHGoc6KSjk+0
 N6ofLhkHaUoRJ4rz37z1rC+bxOTD+fXCrDaGMC+uAN4IZaTsf5rcQzdC5aRDJol5
 daOg+6+WXI9juU6fzEQDO5DyFl01fXv/1GNwFml/pUkiHQTyP/N5BP6vJLPOrq+y
 LEv9G4b4FP0V05PN7FiE+sy7H9r7EZfaTttU6i2dDDb6vttHsxxE7ExBqPNY7JBq
 0BbjtTfvXDqEOvioaKpsRGIoj23JeX3Ch6l/ciDs3FqVrxnQb0U67Y881/MY/nzO
 YRMaBIzyujLGHmogBD7g==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3xfhcwrs6k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Apr 2024 11:08:18 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id A03F24002D;
 Wed, 17 Apr 2024 11:07:55 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E61B5210723;
 Wed, 17 Apr 2024 11:07:41 +0200 (CEST)
Received: from [10.48.86.112] (10.48.86.112) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 17 Apr
 2024 11:07:41 +0200
Message-ID: <e0936c25-7d4b-4149-8709-6ae083c9448f@foss.st.com>
Date: Wed, 17 Apr 2024 11:07:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>, <u-boot@lists.denx.de>
References: <20240409150215.2497778-1-patrice.chotard@foss.st.com>
 <20240409150215.2497778-11-patrice.chotard@foss.st.com>
Content-Language: en-US
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20240409150215.2497778-11-patrice.chotard@foss.st.com>
X-Originating-IP: [10.48.86.112]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-17_08,2024-04-16_01,2023-05-22_02
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH v1 10/25] ARM: dts: stm32: Add gpio-keys
 for stm32mp157a-dk1-scmi-u-boot
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

Hi,

On 4/9/24 17:02, Patrice Chotard wrote:
> Instead of using "st,fastboot-gpios" and "st,stm32prog-gpios", declare
> 2 gpio-keys.
>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>
>   arch/arm/dts/stm32mp157a-dk1-scmi-u-boot.dtsi | 19 +++++++++++++++++--
>   1 file changed, 17 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/dts/stm32mp157a-dk1-scmi-u-boot.dtsi b/arch/arm/dts/stm32mp157a-dk1-scmi-u-boot.dtsi
> index 20728f27ee1..5d49b09c35d 100644
> --- a/arch/arm/dts/stm32mp157a-dk1-scmi-u-boot.dtsi
> +++ b/arch/arm/dts/stm32mp157a-dk1-scmi-u-boot.dtsi
> @@ -3,6 +3,7 @@
>    * Copyright : STMicroelectronics 2022
>    */
>   
> +#include <dt-bindings/input/linux-event-codes.h>
>   #include "stm32mp15-scmi-u-boot.dtsi"
>   
>   / {
> @@ -16,8 +17,22 @@
>   		u-boot,error-led = "error";
>   		u-boot,mmc-env-partition = "u-boot-env";
>   		st,adc_usb_pd = <&adc1 18>, <&adc1 19>;
> -		st,fastboot-gpios = <&gpioa 13 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> -		st,stm32prog-gpios = <&gpioa 14 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> +	};
> +
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +
> +		button-user-1 {
> +			label = "User-1";
> +			linux,code = <BTN_1>;
> +			gpios = <&gpioa 14 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> +		};
> +
> +		button-user-2 {
> +			label = "User-2";
> +			linux,code = <BTN_2>;
> +			gpios = <&gpioa 13 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> +		};
>   	};
>   
>   	led {



Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
