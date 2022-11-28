Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 68DA763A674
	for <lists+uboot-stm32@lfdr.de>; Mon, 28 Nov 2022 11:56:18 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 12D66C65E59;
	Mon, 28 Nov 2022 10:56:18 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7E165C6507A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Nov 2022 10:56:17 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AS96ank017240; Mon, 28 Nov 2022 11:56:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=9O3PuRwd4T6CATmS/ohC4n5m6PCWDGTu0sUWDAHk9Sc=;
 b=fHTyNXr2RsbB60Qe6DpFGGU1sbFOwA/KzrPwAmSjgqQOoDGPEC/jdsqhAeWYHpFKDb27
 4iYafF9i5qARFTvsuw8Y3oKUSrMzx0tESyR1CsZO/FB8ZjLY7++E2blSYCBK25OMi4DQ
 dJApUqT2w+RWkdGzIdks/033Dtjdnv8opVlcdWRQcDlSIrOG2ZAmEdq769e85sO0565t
 so7BDywEx52UdTNn8j4eoRR3uhZ9fatMfsGE1WDrBc33cRJ4Pa/PkM9WCCdZjfHOY28j
 tySarMaV+DIaAsDHamQb4HfDh4LMs/Vo0WHmMu1JYC5fZ9Sg7kQcNf753o45gNIA0YyG qw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3m393rjpjg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Nov 2022 11:56:12 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2B48510002A;
 Mon, 28 Nov 2022 11:56:07 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 24A4D207FFB;
 Mon, 28 Nov 2022 11:56:07 +0100 (CET)
Received: from [10.211.0.247] (10.211.0.247) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Mon, 28 Nov
 2022 11:56:06 +0100
Message-ID: <bd2d5217-6561-bf93-1486-69df9032f1f4@foss.st.com>
Date: Mon, 28 Nov 2022 11:56:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20221128102154.1.I20e8d74ea2ff0a99c6c741846b46af89c4ee136a@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20221128102154.1.I20e8d74ea2ff0a99c6c741846b46af89c4ee136a@changeid>
X-Originating-IP: [10.211.0.247]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-28_09,2022-11-28_01,2022-06-22_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Lukasz Majewski <lukma@denx.de>,
 Christophe KERELLO <christophe.kerello@foss.st.com>,
 Boris Brezillon <bbrezillon@kernel.org>
Subject: Re: [Uboot-stm32] [PATCH] dfu: mtd: mark bad the MTD block on erase
 error
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

On 11/28/22 10:22, Patrick Delaunay wrote:
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
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  drivers/dfu/dfu_mtd.c | 26 ++++++++++++++++++--------
>  1 file changed, 18 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/dfu/dfu_mtd.c b/drivers/dfu/dfu_mtd.c
> index c7075f12eca9..4fb02c4c806c 100644
> --- a/drivers/dfu/dfu_mtd.c
> +++ b/drivers/dfu/dfu_mtd.c
> @@ -91,22 +91,32 @@ static int mtd_block_op(enum dfu_op op, struct dfu_entity *dfu,
>  				return -EIO;
>  			}
>  
> +			/* Skip the block if it is bad, don't erase it again */
> +			if (mtd_block_isbad(mtd, off)) {
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
