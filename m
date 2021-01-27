Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B235305F3E
	for <lists+uboot-stm32@lfdr.de>; Wed, 27 Jan 2021 16:15:53 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 036BEC57182;
	Wed, 27 Jan 2021 15:15:53 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9721AC56639
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Jan 2021 15:15:51 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10REvJof015366; Wed, 27 Jan 2021 16:15:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=4YYDIR2X11y43jc9KBb4YQZo6M/ETqm1v4prbplms5Y=;
 b=FgziTfe9oZoUBJsh4Ru+EIdCmQauAxzJlHExx7dJfOIVzXENtxgIu2S4GRfNWkav7Wc/
 ec3jwhLvZTvkcwNsLqoHbCWYiDdvFPDyXotkxbmeEoOkXPeJiGD+F/vK+rm8BSTAFZ0E
 TgkXyccPz2tjsv+kzmZkQ4ZMxvVCTcZikVvVvZrubF0HGtBkIJ97FGaEazMgDsbY3odm
 bIctuRP0FZjrzL64q3Dag2YueMKClAu+vJNN/aesDsPzCSjn5vb5/QTJ57f8JDESG+aO
 Lbtqsg+LyZb08aQhJA66cHoElkprAjilRu0s5GH8ljW6iFwizeq2StW9gWEgl7NYc9sy +w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 368a56rxe6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Jan 2021 16:15:50 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1A80310002A;
 Wed, 27 Jan 2021 16:15:50 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 116AE24B10F;
 Wed, 27 Jan 2021 16:15:50 +0100 (CET)
Received: from lmecxl0994.lme.st.com (10.75.127.46) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 27 Jan
 2021 16:15:49 +0100
To: Patrice Chotard <patrice.chotard@foss.st.com>, <u-boot@lists.denx.de>
References: <20210120134205.30488-1-patrice.chotard@foss.st.com>
 <20210120134205.30488-4-patrice.chotard@foss.st.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <45b1bd20-fc86-5a22-ca2c-c4e08731f871@foss.st.com>
Date: Wed, 27 Jan 2021 16:15:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210120134205.30488-4-patrice.chotard@foss.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG3NODE3.st.com (10.75.127.9) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-27_05:2021-01-27,
 2021-01-27 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>
Subject: Re: [Uboot-stm32] [PATCH 3/4] mtd: nand: Add WATCHDOG_RESET() in
 nanddev_mtd_erase()
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
> In case of big area erased on nand, watchdog timeout may occurs.
> To fix that, add WATCHDOG_RESET() in nanddev_mtd_erase() to ensure that
> watchdog is reset.
>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>
>   drivers/mtd/nand/core.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/drivers/mtd/nand/core.c b/drivers/mtd/nand/core.c
> index 3abaef23c5..ec11bf44f8 100644
> --- a/drivers/mtd/nand/core.c
> +++ b/drivers/mtd/nand/core.c
> @@ -10,6 +10,7 @@
>   #define pr_fmt(fmt)	"nand: " fmt
>   
>   #include <common.h>
> +#include <watchdog.h>
>   #ifndef __UBOOT__
>   #include <linux/module.h>
>   #endif
> @@ -162,6 +163,7 @@ int nanddev_mtd_erase(struct mtd_info *mtd, struct erase_info *einfo)
>   	nanddev_offs_to_pos(nand, einfo->addr, &pos);
>   	nanddev_offs_to_pos(nand, einfo->addr + einfo->len - 1, &last);
>   	while (nanddev_pos_cmp(&pos, &last) <= 0) {
> +		WATCHDOG_RESET();
>   		ret = nanddev_erase(nand, &pos);
>   		if (ret) {
>   			einfo->fail_addr = nanddev_pos_to_offs(nand, &pos);


Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks

Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
