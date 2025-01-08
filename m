Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D89FDA064DB
	for <lists+uboot-stm32@lfdr.de>; Wed,  8 Jan 2025 19:50:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 91AFFC78F6D;
	Wed,  8 Jan 2025 18:50:09 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 45014C78F64
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Jan 2025 18:50:06 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 508GxA5A007614;
 Wed, 8 Jan 2025 19:50:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 DiZbQuMyGDBE8DtGvk+MlJGbv9FnwUCyOGUzj5PUge4=; b=G3j9d9XEsJfDVU2V
 twIKcZsa2qMfJMvuCNucAOuHyv1zDzTSNa1tWrDnWe7guNX9reddk+zon9+OIMJu
 BNLaz6T5eaygOBocNNc5ltXcEgGOv5Laipp9wPrh+4e+nvN7FuYyGZECSfz/tkR0
 NZvZEvEvNIHgftJAPo9eUQXBlF0XdZxjPKz0ys8UCrsHvMJLNhNmiDH1oneCQ6gx
 IY6zYpNkekCPKxikr6ufY33OxyfFJrvrClWQ43UEGF+iOvulQ5iC9CyrghPT7GUY
 j5H/F9pVJy3gtnKs/dUMXUWlsobBQGGVVgbsA17h/Qe20hKJsfpBGoSsE2ZkIMf+
 2D9MDw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 441wc6rbm4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Jan 2025 19:50:04 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 792CD40048;
 Wed,  8 Jan 2025 19:49:00 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D80AC29E87C;
 Wed,  8 Jan 2025 19:48:46 +0100 (CET)
Received: from [10.48.87.126] (10.48.87.126) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 8 Jan
 2025 19:48:46 +0100
Message-ID: <1cccf0a2-e317-4b00-9624-d2d25c8b4ae4@foss.st.com>
Date: Wed, 8 Jan 2025 19:48:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>, <u-boot@lists.denx.de>
References: <20241129122711.411917-1-patrice.chotard@foss.st.com>
 <20241129122711.411917-3-patrice.chotard@foss.st.com>
Content-Language: en-US
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20241129122711.411917-3-patrice.chotard@foss.st.com>
X-Originating-IP: [10.48.87.126]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH v1 2/6] arm: stm32mp: stm32prog: fix
 warning when CONFIG_SYS_64BIT_LBA is enable
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

On 11/29/24 13:27, Patrice Chotard wrote:
> If CONFIG_SYS_64BIT_LBA flag is enable, following warning is triggered:
>
> ../arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c: In function 'init_device':
> ../arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c:793:27: warning: format
> '%ld' expects argument of type 'long int', but argument 8 has type
> 'lbaint_t' {aka 'long long unsigned int'} [-Wformat=]
>    793 |                 log_debug("MMC %d: lba=%ld blksz=%ld\n", dev->dev_id,
>        |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../include/log.h:157:21: note: in definition of macro 'pr_fmt'
>    157 | #define pr_fmt(fmt) fmt
>        |                     ^~~
> ../include/log.h:182:33: note: in expansion of macro 'log'
>    182 | #define log_debug(_fmt...)      log(LOG_CATEGORY, LOGL_DEBUG, ##_fmt)
>        |                                 ^~~
> ../arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c:793:17: note: in expansion
> of macro 'log_debug'
>    793 |                 log_debug("MMC %d: lba=%ld blksz=%ld\n", dev->dev_id,
>        |                 ^~~~~~~~~
> ../arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c:793:42: note: format string
> is defined here
>    793 |                 log_debug("MMC %d: lba=%ld blksz=%ld\n", dev->dev_id,
>        |                                        ~~^
>        |                                          |
>        |                                          long int
>        |                                        %lld
>
> Cast block_dev->lba to u64 and set the length specifier to %lld which
> is ok with or without CONFIG_SYS_64BIT_LBA flag.
>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>
>   arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>


Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
