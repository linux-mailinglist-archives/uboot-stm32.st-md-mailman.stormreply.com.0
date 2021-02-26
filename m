Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E95532641E
	for <lists+uboot-stm32@lfdr.de>; Fri, 26 Feb 2021 15:33:53 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 825A7C57189;
	Fri, 26 Feb 2021 14:33:52 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EE567C3FADC
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Feb 2021 14:33:50 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11QEXE3D032391; Fri, 26 Feb 2021 15:33:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=4BluljZmEhIqs3n1Rq4zcZ20h4hdtHgP6vd2BGwenEo=;
 b=EUi7MGwPyB6Kw7RUE8aA8InHVH2YMp56LFNLWQXv3nDusD6ZY7y2+nWCpL6dZizU5fnQ
 9NxhBsON6v2Nb09qwe5au3v47CN2SmbcrvNRND9Hy3rnUTpFb8vqTsZhbqWStrLXYIzd
 7CvuTIJxzWYhjaoySu+xGgh3VENJHYv/Dwrw3i1xpjR7q6Tncsf9rdH0FzO3x3lrWqbY
 ziIneXvK4FVdSX3g/ETiA6s9PkAB64H9UUN9qYCtGHQLhqFW2IO6QA05rcvWqsHJPQgY
 c75Vw9DLZMvQZvVs84d0PQHgfQhlQ8SxfBl0bxsR82cRgK1q9YJYh+RBOonu3xgamQ4T hQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36w66ue47w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Feb 2021 15:33:47 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CB3D610002A;
 Fri, 26 Feb 2021 15:33:46 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AC38D23FEB3;
 Fri, 26 Feb 2021 15:33:46 +0100 (CET)
Received: from lmecxl0573.lme.st.com (10.75.127.48) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 26 Feb
 2021 15:33:46 +0100
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20210224110052.1.Ic9a63839b6826cc50ac66c2e87b1abf12bc5adfd@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <ef054e02-f60b-d94f-9275-1467509e4f57@foss.st.com>
Date: Fri, 26 Feb 2021 15:33:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210224110052.1.Ic9a63839b6826cc50ac66c2e87b1abf12bc5adfd@changeid>
Content-Language: en-US
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-26_03:2021-02-24,
 2021-02-26 signatures=0
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 uboot-stm32@st-md-mailman.stormreply.com
Subject: Re: [Uboot-stm32] [PATCH] arm: dts: stm32mp15: remove duplicate
	uart nodes
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

On 2/24/21 11:00 AM, Patrick Delaunay wrote:
> Remove duplicated uart nodes introduced with commit 62f95af92a3f
> ("ARM: dts: stm32mp1: DT alignment with Linux kernel v5.9-rc4"),
> because the uart nodes wasn't correctly ordered in alphabetic order.
> 
> Only cosmetic: the generated device tree don't change.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  arch/arm/dts/stm32mp15-pinctrl.dtsi | 80 -----------------------------
>  1 file changed, 80 deletions(-)
> 
> diff --git a/arch/arm/dts/stm32mp15-pinctrl.dtsi b/arch/arm/dts/stm32mp15-pinctrl.dtsi
> index dd4bd1e554..20a59e8f7a 100644
> --- a/arch/arm/dts/stm32mp15-pinctrl.dtsi
> +++ b/arch/arm/dts/stm32mp15-pinctrl.dtsi
> @@ -1971,86 +1971,6 @@
>  		};
>  	};
>  
> -	uart4_pins_a: uart4-0 {
> -		pins1 {
> -			pinmux = <STM32_PINMUX('G', 11, AF6)>; /* UART4_TX */
> -			bias-disable;
> -			drive-push-pull;
> -			slew-rate = <0>;
> -		};
> -		pins2 {
> -			pinmux = <STM32_PINMUX('B', 2, AF8)>; /* UART4_RX */
> -			bias-disable;
> -		};
> -	};
> -
> -	uart4_pins_b: uart4-1 {
> -		pins1 {
> -			pinmux = <STM32_PINMUX('D', 1, AF8)>; /* UART4_TX */
> -			bias-disable;
> -			drive-push-pull;
> -			slew-rate = <0>;
> -		};
> -		pins2 {
> -			pinmux = <STM32_PINMUX('B', 2, AF8)>; /* UART4_RX */
> -			bias-disable;
> -		};
> -	};
> -
> -	uart4_pins_c: uart4-2 {
> -		pins1 {
> -			pinmux = <STM32_PINMUX('G', 11, AF6)>; /* UART4_TX */
> -			bias-disable;
> -			drive-push-pull;
> -			slew-rate = <0>;
> -		};
> -		pins2 {
> -			pinmux = <STM32_PINMUX('B', 2, AF8)>; /* UART4_RX */
> -			bias-disable;
> -		};
> -	};
> -
> -	uart7_pins_a: uart7-0 {
> -		pins1 {
> -			pinmux = <STM32_PINMUX('E', 8, AF7)>; /* UART4_TX */
> -			bias-disable;
> -			drive-push-pull;
> -			slew-rate = <0>;
> -		};
> -		pins2 {
> -			pinmux = <STM32_PINMUX('E', 7, AF7)>, /* UART4_RX */
> -				 <STM32_PINMUX('E', 10, AF7)>, /* UART4_CTS */
> -				 <STM32_PINMUX('E', 9, AF7)>; /* UART4_RTS */
> -			bias-disable;
> -		};
> -	};
> -
> -	uart7_pins_b: uart7-1 {
> -		pins1 {
> -			pinmux = <STM32_PINMUX('F', 7, AF7)>; /* UART7_TX */
> -			bias-disable;
> -			drive-push-pull;
> -			slew-rate = <0>;
> -		};
> -		pins2 {
> -			pinmux = <STM32_PINMUX('F', 6, AF7)>; /* UART7_RX */
> -			bias-disable;
> -		};
> -	};
> -
> -	uart8_pins_a: uart8-0 {
> -		pins1 {
> -			pinmux = <STM32_PINMUX('E', 1, AF8)>; /* UART8_TX */
> -			bias-disable;
> -			drive-push-pull;
> -			slew-rate = <0>;
> -		};
> -		pins2 {
> -			pinmux = <STM32_PINMUX('E', 0, AF8)>; /* UART8_RX */
> -			bias-disable;
> -		};
> -	};
> -
>  	usbotg_hs_pins_a: usbotg-hs-0 {
>  		pins {
>  			pinmux = <STM32_PINMUX('A', 10, ANALOG)>; /* OTG_ID */
> 

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks

Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
