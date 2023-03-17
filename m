Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C658A6BF043
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 Mar 2023 18:59:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 72CCEC69067;
	Fri, 17 Mar 2023 17:59:09 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D0B50C0356E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Mar 2023 17:59:07 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32HF1hT2032362; Fri, 17 Mar 2023 18:58:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=uERbMDazf5RJJ6uJDq+DGREOfNa509Am4jGGi0Oz7wI=;
 b=R/1CcDe6EQPcCt6BsjnHmzb3nkjIi+GVxaLqbjZAHUaMMBkOP9rgw7oYhWmGIo4RPc6G
 SXuNKoxgW3caIFtI+ERsW+Uuq0w9+iQVY2zJPQOTmWAn3phxDdpEmf9++uuvA+JQPWoY
 lwaDUPfDHmv314DGGUr2XViN9/80QqHZWLi20rVPGbnJHeVLzlhs8If5Sn3Wxr0RxlLi
 44lyl4iMWS7YLnbY42ZhP0l/9YaJniIJ2hFM3oMc86ExprKv47urOe/FO2c0+AFwvyr8
 cWywVHQiEHVpU/MDIue/6qzQU8uYVuEzIcADEl4orfODJIGCGma/Foz8IdVaswsGbczg 4A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3pcn2taxfk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Mar 2023 18:58:59 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 91BEF100034;
 Fri, 17 Mar 2023 18:58:57 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7D84B22D18D;
 Fri, 17 Mar 2023 18:58:57 +0100 (CET)
Received: from [10.48.0.157] (10.48.0.157) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Fri, 17 Mar
 2023 18:58:57 +0100
Message-ID: <90eea0aa-a715-99e2-4c55-72f0017e3882@foss.st.com>
Date: Fri, 17 Mar 2023 18:58:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
To: <u-boot@lists.denx.de>
References: <20221128102154.1.I20e8d74ea2ff0a99c6c741846b46af89c4ee136a@changeid>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20221128102154.1.I20e8d74ea2ff0a99c6c741846b46af89c4ee136a@changeid>
X-Originating-IP: [10.48.0.157]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-17_14,2023-03-16_02,2023-02-09_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Lukasz Majewski <lukma@denx.de>,
 Christophe KERELLO <christophe.kerello@foss.st.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Hi,

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
>   drivers/dfu/dfu_mtd.c | 26 ++++++++++++++++++--------
>   1 file changed, 18 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/dfu/dfu_mtd.c b/drivers/dfu/dfu_mtd.c
> index c7075f12eca9..4fb02c4c806c 100644
> --- a/drivers/dfu/dfu_mtd.c
> +++ b/drivers/dfu/dfu_mtd.c
> @@ -91,22 +91,32 @@ static int mtd_block_op(enum dfu_op op, struct dfu_entity *dfu,
>   				return -EIO;
>   			}
>   
> +			/* Skip the block if it is bad, don't erase it again */
> +			if (mtd_block_isbad(mtd, off)) {


"off" is the not correct offset here

=> need to be replace to "erase_op.addr"


> +				erase_op.addr += mtd->erasesize;
> +				continue;
> +			}
> +
>   			ret = mtd_erase(mtd, &erase_op);
>   
>   			if (ret) {
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
>   				}
> -				printf("Skipping bad block at 0x%08llx\n",
> -				       erase_op.addr);
>   			} else {
>   				remaining -= mtd->erasesize;
>   			}
>   
> -			/* Continue erase behind bad block */
> +			/* Continue erase behind the current block */
>   			erase_op.addr += mtd->erasesize;
>   		}
>   	}


Regards

Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
