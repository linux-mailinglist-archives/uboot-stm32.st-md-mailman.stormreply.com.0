Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA5D50B1F2
	for <lists+uboot-stm32@lfdr.de>; Fri, 22 Apr 2022 09:45:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 874DCC60496;
	Fri, 22 Apr 2022 07:45:45 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2D4A0C60492
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Apr 2022 07:45:44 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23M0SxXg019975;
 Fri, 22 Apr 2022 09:45:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=IrsqLIVjRKMNAx3XGgUA90YSmbaUdxX/R9wUW9jx0DY=;
 b=E9s6e+LVxglo1L3+zDL7Pfzjy+Y/WfSxcKu8jfNFRKivN5VUtjugWW1Fnngxej0QQuTq
 76QDmylMIel7Jrh078QhcXF4//ocsHtBugJaG0Fn13hlPLa102ZSHfffsSjU8OOvOeuz
 zFgvoY+pmb0vkZB6Ei6eVq+18paFpTmWhfDb412wWTNPo4s2/Wm+fA1o3Tap6YR9wKrb
 9Mf4OYnEAo0Jyr4l+Kaq/Oj0SMq+1DUXCxAs4/pkaA+lUz3PcT0MYnZPLpQBfqECd2yV
 0vdZabVz+eWv663RMS5sbjZANJRfpmhGgsjisCbRmOIyFCnFsGCMrhXxL76fRj0n1lMj Ag== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3fh09m92h7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Apr 2022 09:45:43 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B808A100034;
 Fri, 22 Apr 2022 09:45:42 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B02ED216840;
 Fri, 22 Apr 2022 09:45:42 +0200 (CEST)
Received: from [10.201.21.201] (10.75.127.45) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Fri, 22 Apr
 2022 09:45:42 +0200
Message-ID: <fbd6d5a9-6c72-2693-34a5-e25d1e3b56d3@foss.st.com>
Date: Fri, 22 Apr 2022 09:45:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20220415143153.1.I23ed8b36e294031f1f614d2304ea17085f075612@changeid>
 <20220415143153.2.Ie4aa91b7f1b08b59b02853e7f28c2b48445ba0f6@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20220415143153.2.Ie4aa91b7f1b08b59b02853e7f28c2b48445ba0f6@changeid>
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-22_02,2022-04-21_01,2022-02-23_01
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

Hi Patrick

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

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
