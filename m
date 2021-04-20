Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE5336561C
	for <lists+uboot-stm32@lfdr.de>; Tue, 20 Apr 2021 12:25:07 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F3476C57195;
	Tue, 20 Apr 2021 10:25:01 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3836AC3FADC
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Apr 2021 10:24:59 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13KAH6RP010143; Tue, 20 Apr 2021 12:24:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=H6DzBqtN42SZBAfel1YNIUYa0JhWNWFXX1x+2kwTWz4=;
 b=mc7v/NJ+o0o0fyKdvKgZ6vto6FIyhBYS+7w9wha1TVIWElTYWUkJzi+VcLeR7cx6giYN
 hgPn/HfNOdbdypZyI5TtlOxgpScNNEPfc5Jgx3C2huKA99zKEZ3o4GULnTXaj9GJ2/q5
 u/g4PiHlodedvmYG9GSTbX+IlkVpAhaeO8nAHkuHC1vkdGm5aGsBchuCgFGOAp8j/1lB
 aVjvwnFf0fPrLURLFY7fBnUIh8b6R09/R16CpN3uE+fRfnJ3XajB8rTVrnFxBfTputKX
 QRCvE5WdhWbzZTykw9HjZrnTxpbtIcV2IXT2yabWpOMso9mQBsYRydsNSJTkh2kMsxmd dw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 381nbcagdt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Apr 2021 12:24:58 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1074B10002A;
 Tue, 20 Apr 2021 12:24:57 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D62F82C38C1;
 Tue, 20 Apr 2021 12:24:57 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.50) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 20 Apr
 2021 12:24:57 +0200
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20210304174748.1.I1d824180669d63e22275f082e7ac0fe50c2b8646@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <48f7454f-6bae-224c-bba3-4b24e81e800b@foss.st.com>
Date: Tue, 20 Apr 2021 12:24:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210304174748.1.I1d824180669d63e22275f082e7ac0fe50c2b8646@changeid>
Content-Language: en-US
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-20_02:2021-04-19,
 2021-04-20 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Lukasz Majewski <lukma@denx.de>
Subject: Re: [Uboot-stm32] [PATCH] dfu: dfu_mtd: set max_buf_size to
 erasesize also for NOR devices
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

On 3/4/21 5:47 PM, Patrick Delaunay wrote:
> For NOR devices the logical DFU buffer size is the sector_size,
> as it is done in dfu_sf.c or in spi/sf_mtd.c
> (sf_mtd_info.erasesize = flash->sector_size)
> 
> For NAND the DFU size was already limited to erasesize as
> has_pages = true.
> 
> So the mtd dfu backend can use this erasesize for all the MTD devices,
> NOR and NAND with dfu->max_buf_size = mtd->erasesize
> 
> This difference was initially copied from MTD command, where
> data is fully available in RAM without size limitation.
> 
> This patch avoids to have many sector write in dfu_mtd.c at the end
> of the DFU transfer and avoids issues with USB timeout or WATCHDOG.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  drivers/dfu/dfu_mtd.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/dfu/dfu_mtd.c b/drivers/dfu/dfu_mtd.c
> index ca67585a7e..7efb3cbd79 100644
> --- a/drivers/dfu/dfu_mtd.c
> +++ b/drivers/dfu/dfu_mtd.c
> @@ -252,7 +252,6 @@ int dfu_fill_entity_mtd(struct dfu_entity *dfu, char *devstr, char *s)
>  {
>  	char *st;
>  	struct mtd_info *mtd;
> -	bool has_pages;
>  	int ret, part;
>  
>  	mtd = get_mtd_device_nm(devstr);
> @@ -262,9 +261,7 @@ int dfu_fill_entity_mtd(struct dfu_entity *dfu, char *devstr, char *s)
>  
>  	dfu->dev_type = DFU_DEV_MTD;
>  	dfu->data.mtd.info = mtd;
> -
> -	has_pages = mtd->type == MTD_NANDFLASH || mtd->type == MTD_MLCNANDFLASH;
> -	dfu->max_buf_size = has_pages ? mtd->erasesize : 0;
> +	dfu->max_buf_size = mtd->erasesize;
>  
>  	st = strsep(&s, " ");
>  	if (!strcmp(st, "raw")) {
> 

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks

Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
