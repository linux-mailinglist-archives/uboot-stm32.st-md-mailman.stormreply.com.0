Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 45992332874
	for <lists+uboot-stm32@lfdr.de>; Tue,  9 Mar 2021 15:22:59 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 118C8C57195;
	Tue,  9 Mar 2021 14:22:59 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4E8B1C57B78
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Mar 2021 14:22:57 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 129EM23W008902; Tue, 9 Mar 2021 15:22:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=/G2zQj6v84iqoeTM1+hx4IhKWSjTpHcrseFiX/rdesw=;
 b=d7p22LD9tdqPARACj/4/E73+q5OvB0X0kscf71alJrp1frzaIcfn91lRgx2Ntp/SYT/E
 UUl0C5iJEatGc/xmjllYTd0MtQltblFYSTcE3pZ/sQxuNwZwQqp1LD65A9A1xAUBGUlD
 Wnspf7VZxP25TRZoGHHnyQLhRd8pqQLHE9q7wsTd680FcwAgZWmW0nUr7pFMgsFGVXKk
 pCskIPPke2MENCzcC7vQLzxP0kcrvKxQCJ2Z76unze+3Y/QufPpP+/fD3K4i6CuBXjOM
 IY5pr2XCWtHijs1eDJzy5gz26eWYjVcRt6URmGo+z/mF0PhpERfdi0xrTSh94u7mesuY 3g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3741y6sspk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Mar 2021 15:22:53 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6D513100038;
 Tue,  9 Mar 2021 15:22:51 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6618327118F;
 Tue,  9 Mar 2021 15:22:51 +0100 (CET)
Received: from lmecxl0573.lme.st.com (10.75.127.51) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 9 Mar
 2021 15:22:46 +0100
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20210304131413.1.I2cbb4b61852b8dd63bbad5b3a2a27857b59be7ab@changeid>
 <20210304131413.2.I6bd3d4c022837f70b36d4fc91b31ae6e9f367c05@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <4f82a052-e282-8fda-4094-81f2fe029806@foss.st.com>
Date: Tue, 9 Mar 2021 15:22:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210304131413.2.I6bd3d4c022837f70b36d4fc91b31ae6e9f367c05@changeid>
Content-Language: en-US
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-09_11:2021-03-08,
 2021-03-09 signatures=0
Cc: =?UTF-8?Q?Yannick_Fertr=c3=a9?= <yannick.fertre@st.com>, U-Boot
 STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Anatolij Gustschin <agust@denx.de>
Subject: Re: [Uboot-stm32] [PATCH 2/2] video: dw_mipi_dsi: update log of
 dphy_enable
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

On 3/4/21 1:14 PM, Patrick Delaunay wrote:
> From: Yannick Fertre <yannick.fertre@foss.st.com>
> 
> The DSI phy can be turned on from the DSI digital interface in
> the dphy_enable() function or from a dedicated DSI phy "wrapper"
> in phy_ops->init() function. If the STM32MP1 case, the wrapper
> is used then the dphy_enable() "warning" traces are not relevant.
> 
> This patch moves these "warning" traces to "debug" traces so
> they are still available for DSI phy based on the digital
> interface in debug logging mode, but not there in normal mode
> for both cases.
> Note: The related Linux kernel driver uses a "debug"
> message too.
> 
> Signed-off-by: Yannick Fertre <yannick.fertre@foss.st.com>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  drivers/video/dw_mipi_dsi.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/video/dw_mipi_dsi.c b/drivers/video/dw_mipi_dsi.c
> index a5beed3514..9ae09eec12 100644
> --- a/drivers/video/dw_mipi_dsi.c
> +++ b/drivers/video/dw_mipi_dsi.c
> @@ -721,15 +721,15 @@ static void dw_mipi_dsi_dphy_enable(struct dw_mipi_dsi *dsi)
>  	ret = readl_poll_timeout(dsi->base + DSI_PHY_STATUS, val,
>  				 val & PHY_LOCK, PHY_STATUS_TIMEOUT_US);
>  	if (ret)
> -		dev_warn(dsi->dsi_host.dev,
> -			 "failed to wait phy lock state\n");
> +		dev_dbg(dsi->dsi_host.dev,
> +			"failed to wait phy lock state\n");
>  
>  	ret = readl_poll_timeout(dsi->base + DSI_PHY_STATUS,
>  				 val, val & PHY_STOP_STATE_CLK_LANE,
>  				 PHY_STATUS_TIMEOUT_US);
>  	if (ret)
> -		dev_warn(dsi->dsi_host.dev,
> -			 "failed to wait phy clk lane stop state\n");
> +		dev_dbg(dsi->dsi_host.dev,
> +			"failed to wait phy clk lane stop state\n");
>  }
>  
>  static void dw_mipi_dsi_clear_err(struct dw_mipi_dsi *dsi)
> 

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
