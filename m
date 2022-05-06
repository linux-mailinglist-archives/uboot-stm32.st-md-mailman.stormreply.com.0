Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C506E51D37E
	for <lists+uboot-stm32@lfdr.de>; Fri,  6 May 2022 10:37:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7D2D3C628A8;
	Fri,  6 May 2022 08:37:15 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 22B9FC6047D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 May 2022 08:37:14 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2467eqGr026488;
 Fri, 6 May 2022 10:37:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=Je4VcgzAifvPJF/vuZFdG2llhFLnfhmf+TmbQYZTkO8=;
 b=ZW9F8B2a4Xfmq3K3TJSlvtbXSHgcQSpJyq3bzLrQRpye5Xkqzp27y9fSJXcjZi9Y35rT
 epsa96/4/+LWQWmbvmbn1/Pg7RUqqYBx2mt5LtQd+biK2lV7uUawUEelmeXiC+JVkYQ/
 DkH38wweYXo9TMU13Vy0d6GElwfZphv0jIYfZ4LBFl11epBhuShpKiq6bTL0MsM0YzhK
 vaVh76ayMxtwvpunluzZMerYamFGQa9xKNeF/G1jSM/lSJVRytBEnQ8ZrNvc56P4MJzg
 RcS8GX8cel9inCsaz9p4cRWg2JlS/afdOeV3qJYqW4W+glfufjaYEbGELj1Q2nGhak6e lg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3frt899a22-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 May 2022 10:37:12 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 58F7B100038;
 Fri,  6 May 2022 10:37:12 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4329B215138;
 Fri,  6 May 2022 10:37:12 +0200 (CEST)
Received: from [10.48.0.213] (10.75.127.50) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Fri, 6 May
 2022 10:37:11 +0200
Message-ID: <cdf59467-ec70-1ffa-55c0-e5298ffa36ee@foss.st.com>
Date: Fri, 6 May 2022 10:37:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Patrice Chotard <patrice.chotard@foss.st.com>, <u-boot@lists.denx.de>
References: <20220422073831.15538-1-patrice.chotard@foss.st.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20220422073831.15538-1-patrice.chotard@foss.st.com>
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-06_03,2022-05-05_01,2022-02-23_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 1/3] pinctrl: pinctrl_stm32: Update
	pinmux_mode definition
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

On 4/22/22 09:38, Patrice Chotard wrote:
> pinmux_mode[] is linked to gpio_function[] defined in gpio-uclass.c
> So reuse the same gpio_func_t enum value
>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>
>   drivers/pinctrl/pinctrl_stm32.c | 13 ++++++-------
>   1 file changed, 6 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/pinctrl/pinctrl_stm32.c b/drivers/pinctrl/pinctrl_stm32.c
> index 5729799b12..5d8e156d62 100644
> --- a/drivers/pinctrl/pinctrl_stm32.c
> +++ b/drivers/pinctrl/pinctrl_stm32.c
> @@ -42,13 +42,12 @@ struct stm32_gpio_bank {
>   #ifndef CONFIG_SPL_BUILD
>   
>   static char pin_name[PINNAME_SIZE];
> -#define PINMUX_MODE_COUNT		5
> -static const char * const pinmux_mode[PINMUX_MODE_COUNT] = {
> -	"gpio input",
> -	"gpio output",
> -	"analog",
> -	"unknown",
> -	"alt function",
> +static const char * const pinmux_mode[GPIOF_COUNT] = {
> +	[GPIOF_INPUT] = "gpio input",
> +	[GPIOF_OUTPUT] = "gpio output",
> +	[GPIOF_UNUSED] = "analog",
> +	[GPIOF_UNKNOWN] = "unknown",
> +	[GPIOF_FUNC] = "alt function",
>   };
>   
>   static const char * const pinmux_bias[] = {


Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick


_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
