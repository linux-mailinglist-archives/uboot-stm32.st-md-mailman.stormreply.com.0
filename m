Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1FC72D9E9
	for <lists+uboot-stm32@lfdr.de>; Tue, 13 Jun 2023 08:27:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 13EB3C6A615;
	Tue, 13 Jun 2023 06:27:01 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A1A85C6A60F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Jun 2023 06:26:59 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35D0H0qE031072; Tue, 13 Jun 2023 08:26:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=+pBIypkNv/TtfsXtwQJaS9uSg1XSfqCoejOQT3Gkkeg=;
 b=L8JwNxUvJRrJI4C0rguPgg29/mVID4Rc9xi1VMaFlsw5nwiAOEV8Wyj831RETn/yCnWg
 7Msl8KHmrkWEEWq/vhO2DeFbfBHn+CyeATAyaakZdNDWjM6eCqkFB0V5f2V5zqNRRztp
 CRjtbVXVIrqdmOkJQHd/gR7l+OFcyH7++mDiGXc2vEE4Yz0wUPzHS5sYh7C+oVjl56ua
 OF5TzHR7624rM3a7T/2+DAJagMeeLa1Nf42HQcxi2GYBElNZb7RMhGkLRELScYrhFed0
 Ypg3BGgS9zMV3YTOXDbEXF0d+c9f+SdAETwQQRxMB7Byj8LfxgCLE+a0lrChe/cpYWhf OQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3r652tuq9q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Jun 2023 08:26:58 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5CF5010002A;
 Tue, 13 Jun 2023 08:26:57 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 37733211F34;
 Tue, 13 Jun 2023 08:26:55 +0200 (CEST)
Received: from [10.201.20.56] (10.201.20.56) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Tue, 13 Jun
 2023 08:26:54 +0200
Message-ID: <498c6bbd-a952-6ea6-9cc7-980470fed2f2@foss.st.com>
Date: Tue, 13 Jun 2023 08:26:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20230608151648.992505-1-patrick.delaunay@foss.st.com>
 <20230608171614.1.I21f10cd5db605f5c0fbdfd04328958518fa508aa@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20230608171614.1.I21f10cd5db605f5c0fbdfd04328958518fa508aa@changeid>
X-Originating-IP: [10.201.20.56]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-13_03,2023-06-12_02,2023-05-22_02
Cc: Marek Vasut <marex@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [PATCH 01/12] fdt_support: include dm/ofnode.h
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



On 6/8/23 17:16, Patrick Delaunay wrote:
> This patch is a preliminary patch to use ofnode function
> is fdt_support to read the U-Boot device tree with livetree
> compatible functions.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  common/fdt_support.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/common/fdt_support.c b/common/fdt_support.c
> index 2053fe3bad83..ffc59fd8b36a 100644
> --- a/common/fdt_support.c
> +++ b/common/fdt_support.c
> @@ -13,6 +13,7 @@
>  #include <mapmem.h>
>  #include <net.h>
>  #include <stdio_dev.h>
> +#include <dm/ofnode.h>
>  #include <linux/ctype.h>
>  #include <linux/types.h>
>  #include <asm/global_data.h>
> @@ -1065,7 +1066,6 @@ void fdt_del_node_and_alias(void *blob, const char *alias)
>  
>  /* Max address size we deal with */
>  #define OF_MAX_ADDR_CELLS	4
> -#define OF_BAD_ADDR	FDT_ADDR_T_NONE
>  #define OF_CHECK_COUNTS(na, ns)	((na) > 0 && (na) <= OF_MAX_ADDR_CELLS && \
>  			(ns) > 0)
>  
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
