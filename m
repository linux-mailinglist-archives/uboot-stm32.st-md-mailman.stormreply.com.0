Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E2CC99A1193
	for <lists+uboot-stm32@lfdr.de>; Wed, 16 Oct 2024 20:30:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A9E0AC78032;
	Wed, 16 Oct 2024 18:30:58 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AF5CBC78031
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Oct 2024 18:30:51 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49GDxOoh027926;
 Wed, 16 Oct 2024 20:30:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 uJUuuOo55ft7p+tTmxyn0uplLUz3mdYsM69h7AJJReg=; b=4cHoyynMlTe+BPd2
 xFX3stBA7v5IcMFUwBfg4nRQ76i7FLO30GaieuKYJrEEYAy/26UGy39SOqGztPd2
 L2Df8fEAkuLLqG65tJi5HvPGb6mq74m1SC2zsQRmysO9SfCTQMaqe/MN73s0ni26
 XMp3NlR4U+xuOv/LuMJpqsy81SO+94QYt3Cx7BP4Ukizs2s8z8M5WegkZU3VC+V8
 C69TyKpHD6Rzvus+GioHwoAIIQHDxHeiVRtWwOMi+SuUHR/INprJedBF/xaN9Opg
 nwUHckpFxswRpo6QouC0Y4hha8wY17fgmHZHEPb3TM/Aol47LJNDUZVlA8RS22Fc
 y5qV/w==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 427gex4a6k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Oct 2024 20:30:45 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 798B14004F;
 Wed, 16 Oct 2024 20:29:50 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 585FB2695F7;
 Wed, 16 Oct 2024 20:29:29 +0200 (CEST)
Received: from [10.48.86.243] (10.48.86.243) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 16 Oct
 2024 20:29:28 +0200
Message-ID: <a592f993-7cd9-40eb-9098-1b2c99a1ab09@foss.st.com>
Date: Wed, 16 Oct 2024 20:29:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: <u-boot@lists.denx.de>
References: <20241011153152.1637303-1-patrick.delaunay@foss.st.com>
 <20241011173140.1.I5df2535b9afa16b2649399c208ea0e05cafffce5@changeid>
Content-Language: en-US
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20241011173140.1.I5df2535b9afa16b2649399c208ea0e05cafffce5@changeid>
X-Originating-IP: [10.48.86.243]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>,
 Sughosh Ganu <sughosh.ganu@linaro.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Etienne CARRIERE <etienne.carriere@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH 1/4] stm32mp: compute ram_top based on the
 optee base address only for STM32MP1
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Hi

On 10/11/24 17:31, Patrick Delaunay wrote:
> Reserved memory for OP-TEE is located at end of DDR for STM32MP1 SoC only
> (STM32MP13 and STM32MP15) and the OP-TEE reserved memory is located at the
> beginning of DDR for STM32MP25 SoC, before CONFIG_TEXT_BASE and
> with reserved memory for companion coprocessor. So the ram_top is limited
> by OP-TEE reserved memory only for STM32MP1 SoC.
>
> This patch solves an issue for ram_top value on STM32MP25 SoC because the
> generic reserved memory management, based on LMB, is no more used before
> relocation.
>
> Fixes: 8242f14a3e6f ("stm32mp: compute ram_top based on the optee base address")
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
>
>   arch/arm/mach-stm32mp/dram_init.c | 12 +++++++++---
>   1 file changed, 9 insertions(+), 3 deletions(-)
>


Applied to u-boot-stm/master, thanks!

Regards
Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
