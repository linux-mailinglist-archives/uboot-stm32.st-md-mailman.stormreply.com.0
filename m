Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C76F4589DF
	for <lists+uboot-stm32@lfdr.de>; Mon, 22 Nov 2021 08:34:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CA2DBC5C82A;
	Mon, 22 Nov 2021 07:34:33 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 58224C5A4FD
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Nov 2021 07:34:33 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AM74Kiv020517;
 Mon, 22 Nov 2021 08:34:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=pBje5MmaRirVCvG3/+oYvFPw38uMxuxy9N5f+FvdobA=;
 b=PnTp18QrVbjk9LiURdkiR6YJlvFJvKuNTZB9SFlEuGUiEeoVW8o10J4FD11I6l9+yLy5
 PH7nPxKs/202z4jF+AhsCLbLYYy8BYk6MaVT4XyV8jlcraXWiM7wOnOSyNY6E8D9jZOu
 zrRCPOcNDcCbB7aBbIZK+aAl3jD5D0OtRmEd3Z5pK7ziqdp3kXdwrlxve5HviM0B52jG
 LAJ8CxQOwQrmdfBYpcimcfJYAKjP5Vwt9CefEWTmwJovKrT0aqzT74oS5BslwxKE1VGW
 +e+RTL/G/HiXIAsZX3Z5XV4uWo77DutffmGsOXhGUOuGPiXxYqysHmsMIhLTjsU3a7Ya 1A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3cg6gcg5ec-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Nov 2021 08:34:32 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F40D810002A;
 Mon, 22 Nov 2021 08:34:31 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id ECED72171DB;
 Mon, 22 Nov 2021 08:34:31 +0100 (CET)
Received: from lmecxl0573.lme.st.com (10.75.127.44) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Mon, 22 Nov
 2021 08:34:31 +0100
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20211115153223.563377-1-patrick.delaunay@foss.st.com>
 <20211115163155.6.I1e3c35ed5deec91edfad2e93b4e12dda56a4d1c5@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <bfbeb863-9efd-5d80-c758-f86b6974ecda@foss.st.com>
Date: Mon, 22 Nov 2021 08:34:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211115163155.6.I1e3c35ed5deec91edfad2e93b4e12dda56a4d1c5@changeid>
Content-Language: en-US
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-22_03,2021-11-22_01,2020-04-07_01
Cc: Marek Vasut <marex@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 =?UTF-8?Q?Yannick_Fertr=c3=a9?= <yannick.fertre@foss.st.com>,
 Anatolij Gustschin <agust@denx.de>
Subject: Re: [Uboot-stm32] [PATCH 6/7] video: stm32: stm32_ltdc: align
	framebuffer on 2MB
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

On 11/15/21 4:32 PM, Patrick Delaunay wrote:
> Align the framebuffer size on MMU_SECTION_SIZE in kernel, = max 2MB for
> LPAE for armV7, to avoid issue with the simple frame buffer activation,
> when U-Boot add a reserved memory in the kernel device tree to preserve
> the splash screen until Linux driver initialization.
> 
> See Linux documentation for details:
> Documentation/devicetree/bindings/display/simple-framebuffer.yaml
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  drivers/video/stm32/stm32_ltdc.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/video/stm32/stm32_ltdc.c b/drivers/video/stm32/stm32_ltdc.c
> index 65c882d9f1..87e5fd54d9 100644
> --- a/drivers/video/stm32/stm32_ltdc.c
> +++ b/drivers/video/stm32/stm32_ltdc.c
> @@ -459,7 +459,10 @@ static int stm32_ltdc_bind(struct udevice *dev)
>  	uc_plat->size = CONFIG_VIDEO_STM32_MAX_XRES *
>  			CONFIG_VIDEO_STM32_MAX_YRES *
>  			(CONFIG_VIDEO_STM32_MAX_BPP >> 3);
> -	dev_dbg(dev, "frame buffer max size %d bytes\n", uc_plat->size);
> +	/* align framebuffer on kernel MMU_SECTION_SIZE = max 2MB for LPAE */
> +	uc_plat->align = SZ_2M;
> +	dev_dbg(dev, "frame buffer max size %d bytes align %x\n",
> +		uc_plat->size, uc_plat->align);
>  
>  	return 0;
>  }
> 
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
