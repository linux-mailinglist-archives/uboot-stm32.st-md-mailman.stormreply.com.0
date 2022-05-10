Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 799D4520FEE
	for <lists+uboot-stm32@lfdr.de>; Tue, 10 May 2022 10:45:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 43A22C035BE;
	Tue, 10 May 2022 08:45:49 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AB6B9C035BD
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 May 2022 08:45:47 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24A8K1kR011776;
 Tue, 10 May 2022 10:45:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=sdFPm65D2DClsnUZGy4fS66A4i3rJZdyCkn22Pxzm1c=;
 b=xzAw09Q1b+l6S4iwkXZtM1RfIvLNmPY8LnFiti0tWOg+lycJjT3BuDkcbJUiICUOtMLX
 FPtq53MRiuaafBZurGJWx/WqdiMNrkwTnh3UUTRPx9HMBFz3bTQjvZ4HjIKJhd3xUZfq
 tmTZhpHCLiOhJFKe3bUNbJt9WWyYA169nRTtgQjVBKsMOv8d/FNNo9/uudF45m96evhf
 l7VW8Mr1KaoHpWSDaNlM31WYX0Y6dtcsR7HD47kvvMvUU+R9BAUVPgH5aR4vdrpM7Bvr
 rv8BtAseBfItV4xEh87keZll5NzxqQkJNWse9FwSCLbttIwjAOJdX/dYj8NTYp9CZX1E gg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3fwfnggmmd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 May 2022 10:45:46 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 579A010002A;
 Tue, 10 May 2022 10:45:46 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 503B0214D29;
 Tue, 10 May 2022 10:45:46 +0200 (CEST)
Received: from [10.201.20.162] (10.75.127.49) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Tue, 10 May
 2022 10:45:45 +0200
Message-ID: <d30e1a03-6fdf-3356-6c55-45a089179729@foss.st.com>
Date: Tue, 10 May 2022 10:45:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: <u-boot@lists.denx.de>
References: <20220427115401.155400-1-patrice.chotard@foss.st.com>
 <20220427115401.155400-3-patrice.chotard@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20220427115401.155400-3-patrice.chotard@foss.st.com>
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-10_01,2022-05-09_02,2022-02-23_01
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Vikas Manocha <vikas.manocha@st.com>
Subject: Re: [Uboot-stm32] [PATCH v2 02/12] configs: stm32f746-disco: Rename
 stm32f746-disco_defconfig to stm32f746-disco_spl_defconfig
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



On 4/27/22 13:53, Patrice Chotard wrote:
> The current stm32f746-disco_defconfig file supports SPL, rename it to
> stm32f746-disco_spl_defconfig to reflect the supported configuration.
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
> (no changes since v1)
> 
>  board/st/stm32f746-disco/MAINTAINERS                             | 1 +
>  .../{stm32f746-disco_defconfig => stm32f746-disco_spl_defconfig} | 0
>  2 files changed, 1 insertion(+)
>  rename configs/{stm32f746-disco_defconfig => stm32f746-disco_spl_defconfig} (100%)
> 
> diff --git a/board/st/stm32f746-disco/MAINTAINERS b/board/st/stm32f746-disco/MAINTAINERS
> index 3bbb513ad7..06d366e8a2 100644
> --- a/board/st/stm32f746-disco/MAINTAINERS
> +++ b/board/st/stm32f746-disco/MAINTAINERS
> @@ -4,4 +4,5 @@ S:	Maintained
>  F:	board/st/stm32f746-disco
>  F:	include/configs/stm32f746-disco.h
>  F:	configs/stm32f746-disco_defconfig
> +F:	configs/stm32f746-disco_spl_defconfig
>  F:	configs/stm32f769-disco_defconfig
> diff --git a/configs/stm32f746-disco_defconfig b/configs/stm32f746-disco_spl_defconfig
> similarity index 100%
> rename from configs/stm32f746-disco_defconfig
> rename to configs/stm32f746-disco_spl_defconfig
Applied to u-boot-stm32

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
