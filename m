Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 07811A590B1
	for <lists+uboot-stm32@lfdr.de>; Mon, 10 Mar 2025 11:04:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BDA7BC78F99;
	Mon, 10 Mar 2025 10:04:39 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 99F3BC78F96
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Mar 2025 10:04:38 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52A8SoPO032034;
 Mon, 10 Mar 2025 11:04:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 ufhyyY9mXi2j9a5z/1Y1IKW/4xFIwxsUk3T43SvTCuQ=; b=vji767J3RQHhd1pW
 OspcIlsxlsk+LaLo9dAfx4Om53o7MBX6jD2cNEp5QCwj6BaW3VvQkxe7XhtQHk/+
 aXKXuBr06DKI1AfR/xQ07xnjH7xveHUiovPL6vPpHLoi1ecZgpvv6htQe+/1uONX
 +ccqHedFe5v/+Dwl1k+2ZZdmLjlEJy9Pqj/EjLquZsD0W9vF48CLrPQ32ywNfhll
 s6iuZPugP1GoadRnjT4Mz4XsmnT7QLwE337kDGhmi5Y5GMHCQZ/je+jFy2yMyCvz
 kUL8ubsz2r6ek4wGMBADnmRIZDWDc4ajKrpxpikTVV5S2CFy+PchnnEcLrvPLJY8
 HN3SCg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 458f571y0x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Mar 2025 11:04:35 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id DF93A4005E;
 Mon, 10 Mar 2025 11:03:32 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1C38257240D;
 Mon, 10 Mar 2025 11:02:57 +0100 (CET)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 10 Mar
 2025 11:02:56 +0100
Message-ID: <1401381a-5d93-49c5-b20b-44d8d17de589@foss.st.com>
Date: Mon, 10 Mar 2025 11:02:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 <u-boot@lists.denx.de>
References: <20250224183931.313491-1-dario.binacchi@amarulasolutions.com>
 <20250224183931.313491-2-dario.binacchi@amarulasolutions.com>
 <7635c849-40d5-4d80-b4f3-870b89cb57cb@foss.st.com>
Content-Language: en-US
In-Reply-To: <7635c849-40d5-4d80-b4f3-870b89cb57cb@foss.st.com>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-10_04,2025-03-07_03,2024-11-22_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>,
 Vikas Manocha <vikas.manocha@st.com>, uboot-stm32@st-md-mailman.stormreply.com
Subject: Re: [Uboot-stm32] [PATCH v2 2/3] ARM: dts: stm32: drop "st,
	led1" compatible
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



On 2/25/25 10:53, Patrice CHOTARD wrote:
> 
> 
> On 2/24/25 19:39, Dario Binacchi wrote:
>> It is pointless to use the custom compatible "st,led1" when
>> stm32746g-eval.dts and stm32f769-disco.dts already contain the
>> "gpio-leds" compatible, which is specifically used for GPIO LEDs
>> management.
>>
>> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
>>
>> ---
>>
>> Changes in v2:
>> - Drop leds node from stm32f746-disco-u-boot.dtsi
>>
>>  arch/arm/dts/stm32746g-eval-u-boot.dtsi    |  5 -----
>>  arch/arm/dts/stm32f746-disco-u-boot.dtsi   |  5 -----
>>  arch/arm/dts/stm32f769-disco-u-boot.dtsi   |  5 -----
>>  board/st/stm32f746-disco/stm32f746-disco.c | 16 ----------------
>>  4 files changed, 31 deletions(-)
>>
>> diff --git a/arch/arm/dts/stm32746g-eval-u-boot.dtsi b/arch/arm/dts/stm32746g-eval-u-boot.dtsi
>> index f64329287357..32b5c7cea4b8 100644
>> --- a/arch/arm/dts/stm32746g-eval-u-boot.dtsi
>> +++ b/arch/arm/dts/stm32746g-eval-u-boot.dtsi
>> @@ -22,11 +22,6 @@
>>  		mmc0 = &sdio1;
>>  		spi0 = &qspi;
>>  	};
>> -
>> -	led1 {
>> -		compatible = "st,led1";
>> -		led-gpio = <&gpiof 10 0>;
>> -	};
>>  };
>>  
>>  &fmc {
>> diff --git a/arch/arm/dts/stm32f746-disco-u-boot.dtsi b/arch/arm/dts/stm32f746-disco-u-boot.dtsi
>> index a79fca261a2c..38d797e49a0a 100644
>> --- a/arch/arm/dts/stm32f746-disco-u-boot.dtsi
>> +++ b/arch/arm/dts/stm32f746-disco-u-boot.dtsi
>> @@ -22,11 +22,6 @@
>>  		mmc0 = &sdio1;
>>  		spi0 = &qspi;
>>  	};
>> -
>> -	led1 {
>> -		compatible = "st,led1";
>> -		led-gpio = <&gpioi 1 0>;
>> -	};
>>  };
>>  
>>  &ltdc {
>> diff --git a/arch/arm/dts/stm32f769-disco-u-boot.dtsi b/arch/arm/dts/stm32f769-disco-u-boot.dtsi
>> index a50fba64dcd2..7c99a6e61b68 100644
>> --- a/arch/arm/dts/stm32f769-disco-u-boot.dtsi
>> +++ b/arch/arm/dts/stm32f769-disco-u-boot.dtsi
>> @@ -23,11 +23,6 @@
>>  		spi0 = &qspi;
>>  	};
>>  
>> -	led1 {
>> -		compatible = "st,led1";
>> -		led-gpio = <&gpioj 5 0>;
>> -	};
>> -
>>  	panel: panel {
>>  		compatible = "orisetech,otm8009a";
>>  		reset-gpios = <&gpioj 15 1>;
>> diff --git a/board/st/stm32f746-disco/stm32f746-disco.c b/board/st/stm32f746-disco/stm32f746-disco.c
>> index 65a39d965c72..72f479cea66f 100644
>> --- a/board/st/stm32f746-disco/stm32f746-disco.c
>> +++ b/board/st/stm32f746-disco/stm32f746-disco.c
>> @@ -78,22 +78,6 @@ u32 spl_boot_device(void)
>>  
>>  int board_late_init(void)
>>  {
>> -	struct gpio_desc gpio = {};
>> -	int node;
>> -
>> -	node = fdt_node_offset_by_compatible(gd->fdt_blob, 0, "st,led1");
>> -	if (node < 0)
>> -		return -1;
>> -
>> -	gpio_request_by_name_nodev(offset_to_ofnode(node), "led-gpio", 0, &gpio,
>> -				   GPIOD_IS_OUT);
>> -
>> -	if (dm_gpio_is_valid(&gpio)) {
>> -		dm_gpio_set_value(&gpio, 0);
>> -		mdelay(10);
>> -		dm_gpio_set_value(&gpio, 1);
>> -	}
>> -
>>  	return 0;
>>  }
>>  
> 
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> Thanks
> Patrice
Applied to u-boot-stm32/next

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
