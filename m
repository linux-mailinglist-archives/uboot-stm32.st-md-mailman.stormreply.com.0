Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F596F501B
	for <lists+uboot-stm32@lfdr.de>; Wed,  3 May 2023 08:29:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6A964C6A60D;
	Wed,  3 May 2023 06:29:36 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0D765C6A5FD
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 May 2023 06:29:35 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3434oPuF017341; Wed, 3 May 2023 08:29:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=Us3NGj0X9XKbRC5NYEP7nrAjLNfxiblz26styC4x4rk=;
 b=p2d+DfNWdQI/NwXQTwX2ZX5W21uem3DZ9HO1lK7Mvm1SphDVlp+UKo4GUDjdJyMomM0i
 EFpZfkXQyi0Zh8n//gXJk3I+25ySpkcSI5VllHcbMzsmO2VU8/Vevxdcnt/g1GbdZPbg
 IfTdl5muRvwnT0oO2YjcAaE5PhR+TRk1wpzeYSZe0rF33+KKGCTeOYcxfT03aTiP0/Me
 JqYF1h10TcoFRj/osekwt0hEOv5ho9iNTqfmAZleYjj+ORlsCcoDDWkD8xfzqY6TVIP/
 2GE7K1Qr1z1ZD8gfsPcTCLLpLDZnxLO+wAgkFBpNP3TOh+z/L6wZ55z5Xz/x7uAt/FmP Gw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3qatkufmpm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 May 2023 08:29:30 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 292C510002A;
 Wed,  3 May 2023 08:29:30 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2262A2122E3;
 Wed,  3 May 2023 08:29:30 +0200 (CEST)
Received: from [10.201.21.26] (10.201.21.26) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Wed, 3 May
 2023 08:29:29 +0200
Message-ID: <e8b15b89-e24e-2d9f-3231-8c5aa666ec25@foss.st.com>
Date: Wed, 3 May 2023 08:29:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20230427133638.1477556-1-patrick.delaunay@foss.st.com>
 <20230427153632.6.I332950b93da113030cd4c2f00a727b2f2c79602d@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20230427153632.6.I332950b93da113030cd4c2f00a727b2f2c79602d@changeid>
X-Originating-IP: [10.201.21.26]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-03_03,2023-04-27_01,2023-02-09_01
Cc: Jaehoon Chung <jh80.chung@samsung.com>,
 uboot-stm32@st-md-mailman.stormreply.com
Subject: Re: [Uboot-stm32] [PATCH 6/6] pmic: stpmic1: support new prefix
 node name for regulator
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



On 4/27/23 15:36, Patrick Delaunay wrote:
> The '_' character is discouraged in the node name, this patch adds the
> new prefix of regulator subnode, with the '-' character, in STM32MP1 driver
> to support the new  naming rule in Linux kernel device trees.
> 
> It is a preliminary patch before Linux device tree synchronization
> for STMicroelectronics boards.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  drivers/power/pmic/stpmic1.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/power/pmic/stpmic1.c b/drivers/power/pmic/stpmic1.c
> index 2c85410b1bf5..8701d4f971c9 100644
> --- a/drivers/power/pmic/stpmic1.c
> +++ b/drivers/power/pmic/stpmic1.c
> @@ -34,7 +34,9 @@ static const struct pmic_child_info stpmic1_children_info[] = {
>  	{ .prefix = "ldo", .driver = "stpmic1_ldo" },
>  	{ .prefix = "buck", .driver = "stpmic1_buck" },
>  	{ .prefix = "vref_ddr", .driver = "stpmic1_vref_ddr" },
> +	{ .prefix = "vref-ddr", .driver = "stpmic1_vref_ddr" },
>  	{ .prefix = "pwr_sw", .driver = "stpmic1_pwr_sw" },
> +	{ .prefix = "pwr-sw", .driver = "stpmic1_pwr_sw" },
>  	{ .prefix = "boost", .driver = "stpmic1_boost" },
>  	{ },
>  };
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
