Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4ED5EA6B0
	for <lists+uboot-stm32@lfdr.de>; Mon, 26 Sep 2022 14:58:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B5B87C63326;
	Mon, 26 Sep 2022 12:58:41 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 37542C63325
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Sep 2022 12:58:41 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28Q9YqUv025710;
 Mon, 26 Sep 2022 14:58:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=PPzjZT19lDcHw0obXnrBg5Nncq0FHnmsWNydMYyltk8=;
 b=xM5Ty03FCtQ/irE1S0b7AY15o5yMof1A1tARJTZtTthY/CB1uVW0Cd6a6n/JUVWahoIO
 5S8KsuIbjcRPI8WqOSkZCW8+PgbeFvkquI+El87fNR4VvKQNLum0NLrCp3zfUhj02kpY
 Q6sYtAqcohnJCg5FaizYd6DizpLFSq9BmHam/lQKm1hZr0hoQVOkjBNlvtxGONsHUM+/
 fUXTJtHRWN9LvtU3hK/zC2Gh72OWax+giGFMsA4AwmRq6b9hiRW1c3xGQlabr8cuSDj1
 IIoW0n26YpA7D1HzjCr4Bu3hRxO5WTE4eXIcxKzxbkY42V8V+b61+4u9GhyIYMf2hC6J +A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jss822pwr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 Sep 2022 14:58:40 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9470710002A;
 Mon, 26 Sep 2022 14:58:39 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8FE8B22A6DF;
 Mon, 26 Sep 2022 14:58:39 +0200 (CEST)
Received: from [10.48.0.213] (10.75.127.119) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Mon, 26 Sep
 2022 14:58:39 +0200
Message-ID: <6e193abd-0707-ad5e-2ff6-8c19ab17306e@foss.st.com>
Date: Mon, 26 Sep 2022 14:58:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Patrice Chotard <patrice.chotard@foss.st.com>, <u-boot@lists.denx.de>
References: <20220920160436.117811-1-patrice.chotard@foss.st.com>
 <20220920160436.117811-6-patrice.chotard@foss.st.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20220920160436.117811-6-patrice.chotard@foss.st.com>
X-Originating-IP: [10.75.127.119]
X-ClientProxiedBy: GPXDAG2NODE4.st.com (10.75.127.68) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-26_08,2022-09-22_02,2022-06-22_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Vikas Manocha <vikas.manocha@st.com>
Subject: Re: [Uboot-stm32] [PATCH v2 5/7] configs: stm32746g-eval: Fix
 CONFIG_SYS_SPL_ARGS_ADDR
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

On 9/20/22 18:04, Patrice Chotard wrote:
> STM32F746 embeds 1 MB of internal flash [0x08000000-0x080fffff],
> fix CONFIG_SYS_SPL_ARGS_ADDR accordingly
> It solves hard fault when jumping from SPL to U-Boot.
>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>
> (no changes since v1)
>
>   configs/stm32746g-eval_spl_defconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/configs/stm32746g-eval_spl_defconfig b/configs/stm32746g-eval_spl_defconfig
> index d8d55c2d3c..28f522b15e 100644
> --- a/configs/stm32746g-eval_spl_defconfig
> +++ b/configs/stm32746g-eval_spl_defconfig
> @@ -36,7 +36,7 @@ CONFIG_SPL_BOARD_INIT=y
>   CONFIG_SPL_SYS_MALLOC_SIMPLE=y
>   CONFIG_SPL_MTD_SUPPORT=y
>   CONFIG_SPL_XIP_SUPPORT=y
> -CONFIG_SYS_SPL_ARGS_ADDR=0x81c0000
> +CONFIG_SYS_SPL_ARGS_ADDR=0x80c0000
>   CONFIG_SPL_DM_RESET=y
>   CONFIG_SYS_PBSIZE=1050
>   CONFIG_CMD_GPT=y


Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
