Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C1ACC52E4F8
	for <lists+uboot-stm32@lfdr.de>; Fri, 20 May 2022 08:28:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8755DC03FEB;
	Fri, 20 May 2022 06:28:20 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3EBFFC035BF
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 May 2022 06:28:19 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24K1fHTN021302;
 Fri, 20 May 2022 08:28:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=Ur4hkqJPGATQUyGkxKd3Hv+od6hE2GbG0Iqip71d13M=;
 b=RdyyhbkSiygKTybTxGds9K+WhBNjD4y+mCm3yh/Xk1o2OUEVzMUzzD9MZsxJycVxeQCW
 Ka/HXyaSepk0ajZG9TStco7sEmhMSuoD4XEbQFCMlJ0collkL5xmL5i+qfDUrdELL0qh
 myzc5fSA5pudBOsgmjlajzL5oFBcP59z99xxTuXyENaCyxINFkyea9hI6XXbHonR7CFL
 9m2BBQMpKxlC3E9w8HH9vf1vW4eM9i8D/JINjXHTRZm73Dm1601zhULK4IVmuhEd9JVn
 KKGVvu2x1oLfu2bZpVYPqTKH7pPsml+jdmD3wkUn3Uwr50hvPgCIo2HMo41OClOgcRxo ag== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3g23aj64dk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 May 2022 08:28:18 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DD84610002A;
 Fri, 20 May 2022 08:28:17 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D429120F2A8;
 Fri, 20 May 2022 08:28:17 +0200 (CEST)
Received: from [10.201.20.162] (10.75.127.50) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Fri, 20 May
 2022 08:28:16 +0200
Message-ID: <57b21faf-9507-3145-607d-6716778f436e@foss.st.com>
Date: Fri, 20 May 2022 08:28:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20220519155647.1433652-1-patrick.delaunay@foss.st.com>
 <20220519175614.v2.2.I98b0b23318f39ef6411b8f96c05f5b11b4cf5de7@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20220519175614.v2.2.I98b0b23318f39ef6411b8f96c05f5b11b4cf5de7@changeid>
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-20_02,2022-05-19_03,2022-02-23_01
Cc: uboot-stm32@st-md-mailman.stormreply.com,
 Gabriel FERNANDEZ <gabriel.fernandez@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH v2 2/3] misc: stm32mp13: introduce
	STM32MP13 RCC driver
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

On 5/19/22 17:56, Patrick Delaunay wrote:
> Add the MISC RCC driver for STM32MP13, and bind it to the RCC reset
> driver, required for initial support.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
> (no changes since v1)
> 
>  drivers/misc/stm32_rcc.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/misc/stm32_rcc.c b/drivers/misc/stm32_rcc.c
> index f14d6e26d9..b816503bfa 100644
> --- a/drivers/misc/stm32_rcc.c
> +++ b/drivers/misc/stm32_rcc.c
> @@ -39,6 +39,11 @@ struct stm32_rcc_clk stm32_rcc_clk_mp1 = {
>  	.soc = STM32MP1,
>  };
>  
> +struct stm32_rcc_clk stm32_rcc_clk_mp13 = {
> +	.drv_name = "stm32mp13_clk",
> +	.soc = STM32MP1,
> +};
> +
>  static int stm32_rcc_bind(struct udevice *dev)
>  {
>  	struct udevice *child;
> @@ -79,6 +84,7 @@ static const struct udevice_id stm32_rcc_ids[] = {
>  	{.compatible = "st,stm32f746-rcc", .data = (ulong)&stm32_rcc_clk_f7 },
>  	{.compatible = "st,stm32h743-rcc", .data = (ulong)&stm32_rcc_clk_h7 },
>  	{.compatible = "st,stm32mp1-rcc", .data = (ulong)&stm32_rcc_clk_mp1 },
> +	{.compatible = "st,stm32mp13-rcc", .data = (ulong)&stm32_rcc_clk_mp13 },
>  	{ }
>  };
>  

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
