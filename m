Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 56055394303
	for <lists+uboot-stm32@lfdr.de>; Fri, 28 May 2021 14:54:03 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1C969C5718D;
	Fri, 28 May 2021 12:54:03 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 015E7C57189
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 May 2021 12:54:00 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14SCpdHp010989; Fri, 28 May 2021 14:54:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=PXb//HevHdf4wijY71n0RmkmFZ6jD2I5tPSlbgO+I4M=;
 b=b/Lyp2qRVKLBw0VzCqZILjLfeC7ztKJ8S/anE7ZaeHBVs0sBuStKG/x9NrlZvTGWWLc5
 gUNpUoV1ZJcP5aJMLSyhML9sE5jkgcthxQoiK/3G5UwkZvzJREEGmsX3oZeLxPrWDDty
 gJKZuD1SoApz/94M9BxkFgRDQVS4i3aD1oTsCqu8VDAzxXght/im3r9Zk8KdRw3E+nhS
 0FliB7w6U5xI+HqX0fUzuMi7PXcLtTIBIdUvJ0I2jYmS5dBneYl9dBHekaG6hyDXybKf
 OI5KDNSc/4UqMCGsGzqPP/eKlLPM+XhuS006AIXecZQcdJUdRzX8tyH3hOKPECsFq0jS iw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 38tj2rmg6q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 May 2021 14:54:00 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 869B210002A;
 Fri, 28 May 2021 14:53:58 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7EDB02291B2;
 Fri, 28 May 2021 14:53:58 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.45) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 28 May
 2021 14:53:57 +0200
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20210518131213.20343-1-patrick.delaunay@foss.st.com>
 <20210518151206.5.Ic81eb7eb5bd44c0d9022eb4b7aed823a934eecda@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <04258ce5-ba72-ae3d-a4ea-3a704c9f1269@foss.st.com>
Date: Fri, 28 May 2021 14:53:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210518151206.5.Ic81eb7eb5bd44c0d9022eb4b7aed823a934eecda@changeid>
Content-Language: en-US
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-28_04:2021-05-27,
 2021-05-28 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: Re: [Uboot-stm32] [PATCH 05/10] stm32mp: stm32prog: handle the next
 phase after USB re-enumeration
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

On 5/18/21 3:12 PM, Patrick Delaunay wrote:
> Handle the second USB enumeration only when the flashlayout is received
> and when phase is PHASE_FLASHLAYOUT. This patch removes the call of
> stm32prog_next_phase as it is already done in stm32prog_dfu_init().
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_usb.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_usb.c b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_usb.c
> index bc44d9fc8f..d4a3f7ea16 100644
> --- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_usb.c
> +++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_usb.c
> @@ -207,13 +207,10 @@ bool stm32prog_usb_loop(struct stm32prog_data *data, int dev)
>  
>  	if (stm32prog_data->phase == PHASE_FLASHLAYOUT) {
>  		ret = run_usb_dnl_gadget(dev, "usb_dnl_dfu");
> -		if (ret || stm32prog_data->phase == PHASE_DO_RESET)
> +		if (ret || stm32prog_data->phase != PHASE_FLASHLAYOUT)
>  			return ret;
>  		/* prepare the second enumeration with the FlashLayout */
> -		if (stm32prog_data->phase == PHASE_FLASHLAYOUT)
> -			stm32prog_dfu_init(data);
> -		/* found next selected partition */
> -		stm32prog_next_phase(data);
> +		stm32prog_dfu_init(data);
>  	}
>  
>  	ret = run_usb_dnl_gadget(dev, "usb_dnl_dfu");
> 
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
