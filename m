Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F07AB33837
	for <lists+uboot-stm32@lfdr.de>; Mon, 25 Aug 2025 09:51:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 50DB0C36B1F;
	Mon, 25 Aug 2025 07:51:06 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CB2E6C36B17
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Aug 2025 07:51:04 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P7nXIZ027385;
 Mon, 25 Aug 2025 09:51:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 +LBYK2SyF0i5ui1kMGOMszeLvTcnX9lEhbUNOo+F02I=; b=MsRM2KgdAwE0WopO
 vE+IjgT2S2f/QxKEcxpZwEP3qF8zj9Pjzz/hyTYT8q4UXnz4kLY1jU6eeNj0W1uF
 yII755mYJEmaVocXPV62mEHj082G13BaPy0l5dnqEBFSHJdCPZTRo+zlBCSg5YP0
 A3O3m3AOEDb89xnuLBLmrVgmIDB8N1p4yM7yi5uPOBAOnStQNEG0ohCMdhWyw+Va
 d1sEUpt2tRDjwhyfE+16eOQ4OexNdzAAnGA3mWYuGgtVIzx6DSqyTWNk7Oe6Z9pW
 eR/BJqG6XmXTE+y5wZQCQsKXrXnhUhyNYyoNoi9bPkiVjkS836naQ77BHiUWyTU3
 K6Mu5w==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48q626dbsm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Aug 2025 09:51:00 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id A730640045;
 Mon, 25 Aug 2025 09:50:06 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F18B2399A5C;
 Mon, 25 Aug 2025 09:49:44 +0200 (CEST)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Mon, 25 Aug
 2025 09:49:44 +0200
Message-ID: <cd198df4-eee6-4a2a-95a8-dc636e05875f@foss.st.com>
Date: Mon, 25 Aug 2025 09:49:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, Tom Rini
 <trini@konsulko.com>, Kamil Lulko <kamil.lulko@gmail.com>, Dillon Min
 <dillon.minfei@gmail.com>, Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Anatolij Gustschin <ag.dev.uboot@gmail.com>,
 Simon Glass <sjg@chromium.org>, Sumit Garg <sumit.garg@kernel.org>
References: <20250820-master-v1-0-fc76f18ab2fd@foss.st.com>
 <20250820-master-v1-2-fc76f18ab2fd@foss.st.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20250820-master-v1-2-fc76f18ab2fd@foss.st.com>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_03,2025-08-20_03,2025-03-28_01
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de
Subject: Re: [Uboot-stm32] [PATCH 2/8] video: simple_panel: add support for
 "panel-lvds" display
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



On 8/20/25 18:17, Raphael Gallais-Pou wrote:
> Add the compatible "panel-lvds" for simple-panel driver in U-Boot.  In
> Linux this compatible is managed by the driver
> drivers/gpu/drm/panel/panel-lvds.c but in U-Boot the specific LVDS
> features (bus_format/bus_flags) are not supported.
> 
> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> ---
>  drivers/video/simple_panel.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/video/simple_panel.c b/drivers/video/simple_panel.c
> index b6c5b058b2e967bbbd47ab3c3ce5ca52c7804409..0f23df701bc3c40ea49380bbfa3743ee592d8bd3 100644
> --- a/drivers/video/simple_panel.c
> +++ b/drivers/video/simple_panel.c
> @@ -191,6 +191,7 @@ static const struct mipi_dsi_panel_plat panasonic_vvx10f004b00 = {
>  
>  static const struct udevice_id simple_panel_ids[] = {
>  	{ .compatible = "simple-panel" },
> +	{ .compatible = "panel-lvds" },
>  	{ .compatible = "auo,b133xtn01" },
>  	{ .compatible = "auo,b116xw03" },
>  	{ .compatible = "auo,b133htn01" },
> 

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
