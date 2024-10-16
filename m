Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF189A11A0
	for <lists+uboot-stm32@lfdr.de>; Wed, 16 Oct 2024 20:33:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DEF97C78035;
	Wed, 16 Oct 2024 18:33:26 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C2C22C78032
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Oct 2024 18:33:23 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49GDphT4027894;
 Wed, 16 Oct 2024 20:33:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 VJSxPEdyo2c/yY6eHCNXqFFxGzXR5Jd9OBPSX6N0GE8=; b=vini6ezy/VIGMUXP
 5nXifam9j0rU6+NLSWLiQiG9Q11FTMVFsvhL1/xdzTVySn8PcFqudW3WIkAX9ZOL
 eLuqp637hdzlDytXtDezNnSsT582UuHI41wkVgm2rWDv9WXZffeN4LbzY/ATqKeA
 ORlKSY8l55WRlqIff5DXz0IiUO7vn+25AUCYGAY/TZ7jZubAO1IvxcMZa0qEliqH
 EWq3VkW2d6Y6YNRu/yclSwTeMW+dm5k9+yBLtYu5sQTSzVZv6sA4+36NqQ73dPsx
 yje6FMIY1FkhfPPE9AhcakAweYwSFFQPWFJKgpmzmBDJ1n6dv8/v9ym1TFzgrl9q
 Ysaf7A==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 427gex4ae0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Oct 2024 20:33:17 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 39EF3400A0;
 Wed, 16 Oct 2024 20:32:11 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9348926FCE3;
 Wed, 16 Oct 2024 20:30:56 +0200 (CEST)
Received: from [10.48.86.243] (10.48.86.243) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 16 Oct
 2024 20:30:55 +0200
Message-ID: <abc8c0af-9465-4275-8847-d8f1b1a51493@foss.st.com>
Date: Wed, 16 Oct 2024 20:30:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: <u-boot@lists.denx.de>
References: <20241011153152.1637303-1-patrick.delaunay@foss.st.com>
 <20241011173140.4.Ib921aacc11dafeb000f894c2a0deaaf7f5619f6b@changeid>
Content-Language: en-US
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20241011173140.4.Ib921aacc11dafeb000f894c2a0deaaf7f5619f6b@changeid>
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
Subject: Re: [Uboot-stm32] [PATCH 4/4] stm32mp: fix name of optee reserved
	memory node
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

Hi,

On 10/11/24 17:31, Patrick Delaunay wrote:
> In OP-TEE, the "optee_core@" node is reserved, appended in non secure
> device tree (see mark_tzdram_as_reserved() function under CFG_DT) so
> this name must be checked in optee_get_reserved_memory().
> We keep the check on /reserved-memory/optee@ node to have backward
> compatibility with STMT32Image booting, when the reserved node is
> already present in U-Boot or SPL device tree with name "optee@".
>
> This patch solves a boot issue on board with OP-TEE for U-Boot
> compiled with stm32mp15_defconfig and without secure configuration
> device tree (stm32mp157c-dk2.dts for example).
>
> Fixes: 5fe9e0deabb1 ("stm32mp: allow calling optee_get_reserved_memory()
> from U-Boot")
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
>
>   arch/arm/mach-stm32mp/dram_init.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
>

Applied to u-boot-stm/master, thanks!

Regards
Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
