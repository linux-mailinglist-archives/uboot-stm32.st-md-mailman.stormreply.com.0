Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C563325FE
	for <lists+uboot-stm32@lfdr.de>; Tue,  9 Mar 2021 14:03:07 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 84B12C57195;
	Tue,  9 Mar 2021 13:03:06 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B5292C57183
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Mar 2021 13:03:05 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 129CuhIp028451; Tue, 9 Mar 2021 14:03:02 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=lw73B3Ben+no2gIEbuBtPE6vskB9iajX2Wzh84UmdsI=;
 b=g9ziTEHCtF0/kgvzBxLnoA1EfJYNJHZ9ImBuoDOERTIVM6fgL4sbzUHXeB4H4csS41nm
 UOFyNK05ZYiEjclW86HWssXRO3WLTaa4LmQuWtmlSD7rvBYRiw8rbyEfbXXqT9mWWVIh
 v+1roYtsPhEWefrEdTWZ6GDTg1/XYUyvMyhTels98AgLnSGiHGDohs8epljiQtsfPoui
 Z1FsXIwDuNRkQKoHthwGJ1N0Zybm3HG8wvggmEdezNTFldNYEMWUME+5699lCNKo0dYM
 8KYwSRu1Im5y1J8gVp/H3X1DaeyfNeSuLHQqrjhCwsQ0Y9R8G3xJJJ144kVH06GP+R+D Nw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 373yrejm0c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Mar 2021 14:03:02 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E6817100039;
 Tue,  9 Mar 2021 14:03:01 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BEA47258C4A;
 Tue,  9 Mar 2021 14:03:01 +0100 (CET)
Received: from lmecxl0573.lme.st.com (10.75.127.48) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 9 Mar
 2021 14:03:00 +0100
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20210224101946.32003-1-patrick.delaunay@foss.st.com>
 <20210224111907.3.I5f01e1c1c0c7f0d06dec0c0af215c1e476d730de@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <2b444015-a83c-44f0-9ae5-c8e1c06c042a@foss.st.com>
Date: Tue, 9 Mar 2021 14:03:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210224111907.3.I5f01e1c1c0c7f0d06dec0c0af215c1e476d730de@changeid>
Content-Language: en-US
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-09_11:2021-03-08,
 2021-03-09 signatures=0
Cc: Marek Vasut <marex@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Etienne Carriere <etienne.carriere@linaro.org>
Subject: Re: [Uboot-stm32] [PATCH 3/6] scmi: Include device_compat.h
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

On 2/24/21 11:19 AM, Patrick Delaunay wrote:
> Include the file needed for log function prototype, this patch solves the
> compilation issue for undefined reference to `dev_err'.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  drivers/firmware/scmi/smccc_agent.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/firmware/scmi/smccc_agent.c b/drivers/firmware/scmi/smccc_agent.c
> index 64d0929f69..81c2884bb7 100644
> --- a/drivers/firmware/scmi/smccc_agent.c
> +++ b/drivers/firmware/scmi/smccc_agent.c
> @@ -9,6 +9,7 @@
>  #include <scmi_agent.h>
>  #include <scmi_agent-uclass.h>
>  #include <dm/devres.h>
> +#include <dm/device_compat.h>
>  #include <dm/device-internal.h>
>  #include <linux/arm-smccc.h>
>  #include <linux/compat.h>
> 

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
