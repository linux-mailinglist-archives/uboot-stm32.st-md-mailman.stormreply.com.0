Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 754F57AE927
	for <lists+uboot-stm32@lfdr.de>; Tue, 26 Sep 2023 11:27:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 40F36C6B473;
	Tue, 26 Sep 2023 09:27:44 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6C85BC6B462
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Sep 2023 09:27:43 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 38Q59ia4020695; Tue, 26 Sep 2023 11:27:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=MVmppEQJE0Chh8UYEwrAughvzUV+k49BsA1oNMsF+oU=; b=vw
 oZsbZDdNDZcMKMDhJxXBrXZ398furPPiFRRaapLhXcfjnOk3M/j5NxLEWbqpeeui
 /FQUQFsOuXw5tfmygYbgxG4MQdBkjdjgpesFuSMMpvhIFBo0XTBsA/7HghBzztth
 iU1vOSd8AomvCeIde3yUXUX5ldYz2D3bxDUDXX9HXL6y6u1WJDU6YehZYpmCHVbl
 sO9DTK6TCBeCuncb1Y8WlZCzMyFNkQksqKa1uuj3XJU5B9MMjG9oqTwYUJiEXs6n
 R7acvDU4StfU1eBt9UfwJrpTwJwaacXMCZ1c64KSVG+7is0kF3IHtqMF6wTMbrCv
 JIgShtE5vmxHX4XJ6U3A==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3t9nefktgg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Sep 2023 11:27:40 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C319710005A;
 Tue, 26 Sep 2023 11:27:39 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BBDFB22FA49;
 Tue, 26 Sep 2023 11:27:39 +0200 (CEST)
Received: from [10.201.20.38] (10.201.20.38) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 26 Sep
 2023 11:27:39 +0200
Message-ID: <d62a42ee-6753-192e-1207-9fb8d0165876@foss.st.com>
Date: Tue, 26 Sep 2023 11:27:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 <u-boot@lists.denx.de>
References: <20230903203352.658691-1-dario.binacchi@amarulasolutions.com>
 <20230903203352.658691-4-dario.binacchi@amarulasolutions.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20230903203352.658691-4-dario.binacchi@amarulasolutions.com>
X-Originating-IP: [10.201.20.38]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-26_07,2023-09-25_01,2023-05-22_02
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Marc Kleine-Budde <mkl@pengutronix.de>,
 uboot-stm32@st-md-mailman.stormreply.com, linux-amarula@amarulasolutions.com,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH 3/3] ARM: dts: stm32f429: put can2 in
	secondary mode
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



On 9/3/23 22:33, Dario Binacchi wrote:
> commit 6b443faa313c519db755ff90be32758fd9c66453 Linux upstream.
> 
> This is a preparation patch for the upcoming support to manage CAN
> peripherals in single configuration.
> 
> The addition ensures backwards compatibility.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> Link: https://lore.kernel.org/all/20230427204540.3126234-3-dario.binacchi@amarulasolutions.com
> Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
> 
> ---
> 
>  arch/arm/dts/stm32f429.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/dts/stm32f429.dtsi b/arch/arm/dts/stm32f429.dtsi
> index 22225104fca8..8133ea15b036 100644
> --- a/arch/arm/dts/stm32f429.dtsi
> +++ b/arch/arm/dts/stm32f429.dtsi
> @@ -346,6 +346,7 @@
>  			interrupt-names = "tx", "rx0", "rx1", "sce";
>  			resets = <&rcc STM32F4_APB1_RESET(CAN2)>;
>  			clocks = <&rcc 0 STM32F4_APB1_CLOCK(CAN2)>;
> +			st,can-secondary;
>  			st,gcan = <&gcan>;
>  			status = "disabled";
>  		};
Apply on stm32/next

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
