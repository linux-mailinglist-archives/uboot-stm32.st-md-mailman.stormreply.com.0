Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EF22E569BCB
	for <lists+uboot-stm32@lfdr.de>; Thu,  7 Jul 2022 09:40:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B8AF3C640F5;
	Thu,  7 Jul 2022 07:40:33 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3D1E5C640ED
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 Jul 2022 07:40:32 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2675rEdE030892;
 Thu, 7 Jul 2022 09:40:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=9IGc1fSd+iFabqVkAOoM60uZW/0djfM5eeJhcLuENpY=;
 b=5dfOLrCAyrCvLcAn3sfULLPc2hnfEx2YCC1aoMCLnrBb/7QowtJ97ZlrM++vahnSVP8d
 TP0GLUI+QulkaYlMS+ceySao+1CIX/+YpnIz5W90Xw5XDPlI0SnvCYOdagWN39Fc9b6s
 m8LlQBR3rH6eGJSMB+AvNX7bFEqp7ZfC8SXcwlMek0peDnba/zJH0npYYjHwy3l05DQb
 WqolLG75VPb9n2XJh7g8KMU//F/fakApeUe8vQfwcrGh2iwkkb1JL7zdhv6cUVtOUznT
 LmxCpuW9MjdbbeB5pms+pTmHqQBdU29ccH3HA+JS6eBS3BIRcfWYu40Ntp8M8ewegpmK 4A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3h4uadjya2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 07 Jul 2022 09:40:31 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 32FFA10002A;
 Thu,  7 Jul 2022 09:40:31 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 26DFE210F87;
 Thu,  7 Jul 2022 09:40:31 +0200 (CEST)
Received: from [10.201.20.162] (10.75.127.51) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Thu, 7 Jul
 2022 09:40:30 +0200
Message-ID: <118b43f3-bad6-4567-f64b-907094b189a9@foss.st.com>
Date: Thu, 7 Jul 2022 09:40:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20220630101930.v2.1.I32e861dc46886c23a866443be2bace22d86ae24e@changeid>
 <20220630101930.v2.9.Ib45cd17f31c3ffeccd95a162ea3ecf7e5a4392a1@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20220630101930.v2.9.Ib45cd17f31c3ffeccd95a162ea3ecf7e5a4392a1@changeid>
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-07_06,2022-06-28_01,2022-06-22_01
Cc: uboot-stm32@st-md-mailman.stormreply.com
Subject: Re: [Uboot-stm32] [PATCH v2 09/10] configs: stm32mp13: activate I2C
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

Hi Patrick

On 6/30/22 10:20, Patrick Delaunay wrote:
> Activate the I2C driver in STM32MP13x config.
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
> index 9b0c5a36b04..f58c73b7c79 100644
> --- a/configs/stm32mp13_defconfig
> +++ b/configs/stm32mp13_defconfig
> @@ -24,6 +24,7 @@ CONFIG_CMD_MEMINFO=y
>  CONFIG_CMD_MEMTEST=y
>  CONFIG_CMD_CLK=y
>  CONFIG_CMD_GPIO=y
> +CONFIG_CMD_I2C=y
>  CONFIG_CMD_MMC=y
>  CONFIG_CMD_CACHE=y
>  CONFIG_CMD_TIME=y
> @@ -37,6 +38,8 @@ CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
>  CONFIG_SYS_RELOC_GD_ENV_ADDR=y
>  CONFIG_SYS_MMC_ENV_DEV=-1
>  CONFIG_CLK_SCMI=y
> +CONFIG_DM_I2C=y
> +CONFIG_SYS_I2C_STM32F7=y
>  CONFIG_STM32_SDMMC2=y
>  CONFIG_DM_ETH=y
>  CONFIG_PINCONF=y
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
