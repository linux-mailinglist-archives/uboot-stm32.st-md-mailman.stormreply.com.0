Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B0FFB305F33
	for <lists+uboot-stm32@lfdr.de>; Wed, 27 Jan 2021 16:14:17 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3667EC57182;
	Wed, 27 Jan 2021 15:14:17 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 044BCC56639
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Jan 2021 15:14:14 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10REw8LW004472; Wed, 27 Jan 2021 16:14:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=Dk9umvQbkfHJ5h1qun2FCQR3eNqd9gAobJuEsqEjBO4=;
 b=R5odwM8Obrq8ah4JVc2IHo4hN7XSRMpwmkk/4TY6J+uUyK4lMHqWZi7ucGgWw6OJPUj/
 LCfgBN2y5xc7tNUG9aKQKgJv+l05+8DanjtdqDFalrpqsFeLgYOE820lnSaXr3EyEBWO
 dbIHShznAc98NY7oYjSLy88BDJZ9kOCdG9aCNs36GavG+Yjc7qDOn/V5oPE+miUQa1U1
 eJz+xwtEE3QpRY9+GJOWV5MVFKSOR+UHq1FS+4suTO7xlij2MMWY5wl88+MV9BgK+A/W
 vHm6hR3AXBWelzyQ0me6msFyEq2LHF95Kcg3lSiKbz5BQGL8fQrHWkSjQCHIKEVxn6z8 AQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 368bjngrr5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Jan 2021 16:14:12 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B5F90100034;
 Wed, 27 Jan 2021 16:14:11 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9088B24B109;
 Wed, 27 Jan 2021 16:14:11 +0100 (CET)
Received: from lmecxl0994.lme.st.com (10.75.127.47) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 27 Jan
 2021 16:14:11 +0100
To: Patrice Chotard <patrice.chotard@foss.st.com>, <u-boot@lists.denx.de>
References: <20210120134205.30488-1-patrice.chotard@foss.st.com>
 <20210120134205.30488-2-patrice.chotard@foss.st.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <98b9466b-eeb4-2060-6b9d-8992c3ec3e39@foss.st.com>
Date: Wed, 27 Jan 2021 16:14:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210120134205.30488-2-patrice.chotard@foss.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-27_05:2021-01-27,
 2021-01-27 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Vignesh R <vigneshr@ti.com>, Patrick DELAUNAY <patrick.delaunay@st.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [Uboot-stm32] [PATCH 1/4] mtd: spi-nor: Add WATCHDOG_RESET() in
 spi_nor_core callbacks
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

Hi Patrice,

On 1/20/21 2:42 PM, Patrice Chotard wrote:
> In case of big area write/erase on spi nor, watchdog timeout may occurs.
> Issue reproduced on stm32mp157c-ev1 with following commands:
>
> sf write 0xC0000000 0 0x3000000
> or
> sf erase 0 0x1000000
>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>
>   drivers/mtd/spi/spi-nor-core.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/drivers/mtd/spi/spi-nor-core.c b/drivers/mtd/spi/spi-nor-core.c
> index eb49a6c11c..51e0613d4c 100644
> --- a/drivers/mtd/spi/spi-nor-core.c
> +++ b/drivers/mtd/spi/spi-nor-core.c
> @@ -10,6 +10,7 @@
>    */
>   
>   #include <common.h>
> +#include <watchdog.h>
>   #include <linux/err.h>
>   #include <linux/errno.h>
>   #include <linux/log2.h>
> @@ -557,6 +558,7 @@ static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
>   	len = instr->len;
>   
>   	while (len) {
> +		WATCHDOG_RESET();
>   #ifdef CONFIG_SPI_FLASH_BAR
>   		ret = write_bar(nor, addr);
>   		if (ret < 0)
> @@ -1235,6 +1237,7 @@ static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
>   	for (i = 0; i < len; ) {
>   		ssize_t written;
>   		loff_t addr = to + i;
> +		WATCHDOG_RESET();
>   
>   		/*
>   		 * If page_size is a power of two, the offset can be quickly


Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks

Patrick


_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
