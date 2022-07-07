Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA5E569BC9
	for <lists+uboot-stm32@lfdr.de>; Thu,  7 Jul 2022 09:40:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A43B2C640F5;
	Thu,  7 Jul 2022 07:40:10 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C292EC640ED
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 Jul 2022 07:40:08 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2676Eif6030876;
 Thu, 7 Jul 2022 09:40:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=Yw4Y4GxL9Eh+aXTTy24cuxC6fD5Z2hjZPVVmnAW0bLc=;
 b=g01S2DQioO9DeBAFwB0pCQlGmhYuGVNXqLszSMwXNr4xEqosuacLSrH5ldgzmXmHNqck
 /TI/Kc0hAChj8GFQAwIAeQ/dqJh1r/up8CQXXxsqID02oNAmnGcB/H17vMmJtadRSR7s
 Uvjw/iwV5G810qUWqCh5QyTEwFXVDNHSQb7IhqIpj+aLiLWwasZTWYfdE/Iwy+IpcmGh
 iQalfvPPMJHw8S4Opw1ZuXBqfvEuSc9XTQ7P2Qbfat3wbIz7P1ymgWBG7z20QR51fgFK
 GTZka0tzmxni4nfT2+Qr5Omvt/nr6UsJnnv/1XgvVLjRpG95WDrIVPlfaAQOtIhxRBqo xw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3h4uadjy5w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 07 Jul 2022 09:40:08 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6C64410002A;
 Thu,  7 Jul 2022 09:40:07 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 684B220F54F;
 Thu,  7 Jul 2022 09:40:07 +0200 (CEST)
Received: from [10.201.20.162] (10.75.127.48) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Thu, 7 Jul
 2022 09:40:07 +0200
Message-ID: <f4f67da6-24e2-c156-30df-e8a89d7726f4@foss.st.com>
Date: Thu, 7 Jul 2022 09:40:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20220630101930.v2.1.I32e861dc46886c23a866443be2bace22d86ae24e@changeid>
 <20220630101930.v2.7.I9a1f2a75952fa5d1a4c7703d2fcd3b257f15c0d9@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20220630101930.v2.7.I9a1f2a75952fa5d1a4c7703d2fcd3b257f15c0d9@changeid>
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-07_06,2022-06-28_01,2022-06-22_01
Cc: uboot-stm32@st-md-mailman.stormreply.com
Subject: Re: [Uboot-stm32] [PATCH v2 07/10] configs: stm32mp13: activate RNG
	support
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

On 6/30/22 10:20, Patrick Delaunay wrote:
> Activate the RNG driver provided by OP-TEE.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
> (no changes since v1)
> 
>  configs/stm32mp13_defconfig | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/configs/stm32mp13_defconfig b/configs/stm32mp13_defconfig
> index b5dcec78f51..3fa1642b2e4 100644
> --- a/configs/stm32mp13_defconfig
> +++ b/configs/stm32mp13_defconfig
> @@ -27,6 +27,7 @@ CONFIG_CMD_GPIO=y
>  CONFIG_CMD_MMC=y
>  CONFIG_CMD_CACHE=y
>  CONFIG_CMD_TIME=y
> +CONFIG_CMD_RNG=y
>  CONFIG_CMD_TIMER=y
>  CONFIG_CMD_LOG=y
>  CONFIG_OF_LIVE=y
> @@ -44,6 +45,8 @@ CONFIG_DM_REGULATOR_FIXED=y
>  CONFIG_DM_REGULATOR_GPIO=y
>  CONFIG_DM_REGULATOR_SCMI=y
>  CONFIG_RESET_SCMI=y
> +CONFIG_DM_RNG=y
> +CONFIG_RNG_OPTEE=y
>  CONFIG_SERIAL_RX_BUFFER=y
>  CONFIG_SYSRESET_PSCI=y
>  CONFIG_TEE=y
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
