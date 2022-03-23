Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC464E4E4B
	for <lists+uboot-stm32@lfdr.de>; Wed, 23 Mar 2022 09:36:04 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C9542C5F1EF;
	Wed, 23 Mar 2022 08:36:03 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AC48BC5F1D6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Mar 2022 08:36:02 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22N37nrV017651;
 Wed, 23 Mar 2022 09:35:58 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=lZyZgwDmetEVQaP8XNBIx27XzlHm14pP15wqZB5Xmus=;
 b=LyAONwHmPnaE0KLCxw3d3D96LYu7SEAVDG5dvHIK5hzGac6qvoCyDcSvjiWr6pQihhpu
 CZj5jXPCf7MFTa5doCgnyxjbvm4tIyp2NfP7DadiLYk+836ULbR74V8O+xMF4S1WjAwP
 VgkJ0XOjRzAUNo+RrXi4yRXQBjQXGqUkNrY32h7wajSp2EvDTeAGDl7rDSTG0d1IOtuq
 8b5iUnxpObDM+JqMs7ew0rfpl+FJsFC0fV4Wz7FYzsqWbRSNXQrufOtt9wMr5qrKx7Kr
 L0OEe0HFvezHoIfoW4nSG/L6/yzfTup0d5NePytsJ2HxU2S8MOYKrwkFvxLTajJP2HBr nA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ew5fpeu3v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Mar 2022 09:35:58 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E43F610002A;
 Wed, 23 Mar 2022 09:35:57 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DC2F2217B8D;
 Wed, 23 Mar 2022 09:35:57 +0100 (CET)
Received: from [10.201.21.201] (10.75.127.45) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Wed, 23 Mar
 2022 09:35:57 +0100
Message-ID: <2ae2123a-f4cb-ded4-8807-4ce376c3d9ee@foss.st.com>
Date: Wed, 23 Mar 2022 09:35:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20220322170840.v2.1.I87cd34696829974a97e4eae53f9652577d6e2e4b@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20220322170840.v2.1.I87cd34696829974a97e4eae53f9652577d6e2e4b@changeid>
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-23_04,2022-03-22_01,2022-02-23_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Artem Lapkin <email2tema@gmail.com>, Ramon Fried <rfried.dev@gmail.com>,
 Simon Glass <sjg@chromium.org>, Zhaofeng Li <hello@zhaofeng.li>
Subject: Re: [Uboot-stm32] [PATCH v2] cmd: pxe_utils: sysboot: replace cls
 command by video_clear in PXE parser
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

On 3/22/22 17:08, Patrick Delaunay wrote:
> Since the commit bfaa51dd4adf ("cmd: add serial console support
> for the cls command") the cls command is not enough to clear the
> video display when ANSI console is activated.
> 
> This patch clears the video device with the video_clear() API
> before to display the bitmap used for the PXE background.
> 
> This patch avoids to display the LOGO, activated by default with
> commit 7a8555d87136 ("video: Show the U-Boot logo by default").
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> I let a patman warning:
> 
> boot/pxe_utils.c:1520: warning: Use 'if (IS_ENABLED(CONFIG...))'
>                        instead of '#if or #ifdef' where possible
> 
> 
> To avoid parameter issue for video_clear(dev) function:
> no parameter dev when CONFIG_DM_VIDEO is deactivated.
> 
> 
> Changes in v2:
> - move #include <dm.h> to avoid compilation issue when CONFIG_DM_RNG
>   is not activated for uclass_first_device_err
> - Avoid error too many arguments to function 'video_clear'
>   when CONFIG_DM_VIDEO is not activated, use: #if defined(CONFIG_DM_VIDEO)
> 
>  boot/pxe_utils.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/boot/pxe_utils.c b/boot/pxe_utils.c
> index 0c24becae3..b08aee9896 100644
> --- a/boot/pxe_utils.c
> +++ b/boot/pxe_utils.c
> @@ -6,6 +6,7 @@
>  
>  #include <common.h>
>  #include <command.h>
> +#include <dm.h>
>  #include <env.h>
>  #include <image.h>
>  #include <log.h>
> @@ -14,6 +15,7 @@
>  #include <lcd.h>
>  #include <net.h>
>  #include <fdt_support.h>
> +#include <video.h>
>  #include <linux/libfdt.h>
>  #include <linux/string.h>
>  #include <linux/ctype.h>
> @@ -21,7 +23,6 @@
>  #include <linux/list.h>
>  
>  #ifdef CONFIG_DM_RNG
> -#include <dm.h>
>  #include <rng.h>
>  #endif
>  
> @@ -1516,8 +1517,13 @@ void handle_pxe_menu(struct pxe_context *ctx, struct pxe_menu *cfg)
>  		/* display BMP if available */
>  		if (cfg->bmp) {
>  			if (get_relfile(ctx, cfg->bmp, image_load_addr, NULL)) {
> -				if (CONFIG_IS_ENABLED(CMD_CLS))
> -					run_command("cls", 0);
> +#if defined(CONFIG_DM_VIDEO)
> +				struct udevice *dev;
> +
> +				err = uclass_first_device_err(UCLASS_VIDEO, &dev);
> +				if (!err)
> +					video_clear(dev);
> +#endif
>  				bmp_display(image_load_addr,
>  					    BMP_ALIGN_CENTER, BMP_ALIGN_CENTER);
>  			} else {
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
