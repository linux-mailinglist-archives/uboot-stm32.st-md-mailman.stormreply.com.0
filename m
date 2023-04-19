Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F4A6E744B
	for <lists+uboot-stm32@lfdr.de>; Wed, 19 Apr 2023 09:48:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2A241C6B460;
	Wed, 19 Apr 2023 07:48:58 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 31E03C6B456
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Apr 2023 07:48:57 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33J3RISt029264; Wed, 19 Apr 2023 09:48:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=zIr516BqvJlH7Z7ucHJAzgtOFSxx+xSnTWf39srSdFw=;
 b=5YPVst1EYOv306ffStV6EfQ+QWn0iR/XSPVFmUmYC08U03ortM0DM4Sk/q/xcG/MS6yq
 glnzg7l1Vajv8uZ9KpVutSR286mufBDMROzTP0Izxx5aDqfYI+U6KdQV4zCBcWtrmZIe
 P3AtA/r4xmRRS9t+aMgQuWq0BY7Q3/p1NeaYQqRoTZHEyIzw7f0GqOoOMspWVyI5EXCU
 ZUUhgNFlsANIs1lgTwAJqWZ9pSfg+HUQs6grJcyywf8udXNdzDSxLIhUhOXEzi3qQiNC
 HygCbUY1Us4dS72uzLGZ8Bqmx+59jx++1iVPkgyP2zTD2VM+IC8i+1lSJ0u9pAyXrGHt NA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3q1qf7fq4j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Apr 2023 09:48:56 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EABB610002A;
 Wed, 19 Apr 2023 09:48:55 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E465F211F24;
 Wed, 19 Apr 2023 09:48:55 +0200 (CEST)
Received: from [10.201.21.26] (10.201.21.26) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Wed, 19 Apr
 2023 09:48:55 +0200
Message-ID: <3ca0f586-1a3d-b129-414a-fabdffab23da@foss.st.com>
Date: Wed, 19 Apr 2023 09:48:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: <u-boot@lists.denx.de>
References: <20230316070343.1074010-1-patrice.chotard@foss.st.com>
 <20230316070343.1074010-2-patrice.chotard@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20230316070343.1074010-2-patrice.chotard@foss.st.com>
X-Originating-IP: [10.201.21.26]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-19_04,2023-04-18_01,2023-02-09_01
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 2/2] configs: stm32mp13: Increase
 usb_pgood_delay for ST boards
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



On 3/16/23 08:03, Patrice Chotard wrote:
> With some USB device, the current usb_pgood_delay value is not long
> enough to ensure a correct detection.
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
> 
>  include/configs/stm32mp13_st_common.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/configs/stm32mp13_st_common.h b/include/configs/stm32mp13_st_common.h
> index ad8126f6103..20ec11477d6 100644
> --- a/include/configs/stm32mp13_st_common.h
> +++ b/include/configs/stm32mp13_st_common.h
> @@ -9,7 +9,7 @@
>  #define __CONFIG_STM32MP13_ST_COMMON_H__
>  
>  #define STM32MP_BOARD_EXTRA_ENV \
> -	"usb_pgood_delay=1000\0" \
> +	"usb_pgood_delay=2000\0" \
>  	"console=ttySTM0\0"
>  
>  #include <configs/stm32mp13_common.h>

Applied on u-boot-stm/master, thanks.

Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
