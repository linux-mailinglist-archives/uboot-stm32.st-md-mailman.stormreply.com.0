Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0613FCB95
	for <lists+uboot-stm32@lfdr.de>; Tue, 31 Aug 2021 18:39:47 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 08745C57B60;
	Tue, 31 Aug 2021 16:39:47 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D5853C5718F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Aug 2021 16:39:45 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 17VFf8rA011909;
 Tue, 31 Aug 2021 18:39:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=s3YHkGceHdUTHtm1SP3WB/ZivpfghtTblzdYlJxa1Pc=;
 b=iIyz1mqsWa+I3LYjVovOywV4ElQZzuLW9/SCmW1qFuAX2JQg3ik4aif9bCRBN5YEC+DM
 rnD4agXJ4AJjtMDiTtfSP1FPJpccbKGCiyiDJD3iOsZa69HX7j+woRCeVNyBSLZT5qSK
 Dtaw2h712+fNLylqjEkCtmRm1I/2uRs+S8WYe8FM/zQbgEhi9+wJ9qtiQec+pntMp5DB
 c88zNqH60Oxo/CJtOvzNG50IWnFPhPgVrn1I4VfeRgAfpKWsGU8/dxiOuuoL1SZrek+t
 4V1MtzcylqhZ//i4sUr+4kYS/TTSCSCsRq6PFhQRETlQIlRPfMK7qGWSAxKa5OI+eTqk zA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3asc7e48gs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 31 Aug 2021 18:39:43 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2EB6510002A;
 Tue, 31 Aug 2021 18:39:42 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1CCEF2309EE;
 Tue, 31 Aug 2021 18:39:42 +0200 (CEST)
Received: from lmecxl0994.lme.st.com (10.75.127.49) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 31 Aug
 2021 18:39:41 +0200
To: Alexandru Gagniuc <mr.nuke.me@gmail.com>, <u-boot@lists.denx.de>
References: <20210826214209.254461-1-mr.nuke.me@gmail.com>
 <20210826214209.254461-4-mr.nuke.me@gmail.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <dd7635c5-c8dd-a747-8484-48e8ac5969f5@foss.st.com>
Date: Tue, 31 Aug 2021 18:39:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210826214209.254461-4-mr.nuke.me@gmail.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-08-31_07,2021-08-31_01,2020-04-07_01
Cc: marex@denx.de, U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 03/10] board: stm32mp1: Implement
 board_fit_config_name_match() for SPL
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

Add in CC the MAINTAINERS.

On 8/26/21 11:42 PM, Alexandru Gagniuc wrote:
> This function is needed when loading a FIT image from SPL. It selects
> the correct configuration node for the current board. Implement it.
>
> Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
> ---
>   board/st/stm32mp1/spl.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
>
> diff --git a/board/st/stm32mp1/spl.c b/board/st/stm32mp1/spl.c
> index bb210d7727..543c037ad8 100644
> --- a/board/st/stm32mp1/spl.c
> +++ b/board/st/stm32mp1/spl.c
> @@ -5,6 +5,7 @@
>   
>   #include <config.h>
>   #include <common.h>
> +#include <dm/device.h>
>   #include <init.h>
>   #include <asm/io.h>
>   #include <asm/arch/sys_proto.h>
> @@ -92,3 +93,12 @@ void board_debug_uart_init(void)
>   #endif
>   }
>   #endif
> +
> +int board_fit_config_name_match(const char *name)
> +{
> +	if (of_machine_is_compatible("st,stm32mp157c-dk2"))
> +		return !strstr(name, "stm32mp157c-dk2");
> +
> +	/* Okay, it's most likely an EV board */
> +	return !strstr(name, "stm32mp157") + !strstr(name, "-ev");
> +}

It is not working for all STMicroelectronics boards....

=> st,stm32mp157a-dk1 for example

based on board_late_init => I propose board_name extraction from compatible :

#ifdef CONFIG_SPL_LOAD_FIT
int board_fit_config_name_match(const char *name)
{
	const void *fdt_compat;
	int fdt_compat_len;

	fdt_compat = fdt_getprop(gd->fdt_blob, 0, "compatible", &fdt_compat_len);

	/* only STMicrolectronics board are supported */
	if (strncmp(fdt_compat, "st,", 3) != 0)
		return 1;
	
	return !strstr(name, fdt_compat + 3);
}
#endif


_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
