Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6DA305F3D
	for <lists+uboot-stm32@lfdr.de>; Wed, 27 Jan 2021 16:15:22 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 85954C57182;
	Wed, 27 Jan 2021 15:15:22 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3FB69C56639
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Jan 2021 15:15:20 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10REw8V6004458; Wed, 27 Jan 2021 16:15:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=R6uZjs+Saa3Jsa8u8aR2glFyU0LafklaQ1QPybc1iWo=;
 b=7xjUHt/66kxjIUw1o6gGYksK4dBQ8Qm05qw6cddjqDzt6RCctmScDzZylM5suHtroTZp
 RITA+9Mjc3AUhk0Fjsid9GdK4+57R5mx1wr0lZiTFcG5LAPOItHvIaWho+B9Fh83cTYU
 Y8LYbLsndcAHSLgBQPQQTQQe+3IRynvar5VWMrW18xcJ9WR9mhRroAGHO6YVTSY3eWNn
 3Fkgv6/PBVvOHmQPR4etr6pZ5/EAjK3TX1Lk2FqE2sVnYotcmBrWny2J6LcPwFFeSK8y
 WQtNRfETCwxTeSromOTpfz69eOEn/PLl09/aONSqOZ0h6gLPnCnVBDQXIklLKmADHvEs 3A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 368bjngrwt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Jan 2021 16:15:18 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BBB8F10002A;
 Wed, 27 Jan 2021 16:15:17 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B117224B10E;
 Wed, 27 Jan 2021 16:15:17 +0100 (CET)
Received: from lmecxl0994.lme.st.com (10.75.127.46) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 27 Jan
 2021 16:15:17 +0100
To: Patrice Chotard <patrice.chotard@foss.st.com>, <u-boot@lists.denx.de>
References: <20210120134205.30488-1-patrice.chotard@foss.st.com>
 <20210120134205.30488-3-patrice.chotard@foss.st.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <b1a87f5d-a1b7-ca46-6056-5c911b785fa2@foss.st.com>
Date: Wed, 27 Jan 2021 16:15:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210120134205.30488-3-patrice.chotard@foss.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-27_05:2021-01-27,
 2021-01-27 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [Uboot-stm32] [PATCH 2/4] spi: stm32_qspi: Add WATCHDOG_RESET
 in _stm32_qspi_read_fifo()
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

Hi Patrice

On 1/20/21 2:42 PM, Patrice Chotard wrote:
> In case of reading large area and memory-map mode is misconfigured
> (memory-map size declared lower than the real size of the memory chip)
> watchdog can be triggered.
>
> Add WATCHDOG_RESET() in _stm32_qspi_read_fifo to fix it.
>
> Issue reproduced with stm32mp157c-ev1 board and memory map size set to
> 1, with following command:
> sf read 0xC0000000 0 0x4000000
>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>
>   drivers/spi/stm32_qspi.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/drivers/spi/stm32_qspi.c b/drivers/spi/stm32_qspi.c
> index 958c394a1a..c3da17f991 100644
> --- a/drivers/spi/stm32_qspi.c
> +++ b/drivers/spi/stm32_qspi.c
> @@ -11,6 +11,7 @@
>   #include <clk.h>
>   #include <reset.h>
>   #include <spi-mem.h>
> +#include <watchdog.h>
>   #include <linux/iopoll.h>
>   #include <linux/ioport.h>
>   #include <linux/sizes.h>
> @@ -163,6 +164,7 @@ static int _stm32_qspi_wait_cmd(struct stm32_qspi_priv *priv,
>   static void _stm32_qspi_read_fifo(u8 *val, void __iomem *addr)
>   {
>   	*val = readb(addr);
> +	WATCHDOG_RESET();
>   }
>   
>   static void _stm32_qspi_write_fifo(u8 *val, void __iomem *addr)


Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks

Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
