Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D9D50B1E1
	for <lists+uboot-stm32@lfdr.de>; Fri, 22 Apr 2022 09:42:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2D591C60496;
	Fri, 22 Apr 2022 07:42:52 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BD7E4C60492
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Apr 2022 07:42:50 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23M3E3xT025876;
 Fri, 22 Apr 2022 09:42:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=Hnvb9CQbT+lWjvJVdc/pQxHPZCanSJ4Rbr9LgNTrny8=;
 b=5MkvHDay/Ykr122lLlDf888T2G1qOOXwd6eBE5yxumQH6/L1r4f6io9wNKvntjH0NFe0
 +E7z25WPuMhH9Z4SyLZ0nHkF1zN/D4td2tR0LcA0L9Dr6ig8W+cf9hgdS7gCDJ3+8J+g
 w3su8/74KXpPDXSBlxr2qg6UG2t5gmDhR25aNY5IUJHxIVZwnVbmxPcXjOj+wBKy3E9a
 VW45t3gjlHFD1IYAF8GP4+S3rNOndIKfbs4lC3J6bjEkhzpp5EDWKm7lLSZLQj//Ja0U
 Hpo0K/erEECi/R95bfNGbdfHLVa0INaLQuc5tZ/H8OjPYYmYJpLFMqpIZMmM4z6ZdgqK fQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ffpqe7h0k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Apr 2022 09:42:50 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B85A310002A;
 Fri, 22 Apr 2022 09:42:49 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B1BE721683D;
 Fri, 22 Apr 2022 09:42:49 +0200 (CEST)
Received: from [10.201.21.201] (10.75.127.46) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Fri, 22 Apr
 2022 09:42:49 +0200
Message-ID: <659eed15-6752-05ac-fdbd-2b941b0beabb@foss.st.com>
Date: Fri, 22 Apr 2022 09:42:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20220328172534.1196119-1-patrick.delaunay@foss.st.com>
 <20220328192520.6.Ie76b6efe731c9d721b794d9ad6b394b38492a4df@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20220328192520.6.Ie76b6efe731c9d721b794d9ad6b394b38492a4df@changeid>
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-22_02,2022-04-21_01,2022-02-23_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 6/8] stm32mp: stm32prog: handle
 interruption during the first enumeration
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

On 3/28/22 19:25, Patrick Delaunay wrote:
> When an interruption is received during the first USB enumeration
> used to received the FlashLayout, with handle ctrl-c, the second
> enumeration is not needed and the result for stm32prog_usb_loop
> is false (reset is not needed).
> 
> This patch avoids the need of a second ctrl to interrupt the command
> stm32prog.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_usb.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_usb.c b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_usb.c
> index 82b702f93b..a8b57c4d8f 100644
> --- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_usb.c
> +++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_usb.c
> @@ -206,9 +206,12 @@ bool stm32prog_usb_loop(struct stm32prog_data *data, int dev)
>  	g_dnl_set_product(product);
>  
>  	if (stm32prog_data->phase == PHASE_FLASHLAYOUT) {
> +		/* forget any previous Control C */
> +		clear_ctrlc();
>  		ret = run_usb_dnl_gadget(dev, "usb_dnl_dfu");
> -		if (ret || stm32prog_data->phase != PHASE_FLASHLAYOUT)
> -			return ret;
> +		/* DFU reset received, no error or CtrlC */
> +		if (ret || stm32prog_data->phase != PHASE_FLASHLAYOUT || had_ctrlc())
> +			return ret; /* true = reset on DFU error */
>  		/* prepare the second enumeration with the FlashLayout */
>  		stm32prog_dfu_init(data);
>  	}
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
