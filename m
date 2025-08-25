Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D85AB33827
	for <lists+uboot-stm32@lfdr.de>; Mon, 25 Aug 2025 09:49:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 32E87C36B1F;
	Mon, 25 Aug 2025 07:49:44 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C4D6CC36B17
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Aug 2025 07:49:42 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P6lJ3O027282;
 Mon, 25 Aug 2025 09:49:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 DVzwq+NMZiThbaCm7B0a9hGhXzpELXMweiWwczoE8V0=; b=AbsOsYsXVPDQYru+
 RszBmuRFPx81YNYBHulp9I/arVnR9TQG/dd2yk4el7tKPggoeW8PDwz9KEp1NR9o
 XodIMtUIORW1gX8cxMIWMtIT/Xri+CX/Gyt8SdD/TzmN5ydk+t4PZgidrO1lFSXD
 ms+B1dhac+SmdD55n0VSyegLbgMLpF4WXEerdm2La6vHAC4zBVY51Ri93dkRPGXk
 bOnuvHJIqFWC8ZdwQOFyURqQyG5l+opSKAgawlDWiFE4PoUAJRI3vA54Nzu7T/tU
 iq8wGDMpc8sNAz3Dq66EWEMlWjyqDGvZ5GrIJERVpPtCR2ubW0BhkS7jXfqDMewo
 zUND3g==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48q5xbdc5s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Aug 2025 09:49:30 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id B45274002D;
 Mon, 25 Aug 2025 09:48:24 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7CD80399A51;
 Mon, 25 Aug 2025 09:48:05 +0200 (CEST)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Mon, 25 Aug
 2025 09:48:04 +0200
Message-ID: <e95f93de-6851-4336-84cc-5b533672503c@foss.st.com>
Date: Mon, 25 Aug 2025 09:48:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, Tom Rini
 <trini@konsulko.com>, Kamil Lulko <kamil.lulko@gmail.com>, Dillon Min
 <dillon.minfei@gmail.com>, Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Anatolij Gustschin <ag.dev.uboot@gmail.com>,
 Simon Glass <sjg@chromium.org>, Sumit Garg <sumit.garg@kernel.org>
References: <20250820-master-v1-0-fc76f18ab2fd@foss.st.com>
 <20250820-master-v1-1-fc76f18ab2fd@foss.st.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20250820-master-v1-1-fc76f18ab2fd@foss.st.com>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_03,2025-08-20_03,2025-03-28_01
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de
Subject: Re: [Uboot-stm32] [PATCH 1/8] ofnode: support panel-timings in
 ofnode_decode_display_timing
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
> The "Display Timings" in panel-common.yaml can be provided by 2 properties
> - panel-timing: when display panels are restricted to a single resolution
>                 the "panel-timing" node expresses the required timings.
> - display-timings: several resolutions with different timings are supported
>                    with several timing subnode of "display-timings" node
> 
> This patch update the parsing function to handle this 2 possibility
> when index = 0.
> 
> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> ---
>  drivers/core/ofnode.c | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/core/ofnode.c b/drivers/core/ofnode.c
> index e040e3f2806ffe74c58dcd82f36307351acd5a99..5a721b46e5a3214e7bd437739776362c2d22a3c9 100644
> --- a/drivers/core/ofnode.c
> +++ b/drivers/core/ofnode.c
> @@ -1221,13 +1221,16 @@ int ofnode_decode_display_timing(ofnode parent, int index,
>  	int ret = 0;
>  
>  	timings = ofnode_find_subnode(parent, "display-timings");
> -	if (!ofnode_valid(timings))
> -		return -EINVAL;
> -
> -	i = 0;
> -	ofnode_for_each_subnode(node, timings) {
> -		if (i++ == index)
> -			break;
> +	if (ofnode_valid(timings)) {
> +		i = 0;
> +		ofnode_for_each_subnode(node, timings) {
> +			if (i++ == index)
> +				break;
> +		}
> +	} else {
> +		if (index != 0)
> +			return -EINVAL;
> +		node = ofnode_find_subnode(parent, "panel-timing");
>  	}
>  
>  	if (!ofnode_valid(node))
> 

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
