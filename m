Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DA031A064D9
	for <lists+uboot-stm32@lfdr.de>; Wed,  8 Jan 2025 19:49:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 78DB1C78F67;
	Wed,  8 Jan 2025 18:49:31 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 30615C78F64
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Jan 2025 18:49:30 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 508DgFt3000938;
 Wed, 8 Jan 2025 19:49:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 acReBbNlQ3yGsRNCuxvuW1twfFxl/M9bWXohRMty+ns=; b=c5K2jkeN1Pqz4z3z
 jwAtbEPO39Q2WG4FGszspTxxpZdHwhEbgH/dQM+aXFztMOB634AFRDA0Wver39+Z
 TVqA85PW3NyW2DxJmQ41KVl3yPTlVwTR+pyklz/JvQC4TaR/qjTozIFSXtbOdml6
 X05umoCz29jMyO+826S81IEyXKrA6qGU7DpioS5C8RYH1lCBSgQVzsO85HX1LPrV
 yLv4A7xhBsWhlTrOAc3pd03XLi7Hg/4Uw6RQzJR1lY8rTKfeYcsWXejZpBN+l3je
 OHt2WRby4i1s3gexaCHfitHRVFJkXEwyuDVU3YcSAT4i6rLtPikNSMp2BkNTgtdr
 ynZnSw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 441tfu9885-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Jan 2025 19:49:26 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 451F240047;
 Wed,  8 Jan 2025 19:48:19 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EDB67298E0E;
 Wed,  8 Jan 2025 19:48:01 +0100 (CET)
Received: from [10.48.87.126] (10.48.87.126) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 8 Jan
 2025 19:48:01 +0100
Message-ID: <ae469951-f6f2-4be8-99d5-38db13ed85bc@foss.st.com>
Date: Wed, 8 Jan 2025 19:48:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>, <u-boot@lists.denx.de>
References: <20241129122711.411917-1-patrice.chotard@foss.st.com>
 <20241129122711.411917-2-patrice.chotard@foss.st.com>
Content-Language: en-US
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20241129122711.411917-2-patrice.chotard@foss.st.com>
X-Originating-IP: [10.48.87.126]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>, Mattijs Korpershoek <mkorpershoek@baylibre.com>
Subject: Re: [Uboot-stm32] [PATCH v1 1/6] fastboot: Fix warning when
 CONFIG_SYS_64BIT_LBA is enable
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
> If CONFIG_SYS_64BIT_LBA is enable, following compilation warning is
> triggered:
>
>   CC      drivers/fastboot/fb_mmc.o
> ../drivers/fastboot/fb_mmc.c: In function 'fb_mmc_erase_mmc_hwpart':
> ../drivers/fastboot/fb_mmc.c:215:35: warning: format '%lu' expects
> argument of type 'long unsigned int', but argument 2 has type
> 'long long unsigned int' [-Wformat=]
>    215 |         printf("........ erased %lu bytes from mmc hwpart[%u]\n",
>        |                                 ~~^
>        |                                   |
>        |                                   long unsigned int
>        |                                 %llu
>    216 |                dev_desc->lba * dev_desc->blksz, dev_desc->hwpart);
>        |                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>        |                              |
>        |                              long long unsigned int
> ../drivers/fastboot/fb_mmc.c: In function 'fb_mmc_boot_ops':
> ../drivers/fastboot/fb_mmc.c:261:42: warning: format '%lu' expects
> argument of type 'long unsigned int', but argument 2 has type
> 'long long unsigned int' [-Wformat=]
>    261 |                 printf("........ wrote %lu bytes to EMMC_BOOT%d\n",
>        |                                        ~~^
>        |                                          |
>        |                                          long unsigned int
>        |                                        %llu
>    262 |                        blkcnt * blksz, hwpart);
>        |                        ~~~~~~~~~~~~~~
>        |                               |
>        |                               long long unsigned int
>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>
>   drivers/fastboot/fb_mmc.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>


Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
