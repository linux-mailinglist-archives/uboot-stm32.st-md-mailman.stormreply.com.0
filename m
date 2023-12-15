Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1138C814AC3
	for <lists+uboot-stm32@lfdr.de>; Fri, 15 Dec 2023 15:42:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B2910C6DD6D;
	Fri, 15 Dec 2023 14:42:31 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C5172C6A5EA
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Dec 2023 14:42:30 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3BF9TrKW006665; Fri, 15 Dec 2023 15:42:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=cepyr1K+SZomwnQrKIK7ucVYeK1okcGDtLp7lzkclqA=; b=uZ
 rK8ikFiXewGydAI7ntIPlF+sIXtPgTCdRax4jfBbXi2yR8PZjm3Ti3pihfSwW3ql
 cGf2ovbHv2y3dqrvkIXCjNcgibX27y3KlP0Nm8gI1TN94J5s4o48JTYFqx15LCKc
 9pXWJ2PFdL3xwQHlsi+NPwK8OmNjudv349QSrKCEuZONeghmz0GljVuMNfod+DWK
 CGOftNZVK0mOdm1z+v+WhpyM1mcnQ2x/CiU8fwDpihtz901AkIqR5YGO+NuHpzZn
 JsDxnkaLyxAmFP6PzBE8hYIso8HDtBcEa6Zoh9mRaFAsvgYMI7lktjhUhKDqwFGJ
 Bhwoak+xjWkjOU0JTLIQ==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3uvg0ha0xj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Dec 2023 15:42:27 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B2159100052;
 Fri, 15 Dec 2023 15:42:26 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A828F228A22;
 Fri, 15 Dec 2023 15:42:26 +0100 (CET)
Received: from [10.252.23.141] (10.252.23.141) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 15 Dec
 2023 15:42:26 +0100
Message-ID: <ea021247-ce01-40bd-a162-4f938b10603d@foss.st.com>
Date: Fri, 15 Dec 2023 15:42:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 <u-boot@lists.denx.de>
References: <20231211220643.1073606-1-dario.binacchi@amarulasolutions.com>
 <20231211220643.1073606-2-dario.binacchi@amarulasolutions.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20231211220643.1073606-2-dario.binacchi@amarulasolutions.com>
X-Originating-IP: [10.252.23.141]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-15_08,2023-12-14_01,2023-05-22_02
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tom Rini <trini@konsulko.com>, uboot-stm32@st-md-mailman.stormreply.com,
 linux-amarula@amarulasolutions.com
Subject: Re: [Uboot-stm32] [PATCH v3 1/6] ARM: dts: stm32f469-disco: sync
	with Linux 6.5
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



On 12/11/23 23:05, Dario Binacchi wrote:
> Sync the devicetree with linux 6.5 for stm32f746-disco board.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> ---
> 
> (no changes since v2)
> 
> Changes in v2:
> - Add Patrice Chotard's Reviewed-by tag.
> 
>  arch/arm/dts/stm32f469-disco.dts | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/dts/stm32f469-disco.dts b/arch/arm/dts/stm32f469-disco.dts
> index 6e0ffc1903be..c9acabf0f530 100644
> --- a/arch/arm/dts/stm32f469-disco.dts
> +++ b/arch/arm/dts/stm32f469-disco.dts
> @@ -119,7 +119,7 @@
>  		};
>  	};
>  
> -	panel-dsi@0 {
> +	panel@0 {
>  		compatible = "orisetech,otm8009a";
>  		reg = <0>; /* dsi virtual channel (0..3) */
>  		reset-gpios = <&gpioh 7 GPIO_ACTIVE_LOW>;
> @@ -138,7 +138,7 @@
>  	status = "okay";
>  
>  	port {
> -		ltdc_out_dsi: endpoint@0 {
> +		ltdc_out_dsi: endpoint {
>  			remote-endpoint = <&dsi_in>;
>  		};
>  	};
Applied to u-boot-stm32/next

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
