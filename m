Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BCD848EBA5
	for <lists+uboot-stm32@lfdr.de>; Fri, 14 Jan 2022 15:26:25 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C584EC5E2C1;
	Fri, 14 Jan 2022 14:26:24 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E792CC5C842
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Jan 2022 14:26:22 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20E9HXvu012481;
 Fri, 14 Jan 2022 15:26:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=myNoiDdVGOJMNVSCNacdicgR6QPxbg3hmYhoJmtePvE=;
 b=5D9x01BFI2/mqFzYTAa7R0CU4dsNHZ0bWOR+GIMH1H3nS5xSb8CU4itxmHkLS8St0A9p
 V68K5OF7WI89AL2YwEHYPXi2Ve6jp+mfXvrlqTLtkwMjXLw8nmmFz1cGrvygFnzg9hwl
 GYnm/givFzKkspMA9CX2bcVRpTHL+Ko4aTXqJTVg7aFI0DUowlQQyNsNhioE0H0pALEu
 5EEVl77+0tVM/H6upN72RZbHC3HKOZ0mAWcVc/ZNWIyCoWD0hL40vmnpOZR0rhFrpHM9
 7pfIUPhF8SN1duaWQI8PBDwHvsel4daa8OkKL4NSmrbxTBTFeAGwcTLneeTLr/gCb+a8 Tg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3djyr5k5ph-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Jan 2022 15:26:22 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5C3D510002A;
 Fri, 14 Jan 2022 15:26:21 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5235B21278D;
 Fri, 14 Jan 2022 15:26:21 +0100 (CET)
Received: from lmecxl0573.lme.st.com (10.75.127.45) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Fri, 14 Jan
 2022 15:26:21 +0100
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20211207100549.1.Iafe36c0d5ba0a3fbd8016d9ae07ef5db77c553c7@changeid>
 <20211207100549.2.I6347e4b7268b9a30a04d597cd467fbcf8defd684@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <4ef7570d-1b77-a56f-1b9f-f4091a82646e@foss.st.com>
Date: Fri, 14 Jan 2022 15:26:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211207100549.2.I6347e4b7268b9a30a04d597cd467fbcf8defd684@changeid>
Content-Language: en-US
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-14_05,2022-01-14_01,2021-12-02_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 2/2] stm32mp: correct the dependency for
	bootcount configs
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

Hi Patrick

On 12/7/21 10:05 AM, Patrick Delaunay wrote:
> Default value for CONFIG_SYS_BOOTCOUNT_SINGLEWORD and
> CONFIG_SYS_BOOTCOUNT_ADDR are only needed when
> CONFIG_BOOTCOUNT_GENERIC is used.
> 
> This patch avoids to define these configs when an other bootcount backend
> is activated, for example for CONFIG_BOOTCOUNT_ENV.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  arch/arm/mach-stm32mp/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/mach-stm32mp/Kconfig b/arch/arm/mach-stm32mp/Kconfig
> index 2fa4ea4d5c..2819944df3 100644
> --- a/arch/arm/mach-stm32mp/Kconfig
> +++ b/arch/arm/mach-stm32mp/Kconfig
> @@ -194,7 +194,7 @@ config PRE_CON_BUF_SZ
>  config BOOTSTAGE_STASH_ADDR
>  	default 0xC3000000
>  
> -if BOOTCOUNT_LIMIT
> +if BOOTCOUNT_GENERIC
>  config SYS_BOOTCOUNT_SINGLEWORD
>  	default y
>  
> 
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
