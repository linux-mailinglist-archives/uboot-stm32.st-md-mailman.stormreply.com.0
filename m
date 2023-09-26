Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A5A57AE85C
	for <lists+uboot-stm32@lfdr.de>; Tue, 26 Sep 2023 10:54:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 433F0C6A5F2;
	Tue, 26 Sep 2023 08:54:09 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 69071C6A5EA
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Sep 2023 08:54:07 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 38Q6ogRY017300; Tue, 26 Sep 2023 10:54:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=+AwnxToXN4/Hfq4JIwXG74pJ3YNVOx8o1VwZ/Bm4nGg=; b=7D
 3TEaSZwonX0/9Wr120ikZcpTUq/1ISzNU/cXvzK187GHe4GWexzY/ksWPgoJTtpV
 kZO3/5VshLzsc0ZV7/Qx+aJaoo6MXt+oFpRNWv43tMPL8JolwzzlpobXg+V/K9ij
 WsKTahczDx0e6U1RonnLf4OGbVA1KlzfJBR13ulzT8JW8ze/rmjXwPbzZnhnoHIO
 L2qFQJ3+17zOBdHsed2erLEH89oNsOXGXV986QJOHEzQ5kka4VadBEe2UEcmcW6A
 EQoNzl5ZCBzuCXYKEwJbwN5LsReDBozjlSLlCo46DV88RS6EXzAlziDmayYf4Nrq
 9Yp8cyMBJkTc7oxgUPnw==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3t9nefkmhm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Sep 2023 10:54:04 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B30E510005C;
 Tue, 26 Sep 2023 10:54:03 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id ABFC122A6C6;
 Tue, 26 Sep 2023 10:54:03 +0200 (CEST)
Received: from [10.201.20.38] (10.201.20.38) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 26 Sep
 2023 10:54:03 +0200
Message-ID: <98c26606-e835-e127-996a-410625de5b93@foss.st.com>
Date: Tue, 26 Sep 2023 10:54:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 <u-boot@lists.denx.de>
References: <20230903204849.660722-1-dario.binacchi@amarulasolutions.com>
 <20230903204849.660722-7-dario.binacchi@amarulasolutions.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20230903204849.660722-7-dario.binacchi@amarulasolutions.com>
X-Originating-IP: [10.201.20.38]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-26_07,2023-09-25_01,2023-05-22_02
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tom Rini <trini@konsulko.com>, uboot-stm32@st-md-mailman.stormreply.com,
 linux-amarula@amarulasolutions.com,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH 06/10] ARM: dts: stm32: add touchscreen on
 stm32f746-disco board
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



On 9/3/23 22:48, Dario Binacchi wrote:
> commit f0215440069c4fb12958d2d321e05faa2708a11d Linux upstream.
> 
> The patch adds support for touchscreen on the stm32f746-disco board.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
> ---
> 
>  arch/arm/dts/stm32f746-disco.dts | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/dts/stm32f746-disco.dts b/arch/arm/dts/stm32f746-disco.dts
> index 1ed58f236149..9541f449fd0e 100644
> --- a/arch/arm/dts/stm32f746-disco.dts
> +++ b/arch/arm/dts/stm32f746-disco.dts
> @@ -7,8 +7,9 @@
>  /dts-v1/;
>  #include "stm32f746.dtsi"
>  #include "stm32f746-pinctrl.dtsi"
> -#include <dt-bindings/input/input.h>
>  #include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
>  
>  / {
>  	model = "STMicroelectronics STM32F746-DISCO board";
> @@ -63,6 +64,22 @@
>  	status = "okay";
>  };
>  
> +&i2c3 {
> +	pinctrl-0 = <&i2c3_pins_a>;
> +	pinctrl-names = "default";
> +	clock-frequency = <400000>;
> +	status = "okay";
> +
> +	touchscreen@38 {
> +		compatible = "edt,edt-ft5306";
> +		reg = <0x38>;
> +		interrupt-parent = <&gpioi>;
> +		interrupts = <13 IRQ_TYPE_EDGE_FALLING>;
> +		touchscreen-size-x = <480>;
> +		touchscreen-size-y = <272>;
> +	};
> +};
> +
>  &sdio1 {
>  	status = "okay";
>  	vmmc-supply = <&mmc_vcard>;
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
