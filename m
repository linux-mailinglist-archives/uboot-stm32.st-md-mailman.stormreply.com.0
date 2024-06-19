Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E1FA90E38C
	for <lists+uboot-stm32@lfdr.de>; Wed, 19 Jun 2024 08:36:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D044CC71282;
	Wed, 19 Jun 2024 06:36:04 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A1711C6B460
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Jun 2024 06:35:57 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45ILZtve002573;
 Wed, 19 Jun 2024 08:35:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 oxI/oHpnVoYsBVI53472R7ZraxX6l42TM8cRUojKihA=; b=7o2kJ9l98RkAEdoh
 Lz5y+tD0Zz823gz0/vGa4/bR9Dvuf3c/eqHyJhBjLyIaeo9XxG323e8vKnvYKcCa
 zmKk09cKgE+eproJcOtC3EZvoq4vfvEKmP0DvtlC36E2z3HvII3gFm7IIoHrHFZ3
 +g/JbtG38T6Xbo8KcsQDl6D5XV8AF0uFFTRk14Rb6VOyBQiREwRtjC4NFf7QiGXL
 wvNvQtVW98UCwryZje6UiXatqMUTd/dhNONCXQcGcHUyMXNknS7V/AqGE1omxU9P
 c5yylAhSc+bFgE0z3Ng8/SbViJFMVo716mbuaR4SyKj7ydkFz8jc6WQSDwzwqmY4
 dyBGUQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3yuj9n1gwn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Jun 2024 08:35:55 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id E607640048;
 Wed, 19 Jun 2024 08:35:50 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 95DA720FA3E;
 Wed, 19 Jun 2024 08:35:25 +0200 (CEST)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 19 Jun
 2024 08:35:25 +0200
Message-ID: <2fd69224-c299-4b43-9078-07e06cc345f5@foss.st.com>
Date: Wed, 19 Jun 2024 08:35:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marek Vasut <marex@denx.de>, <u-boot@lists.denx.de>
References: <20240618225736.154959-1-marex@denx.de>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20240618225736.154959-1-marex@denx.de>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-19_02,2024-06-17_01,2024-05-17_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tom Rini <trini@konsulko.com>, uboot-stm32@st-md-mailman.stormreply.com
Subject: Re: [Uboot-stm32] [PATCH] ARM: stm32: Fix TAMP_SMCR BKP..PROT
	fields on STM32MP15xx
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



On 6/19/24 00:57, Marek Vasut wrote:
> Update the TAMP_SMCR BKP..PROT fields to put first 10 registers
> into protection zone 1 and next 5 into zone 2. This fixes use of
> boot counter which is often in zone 3 and has to be updated from
> Linux, which runs in NS.
> 
> Fixes: 73f7fc944cf6 ("ARM: stm32: Initialize TAMP_SMCR BKP..PROT fields on STM32MP15xx")
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Cc: Tom Rini <trini@konsulko.com>
> Cc: u-boot@lists.denx.de
> Cc: uboot-stm32@st-md-mailman.stormreply.com
> ---
>  arch/arm/mach-stm32mp/stm32mp1/stm32mp15x.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/mach-stm32mp/stm32mp1/stm32mp15x.c b/arch/arm/mach-stm32mp/stm32mp1/stm32mp15x.c
> index f096fe538d8..ca202bec8ee 100644
> --- a/arch/arm/mach-stm32mp/stm32mp1/stm32mp15x.c
> +++ b/arch/arm/mach-stm32mp/stm32mp1/stm32mp15x.c
> @@ -148,8 +148,8 @@ static void security_init(void)
>  	 */
>  	clrsetbits_le32(TAMP_SMCR,
>  			TAMP_SMCR_BKPRWDPROT | TAMP_SMCR_BKPWDPROT,
> -			FIELD_PREP(TAMP_SMCR_BKPRWDPROT, 0x20) |
> -			FIELD_PREP(TAMP_SMCR_BKPWDPROT, 0x20));
> +			FIELD_PREP(TAMP_SMCR_BKPRWDPROT, 0x0A) |
> +			FIELD_PREP(TAMP_SMCR_BKPWDPROT, 0x0F));
>  
>  	/* GPIOZ: deactivate the security */
>  	writel(BIT(0), RCC_MP_AHB5ENSETR);

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
