Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD414E4E6B
	for <lists+uboot-stm32@lfdr.de>; Wed, 23 Mar 2022 09:43:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 47B1BC5F1EF;
	Wed, 23 Mar 2022 08:43:26 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1F9BAC5F1D6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Mar 2022 08:43:25 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22N361i0013341;
 Wed, 23 Mar 2022 09:43:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=n3gFEnpo8ZXs462v4db1bW1XYdITZlr46lzQwNoV4IY=;
 b=J3z/mbrnFjcNIkagzCvQfJ5O5qSei6sXdfzEbAWQ02Scq7rtTl/xOWrBOyO667vR4R+a
 jeO539cOhLeZovDnVvgodyoh7JHhyT0TtY+ktRvBzO2aCVms3miCLtERF7Sv+JYqjIV2
 dwoP/dmttJwD4DO/1YzfE96HztBSjwxri1DMS05mgg3jY6pywGBM2bEGIzqvPauupU3W
 O70xryV+UNY7WkW2ek0qQcXD5/oiIbCQUqKE9maZoWug5A05SeUONHGrmP53ewaBxUsT
 57TgpAHslod/Rmmp6c4mNgrQJxp1s7ZCWuQQSC278h2sfmrx3cXwQIWwyBD+bYGpanAJ 7A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ew6xkh2sh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Mar 2022 09:43:18 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 16DB310002A;
 Wed, 23 Mar 2022 09:43:17 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 10FC021A200;
 Wed, 23 Mar 2022 09:43:17 +0100 (CET)
Received: from [10.201.21.201] (10.75.127.46) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Wed, 23 Mar
 2022 09:43:16 +0100
Message-ID: <a838c85b-b865-2927-0d6a-a95dc59cbb0a@foss.st.com>
Date: Wed, 23 Mar 2022 09:43:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20220215162301.1.I5f92544259c3d1dad2df30c9d7762ec7860f07cf@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20220215162301.1.I5f92544259c3d1dad2df30c9d7762ec7860f07cf@changeid>
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-23_04,2022-03-22_01,2022-02-23_01
Cc: Jaehoon Chung <jh80.chung@samsung.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Peng Fan <peng.fan@nxp.com>
Subject: Re: [Uboot-stm32] [PATCH 1/2] mmc: fix error message for unaligned
 erase request
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

On 2/15/22 16:23, Patrick Delaunay wrote:
> Fix the end address in the message for unaligned erase request in
> mmc_berase() when start + blkcnt is aligned to erase_grp_size.
> 
> for example:
>   - start = 0x2000 - 26
>   - count = 26
>   - erase_grp_size = 0x400
> 
>   Caution! Your devices Erase group is 0x400
>   The erase range would be change to 0x2000~0x27ff
> 
> But no issue when the end address is not aligned, for example
>   - start = 0x2000 - 2 * 26
>   - count = 26
>   - erase_grp_size = 0x400
> 
>   Caution! Your devices Erase group is 0x400
>   The erase range would be change to 0x2000~0x23ff
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  drivers/mmc/mmc_write.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mmc/mmc_write.c b/drivers/mmc/mmc_write.c
> index d23b7d9729..eab94c7b60 100644
> --- a/drivers/mmc/mmc_write.c
> +++ b/drivers/mmc/mmc_write.c
> @@ -102,7 +102,7 @@ ulong mmc_berase(struct blk_desc *block_dev, lbaint_t start, lbaint_t blkcnt)
>  		       "The erase range would be change to "
>  		       "0x" LBAF "~0x" LBAF "\n\n",
>  		       mmc->erase_grp_size, start & ~(mmc->erase_grp_size - 1),
> -		       ((start + blkcnt + mmc->erase_grp_size)
> +		       ((start + blkcnt + mmc->erase_grp_size - 1)
>  		       & ~(mmc->erase_grp_size - 1)) - 1);
>  
>  	while (blk < blkcnt) {
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
