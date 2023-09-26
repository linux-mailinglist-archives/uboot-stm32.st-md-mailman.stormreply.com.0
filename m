Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F2597AE852
	for <lists+uboot-stm32@lfdr.de>; Tue, 26 Sep 2023 10:52:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F024DC6A5F2;
	Tue, 26 Sep 2023 08:52:10 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7CC2BC6A5EA
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Sep 2023 08:52:09 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 38Q89FIi009455; Tue, 26 Sep 2023 10:52:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=R9YxDM64Mw7+0PtM+l0FqMbOKVoZimAKg368pTPYIEo=; b=aM
 XBEM+7oPBkv+04FSP6NV8wGXOdnr+tJ3jQVOmTP8cF4Zi/rzVMJVKg36TVizkpb5
 5QvC+g7TzMaMHsfGdUOTEBvGcawcpIW9igJqSDed8Xq0jZVhXJjxMG9EbH42LFQC
 ZT/weyYqiTPZNC9iq2PuGzy35Adz+4X/w2guxtePJsIM85W0vKoNdomy5Z8EcrqO
 Co6U1OXHSK/AZDqN4wjOxxsDJz+P26wKNhofr2gpgfWmIjeb+pE4+ZPeJw9zL8Du
 wS8AMru+H+dZsdNFuHdjWk0wmS0jVOrN8A5td7qjW8g8avQZ3puR02UvkIjzrMKQ
 z+XxvpFEkVfXGHaIY0vw==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3t9nefkm66-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Sep 2023 10:52:04 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3013B10005A;
 Tue, 26 Sep 2023 10:52:03 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 26CCF22A6C4;
 Tue, 26 Sep 2023 10:52:03 +0200 (CEST)
Received: from [10.201.20.38] (10.201.20.38) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 26 Sep
 2023 10:52:02 +0200
Message-ID: <a4d4c4ff-675d-c9e0-1378-88eb1b7de78c@foss.st.com>
Date: Tue, 26 Sep 2023 10:52:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 <u-boot@lists.denx.de>
References: <20230903204849.660722-1-dario.binacchi@amarulasolutions.com>
 <20230903204849.660722-3-dario.binacchi@amarulasolutions.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20230903204849.660722-3-dario.binacchi@amarulasolutions.com>
X-Originating-IP: [10.201.20.38]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-26_07,2023-09-25_01,2023-05-22_02
Cc: Tom Rini <trini@konsulko.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Marc Kleine-Budde <mkl@pengutronix.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 linux-amarula@amarulasolutions.com
Subject: Re: [Uboot-stm32] [PATCH 02/10] ARM: dts: stm32: add pin map for
 CAN controller on stm32f7
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
> commit 011644249686f2675e142519cd59e81e04cfc231 Linux upstream.
> 
> Add pin configurations for using CAN controller on stm32f7.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> Link: https://lore.kernel.org/all/20230427204540.3126234-4-dario.binacchi@amarulasolutions.com
> Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
> ---
> 
>  arch/arm/dts/stm32f7-pinctrl.dtsi | 82 +++++++++++++++++++++++++++++++
>  1 file changed, 82 insertions(+)
> 
> diff --git a/arch/arm/dts/stm32f7-pinctrl.dtsi b/arch/arm/dts/stm32f7-pinctrl.dtsi
> index 8f37aefa7315..000278ec2c58 100644
> --- a/arch/arm/dts/stm32f7-pinctrl.dtsi
> +++ b/arch/arm/dts/stm32f7-pinctrl.dtsi
> @@ -284,6 +284,88 @@
>  					slew-rate = <2>;
>  				};
>  			};
> +
> +			can1_pins_a: can1-0 {
> +				pins1 {
> +					pinmux = <STM32_PINMUX('A', 12, AF9)>; /* CAN1_TX */
> +				};
> +				pins2 {
> +					pinmux = <STM32_PINMUX('A', 11, AF9)>; /* CAN1_RX */
> +					bias-pull-up;
> +				};
> +			};
> +
> +			can1_pins_b: can1-1 {
> +				pins1 {
> +					pinmux = <STM32_PINMUX('B', 9, AF9)>; /* CAN1_TX */
> +				};
> +				pins2 {
> +					pinmux = <STM32_PINMUX('B', 8, AF9)>; /* CAN1_RX */
> +					bias-pull-up;
> +				};
> +			};
> +
> +			can1_pins_c: can1-2 {
> +				pins1 {
> +					pinmux = <STM32_PINMUX('D', 1, AF9)>; /* CAN1_TX */
> +				};
> +				pins2 {
> +					pinmux = <STM32_PINMUX('D', 0, AF9)>; /* CAN1_RX */
> +					bias-pull-up;
> +
> +				};
> +			};
> +
> +			can1_pins_d: can1-3 {
> +				pins1 {
> +					pinmux = <STM32_PINMUX('H', 13, AF9)>; /* CAN1_TX */
> +				};
> +				pins2 {
> +					pinmux = <STM32_PINMUX('H', 14, AF9)>; /* CAN1_RX */
> +					bias-pull-up;
> +
> +				};
> +			};
> +
> +			can2_pins_a: can2-0 {
> +				pins1 {
> +					pinmux = <STM32_PINMUX('B', 6, AF9)>; /* CAN2_TX */
> +				};
> +				pins2 {
> +					pinmux = <STM32_PINMUX('B', 5, AF9)>; /* CAN2_RX */
> +					bias-pull-up;
> +				};
> +			};
> +
> +			can2_pins_b: can2-1 {
> +				pins1 {
> +					pinmux = <STM32_PINMUX('B', 13, AF9)>; /* CAN2_TX */
> +				};
> +				pins2 {
> +					pinmux = <STM32_PINMUX('B', 12, AF9)>; /* CAN2_RX */
> +					bias-pull-up;
> +				};
> +			};
> +
> +			can3_pins_a: can3-0 {
> +				pins1 {
> +					pinmux = <STM32_PINMUX('A', 15, AF11)>; /* CAN3_TX */
> +				};
> +				pins2 {
> +					pinmux = <STM32_PINMUX('A', 8, AF11)>; /* CAN3_RX */
> +					bias-pull-up;
> +				};
> +			};
> +
> +			can3_pins_b: can3-1 {
> +				pins1 {
> +					pinmux = <STM32_PINMUX('B', 4, AF11)>;  /* CAN3_TX */
> +				};
> +				pins2 {
> +					pinmux = <STM32_PINMUX('B', 3, AF11)>; /* CAN3_RX */
> +					bias-pull-up;
> +				};
> +			};
>  		};
>  	};
>  };

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
