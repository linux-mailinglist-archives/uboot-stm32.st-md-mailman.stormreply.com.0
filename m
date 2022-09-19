Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E075BC302
	for <lists+uboot-stm32@lfdr.de>; Mon, 19 Sep 2022 08:42:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1FF8BC0D2C1;
	Mon, 19 Sep 2022 06:42:29 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3E443C03FD5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Sep 2022 06:42:28 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28J0XRBu032263;
 Mon, 19 Sep 2022 08:42:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=iJftyYYVoFg5q4e2Mc4d9VZgO61eult30HK2XFha6vA=;
 b=QShDdCErHXK72dihDeD5ZIHga+GZIGqtBTeIYPk6BKxCpxJkH+x1aWEZy8OgpgVYr3zc
 IkhnfIqFRFqT3Cj8dtfV9tCrLDzwOiLyXIbQhoLPX2umgKiPWsVPoDGzSSKpFhS8+p14
 2/Q7guzFjGDEhCIz918moXXd7dE2dbGzREP6h7Tt0NYL5pWyQDg/INVtankEFHRc2lD+
 HnHbN7rUqzWHBGEWa4btEzfDe1xAHpbU/iPlez8TAqxTSqvKi40bioFsQRHvnvJ4XW8y
 ibnKQuAAetl7TFDkKU2p2/cCeGSn/ZCyvIrYfcBIeVMF+zpsVXPYSVP78/9LGKiNoMjh tA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jn6a0hfs2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Sep 2022 08:42:27 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3B96410002A;
 Mon, 19 Sep 2022 08:42:25 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 54F892128B3;
 Mon, 19 Sep 2022 08:42:25 +0200 (CEST)
Received: from [10.201.21.72] (10.75.127.50) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Mon, 19 Sep
 2022 08:42:25 +0200
Message-ID: <9f4dd203-a66f-a7c1-8aac-0da3e2a00b59@foss.st.com>
Date: Mon, 19 Sep 2022 08:42:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20220916165244.1.I22e7aeac596c03aca2236b69fd3cdf41a1f11339@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20220916165244.1.I22e7aeac596c03aca2236b69fd3cdf41a1f11339@changeid>
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-19_03,2022-09-16_01,2022-06-22_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH] configs: stm32mp1: cleanup config file
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

Hi PAtrick

On 9/16/22 16:52, Patrick Delaunay wrote:
> Remove the unnecessary comment after the CONFIG_SYS_BOOTM_LEN
> migration to Kconfig.
> 
> Fixes: c45568cc4e51 ("Convert CONFIG_SYS_BOOTM_LEN to Kconfig")
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  include/configs/stm32mp13_common.h | 2 --
>  include/configs/stm32mp15_common.h | 2 --
>  2 files changed, 4 deletions(-)
> 
> diff --git a/include/configs/stm32mp13_common.h b/include/configs/stm32mp13_common.h
> index 3ca65ea2a37..78089b965ae 100644
> --- a/include/configs/stm32mp13_common.h
> +++ b/include/configs/stm32mp13_common.h
> @@ -21,8 +21,6 @@
>   */
>  #define CONFIG_SYS_BOOTMAPSZ		SZ_256M
>  
> -/* Extend size of kernel image for uncompression */
> -
>  /*MMC SD*/
>  #define CONFIG_SYS_MMC_MAX_DEVICE	2
>  
> diff --git a/include/configs/stm32mp15_common.h b/include/configs/stm32mp15_common.h
> index c5412ffeb31..bd8e16bc1b9 100644
> --- a/include/configs/stm32mp15_common.h
> +++ b/include/configs/stm32mp15_common.h
> @@ -21,8 +21,6 @@
>   */
>  #define CONFIG_SYS_BOOTMAPSZ		SZ_256M
>  
> -/* Extend size of kernel image for uncompression */
> -
>  /*MMC SD*/
>  #define CONFIG_SYS_MMC_MAX_DEVICE	3
>  

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
