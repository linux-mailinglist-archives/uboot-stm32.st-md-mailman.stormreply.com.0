Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A41EC46307F
	for <lists+uboot-stm32@lfdr.de>; Tue, 30 Nov 2021 11:02:53 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 67F92C597BA;
	Tue, 30 Nov 2021 10:02:53 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 58D29C57B6F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Nov 2021 10:02:52 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AU6eqXf000471;
 Tue, 30 Nov 2021 11:02:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=rY9W7ibsxzfGdV1ZyYwx5Vy0cScUtC5CGl4XoHUjwm4=;
 b=39/pWleESErcgL4KLcrfOEHjUZVFUpKVmnyITIGG/oJJW1wGhQayDqZITDFrFJk4P1hJ
 OEGCc/TFoPc0VNSWLAuqXE0ju3z5XLvLhVRy7SY3Q99Vj0pcrFAdAe0RJ42IYVOj6A/Y
 588d+XvefsVZBdUnbXkdL9HX8UVP3NGohdHjkb7vJNlesi95iUyiUMnnotw6ljV8iG/g
 6jXdzKW4SS88zAPSYSDXbkOXyQ++30GF1ni33dkxFJLKhUvCVGdlcOLaTXjp39834/Jg
 PC81OUbtfAu5GTtixYkhW4rss3eIu3CnoWT0Oi9uiZV+5zLFgPjxxg8B27eufn6sxhPq Zg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3cnewbh7u5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Nov 2021 11:02:51 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 05E0D10002A;
 Tue, 30 Nov 2021 11:02:51 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F115E2248B5;
 Tue, 30 Nov 2021 11:02:50 +0100 (CET)
Received: from lmecxl0573.lme.st.com (10.75.127.45) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Tue, 30 Nov
 2021 11:02:50 +0100
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20211124105216.1.I2f1cd5fa86d23797b452eecde73e8b52ac0f878f@changeid>
 <20211124105216.2.I9be593bea27d9cdb1d37cc5f8afc16d8e2e8a5be@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <252441a9-1172-10d6-cb16-3da9c67119d0@foss.st.com>
Date: Tue, 30 Nov 2021 11:02:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211124105216.2.I9be593bea27d9cdb1d37cc5f8afc16d8e2e8a5be@changeid>
Content-Language: en-US
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-30_06,2021-11-28_01,2020-04-07_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 2/2] ram: stm32mp1: remove __maybe_unused
 on stm32mp1_ddr_setup
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

On 11/24/21 10:52 AM, Patrick Delaunay wrote:
> Since the commit f42045b2e750 ("stm32mp15: replace CONFIG_TFABOOT when
> it is possible") the function stm32mp1_ddr_setup is always called so the
> __maybe_unused can be removed.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  drivers/ram/stm32mp1/stm32mp1_ram.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/ram/stm32mp1/stm32mp1_ram.c b/drivers/ram/stm32mp1/stm32mp1_ram.c
> index c9335e59df..43702f3576 100644
> --- a/drivers/ram/stm32mp1/stm32mp1_ram.c
> +++ b/drivers/ram/stm32mp1/stm32mp1_ram.c
> @@ -88,7 +88,7 @@ static ofnode stm32mp1_ddr_get_ofnode(struct udevice *dev)
>  	return dev_ofnode(dev);
>  }
>  
> -static __maybe_unused int stm32mp1_ddr_setup(struct udevice *dev)
> +static int stm32mp1_ddr_setup(struct udevice *dev)
>  {
>  	struct ddr_info *priv = dev_get_priv(dev);
>  	int ret;
> 


Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
