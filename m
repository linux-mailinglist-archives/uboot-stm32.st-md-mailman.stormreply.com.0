Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FFB36ECD10
	for <lists+uboot-stm32@lfdr.de>; Mon, 24 Apr 2023 15:20:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1644CC6905A;
	Mon, 24 Apr 2023 13:20:10 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8E82DC65E4C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Apr 2023 13:20:08 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33OCpH4U010494; Mon, 24 Apr 2023 15:20:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=N3V+4OooVO7dWuqE88XynIAIN/4ELL4bS1gDbSs69oU=;
 b=5IQndSjNH/k1o/bIZbife0szzsQ0q2OcPYUjzyUwG+jnfesOhCmKfVuBDImJubd3D4Lx
 RgQAHQTB6JdvgeWTHXSodx0a9aDz9b9TPlFVeSLLm/iSEnt5dBwIp4sJt9Eoioo8HB0a
 RqVDU7JaRjyDuWWoHmMYaUw4taSMFyuDYbgKFBdQkDx6v6zwB68yrqqDvl6m8eyNxqt4
 owqaVRV3RgIsfadN7r/CiMdrcDMuovqjCZ9YnA892suZnJx2ELwele39aj/B/JMoM74Z
 um9D1kTE5opPJw1DrrxPk8uau4q2ja8ki4Yl+fbi4E3ngeo1oBQBLooCs3QDeD3mrh5Y Sg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3q5t4v85ve-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Apr 2023 15:20:06 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 59217100034;
 Mon, 24 Apr 2023 15:20:06 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4DD3F22FA2E;
 Mon, 24 Apr 2023 15:20:06 +0200 (CEST)
Received: from [10.48.1.0] (10.48.1.0) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Mon, 24 Apr
 2023 15:20:05 +0200
Message-ID: <5e6500e1-834f-fa73-c07a-2ad13a120371@foss.st.com>
Date: Mon, 24 Apr 2023 15:20:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 <u-boot@lists.denx.de>
References: <20230422140140.616230-1-dario.binacchi@amarulasolutions.com>
Content-Language: en-US
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20230422140140.616230-1-dario.binacchi@amarulasolutions.com>
X-Originating-IP: [10.48.1.0]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-24_07,2023-04-21_01,2023-02-09_01
Cc: uboot-stm32@st-md-mailman.stormreply.com,
 Vikas Manocha <vikas.manocha@st.com>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Hi,

On 4/22/23 16:01, Dario Binacchi wrote:
> Commit 8fc78fc73b7f9d ("configs: migrate CONFIG_BMP_16/24/32BPP to defconfigs")
> made the comment useless.
>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>
>   include/configs/stm32f746-disco.h | 2 --
>   1 file changed, 2 deletions(-)
>
> diff --git a/include/configs/stm32f746-disco.h b/include/configs/stm32f746-disco.h
> index 34856d300403..9bf01cac47a4 100644
> --- a/include/configs/stm32f746-disco.h
> +++ b/include/configs/stm32f746-disco.h
> @@ -36,6 +36,4 @@
>   #define CFG_SYS_UBOOT_BASE		(CFG_SYS_FLASH_BASE + \
>   					 CONFIG_SPL_PAD_TO)
>   
> -/* For splashcreen */
> -
>   #endif /* __CONFIG_H */


Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick


_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
