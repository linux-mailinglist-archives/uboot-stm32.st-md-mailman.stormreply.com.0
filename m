Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 40043332873
	for <lists+uboot-stm32@lfdr.de>; Tue,  9 Mar 2021 15:22:57 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0A785C57B77;
	Tue,  9 Mar 2021 14:22:57 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5C8BAC57B53
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Mar 2021 14:22:54 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 129EMqnj011195; Tue, 9 Mar 2021 15:22:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=arKSZADhVthxi3jRTrkMgubpB6hbEZ1ruh/iEsTtOlo=;
 b=VBN3omhBtiY85pjsNX+Szmwndrq6NNyc1JGCgebOgvFBEAV694chHdQ2wqcMmsygRETW
 qrrGPXPPXxHRlNAkDiUTL+lTK/3bN+Hqq3jdOefCHNv6LBs74LpEZZKiCSxqYmQoGfff
 wWpGc3SQV/KvMTQAV8iZ06NGxvMJ+7v0xURWSyvSSAd0Aaj1ricohcB8GKCgHoPW7Vr6
 MKA30Y7FGwVvYWl6Gey8hfUHQOPHcPiyRdRgdU0+0pplPFDi62aZ2nOaA7oDQXzlpGUr
 5tOa0raDwKOh2bVbUoxOgB6/qya+j5B3pOI40TlZGVjfWuNH5Bd4JEU7tAG7ZMbZLhxy Dw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 373yrek149-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Mar 2021 15:22:53 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 67AD610002A;
 Tue,  9 Mar 2021 15:22:51 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5DE2B27118D;
 Tue,  9 Mar 2021 15:22:51 +0100 (CET)
Received: from lmecxl0573.lme.st.com (10.75.127.51) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 9 Mar
 2021 15:22:12 +0100
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20210304131413.1.I2cbb4b61852b8dd63bbad5b3a2a27857b59be7ab@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <c56d3c65-72fd-89ef-080e-f5a053848f8d@foss.st.com>
Date: Tue, 9 Mar 2021 15:22:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210304131413.1.I2cbb4b61852b8dd63bbad5b3a2a27857b59be7ab@changeid>
Content-Language: en-US
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-09_11:2021-03-08,
 2021-03-09 signatures=0
Cc: =?UTF-8?Q?Yannick_Fertr=c3=a9?= <yannick.fertre@st.com>, U-Boot
 STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Anatolij Gustschin <agust@denx.de>
Subject: Re: [Uboot-stm32] [PATCH 1/2] video: dw_mipi_dsi: missing device to
 log debug
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

On 3/4/21 1:14 PM, Patrick Delaunay wrote:
> From: Yannick Fertre <yannick.fertre@foss.st.com>
> 
> Missing udevice to struct dw_mipi_dsi to log trace.
> 
> Signed-off-by: Yannick Fertre <yannick.fertre@foss.st.com>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  drivers/video/dw_mipi_dsi.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/video/dw_mipi_dsi.c b/drivers/video/dw_mipi_dsi.c
> index 4dde648814..a5beed3514 100644
> --- a/drivers/video/dw_mipi_dsi.c
> +++ b/drivers/video/dw_mipi_dsi.c
> @@ -797,6 +797,7 @@ static int dw_mipi_dsi_init(struct udevice *dev,
>  	dsi->phy_ops = phy_ops;
>  	dsi->max_data_lanes = max_data_lanes;
>  	dsi->device = device;
> +	dsi->dsi_host.dev = (struct device *)dev;
>  	dsi->dsi_host.ops = &dw_mipi_dsi_host_ops;
>  	device->host = &dsi->dsi_host;
>  
> 
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
