Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 573BC305F52
	for <lists+uboot-stm32@lfdr.de>; Wed, 27 Jan 2021 16:18:19 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 93051C57182;
	Wed, 27 Jan 2021 15:18:18 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 42F67C56639
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Jan 2021 15:18:15 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10REw8Vm004458
 for <uboot-stm32@st-md-mailman.stormreply.com>; Wed, 27 Jan 2021 16:18:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=+Pqt39LYeSl/+h0xbQTVtoyAs/Gbb05C7n2GXeectYw=;
 b=idc/3RxL1FKqYQm9HAsIlbfNDqU45764+hrXtyeiwA3OYRVzo0v4r2FqLk+Mf1U3g5pr
 bWuXne/MtMvyvyF2Smkwp8TUQD/m8WVB8NVIe3dldYa0gGszOwPT0G+dNQKOVfFu9oml
 VDOOeMxscKhH08ozXZvPZ1GhpqR2qpqgTRqPfXz4/KJQAiGhHq/9lq1vKcrfLAktZy58
 C1arD0zmw9qQXCOyoig4x9KkBdYZ3Z/GYn2zTlNCyFAh2XJU5gSv93NynlPOJyPnXeNb
 heQSBD5JDiI0dFuWIfz5S4q1PRMhHXAnWRvxfriDxIebk/ePj/7BYVmuDBe6Sacn4HdV FQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 368bjngsf3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <uboot-stm32@st-md-mailman.stormreply.com>; Wed, 27 Jan 2021 16:18:14 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6FA3910002A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Jan 2021 16:18:14 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6869024B119
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Jan 2021 16:18:14 +0100 (CET)
Received: from lmecxl0994.lme.st.com (10.75.127.44) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 27 Jan
 2021 16:18:14 +0100
To: <uboot-stm32@st-md-mailman.stormreply.com>
References: <20210120134205.30488-1-patrice.chotard@foss.st.com>
 <20210120134205.30488-5-patrice.chotard@foss.st.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <19d4f526-796a-6571-fce1-5ae8b2dc7850@foss.st.com>
Date: Wed, 27 Jan 2021 16:18:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210120134205.30488-5-patrice.chotard@foss.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-27_05:2021-01-27,
 2021-01-27 signatures=0
Subject: Re: [Uboot-stm32] [PATCH 4/4] mtd: spinand: Add WATCHDOG_RESET() in
 spinand_mtd_read/write()
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
> In case of big area read/write on spi nand, watchdog timeout may occurs.
> To fix that, add WATCHDOG_RESET() in spinand_mtd_read() and
> spinand_mtd_write() to ensure that watchdog is reset.
>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
>
> ---
>
>   drivers/mtd/nand/spi/core.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
> index cb8ffa3fa9..7f54422c93 100644
> --- a/drivers/mtd/nand/spi/core.c
> +++ b/drivers/mtd/nand/spi/core.c
> @@ -24,6 +24,7 @@
>   #include <errno.h>
>   #include <spi.h>
>   #include <spi-mem.h>
> +#include <watchdog.h>
>   #include <linux/mtd/spinand.h>
>   #endif
>   
> @@ -574,6 +575,7 @@ static int spinand_mtd_read(struct mtd_info *mtd, loff_t from,
>   #endif
>   
>   	nanddev_io_for_each_page(nand, from, ops, &iter) {
> +		WATCHDOG_RESET();
>   		ret = spinand_select_target(spinand, iter.req.pos.target);
>   		if (ret)
>   			break;
> @@ -625,6 +627,7 @@ static int spinand_mtd_write(struct mtd_info *mtd, loff_t to,
>   #endif
>   
>   	nanddev_io_for_each_page(nand, to, ops, &iter) {
> +		WATCHDOG_RESET();
>   		ret = spinand_select_target(spinand, iter.req.pos.target);
>   		if (ret)
>   			break;

Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks

Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
