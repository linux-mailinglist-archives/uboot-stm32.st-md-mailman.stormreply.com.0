Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 741AB2F77E3
	for <lists+uboot-stm32@lfdr.de>; Fri, 15 Jan 2021 12:45:59 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 854E8C424BE;
	Fri, 15 Jan 2021 11:45:58 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7C686C32EA7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Jan 2021 11:45:57 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10FBb4VP012880; Fri, 15 Jan 2021 12:45:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=ib4+7OCLNVJJU65TtAj5byyGlyvwBQL59tMVU54LXBY=;
 b=Cymo4cQgD0ygucMizlGwhP5l81JYk2AYPizIgb5REoJEbwE/vJbHovbY2skwlC2wDeYT
 cKdR99wUKo68PjmMe9slWPpb6Ci1Zo/R9GS7ophGjEEaZXCTwghpfew36bNb1gL+M3sl
 4SQ3AB1B98anuN/goibp9IuSbgwT7EV1wMNzMpjHJqZlNc7HPUDfNTAnRksKpBwGX28K
 sou5cCEtAaWl1625DV2j2aiMphmG5jLHltTVpjqVzbP33XyY8WswM9unKmp/fLJe8NCm
 X6qLOKHO6gw326f+VXNq9gIybE5aI/HOnklQtCHKBRAxhTk4UxgIptKwdEbC259XT8Yd hA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 35yp3y8sbu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Jan 2021 12:45:54 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DB38610002A;
 Fri, 15 Jan 2021 12:45:53 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A2A8F232754;
 Fri, 15 Jan 2021 12:45:53 +0100 (CET)
Received: from lmecxl0573.lme.st.com (10.75.127.44) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 15 Jan
 2021 12:45:52 +0100
To: <u-boot@lists.denx.de>
References: <20210111140347.5754-1-patrice.chotard@foss.st.com>
 <20210111140347.5754-2-patrice.chotard@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <6be35818-82a5-85e6-c1a0-043121a39e61@foss.st.com>
Date: Fri, 15 Jan 2021 12:45:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210111140347.5754-2-patrice.chotard@foss.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG4NODE2.st.com (10.75.127.11) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-15_07:2021-01-15,
 2021-01-15 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Simon Glass <sjg@chromium.org>, Patrick DELAUNAY <patrick.delaunay@st.com>
Subject: Re: [Uboot-stm32] [PATCH 1/2] pinctrl: stmfx: Fix MAX_PIN_NAME_LEN
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

Hi 

This series is abandoned and will be replaced by a new one.

Patrice


On 1/11/21 3:03 PM, Patrice Chotard wrote:
> MAX_PIN_NAME_LEN is set to 7 whereas stmfx pin name prefix "stmfx_gpio"
> is 10 char long. So "pinmux status" output looks like:
> 
> STM32MP> pinmux status -a
> --------------------------
> stmfx@42:
> stmfx_ : input
> stmfx_ : input
> stmfx_ : input
> stmfx_ : input
> stmfx_ : input
> .....
> 
> Set MAX_PIN_NAME_LEN to 13 to get a correct pinmux command output.
> 
> Fixes: e27e96aa804e("pinctrl: stmfx: update pin name")
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> ---
> 
>  drivers/pinctrl/pinctrl-stmfx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-stmfx.c b/drivers/pinctrl/pinctrl-stmfx.c
> index a62be44d2d..d23ad862f2 100644
> --- a/drivers/pinctrl/pinctrl-stmfx.c
> +++ b/drivers/pinctrl/pinctrl-stmfx.c
> @@ -346,7 +346,7 @@ static int stmfx_pinctrl_get_pins_count(struct udevice *dev)
>   * STMFX pins[15:0] are called "stmfx_gpio[15:0]"
>   * and STMFX pins[23:16] are called "stmfx_agpio[7:0]"
>   */
> -#define MAX_PIN_NAME_LEN 7
> +#define MAX_PIN_NAME_LEN 13
>  static char pin_name[MAX_PIN_NAME_LEN];
>  static const char *stmfx_pinctrl_get_pin_name(struct udevice *dev,
>  					      unsigned int selector)
> 
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
