Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AAFD8AAE75
	for <lists+uboot-stm32@lfdr.de>; Fri, 19 Apr 2024 14:30:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6578CC6DD72;
	Fri, 19 Apr 2024 12:30:45 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D044CC6C859
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Apr 2024 12:30:43 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 43J9drOY009597; Fri, 19 Apr 2024 14:30:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=Q+lQFCSojiczd85iG9Ayo6k8i4kY9UNzjHGQotsgadE=; b=3/
 X3tbub0qLkkXrk2nF1p5P4jV19MWF/Uzblv33wHHxUUz+8l6IzjCJzKLMpcp1u+S
 MTGt0fffGFKVm06SjJBIkP4mx6MTLSTz6a+K0Ch82hJ10+qHNP73bqvV7+2C6eKr
 cS7NwcY6gxw7rYzVw07xCzrBAtKXeZCvzEiKGl/LM9cCikMocdoCykF4vF+B+K7q
 KaoytSyzLcJvZSYhN5c/DYtGndD4qnfNR1RNIL4JXnZSeT6jXJmYicxWMfdAIZnY
 9PVa59pS4pnIyeR7s5GlBk2AdxlNLLBe/tXeDOlM85Bm1BKO2uqr1dFWbVp6IpHK
 SsIceTEKiszM1sGztmAQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3xff64uv5j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Apr 2024 14:30:41 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 05D064002D;
 Fri, 19 Apr 2024 14:30:38 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7D47221ADAF;
 Fri, 19 Apr 2024 14:30:24 +0200 (CEST)
Received: from [10.252.13.94] (10.252.13.94) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 19 Apr
 2024 14:30:24 +0200
Message-ID: <585b1091-0df0-49fb-a651-b158987c0ed1@foss.st.com>
Date: Fri, 19 Apr 2024 14:30:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: <u-boot@lists.denx.de>
References: <20240409150215.2497778-1-patrice.chotard@foss.st.com>
 <20240409150215.2497778-24-patrice.chotard@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20240409150215.2497778-24-patrice.chotard@foss.st.com>
X-Originating-IP: [10.252.13.94]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-19_08,2024-04-19_01,2023-05-22_02
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH v1 23/25] ARM: dts: stm32: Don't probe red
 led at boot for stm32mp157c-ed1-scmi-u-boot
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



On 4/9/24 17:02, Patrice Chotard wrote:
> red led and button dedicated to fastboot share the same gpio GPIOA13.
> Led driver is probed early so the corresponding gpio is taken and
> configured in output which forbid fastboot and stm32prog button usage.
> 
> To avoid this, remove the "default-state" property from red led node.
> 
> This will avoid to trigger the led driver probe() to configure the led
> default state during startup.
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
> 
>  arch/arm/dts/stm32mp157c-ed1-scmi-u-boot.dtsi | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm/dts/stm32mp157c-ed1-scmi-u-boot.dtsi b/arch/arm/dts/stm32mp157c-ed1-scmi-u-boot.dtsi
> index 84920f53496..2abd512e297 100644
> --- a/arch/arm/dts/stm32mp157c-ed1-scmi-u-boot.dtsi
> +++ b/arch/arm/dts/stm32mp157c-ed1-scmi-u-boot.dtsi
> @@ -37,7 +37,6 @@
>  		red {
>  			label = "error";
>  			gpios = <&gpioa 13 GPIO_ACTIVE_LOW>;
> -			default-state = "off";
>  			status = "okay";
>  		};
>  	};

Applied on u-boot-stm32/master 
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
