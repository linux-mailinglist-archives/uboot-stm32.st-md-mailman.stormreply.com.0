Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D07FF3B8E41
	for <lists+uboot-stm32@lfdr.de>; Thu,  1 Jul 2021 09:37:48 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 96060C597AA;
	Thu,  1 Jul 2021 07:37:48 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 35CACC59783
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  1 Jul 2021 07:37:46 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1617ae8f024051; Thu, 1 Jul 2021 09:37:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=QPA3ZRjBDz4eXetZ9OC9Tl25kSkDrH3EuvihDIR6h/0=;
 b=S7aXlbNkCi/K9/apXYjrYmrE1HhQB0BNAQs5LB4Y4GFWGzNpzxiZ0HHqIoiR8Aj/f7ie
 2QLearWtOD9Ocs5SWU9sKJrF75Yu8dObO0kyj0REzjWxFmZAyplQbK2JopXoWNayEfEA
 baU3aPFTZo0Xa07GF9hUdwpaL6no1ZmL7mVKXZLwA0NoqtvIqiVmrb18458MVu0u5etF
 gD1QgpCvjcyU58thJSv9a8As46xw9V6ngrSnx8BzLIPZkYyOaXtNiSD8+AsRzudy/rqP
 z0+njyadKNiAj/B3XvHrRLaHRVS4+OXU/CYo1TCqhr0IaemL8/A0aDz5pxW9KdWt8z7g yA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 39h1xqa92q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Jul 2021 09:37:43 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 132DD10002A;
 Thu,  1 Jul 2021 09:37:43 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0778A2138D2;
 Thu,  1 Jul 2021 09:37:43 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.45) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 1 Jul
 2021 09:37:42 +0200
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20210628144151.1.I5e93758388130e77d97fc9904105c8e69363705b@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <696998ea-454c-19ef-ccc3-40e7162941a9@foss.st.com>
Date: Thu, 1 Jul 2021 09:37:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210628144151.1.I5e93758388130e77d97fc9904105c8e69363705b@changeid>
Content-Language: en-US
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-01_01:2021-06-30,
 2021-07-01 signatures=0
Cc: Marek Vasut <marex@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@dh-electronics.com
Subject: Re: [Uboot-stm32] [PATCH] configs: stm32mp1: remove splashimage and
 add fdtoverlay_addr_r
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

On 6/28/21 2:42 PM, Patrick Delaunay wrote:
> Add the variable used by PXE command for fdtoverlays support
> since the commit 69076dff2284 ("cmd: pxe: add support for FDT overlays").
> 
> Reused the unused "splashimage" address as CONFIG_SPLASH_SOURCE and
> CONFIG_VIDEO_LOGO are not activated and U-Boot display the "BACKGROUND"
> image found in extlinux.conf to manage splashscreen on stm32mp1 boards.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  include/configs/stm32mp1.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/include/configs/stm32mp1.h b/include/configs/stm32mp1.h
> index 440efa1a55..2e7f49e7bb 100644
> --- a/include/configs/stm32mp1.h
> +++ b/include/configs/stm32mp1.h
> @@ -155,7 +155,7 @@
>  
>  /*
>   * memory layout for 32M uncompressed/compressed kernel,
> - * 1M fdt, 1M script, 1M pxe and 1M for splashimage
> + * 1M fdt, 1M script, 1M pxe and 1M for overlay
>   * and the ramdisk at the end.
>   */
>  #define CONFIG_EXTRA_ENV_SETTINGS \
> @@ -163,7 +163,7 @@
>  	"fdt_addr_r=0xc4000000\0" \
>  	"scriptaddr=0xc4100000\0" \
>  	"pxefile_addr_r=0xc4200000\0" \
> -	"splashimage=0xc4300000\0"  \
> +	"fdtoverlay_addr_r=0xc4300000\0" \
>  	"ramdisk_addr_r=0xc4400000\0" \
>  	"altbootcmd=run bootcmd\0" \
>  	"env_check=if env info -p -d -q; then env save; fi\0" \
> 
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
