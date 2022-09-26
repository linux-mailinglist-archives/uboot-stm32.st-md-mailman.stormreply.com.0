Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F8A5EA6AC
	for <lists+uboot-stm32@lfdr.de>; Mon, 26 Sep 2022 14:58:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A9E17C63324;
	Mon, 26 Sep 2022 12:58:24 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 180A8C035BA
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Sep 2022 12:58:24 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28QCrvUg023815;
 Mon, 26 Sep 2022 14:58:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=SbO+dUeViYsWpKqseTd7jOhaip8/YJccUbAqQXhyBV8=;
 b=5a7rt3nK5+qgvEflWdEW2qv2OGqJqgnl4z7s2eJSS/tEyylzgs3JB7AoX7oJJP1yU1C5
 +UeeH119VLs//ANSkqRasZnrr1bAqsq5xQwN+6zSm31/MqWxiAxQW+vMBtCnD6u0avyT
 XMT/MXx1bSui0ArQkvkyyXEcjk5R1urpK4uUY5ntSy5oBFgrF9x4JUkPwfL7+iOi473y
 BDA3cGCdW7SkNrYWmv2pYd8hrV9mbububiL0BRwtQafmYPJBY2ZIgnBp0UUQVaBZUAKv
 OCOpJCyjdV/SbegLJo2ooIdK2t4mVPQ4065PEuSKeQBoAhUFLirF32IV1qb25yXvaU23 JA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jsq1auypw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 Sep 2022 14:58:23 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1CC3E10002A;
 Mon, 26 Sep 2022 14:58:23 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1887D22A6DE;
 Mon, 26 Sep 2022 14:58:23 +0200 (CEST)
Received: from [10.48.0.213] (10.75.127.46) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Mon, 26 Sep
 2022 14:58:22 +0200
Message-ID: <19cf1f5a-e6d1-1e44-3098-4847458a3b85@foss.st.com>
Date: Mon, 26 Sep 2022 14:58:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Patrice Chotard <patrice.chotard@foss.st.com>, <u-boot@lists.denx.de>
References: <20220920160436.117811-1-patrice.chotard@foss.st.com>
 <20220920160436.117811-5-patrice.chotard@foss.st.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20220920160436.117811-5-patrice.chotard@foss.st.com>
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-26_08,2022-09-22_02,2022-06-22_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Vikas Manocha <vikas.manocha@st.com>
Subject: Re: [Uboot-stm32] [PATCH v2 4/7] configs: stm32f746-disco: Fix
 CONFIG_SYS_SPL_ARGS_ADDR
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

On 9/20/22 18:04, Patrice Chotard wrote:
> STM32F746 embeds 1 MB of internal flash [0x08000000-0x080fffff],
> fix CONFIG_SYS_SPL_ARGS_ADDR accordingly
> It solves hard fault when jumping from SPL to U-Boot.
>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>
> (no changes since v1)
>
>   configs/stm32f746-disco_spl_defconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/configs/stm32f746-disco_spl_defconfig b/configs/stm32f746-disco_spl_defconfig
> index 5e8a8aaf3c..d4a65bde24 100644
> --- a/configs/stm32f746-disco_spl_defconfig
> +++ b/configs/stm32f746-disco_spl_defconfig
> @@ -36,7 +36,7 @@ CONFIG_SPL_BOARD_INIT=y
>   CONFIG_SPL_SYS_MALLOC_SIMPLE=y
>   CONFIG_SPL_MTD_SUPPORT=y
>   CONFIG_SPL_XIP_SUPPORT=y
> -CONFIG_SYS_SPL_ARGS_ADDR=0x81c0000
> +CONFIG_SYS_SPL_ARGS_ADDR=0x80c0000
>   CONFIG_SPL_DM_RESET=y
>   CONFIG_SYS_PBSIZE=1050
>   CONFIG_CMD_GPT=y


Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
