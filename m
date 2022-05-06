Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CD41251D3B7
	for <lists+uboot-stm32@lfdr.de>; Fri,  6 May 2022 10:51:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 97CF2C628AA;
	Fri,  6 May 2022 08:51:25 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 963C0C628A8
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 May 2022 08:51:24 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2467ScdG015790;
 Fri, 6 May 2022 10:51:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=Mhni8lJmBUegRqW7pJjfMVl+c9FBeBscFzjOmzDtUwU=;
 b=XBi7FxJQNtyGiqq4qW6Z3z+0lzaz1PThe3Hgkr3yF5k1KyTxff0GuGU0WgkaLOW9sugH
 QFbR3gMv9Y0AAWdhSdKkcxhNtQ2wWUprHLY6iVC4Fbda4qXE5I3sQRBzP59H8a64YqdD
 fZGmBEdmg76UGWOw6hujsS7MLlNgNdFYUGtB5H3doL9jN/6UFQNYFDyRQV4850nDjubH
 WmqtTVwogpN8uJH/Sj6BZ2lJgFMt1oLOH1uLucm/4D6N2pOsS2Gq5g11kyGFO0YRzf8s
 HabzXNy+zrK8e9OPdDrHcYJ9Y8SUsxtZ1eCQBGCm/a+8zQex9o+OyqidJFdlvUZ3/GGt gg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3frvf0ynpf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 May 2022 10:51:23 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0F252100034;
 Fri,  6 May 2022 10:51:23 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 09BC9215147;
 Fri,  6 May 2022 10:51:23 +0200 (CEST)
Received: from [10.48.0.213] (10.75.127.48) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Fri, 6 May
 2022 10:51:22 +0200
Message-ID: <0884576b-f850-1bf2-2b72-0db328d61c51@foss.st.com>
Date: Fri, 6 May 2022 10:51:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Patrice Chotard <patrice.chotard@foss.st.com>, <u-boot@lists.denx.de>
References: <20220422073918.15918-1-patrice.chotard@foss.st.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20220422073918.15918-1-patrice.chotard@foss.st.com>
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-06_03,2022-05-05_01,2022-02-23_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH] board: st: stm32mp1: Consider USB cable
 connected when boot device is USB
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

On 4/22/22 09:39, Patrice Chotard wrote:
> Always consider USB cable is connected when USB boot device is detected.
>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>
>   board/st/stm32mp1/stm32mp1.c | 7 +++++++
>   1 file changed, 7 insertions(+)
>
> diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
> index fff1880e5b..62a5fc23e6 100644
> --- a/board/st/stm32mp1/stm32mp1.c
> +++ b/board/st/stm32mp1/stm32mp1.c
> @@ -199,6 +199,13 @@ int g_dnl_board_usb_cable_connected(void)
>   	if (!IS_ENABLED(CONFIG_USB_GADGET_DWC2_OTG))
>   		return -ENODEV;
>   
> +	/*
> +	 * In case of USB boot device is detected, consider USB cable is
> +	 * connected
> +	 */
> +	if ((get_bootmode() & TAMP_BOOT_DEVICE_MASK) == BOOT_SERIAL_USB)
> +		return true;
> +
>   	/* if typec stusb160x is present, means DK1 or DK2 board */
>   	ret = stusb160x_cable_connected();
>   	if (ret >= 0)


Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick


_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
