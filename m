Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CC28C7AEBA1
	for <lists+uboot-stm32@lfdr.de>; Tue, 26 Sep 2023 13:42:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 85842C6B462;
	Tue, 26 Sep 2023 11:42:57 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 891F4C6A5F2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Sep 2023 11:42:56 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 38Q7mwtO021156; Tue, 26 Sep 2023 13:42:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=WxN0wYDLLNPweRFbwVmgzEqGF7hmg1o6GrIiJ0L4+G4=; b=zI
 YWa2NVqTktW2NWVgkBpgeAcjTROg334PEAzo3cA4DyU0sVQNwY000ZKHRgryYuzc
 TFQ5NRtdxihXhecmk6EAzff/rxWfkpZLWzBSFinSL+a77KqXSONVdHokn3VF0Ohg
 3pcbC+XH7f3rwFlGwekL4L3j5quefC6zGqib2KtRLEzAt0ZwZx2y5jDq2etRHpPb
 55q7cShlX8Ui8gi25aBe9/ISpcTK21h5Uyk+6nSwpPhSQYEbJ83Ax7ERZRD4nygu
 FTMgDCvt5plv2tVzluGGZZc1D3rCi2mKXwKOaojGh1dB++8ZZO9oVvIgiQ22yCOl
 WV4ZhYbKpuiMnO8FSVGg==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3t9nefme3n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Sep 2023 13:42:53 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D75F010005A;
 Tue, 26 Sep 2023 13:42:52 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CC6D924B8B6;
 Tue, 26 Sep 2023 13:42:52 +0200 (CEST)
Received: from [10.201.20.38] (10.201.20.38) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 26 Sep
 2023 13:42:52 +0200
Message-ID: <7a9275c2-c62a-1ba2-2810-187c09660a76@foss.st.com>
Date: Tue, 26 Sep 2023 13:42:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 <u-boot@lists.denx.de>
References: <20230903205703.662080-1-dario.binacchi@amarulasolutions.com>
 <20230903205703.662080-3-dario.binacchi@amarulasolutions.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20230903205703.662080-3-dario.binacchi@amarulasolutions.com>
X-Originating-IP: [10.201.20.38]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-26_08,2023-09-25_01,2023-05-22_02
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>,
 linux-amarula@amarulasolutions.com, uboot-stm32@st-md-mailman.stormreply.com
Subject: Re: [Uboot-stm32] [RFC PATCH 2/5] ARM: dts: stm32: make the LTDC
 clock usable by the clock driver
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



On 9/3/23 22:57, Dario Binacchi wrote:
> As described in [1], the "clocks" property contains "a phandle to the
> clock device node, an index selecting between gated clocks (0) and other
> clocks (1), and an index specifying the clock to use." The current version
> of the clock driver, unlike the kernel, is currently able to properly
> handle nodes with "clocks" properties with an index set to 0.
> 
> This patch is preparatory for future developments that require the use
> of the LTDC clock.
> 
> [1] Documentation/devicetree/bindings/clock/st,stm32-rcc.txt
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
> 
>  arch/arm/dts/stm32f469-disco-u-boot.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm/dts/stm32f469-disco-u-boot.dtsi b/arch/arm/dts/stm32f469-disco-u-boot.dtsi
> index c07e2022e4a8..dcc70369cd0d 100644
> --- a/arch/arm/dts/stm32f469-disco-u-boot.dtsi
> +++ b/arch/arm/dts/stm32f469-disco-u-boot.dtsi
> @@ -134,6 +134,10 @@
>  	bootph-all;
>  };
>  
> +&ltdc {
> +	clocks = <&rcc 0 STM32F4_APB2_CLOCK(LTDC)>;
> +};
> +
>  &pinctrl {
>  	bootph-all;
>  

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
