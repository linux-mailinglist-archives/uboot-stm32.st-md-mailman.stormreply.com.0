Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C1D15B0532
	for <lists+uboot-stm32@lfdr.de>; Wed,  7 Sep 2022 15:34:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C0FADC63325;
	Wed,  7 Sep 2022 13:34:40 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E2B0CC63324
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Sep 2022 13:34:39 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2879EQVW031613;
 Wed, 7 Sep 2022 15:34:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=cy9SLbYsIty4i/uu3IGshzrKR4OsHYjbbYC3eG/WJPI=;
 b=4gAGj8RrDfnOX22Y/RnhO+FpZ16ogZuBGGQs3C+n9zvKwaN0PjZsHg+7R6xnub1LaF+D
 pLeOGov8ZIljfTjmXcMB0u2s/CQ3mYfC+WdO/BRpvg/ny8TvelsrO02jAgNq5ILRGp13
 wLDaWiVsvTLrGxL61gU9PWQLBHAugeo+1jsR6NS1P5D0mFQI5tmMQCj3V9tx72bZgqML
 rje3mGHngtMcEI5AsIcEMdLyGhiorBhGTgX3DOpK7NVZm7jUq97Ubr+Z2+RKsjHi7qKB
 eomnRslQWv0p3PX++gkqrU36rW1sbkNhcQv6aUbyysC24pJfBafSLmnvFsRbOPl+dBjB fA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jergb1nff-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Sep 2022 15:34:35 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 65CFC10002A;
 Wed,  7 Sep 2022 15:34:34 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 60F9C22A6EF;
 Wed,  7 Sep 2022 15:34:34 +0200 (CEST)
Received: from [10.48.0.213] (10.75.127.50) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Wed, 7 Sep
 2022 15:34:33 +0200
Message-ID: <49b0b731-c0bf-f48a-98d9-74530d15d4e4@foss.st.com>
Date: Wed, 7 Sep 2022 15:34:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Patrice Chotard <patrice.chotard@foss.st.com>, <u-boot@lists.denx.de>
References: <20220825071457.1136386-1-patrice.chotard@foss.st.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20220825071457.1136386-1-patrice.chotard@foss.st.com>
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-07_08,2022-09-07_01,2022-06-22_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH v2] configs: stih410-b2260: Fix
	SYS_HZ_CLOCK value
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

On 8/25/22 09:14, Patrice Chotard wrote:
> SYS_HZ_CLOCK was wrongly set to 1GHz whereas it's set to 750MHz
> by default by bootrom.
>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> Reviewed-by: Grzegorz Szymaszek <gszymaszek@short.pl>
>
> ---
>
> Changes in v2:
>     - Replace 1MHz by 1GHz in commit description
>
>   include/configs/stih410-b2260.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/configs/stih410-b2260.h b/include/configs/stih410-b2260.h
> index b1a011bacb..1e966a2322 100644
> --- a/include/configs/stih410-b2260.h
> +++ b/include/configs/stih410-b2260.h
> @@ -14,7 +14,7 @@
>   #define CONFIG_SYS_SDRAM_BASE		PHYS_SDRAM_1
>   #define PHYS_SDRAM_1_SIZE		0x3E000000
>   
> -#define CONFIG_SYS_HZ_CLOCK		1000000000	/* 1 GHz */
> +#define CONFIG_SYS_HZ_CLOCK		750000000	/* 750 MHz */
>   
>   /* Environment */
>   


Applied to u-boot-stm/master, thanks!

Regards
Patrick


_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
