Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF2032E44F
	for <lists+uboot-stm32@lfdr.de>; Fri,  5 Mar 2021 10:06:21 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A3A11C57B7B;
	Fri,  5 Mar 2021 09:06:21 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B5FEDC56631
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Mar 2021 14:59:16 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 124EwA3m022506; Thu, 4 Mar 2021 15:59:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=+ohmQkn28/s+IcouP9ipcC3UkLN+NWHcBxVoHJZkvUw=;
 b=e0ibZm7FkJGiQ7OtgAz+VhcK3sOXXgB77BwBTuTCQMxQQ/eDwpQ6SrnCpRdMNNPBNRhW
 BjTxQoaCTxH5x/L5giKVqKMVTH1YxYVLCdF8eIF5z9aKYC/BN/mcVbNuuMdF3L6du0mM
 GLmssm/K6pG3NBAlHWsPkG9PpnJ3odTYkiLrUFF7m6Vi4pV5qf5EwcgirEzf3+/i8Kdh
 cEVImqoOUx90JqhJFPQXKu+3TpRM8G5T0iwBcmonim+Uu8PgUSHt5FJ7owPPxHchKKWV
 YyvjK7xstX349P6qGe6thGlXrV407rM23zNJ84g7coRvRAZRYhVJjAsLvrH7BXsWnCdn Pg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36yf9qg581-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Mar 2021 15:59:10 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3626710002A;
 Thu,  4 Mar 2021 15:59:09 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1254E209061;
 Thu,  4 Mar 2021 15:59:09 +0100 (CET)
Received: from lmecxl0951.lme.st.com (10.75.127.49) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 4 Mar
 2021 15:59:08 +0100
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20210304131413.1.I2cbb4b61852b8dd63bbad5b3a2a27857b59be7ab@changeid>
From: yannick Fertre <yannick.fertre@foss.st.com>
Message-ID: <44c46998-7ea1-562a-a269-a89637962ca2@foss.st.com>
Date: Thu, 4 Mar 2021 15:59:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210304131413.1.I2cbb4b61852b8dd63bbad5b3a2a27857b59be7ab@changeid>
Content-Language: en-US
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-04_04:2021-03-03,
 2021-03-04 signatures=0
X-Mailman-Approved-At: Fri, 05 Mar 2021 09:06:20 +0000
Cc: =?UTF-8?Q?Yannick_Fertr=c3=a9?= <yannick.fertre@st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Acked-by: Yannick Fertre <yannick.fertre@foss.st.com>


On 3/4/21 1:14 PM, Patrick Delaunay wrote:
> From: Yannick Fertre <yannick.fertre@foss.st.com>
> 
> Missing udevice to struct dw_mipi_dsi to log trace.
> 
> Signed-off-by: Yannick Fertre <yannick.fertre@foss.st.com>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>   drivers/video/dw_mipi_dsi.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/video/dw_mipi_dsi.c b/drivers/video/dw_mipi_dsi.c
> index 4dde648814..a5beed3514 100644
> --- a/drivers/video/dw_mipi_dsi.c
> +++ b/drivers/video/dw_mipi_dsi.c
> @@ -797,6 +797,7 @@ static int dw_mipi_dsi_init(struct udevice *dev,
>   	dsi->phy_ops = phy_ops;
>   	dsi->max_data_lanes = max_data_lanes;
>   	dsi->device = device;
> +	dsi->dsi_host.dev = (struct device *)dev;
>   	dsi->dsi_host.ops = &dw_mipi_dsi_host_ops;
>   	device->host = &dsi->dsi_host;
>   
> 
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
