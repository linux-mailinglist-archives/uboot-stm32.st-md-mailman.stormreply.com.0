Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7A4643E52
	for <lists+uboot-stm32@lfdr.de>; Tue,  6 Dec 2022 09:17:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 42E6BC65E6E;
	Tue,  6 Dec 2022 08:17:14 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D41EAC65E6C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Dec 2022 08:17:12 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2B63Hog6023656; Tue, 6 Dec 2022 09:17:02 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=I34VvBzTB1f0+xi827Tam9AnagRDUJGeUfFtEVCfaR8=;
 b=eUUvvafK0RXQ9+nE1z+i75eoxcRuwFPxoj1flEouPa5xwY1YZfYFkudOwnA3AT4YNmNW
 DL9aNX2XhLE/8H77jAzRI0igBAjRR3f6QcLyUQQLAT8D5APLbqcYAE+vlfpNT0PS0Cdy
 DjJncd/hZIBfpkWgyQoQgeOdV1hBEfGL+SZ13Nj0d+9gXT4hexr7y+eo2GsYT6OTVN5M
 r2RUPDbbTrvUSNImyZW9CMY7WsSC5WoJ74uI108ULU+E8tvPaomkYRktmKL3EK2XBDRD
 V6EEUfI242AL365c/RAD+8LurnYUO0y1xSifEQ/bzdIAgYm/ej7eNcvlfP4TSqdGEIu6 GQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3m7x7pqfpj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Dec 2022 09:17:02 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B24A7100039;
 Tue,  6 Dec 2022 09:16:57 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AB8412138D6;
 Tue,  6 Dec 2022 09:16:57 +0100 (CET)
Received: from [10.201.20.130] (10.201.20.130) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Tue, 6 Dec
 2022 09:16:57 +0100
Message-ID: <79a6823e-ffb2-723c-2701-75bb28b30e9c@foss.st.com>
Date: Tue, 6 Dec 2022 09:16:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20221110104905.3076915-1-patrick.delaunay@foss.st.com>
 <20221110114828.8.I538cb13cfee1aa38486ec5fb712726a1d65dbe56@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20221110114828.8.I538cb13cfee1aa38486ec5fb712726a1d65dbe56@changeid>
X-Originating-IP: [10.201.20.130]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-06_05,2022-12-05_01,2022-06-22_01
Cc: Jaehoon Chung <jh80.chung@samsung.com>,
 Joe Hershberger <joe.hershberger@ni.com>, Peng Fan <peng.fan@nxp.com>,
 Wolfgang Denk <wd@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 8/8] env: mmc: cosmetic: remove unused
 macro STR(X)
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



On 11/10/22 11:49, Patrick Delaunay wrote:
> Remove the unused macro STR(X) since the commit 2b2f727500dc ("env: mmc:
> allow support of mmc_get_env_dev with OF_CONTROL")
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  env/mmc.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/env/mmc.c b/env/mmc.c
> index 8941e0f5ff39..85761417f283 100644
> --- a/env/mmc.c
> +++ b/env/mmc.c
> @@ -21,9 +21,6 @@
>  #include <errno.h>
>  #include <dm/ofnode.h>
>  
> -#define __STR(X) #X
> -#define STR(X) __STR(X)
> -
>  #define ENV_MMC_INVALID_OFFSET ((s64)-1)
>  
>  #if defined(CONFIG_ENV_MMC_USE_DT)

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
