Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E7A569BCF
	for <lists+uboot-stm32@lfdr.de>; Thu,  7 Jul 2022 09:43:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 117D0C640F5;
	Thu,  7 Jul 2022 07:43:03 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D1B8FC640ED
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 Jul 2022 07:43:01 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2675ghka029324;
 Thu, 7 Jul 2022 09:43:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=YVTJXWME2Zup76nK3IjDQztxc+/0E5g/NNmT1xuKjPY=;
 b=hVfWsjdONWztNFt6rhNxGoiXK3RzZL8jpNkaDwD3Z3PiCisi7Ui7JJvZuE2H5LdTZ8CY
 cBuKnY2KYONHKPXNnZdo0zeWZJbAlKAgPElL32NuaMbWALsPnP2eayUuI20v92kw6VuN
 5W/dmHRVW5FoTrqdgyM3i84ihaHoYKeO08klg+iVokP9dZtCx6OhyNdpURDUznyVzeWx
 AQ05hduxCvwoqbNr1N4zgj4XM32m2+whMxZAfDbVptMtEoHJT8ql4D5XlSE9ZJk2OX/W
 vpfc/qM3Y+RDrPbBOakfI0mtzqELVwD9jL7GtFdGeMfQNoBkGhjKMtrw9Qn+XVvqdR8e Rg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3h4ubfb0mh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 07 Jul 2022 09:43:00 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 37A2F10002A;
 Thu,  7 Jul 2022 09:43:00 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3263A2115EA;
 Thu,  7 Jul 2022 09:43:00 +0200 (CEST)
Received: from [10.201.20.162] (10.75.127.48) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Thu, 7 Jul
 2022 09:42:59 +0200
Message-ID: <0afd18d3-ed66-40a1-b66f-efb3513b47aa@foss.st.com>
Date: Thu, 7 Jul 2022 09:42:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20220705165545.1.If6846005f2384c6cc800089ee2d23466c0b2054f@changeid>
 <20220705165545.2.I0cf2d893e7ee711664e7586b9f7fb992caff06fa@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20220705165545.2.I0cf2d893e7ee711664e7586b9f7fb992caff06fa@changeid>
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-07_05,2022-06-28_01,2022-06-22_01
Cc: Marek Vasut <marex@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Gabriel FERNANDEZ <gabriel.fernandez@foss.st.com>,
 Etienne CARRIERE <etienne.carriere@foss.st.com>,
 Alexandre TORGUE <alexandre.torgue@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH 2/4] clk: stm32: add support compatible st,
 stm32mp1-rcc-secure
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

Hi PAtrick

On 7/5/22 16:55, Patrick Delaunay wrote:
> Add support for new compatible st,stm32mp1-rcc-secure used when the
> RCC resource is managed by secured world (RCC_TZCR.TZEN=1)
> iand when SCMI is used.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  drivers/misc/stm32_rcc.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/misc/stm32_rcc.c b/drivers/misc/stm32_rcc.c
> index b816503bfa2..c1e5428a6b8 100644
> --- a/drivers/misc/stm32_rcc.c
> +++ b/drivers/misc/stm32_rcc.c
> @@ -84,6 +84,7 @@ static const struct udevice_id stm32_rcc_ids[] = {
>  	{.compatible = "st,stm32f746-rcc", .data = (ulong)&stm32_rcc_clk_f7 },
>  	{.compatible = "st,stm32h743-rcc", .data = (ulong)&stm32_rcc_clk_h7 },
>  	{.compatible = "st,stm32mp1-rcc", .data = (ulong)&stm32_rcc_clk_mp1 },
> +	{.compatible = "st,stm32mp1-rcc-secure", .data = (ulong)&stm32_rcc_clk_mp1 },
>  	{.compatible = "st,stm32mp13-rcc", .data = (ulong)&stm32_rcc_clk_mp13 },
>  	{ }
>  };

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
