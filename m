Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA987B7CB8
	for <lists+uboot-stm32@lfdr.de>; Wed,  4 Oct 2023 11:57:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 80E89C6C833;
	Wed,  4 Oct 2023 09:57:59 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2499FC6C832
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Oct 2023 09:57:58 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 39450H4A026784; Wed, 4 Oct 2023 11:57:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=mTklWt1yrRX98nH9sOpPsFxr9PWv1Er23Rpf5GNRva8=; b=XY
 gcrB+K0egid7grTT9VC6zQIxEgVQJ9w59P3Sh3VYItdgrngieQVs5sO2MnJfa4Ho
 NvuTq8D4blj9lf6GAOjrMjCBkFtum1P+6m4ukYkX6MEplR9/XgS0TwpZWrfrtAej
 Yw67HEMsB9+t+JRjqjMZCrd0KufGZFDSVOvDNiD51nHxMfZNsSKQU30375btrtLI
 KvW6RdSlEp4LYd/vGrOSMHKcM2kAVYHfdjd0G6MY8EVMqGmrN2h7a6wYMs00AsIh
 JR+fnQRDvVg9BhjYoIYHDbLV36eYT79TWrJMa9NkHViyUp2vzjL19r2zh3bU/2hr
 lsX1icHSSi9b/s2aPs2g==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3tew80p0kb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 Oct 2023 11:57:57 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 02812100053;
 Wed,  4 Oct 2023 11:57:57 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EE5ED22F7A5;
 Wed,  4 Oct 2023 11:57:56 +0200 (CEST)
Received: from [10.201.22.165] (10.201.22.165) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 4 Oct
 2023 11:57:56 +0200
Message-ID: <8a5daa34-e50a-2f2d-7ce2-9879e64e881d@foss.st.com>
Date: Wed, 4 Oct 2023 11:57:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
To: Patrice Chotard <patrice.chotard@foss.st.com>, <u-boot@lists.denx.de>
References: <20230926150924.1150082-1-patrice.chotard@foss.st.com>
 <20230926150924.1150082-7-patrice.chotard@foss.st.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20230926150924.1150082-7-patrice.chotard@foss.st.com>
X-Originating-IP: [10.201.22.165]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-04_01,2023-10-02_01,2023-05-22_02
Cc: uboot-stm32@st-md-mailman.stormreply.com,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH v1 6/6] board: st: common: cleanup dfu
	support
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

On 9/26/23 17:09, Patrice Chotard wrote:
> From: Patrick Delaunay <patrick.delaunay@foss.st.com>
>
> split the file stm32mp_dfu.c in two files to simplify the Makefile
> - stm32mp_dfu.c: required by CONFIG_SET_DFU_ALT_INFO
> - stm32mp_dfu_virt.c: required by CONFIG_DFU_VIRT for stm32prog
>    command or VIRT device for PMIC for CONFIG_SET_DFU_ALT_INFO.
>
> This patch also remove some remaining #ifdef CONFIG
> and avoid compilation error when CONFIG_SET_DFU_ALT_INFO is not
> activated.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>
>   board/st/common/Makefile           |   1 +
>   board/st/common/stm32mp_dfu.c      | 103 ++---------------------------
>   board/st/common/stm32mp_dfu_virt.c |  99 +++++++++++++++++++++++++++
>   3 files changed, 104 insertions(+), 99 deletions(-)
>   create mode 100644 board/st/common/stm32mp_dfu_virt.c
>


Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick



_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
