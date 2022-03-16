Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 13AC14DAC0E
	for <lists+uboot-stm32@lfdr.de>; Wed, 16 Mar 2022 08:51:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BF43EC5F1EF;
	Wed, 16 Mar 2022 07:51:39 +0000 (UTC)
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 47820C5F1ED
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Mar 2022 07:51:37 +0000 (UTC)
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20220316075134epoutp04dc30f1c8288fa9b8878d3fd282329329~czR5zXnqc0400804008epoutp04a
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Mar 2022 07:51:34 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20220316075134epoutp04dc30f1c8288fa9b8878d3fd282329329~czR5zXnqc0400804008epoutp04a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1647417094;
 bh=zyMCZOx+Bql5Lv6uhFcxzOvK3x4uXpIiM2gH77YhC3c=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=u4gmsltl5Qh+Yr6WkykBfa/7y3J/gc/vmVrZZmv1v+dCaiy8/A4jwgFTfDJN9rBvt
 pAoo1B5r5rjwSqA+YPQPZToAcfmKenmRgf6widOUAy3YHxlPkYb+KJbb1F9jHQGkJG
 EMbZ+17jONe7cq9IVZNWdAV7CvlSGciIQ3W/qLF4=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTP id
 20220316075134epcas1p1272e4bbb9dc016895196de75826e012f~czR5gr9m51157111571epcas1p1N;
 Wed, 16 Mar 2022 07:51:34 +0000 (GMT)
Received: from epsmges1p3.samsung.com (unknown [182.195.38.231]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4KJMsq0lSNz4x9QC; Wed, 16 Mar
 2022 07:51:27 +0000 (GMT)
Received: from epcas1p2.samsung.com ( [182.195.41.46]) by
 epsmges1p3.samsung.com (Symantec Messaging Gateway) with SMTP id
 72.59.09592.8F691326; Wed, 16 Mar 2022 16:51:20 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
 20220316075120epcas1p3d2e447bbaa259f716f5fbece7c4f9378~czRskl3wC1092710927epcas1p3j;
 Wed, 16 Mar 2022 07:51:20 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20220316075120epsmtrp2bffb116f2a528755d7387b0f3bfb719a~czRsjraR01247812478epsmtrp2q;
 Wed, 16 Mar 2022 07:51:20 +0000 (GMT)
X-AuditID: b6c32a37-28fff70000002578-a5-623196f878b1
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 2C.55.03370.7F691326; Wed, 16 Mar 2022 16:51:20 +0900 (KST)
Received: from [10.113.113.235] (unknown [10.113.113.235]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20220316075119epsmtip28355a9910109927f25e7f0c05f13ba29~czRsHvnZV0789707897epsmtip2K;
 Wed, 16 Mar 2022 07:51:19 +0000 (GMT)
Message-ID: <9490c25d-e9bf-e151-e8d7-fe0d23a07e2e@samsung.com>
Date: Wed, 16 Mar 2022 16:51:19 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, u-boot@lists.denx.de
From: Jaehoon Chung <jh80.chung@samsung.com>
In-Reply-To: <20220215162301.1.I5f92544259c3d1dad2df30c9d7762ec7860f07cf@changeid>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpjk+LIzCtJLcpLzFFi42LZdlhTT/fHNMMkg+V7JS0mrb/GbvFj1RdW
 i7d7O9ktFm5dzuLA4vG0fyu7x9k7Oxg9Nr7bweRxcJ9hAEtUtk1GamJKapFCal5yfkpmXrqt
 kndwvHO8qZmBoa6hpYW5kkJeYm6qrZKLT4CuW2YO0EolhbLEnFKgUEBicbGSvp1NUX5pSapC
 Rn5xia1SakFKToFpgV5xYm5xaV66Xl5qiZWhgYGRKVBhQnbGlCW7GAs+clcc2r2TuYGxgbOL
 kZNDQsBEYnJXK3MXIxeHkMAORokbUx6zQDifGCW+netig3A+M0pce3+SHaal699yVojELkaJ
 hZvvQDnvGSW2Nv1nBaniFbCT2LbkKlgHi4CqRO+PDVBxQYmTM5+wgNiiAhESL4/8ZQKxhQW8
 JU5PWswIYjMLiEvcejIfLC4i4Clx89luqHiURNvUV2C9bAI6Etu/HQer4RQIkrh09ApUjbzE
 9rdzwB6SEPjILvHw1W8WiLNdJL73v2OEsIUlXh3fAvWOlMTnd3vZIBqaGSWWLjnICuH0MEr8
 a7jOBlFlLLF/6WSgdRxAKzQl1u/ShwgrSuz8PRdqM5/Eu689rCAlEgK8Eh1tQhAlKhKXXr9k
 gtl19wkkgCQEPCRO7jzHOIFRcRZSuMxC8v8sJP/MQli8gJFlFaNYakFxbnpqsWGBMTy+k/Nz
 NzGCE6SW+Q7GaW8/6B1iZOJgPMQowcGsJMJ75oV+khBvSmJlVWpRfnxRaU5q8SFGU2DsTGSW
 Ek3OB6bovJJ4QxNLAxMzI2MTC0MzQyVx3lXTTicKCaQnlqRmp6YWpBbB9DFxcEo1MJXtmWGw
 RFjuypVUhZ8BKzZM6w+q/viIRaJwkaZAyqfb4V5qc7ikLY/s3X91oqEam0bcv+ffep13iNxI
 TD3zxvNW3d//9QIbW2Tbt124eLyeN/HTajOlQxcyVwYEbP5btjLk5eaHX8QeGXrNStk7/bpy
 y1bHX28vLORquWtbci7Z2j0g17U/d0uk977EvJyZK46fYck+oPh7jcb2Qrm4RQK15zOnVB6P
 PZDqbfWn5mh+OGur5C2bmDCtzpyUfyV7dp2pq3/15dHcS5Fbi77lRv+Q8rOaHy15NDXG/mVh
 rUZ/5neHtQLfHlzfH1pl9qf50cJjwWJzhdP+GT3mm6ibtak/nd9aYFYXw8uepm0JKUosxRmJ
 hlrMRcWJAMWYi4wZBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrALMWRmVeSWpSXmKPExsWy7bCSvO6PaYZJBrPWs1pMWn+N3eLHqi+s
 Fm/3drJbLNy6nMWBxeNp/1Z2j7N3djB6bHy3g8nj4D7DAJYoLpuU1JzMstQifbsErowpS3Yx
 Fnzkrji0eydzA2MDZxcjJ4eEgIlE17/lrF2MXBxCAjsYJe5PPssEkZCS+Px0KlsXIweQLSxx
 +HAxRM1bRoltR/uZQWp4Bewkti25yg5iswioSvT+2MAKEReUODnzCQuILSoQIdG2bApYvbCA
 t8TpSYsZQWxmAXGJW0/mg+0SEfCUuPlsNyPILmaBKIlNZ4Qgdi1llLgy5QzYHDYBHYnt346D
 1XMKBElcOnoFql5dYv08IYiR8hLb385hnsAoNAvJFbOQbJuF0DELSccCRpZVjJKpBcW56bnF
 hgVGeanlesWJucWleel6yfm5mxjBkaCltYNxz6oPeocYmTgYDzFKcDArifCeeaGfJMSbklhZ
 lVqUH19UmpNafIhRmoNFSZz3QtfJeCGB9MSS1OzU1ILUIpgsEwenVANT2fUp4vYsb34elz0h
 0+aX3rY//nt/ocb5P28bm6SU1j6eWf3q8UqRFMUF64QnKsy4ETCtW0J3/a0nsQFXS+5vfruR
 a2pg/4mMkP4X2w9uuZrYeN2y7JwTb4m0U/hFpcczZ/V9Opz7MpIrSNszakW/o9GrFTtX3Xhr
 mHtkoZ3DVNeKVQuK+nT/9za+M6iR54lV1zkb2D/JdIaNnlprEsu5g1ul91cwlxprpRWeKvuy
 VWpCiFLc7NxPFs7R05ZKXZr+32HGncfCFhs/8cwM1r4SH334y0l/hwKvgt3r4pfFnv9ltjFz
 cvPB2FM+CpL+O3xao1RnRfuy7Nm/f05v2oWqVcZ2LMl9ZhkWe28/vrpZiaU4I9FQi7moOBEA
 khEt2/MCAAA=
X-CMS-MailID: 20220316075120epcas1p3d2e447bbaa259f716f5fbece7c4f9378
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220215152338epcas1p2880ad243ab3e035ec077670cce6476ca
References: <CGME20220215152338epcas1p2880ad243ab3e035ec077670cce6476ca@epcas1p2.samsung.com>
 <20220215162301.1.I5f92544259c3d1dad2df30c9d7762ec7860f07cf@changeid>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
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

On 2/16/22 00:23, Patrick Delaunay wrote:
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

Reviewed-by: Jaehoon Chung <jh80.chung@samsung.com>

Best Regards,
Jaehoon Chung

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

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
