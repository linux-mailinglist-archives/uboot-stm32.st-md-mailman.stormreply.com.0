Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A2F73306E
	for <lists+uboot-stm32@lfdr.de>; Fri, 16 Jun 2023 13:50:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0B332C6A615;
	Fri, 16 Jun 2023 11:50:53 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4071BC6A610
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Jun 2023 11:50:52 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35G8bjEk015754; Fri, 16 Jun 2023 13:50:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=EVHGvlTWTSeZWrA/L9fVI3TPf0hcR80tdE6bb4ngeUw=;
 b=g0HnkhOqvEm1vd3rBs8QzHo7zfV4xSvQRWFolG+38OY7UBm0IQUggmhgsV7isQO63YAV
 jMzI33xsMtSJLXYFx2TcOjVGsFvutX6MfhPAV0HRiCLUFxquJom8pJNGiBhHclASXaFD
 sboOz6Q4zy0DckrTa2esn3gqvGiZ+TC8JwE4rhkuAG4i5FS7ZCaFUZdMroYL2kRwLS55
 pTCLDVYE8yZhtLntYwRPnSDjkYTMp4KtjoXcfevmZlg+WGuhIF/+Q6lglG7lGKzsO1Da
 QOqXn8oN4tBQ0RhVTs1A6wI892hn2gbqvEfkzWe08GnvTrfNyEsWsd6tiJ39si8Qzxwm 9A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3r8fj9avd3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Jun 2023 13:50:50 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9378410002A;
 Fri, 16 Jun 2023 13:50:48 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 888F7232FF5;
 Fri, 16 Jun 2023 13:50:48 +0200 (CEST)
Received: from [10.252.4.57] (10.252.4.57) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Fri, 16 Jun
 2023 13:50:48 +0200
Message-ID: <144bf945-64d0-d096-099e-3a2c58b06419@foss.st.com>
Date: Fri, 16 Jun 2023 13:50:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 <u-boot@lists.denx.de>
References: <20230422140140.616230-1-dario.binacchi@amarulasolutions.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20230422140140.616230-1-dario.binacchi@amarulasolutions.com>
X-Originating-IP: [10.252.4.57]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-16_08,2023-06-16_01,2023-05-22_02
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Vikas Manocha <vikas.manocha@st.com>
Subject: Re: [Uboot-stm32] [PATCH] configs: stm32f746-disco: remove a
	useless comment
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



On 4/22/23 16:01, Dario Binacchi wrote:
> Commit 8fc78fc73b7f9d ("configs: migrate CONFIG_BMP_16/24/32BPP to defconfigs")
> made the comment useless.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
> 
>  include/configs/stm32f746-disco.h | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/include/configs/stm32f746-disco.h b/include/configs/stm32f746-disco.h
> index 34856d300403..9bf01cac47a4 100644
> --- a/include/configs/stm32f746-disco.h
> +++ b/include/configs/stm32f746-disco.h
> @@ -36,6 +36,4 @@
>  #define CFG_SYS_UBOOT_BASE		(CFG_SYS_FLASH_BASE + \
>  					 CONFIG_SPL_PAD_TO)
>  
> -/* For splashcreen */
> -
>  #endif /* __CONFIG_H */

Applied to u-boot-stm/next

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
