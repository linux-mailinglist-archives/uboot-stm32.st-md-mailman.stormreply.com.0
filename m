Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3368253099C
	for <lists+uboot-stm32@lfdr.de>; Mon, 23 May 2022 08:42:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D6C34C0C921;
	Mon, 23 May 2022 06:42:43 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B5792C0C920
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 May 2022 06:42:42 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24MMIS8G009718;
 Mon, 23 May 2022 08:42:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=WgFPk1XJ4Znax88ToyHyPBQy2YLb6OogGrWLXeKv77E=;
 b=lAmpHkuunTAWw1P7eULWnnFaCENt/KS2V+x8ePFS9bMouWp50DQHP6qEoH8f7wCgqwaZ
 73A/0jrj+ciA31H8vMEjzjNwdQqvFPuY+0dPhkQm0KHQH5q73FNaNcoy5tnvA6NZqviY
 xVU+3lB8/RNzN9sngaoDa9K4oJJblBrG7oR2nF7rWPGWYoQvV+fJFT1cvLnYVq8NPplU
 7TC0UbVJIniPhTAshZug5GsGs5JbOukz9XmBuU4XiMvuPPPTBG8Z5gSnJ11RmHIX+8Xx
 rwSX0UGah9Cd2PvsN3Y6iqfh3kBtAANAzXV4zbRGgreborULvMLrKZ245VZFcrSfAJmA Iw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3g6rv6fe14-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 May 2022 08:42:41 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5FB9710002A;
 Mon, 23 May 2022 08:42:40 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 56FE4212FC1;
 Mon, 23 May 2022 08:42:40 +0200 (CEST)
Received: from [10.201.20.162] (10.75.127.44) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Mon, 23 May
 2022 08:42:39 +0200
Message-ID: <2f8790b1-6724-c5ba-c6d1-a3848345bf84@foss.st.com>
Date: Mon, 23 May 2022 08:42:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20220517143655.1.I4d61d5a725e965f1476b26412ed1e8329aa9ba98@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20220517143655.1.I4d61d5a725e965f1476b26412ed1e8329aa9ba98@changeid>
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-23_02,2022-05-20_02,2022-02-23_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [PATCH] dm: core: convert
 of_machine_is_compatible to livetree
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

HI Patrick

On 5/17/22 14:37, Patrick Delaunay wrote:
> Replace in the function of_machine_is_compatible(), the used API
> fdt_node_check_compatible() by ofnode_device_is_compatible()
> to support a live tree.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  drivers/core/device.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/core/device.c b/drivers/core/device.c
> index 3ab2583df3..3199d6a1b7 100644
> --- a/drivers/core/device.c
> +++ b/drivers/core/device.c
> @@ -1125,9 +1125,7 @@ bool device_is_compatible(const struct udevice *dev, const char *compat)
>  
>  bool of_machine_is_compatible(const char *compat)
>  {
> -	const void *fdt = gd->fdt_blob;
> -
> -	return !fdt_node_check_compatible(fdt, 0, compat);
> +	return ofnode_device_is_compatible(ofnode_root(), compat);
>  }
>  
>  int dev_disable_by_path(const char *path)

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
