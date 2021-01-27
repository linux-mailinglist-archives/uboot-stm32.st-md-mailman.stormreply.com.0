Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E50305F57
	for <lists+uboot-stm32@lfdr.de>; Wed, 27 Jan 2021 16:19:30 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 77E98C57183;
	Wed, 27 Jan 2021 15:19:30 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DEE16C57182
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Jan 2021 15:19:28 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10REtpWp007705; Wed, 27 Jan 2021 16:19:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=IDWZxH/yeWdcBz2lEquNrgSw9dNnpm81EDKj2DEpm6w=;
 b=CTCHTMh8+uDUTOEk/DMeevwYzEAo34NartJ0jzWO1UEf4x/xP+BSDszZxpnN/lKLQjH1
 D69m8hJYjerJ98e/6YqHmLPo+PvDcsGpAN31pC0zb5aSUZzG7OnOnkg+vYr+mkahDM6Y
 mCjxvaaJPMc0UI2kxSf0q4EcB7dHvdK2imDHgQumDkikn2tM7XNFVVYzO4QS6B5o0OKv
 Rc0w3Zq6GgTFgvMdi0MZyiKlxlzuTdwv9twOjX9fxM99S8DiNs2tTCyp9r6UMAlCVUXl
 3fCOCQlPQBQbZ0WLUH5vcOYt+rRWKCp8ZZ4z+T075fBSvMocLBhFim+ydy6NBqBNZRjg cA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 368c160jqn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Jan 2021 16:19:27 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1E529100034;
 Wed, 27 Jan 2021 16:19:27 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 167A724C7C0;
 Wed, 27 Jan 2021 16:19:27 +0100 (CET)
Received: from lmecxl0994.lme.st.com (10.75.127.46) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 27 Jan
 2021 16:19:26 +0100
To: Patrice Chotard <patrice.chotard@foss.st.com>, <u-boot@lists.denx.de>
References: <20210120134205.30488-1-patrice.chotard@foss.st.com>
 <20210120134205.30488-5-patrice.chotard@foss.st.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <24411175-20ba-92ae-e1b4-bba0c7ae7ca5@foss.st.com>
Date: Wed, 27 Jan 2021 16:19:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210120134205.30488-5-patrice.chotard@foss.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG3NODE3.st.com (10.75.127.9) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-27_05:2021-01-27,
 2021-01-27 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>
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

Hi,

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
