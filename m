Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F89788CCC
	for <lists+uboot-stm32@lfdr.de>; Fri, 25 Aug 2023 17:46:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D5780C6B444;
	Fri, 25 Aug 2023 15:46:21 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7D660C6B443
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 25 Aug 2023 15:46:20 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 37PE8Jsd014611
 for <uboot-stm32@st-md-mailman.stormreply.com>; Fri, 25 Aug 2023 17:46:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=H7ny052HA/hpzq8O7KozHMxw98g8E/BKNepBm2Aakho=; b=6H
 93+275LNFi1SwVJeXz0W1FK2GuzpeXePIab/LBKqi8fcpL+oScY5YNZJIVJaShAF
 4tpdWZ8V3NKzGPLVT4KAp7wg9fYjqrHPncFTXNlmdEK/BqTQY4ssMwBV266MVIj5
 bj3E/2Jzo5WwLBg5aSnxV6P9ifdy3X4PrL1DLHiWT1jO9/7F+nns4+DEkXIXHyYZ
 B1clX5pAEkaQa9ExYf3Q3zlDrYPeEatirSvO1IUVf1U3oZKpa0c63JhcMvR9jo6N
 0sWJk9jINoE26JNNGJbi1XY2UnP9tG0hjt6gyheTkikesqy+9z2zO8/O0pQdOAMx
 fCGdhQm59snTOtrueRlQ==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3spmhsakhv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 25 Aug 2023 17:46:19 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EA3EF10004F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 25 Aug 2023 17:46:08 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DDEC623BDFC
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 25 Aug 2023 17:46:08 +0200 (CEST)
Received: from [10.201.20.38] (10.201.20.38) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Fri, 25 Aug
 2023 17:46:08 +0200
Message-ID: <0bf1a499-9e2b-05ff-c30d-5fb0bc0ce961@foss.st.com>
Date: Fri, 25 Aug 2023 17:46:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: <uboot-stm32@st-md-mailman.stormreply.com>
References: <20230605075208.55221-1-patrick.delaunay@foss.st.com>
 <20230605095147.v3.2.I20e8d74ea2ff0a99c6c741846b46af89c4ee136a@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20230605095147.v3.2.I20e8d74ea2ff0a99c6c741846b46af89c4ee136a@changeid>
X-Originating-IP: [10.201.20.38]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-25_13,2023-08-25_01,2023-05-22_02
Subject: Re: [Uboot-stm32] [PATCH v3 2/2] dfu: mtd: mark bad the MTD block
 on erase error
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



On 6/5/23 09:52, Patrick Delaunay wrote:
> In the MTD DFU backend, it is needed to mark the NAND block bad when the
> erase failed with the -EIO error, as it is done in UBI and JFFS2 code.
> 
> This operation is not done in the MTD framework, but the bad block
> tag (in BBM or in BBT) is required to avoid to write data on this block
> in the next DFU_OP_WRITE loop in mtd_block_op(): the code skip the bad
> blocks, tested by mtd_block_isbad().
> 
> Without this patch, when the NAND block become bad on DFU write operation
> - low probability on new NAND - the DFU write operation will always failed
> because the failing block is never marked bad.
> 
> This patch also adds a test to avoid to request an erase operation on a
> block already marked bad; this test is not performed in MTD framework
> in mtd_erase().
> 
> Reviewed-by: Michael Trimarchi <michael@amarulasolutions.com>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
> Changes in v3:
> - Split serie with trace fix and support of bad block in MTD erase
> - Fix trace for "bbt reserved" when mtd_block_isbad return 2
> 
> Changes in v2:
> - fix mtd_block_isbad offset parameter for erase check
> - Add trace when bad block are skipped in erase loop
> - Add remaining byte in trace "Limit reached"
> 
>  drivers/dfu/dfu_mtd.c | 30 ++++++++++++++++++++++--------
>  1 file changed, 22 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/dfu/dfu_mtd.c b/drivers/dfu/dfu_mtd.c
> index b764f091786d..271d485d1c9a 100644
> --- a/drivers/dfu/dfu_mtd.c
> +++ b/drivers/dfu/dfu_mtd.c
> @@ -91,22 +91,36 @@ static int mtd_block_op(enum dfu_op op, struct dfu_entity *dfu,
>  				return -EIO;
>  			}
>  
> +			/* Skip the block if it is bad, don't erase it again */
> +			ret = mtd_block_isbad(mtd, erase_op.addr);
> +			if (ret) {
> +				printf("Skipping %s at 0x%08llx\n",
> +				       ret == 1 ? "bad block" : "bbt reserved",
> +				       erase_op.addr);
> +				erase_op.addr += mtd->erasesize;
> +				continue;
> +			}
> +
>  			ret = mtd_erase(mtd, &erase_op);
>  
>  			if (ret) {
> -				/* Abort if its not a bad block error */
> -				if (ret != -EIO) {
> -					printf("Failure while erasing at offset 0x%llx\n",
> -					       erase_op.fail_addr);
> -					return 0;
> +				/* If this is not -EIO, we have no idea what to do. */
> +				if (ret == -EIO) {
> +					printf("Marking bad block at 0x%08llx (%d)\n",
> +					       erase_op.fail_addr, ret);
> +					ret = mtd_block_markbad(mtd, erase_op.addr);
> +				}
> +				/* Abort if it is not -EIO or can't mark bad */
> +				if (ret) {
> +					printf("Failure while erasing at offset 0x%llx (%d)\n",
> +					       erase_op.fail_addr, ret);
> +					return ret;
>  				}
> -				printf("Skipping bad block at 0x%08llx\n",
> -				       erase_op.addr);
>  			} else {
>  				remaining -= mtd->erasesize;
>  			}
>  
> -			/* Continue erase behind bad block */
> +			/* Continue erase behind the current block */
>  			erase_op.addr += mtd->erasesize;
>  		}
>  	}

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
