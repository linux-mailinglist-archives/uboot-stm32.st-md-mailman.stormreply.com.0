Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD79A072E4
	for <lists+uboot-stm32@lfdr.de>; Thu,  9 Jan 2025 11:24:08 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 20FFAC78F69;
	Thu,  9 Jan 2025 10:24:08 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E66BAC78F67
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Jan 2025 10:24:06 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5098Vj70023173;
 Thu, 9 Jan 2025 11:24:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 Mq1wgX+MCJ77CmvXuyQ+uxauAewWPNk5HdFKeICvgP4=; b=fvZceEUI5iII7+iG
 O4yj5DcQRqJQ9AbjTsSf+HxMBKiXrVmh9EJl4vDjiVDfMVWhHgWq6fzJgG0yF5ZI
 JMfZDOamJ5euNZbNg0lsr87VjF+SAC4i+XBshBuV8xvDwiQyZCCqMfLbPYQCbogq
 QXWjO9Jz9gOEfxIR2eaJMduFZURZ30u9Nr0bP/Q1UfPxrEkXf/bwoSPcQC476FQM
 N7SIqDjqsRQnLBtcbEh74lHI6DCYIaxcP5aOjyaZjyV0D5GVK0YO4WDjewIKAgTp
 SdzoouUoDUzUHOkeCV0O6vIqDs63FTHKsEGWbhVfCm0l4mObdqjTRg+PlohVMuFY
 CnZgSw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 441u78uw9h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Jan 2025 11:24:04 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 3E4904004D;
 Thu,  9 Jan 2025 11:23:05 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8FC5D22B143;
 Thu,  9 Jan 2025 11:22:39 +0100 (CET)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Thu, 9 Jan
 2025 11:22:39 +0100
Message-ID: <c4fe14d9-6b7c-469d-b63c-3e972905f77a@foss.st.com>
Date: Thu, 9 Jan 2025 11:22:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: <u-boot@lists.denx.de>
References: <20250109101838.1733468-1-patrice.chotard@foss.st.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20250109101838.1733468-1-patrice.chotard@foss.st.com>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Sughosh Ganu <sughosh.ganu@linaro.org>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH 0/2]
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

Don't take care of this series, i will resend it with correct cover letter title

Sorry
Patrice

On 1/9/25 11:18, Patrice Chotard wrote:
> stm32mp: Restore STM32MP257F-EV1 boot
> 
> This series is restoring STM32MP257F-EV1 boot :
>   _ Fix usart2 clock frequency
>   _ Fix board_get_usable_ram_top()
> 
> 
> 
> Patrice Chotard (2):
>   stm32mp: Fix board_get_usable_ram_top()
>   ARM: dts: stm32: Update ck_flexgen_08 frequency.
> 
>  arch/arm/dts/stm32mp251.dtsi      | 2 +-
>  arch/arm/mach-stm32mp/dram_init.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
