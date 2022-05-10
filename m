Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D37A6520EFC
	for <lists+uboot-stm32@lfdr.de>; Tue, 10 May 2022 09:46:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4C5BDC0D2B9;
	Tue, 10 May 2022 07:36:43 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0CABBC0D2B8
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 May 2022 07:36:42 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24A4C6m9025914;
 Tue, 10 May 2022 09:36:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=lLlvX7G9bAWOwQo3qc+SdWSRBTokrTrKD7cCB3PCCKQ=;
 b=NTz/VA0GfuLTVpKa+ZRj/M2RhVLOKknZvmAzj6sDSTD8LKE9f1Dq8nUiad5zOusp+Ywt
 SHhwzTXWB0t82lyDpS2IF1HkRV2c/SgZAZvV6FKfJjgjYiyjugLG53x6Wp3VmPjL+3DF
 ysPuxx8MRZp5K38RJNnhCqT4iQzTbpYzzy3rEGFwcAbMXddUn4eKczbZr63xfz/HLo5B
 OyOJAHAq3foGiPBMEj7zpQW+xuAjHxayXCU94jk5E530wc1+P1K8GlF1pbzQzWxo4bDY
 VnHDVebUk9BwyWnXDB7Kn/IJYdS090g4RGEmFixc8unALr5/B7tKhQjYWJqymgPHex/K lg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3fwe6kpj6e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 May 2022 09:36:40 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3563E10002A;
 Tue, 10 May 2022 09:36:40 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 24DA82128B8;
 Tue, 10 May 2022 09:36:40 +0200 (CEST)
Received: from [10.201.20.162] (10.75.127.50) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Tue, 10 May
 2022 09:36:39 +0200
Message-ID: <4a23ce52-98a6-4e60-5785-c6321d27be4c@foss.st.com>
Date: Tue, 10 May 2022 09:36:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20220415143153.1.I23ed8b36e294031f1f614d2304ea17085f075612@changeid>
 <20220415143153.2.Ie4aa91b7f1b08b59b02853e7f28c2b48445ba0f6@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20220415143153.2.Ie4aa91b7f1b08b59b02853e7f28c2b48445ba0f6@changeid>
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-09_06,2022-05-09_02,2022-02-23_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Alexandru Gagniuc <mr.nuke.me@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH 2/2] configs: stm32mp1: Add support for
 baudrates higher than 115200 for st-link
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



On 4/15/22 14:31, Patrick Delaunay wrote:
> On STMicroelectronics boards, the UART can reliably go up to
> 2000000 bauds when connected to the on-board ST-LINK-V2 for STM32MP15
> 
> Unfortunately U-Boot will fall back to 115200 unless higher rates are
> declared via CONFIG_SYS_BAUDRATE_TABLE.
> 
> This patch add the support of higher baudrates on STMicroelectronics
> boards with ST-LINK.
> 
> Cc: Alexandru Gagniuc <mr.nuke.me@gmail.com>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  include/configs/stm32mp15_st_common.h | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/include/configs/stm32mp15_st_common.h b/include/configs/stm32mp15_st_common.h
> index e8dad004c6..3c0ffb8f56 100644
> --- a/include/configs/stm32mp15_st_common.h
> +++ b/include/configs/stm32mp15_st_common.h
> @@ -13,6 +13,11 @@
>  
>  #include <configs/stm32mp15_common.h>
>  
> +/* uart with on-board st-link */
> +#define CONFIG_SYS_BAUDRATE_TABLE      { 9600, 19200, 38400, 57600, 115200, \
> +					 230400, 460800, 921600, \
> +					 1000000, 2000000 }
> +
>  #ifdef CONFIG_EXTRA_ENV_SETTINGS
>  /*
>   * default bootcmd for stm32mp1 STMicroelectronics boards:
Applied to u-boot-stm32

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
