Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 078FA4589DC
	for <lists+uboot-stm32@lfdr.de>; Mon, 22 Nov 2021 08:33:42 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B88EBC5A4FD;
	Mon, 22 Nov 2021 07:33:41 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 715D3C597BB
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Nov 2021 07:33:40 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AM3kNru013732;
 Mon, 22 Nov 2021 08:33:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=ACYyu5GtWU8dErHCvv3ePZUIeqU2elrVjg2c9X4EDz0=;
 b=Bd4xBVD6nClbnpA3JwMMQNItCxPeyry+MqsCTDMY/AJBY9TBluN1RJUyFXdfeZvdB1Gz
 oKU/PAAMUB4QY/EuyYjUMc+3a0m5qkmQrj9X+M8urT/Y534JOipiIieydu23ewuW1zzg
 eTpu0YOpA3yoLGesrIm6IBZKhvVjRJ1vBn2UiiiF91RjzPdAlkP+TtqtWO7Ma6i6eFvE
 HJ6ozjSnQ3aXs9vXrOn+KabWc+ZQLzsW58BFjK5GtCoKKThzwK0Rfc+iQeOcbRfQwAp7
 qBVBFILHHgxLbfe6xvuINgwyJnx2VSToJ29ptzqflWRJEdOp2yTC3SzyJ9QeuW+MD85h dA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3cfjepuwh0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Nov 2021 08:33:39 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2F81E10002A;
 Mon, 22 Nov 2021 08:33:35 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 268B52171DB;
 Mon, 22 Nov 2021 08:33:35 +0100 (CET)
Received: from lmecxl0573.lme.st.com (10.75.127.46) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Mon, 22 Nov
 2021 08:33:34 +0100
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20211115153223.563377-1-patrick.delaunay@foss.st.com>
 <20211115163155.5.I9d5be95eede5162b9b7b74778d8c7620e6762e56@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <483d5052-c409-c106-b0a8-58bfa65fe2af@foss.st.com>
Date: Mon, 22 Nov 2021 08:33:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211115163155.5.I9d5be95eede5162b9b7b74778d8c7620e6762e56@changeid>
Content-Language: en-US
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-22_03,2021-11-22_01,2020-04-07_01
Cc: Marek Vasut <marex@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [PATCH 5/7] common: add
 fdt_simplefb_enable_and_mem_rsv function
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

On 11/15/21 4:32 PM, Patrick Delaunay wrote:
> Add a new function to activate an existing simple frame buffer node
> and add the associated reserved memory, with no-map properties.
> 
> This device tree update is only done when the video device is active
> and the video buffer is used.
> 
> This patch uses '#if CONFIG_IS_ENABLED(DM_VIDEO)' because
> gd->video_bottom and gd->video_top are only defined when CONFIG_DM_VIDEO
> is activated.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  common/fdt_simplefb.c  | 27 +++++++++++++++++++++++++++
>  include/fdt_simplefb.h |  1 +
>  2 files changed, 28 insertions(+)
> 
> diff --git a/common/fdt_simplefb.c b/common/fdt_simplefb.c
> index 32173030ab..c52846f4bc 100644
> --- a/common/fdt_simplefb.c
> +++ b/common/fdt_simplefb.c
> @@ -89,3 +89,30 @@ int fdt_simplefb_enable_existing_node(void *blob)
>  
>  	return fdt_simplefb_configure_node(blob, off);
>  }
> +
> +#if CONFIG_IS_ENABLED(DM_VIDEO)
> +int fdt_simplefb_enable_and_mem_rsv(void *blob)
> +{
> +	struct fdt_memory mem;
> +	int ret;
> +
> +	/* nothing to do when video is not active */
> +	if (!video_is_active())
> +		return 0;
> +
> +	ret = fdt_simplefb_enable_existing_node(blob);
> +	if (ret)
> +		return ret;
> +
> +	/* nothing to do when the frame buffer is not defined */
> +	if (gd->video_bottom == gd->video_top)
> +		return 0;
> +
> +	/* reserved with no-map tag the video buffer */
> +	mem.start = gd->video_bottom;
> +	mem.end = gd->video_top - 1;
> +
> +	return fdtdec_add_reserved_memory(blob, "framebuffer", &mem, NULL, 0, NULL,
> +					  FDTDEC_RESERVED_MEMORY_NO_MAP);
> +}
> +#endif
> diff --git a/include/fdt_simplefb.h b/include/fdt_simplefb.h
> index 7e54723591..41cd740ac0 100644
> --- a/include/fdt_simplefb.h
> +++ b/include/fdt_simplefb.h
> @@ -10,4 +10,5 @@
>  #define _FDT_SIMPLEFB_H_
>  int fdt_simplefb_add_node(void *blob);
>  int fdt_simplefb_enable_existing_node(void *blob);
> +int fdt_simplefb_enable_and_mem_rsv(void *blob);
>  #endif
> 
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
